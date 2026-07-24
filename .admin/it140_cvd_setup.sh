#!/usr/bin/env bash
#
# IT 140 Codio Virtual Desktop provisioning script
#
# Audience: SNHU Codio administrators
# Purpose: Provision a fresh Codio Virtual Desktop with the supported
#          IT 140 course development environment and desktop configuration.
#
# Run this script as the standard Codio desktop user. The script invokes sudo
# only for system-level package and repository changes. User-specific settings,
# VS Code extensions, desktop launchers, and logs are created for the account
# that runs the script.

set -Eeuo pipefail

LOG_DIR="$HOME/it140/logs"
LOG_FILE="$LOG_DIR/it140_setup_log.txt"

mkdir -p "$LOG_DIR"
exec > >(tee "$LOG_FILE") 2>&1

trap 'status=$?; echo "ERROR: Codio provisioning stopped at line $LINENO (exit $status). Review $LOG_FILE." >&2; exit "$status"' ERR

echo "Updating Ubuntu and installing repository prerequisites..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    curl \
    gpg

echo "Configuring vendor package repositories..."
sudo install -d -m 0755 /etc/apt/keyrings /etc/apt/sources.list.d

# Configure the official GitHub CLI APT repository.
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
sudo chmod 0644 /etc/apt/keyrings/githubcli-archive-keyring.gpg
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\n' \
    "$(dpkg --print-architecture)" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

# Configure the official Microsoft Visual Studio Code APT repository.
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
sudo chmod 0644 /usr/share/keyrings/microsoft.gpg
sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<EOF_VSCODE_REPO
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF_VSCODE_REPO

echo "Updating Ubuntu and installing the Codio course IDE..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get full-upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    direnv \
    git \
    gh \
    numlockx \
    tree \
    xclip \
    python3 \
    python3-pip \
    python3-venv \
    code

echo "Configuring command-line tools..."
python3 -m pip install \
    --user \
    --upgrade \
    --break-system-packages \
    pytest \
    pytest-cov \
    ruff

USER_BIN="$(python3 -m site --user-base)/bin"
export PATH="$USER_BIN:$PATH"

# Persist the user-local executable path for future login sessions.
if ! grep -Fqs '$HOME/.local/bin' "$HOME/.profile"; then
    printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$HOME/.profile"
fi

# Apply course-standard Git defaults for the Codio user account.
git config --global init.defaultBranch main
git config --global core.longpaths true
git config --global core.editor "code --wait"

echo "Installing required VS Code extensions..."
for extension in \
    ms-python.python \
    charliermarsh.ruff \
    hediet.vscode-drawio \
    streetsidesoftware.code-spell-checker \
    i2p-hub.i2p-pseudo \
    cweijan.vscode-office
do
    echo "  Installing $extension"
    NODE_NO_WARNINGS=1 code --install-extension "$extension" --force
done

echo "Customizing the Codio course IDE desktop..."
DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || true)"
DESKTOP_DIR="${DESKTOP_DIR:-$HOME/Desktop}"
mkdir -p "$DESKTOP_DIR"

# Hide Xfce's built-in File System and Home desktop icons. Course-specific
# launchers are created below to reduce ambiguity for students.
for property in \
    /desktop-icons/file-icons/show-filesystem \
    /desktop-icons/file-icons/show-home
do
    xfconf-query \
        --channel xfce4-desktop \
        --property "$property" \
        --set false 2>/dev/null \
    || xfconf-query \
        --channel xfce4-desktop \
        --property "$property" \
        --create \
        --type bool \
        --set false
done

echo "Configuring the course desktop..."

# Enable Num Lock when the Xfce desktop session starts.
sudo tee /etc/xdg/autostart/numlockx.desktop > /dev/null <<'EOF_NUMLOCK'
[Desktop Entry]
Type=Application
Name=Enable Num Lock
Comment=Enable Num Lock when the desktop session starts
Exec=/usr/bin/numlockx on
OnlyShowIn=XFCE;
NoDisplay=true
X-GNOME-Autostart-enabled=true
EOF_NUMLOCK

# Create an IT 140 folder launcher owned by the Codio user.
cat > "$DESKTOP_DIR/it140.desktop" <<EOF_IT140_LAUNCHER
[Desktop Entry]
Version=1.0
Type=Application
Name=it140
Comment=Open the IT 140 course directory
Exec=exo-open --launch FileManager "$HOME/it140"
Icon=folder
Terminal=false
StartupNotify=true
EOF_IT140_LAUNCHER

# Copy the system VS Code launcher to the user's desktop so it appears as a
# regular desktop icon rather than a symbolic link.
install -m 0755 \
    /usr/share/applications/code.desktop \
    "$DESKTOP_DIR/visual-studio-code.desktop"

chmod 0755 \
    "$DESKTOP_DIR/it140.desktop" \
    "$DESKTOP_DIR/visual-studio-code.desktop"

# Register the final launcher contents as trusted by Xfce. This must occur
# after all launcher content and permission changes are complete.
for launcher in \
    "$DESKTOP_DIR/it140.desktop" \
    "$DESKTOP_DIR/visual-studio-code.desktop"
do
    launcher_checksum="$(sha256sum "$launcher" | awk '{print $1}')"

    gio set \
        --type=string \
        "$launcher" \
        metadata::xfce-exe-checksum \
        "$launcher_checksum"
done

echo "Configuring the course panel..."
PANEL_CHANNEL="xfce4-panel"
PANEL_CONFIG_DIR="$HOME/.config/xfce4/panel"
mkdir -p "$PANEL_CONFIG_DIR"

set_xfconf_string() {
    local property="$1"
    local value="$2"

    if xfconf-query \
        --channel "$PANEL_CHANNEL" \
        --property "$property" > /dev/null 2>&1
    then
        xfconf-query \
            --channel "$PANEL_CHANNEL" \
            --property "$property" \
            --set "$value"
    else
        xfconf-query \
            --channel "$PANEL_CHANNEL" \
            --property "$property" \
            --create \
            --type string \
            --set "$value"
    fi
}

# Find the existing folder-shaped Directory Menu plugin.
DIRECTORY_PLUGIN_ID="$(
    xfconf-query \
        --channel "$PANEL_CHANNEL" \
        --property /plugins \
        --list \
        --verbose 2>/dev/null \
    | awk '$NF == "directorymenu" {
        sub(/^.*plugin-/, "", $1)
        print $1
        exit
    }'
)"

if [[ -z "$DIRECTORY_PLUGIN_ID" ]]; then
    echo "ERROR: Could not find the Xfce Directory Menu plugin." >&2
    exit 1
fi

# Make the existing folder menu start at the IT 140 course directory.
set_xfconf_string \
    "/plugins/plugin-$DIRECTORY_PLUGIN_ID/base-directory" \
    "$HOME/it140"

# Find the panel that contains the Directory Menu plugin.
COURSE_PANEL_ID=""
mapfile -t PANEL_IDS < <(
    xfconf-query \
        --channel "$PANEL_CHANNEL" \
        --property /panels 2>/dev/null \
    | awk '$1 ~ /^[0-9]+$/ { print $1 }'
)

for panel_id in "${PANEL_IDS[@]}"; do
    mapfile -t panel_plugin_ids < <(
        xfconf-query \
            --channel "$PANEL_CHANNEL" \
            --property "/panels/panel-$panel_id/plugin-ids" 2>/dev/null \
        | awk '$1 ~ /^[0-9]+$/ { print $1 }'
    )

    if printf '%s\n' "${panel_plugin_ids[@]}" \
        | grep --fixed-strings --line-regexp --quiet "$DIRECTORY_PLUGIN_ID"
    then
        COURSE_PANEL_ID="$panel_id"
        break
    fi
done

if [[ -z "$COURSE_PANEL_ID" ]]; then
    echo "ERROR: Could not identify the panel containing the Directory Menu." >&2
    exit 1
fi

# Reuse the prior VS Code launcher plugin on repeated runs, or allocate a new ID.
VSCODE_PLUGIN_MARKER="$PANEL_CONFIG_DIR/it140-vscode-plugin-id"
VSCODE_PLUGIN_ID=""

if [[ -s "$VSCODE_PLUGIN_MARKER" ]]; then
    candidate_id="$(<"$VSCODE_PLUGIN_MARKER")"

    if [[ "$candidate_id" =~ ^[0-9]+$ ]]; then
        candidate_type="$(
            xfconf-query \
                --channel "$PANEL_CHANNEL" \
                --property "/plugins/plugin-$candidate_id" 2>/dev/null \
            || true
        )"

        if [[ "$candidate_type" == "launcher" ]]; then
            VSCODE_PLUGIN_ID="$candidate_id"
        fi
    fi
fi

if [[ -z "$VSCODE_PLUGIN_ID" ]]; then
    LAST_PLUGIN_ID="$(
        xfconf-query \
            --channel "$PANEL_CHANNEL" \
            --property /plugins \
            --list 2>/dev/null \
        | sed -n 's#^/plugins/plugin-\([0-9][0-9]*\).*#\1#p' \
        | sort --numeric-sort \
        | tail --lines=1
    )"

    VSCODE_PLUGIN_ID="$(( ${LAST_PLUGIN_ID:-0} + 1 ))"
    printf '%s\n' "$VSCODE_PLUGIN_ID" > "$VSCODE_PLUGIN_MARKER"
fi

VSCODE_LAUNCHER_NAME="it140-vscode.desktop"
VSCODE_LAUNCHER_DIR="$PANEL_CONFIG_DIR/launcher-$VSCODE_PLUGIN_ID"
mkdir -p "$VSCODE_LAUNCHER_DIR"
install -m 0644 \
    /usr/share/applications/code.desktop \
    "$VSCODE_LAUNCHER_DIR/$VSCODE_LAUNCHER_NAME"

set_xfconf_string "/plugins/plugin-$VSCODE_PLUGIN_ID" "launcher"

# Configure the launcher plugin with VS Code as its only item.
VSCODE_ITEMS_PROPERTY="/plugins/plugin-$VSCODE_PLUGIN_ID/items"
xfconf-query \
    --channel "$PANEL_CHANNEL" \
    --property "$VSCODE_ITEMS_PROPERTY" \
    --reset 2>/dev/null || true
xfconf-query \
    --channel "$PANEL_CHANNEL" \
    --property "$VSCODE_ITEMS_PROPERTY" \
    --create \
    --force-array \
    --type string \
    --set "$VSCODE_LAUNCHER_NAME"

# Remove any prior occurrence, then append VS Code as the far-right panel item.
PANEL_PLUGIN_PROPERTY="/panels/panel-$COURSE_PANEL_ID/plugin-ids"
mapfile -t panel_plugin_ids < <(
    xfconf-query \
        --channel "$PANEL_CHANNEL" \
        --property "$PANEL_PLUGIN_PROPERTY" 2>/dev/null \
    | awk '$1 ~ /^[0-9]+$/ { print $1 }'
)

updated_plugin_ids=()
for plugin_id in "${panel_plugin_ids[@]}"; do
    if [[ "$plugin_id" != "$VSCODE_PLUGIN_ID" ]]; then
        updated_plugin_ids+=("$plugin_id")
    fi
done
updated_plugin_ids+=("$VSCODE_PLUGIN_ID")

xfconf-query \
    --channel "$PANEL_CHANNEL" \
    --property "$PANEL_PLUGIN_PROPERTY" \
    --reset

panel_plugin_args=()
for plugin_id in "${updated_plugin_ids[@]}"; do
    panel_plugin_args+=(--type int --set "$plugin_id")
done

xfconf-query \
    --channel "$PANEL_CHANNEL" \
    --property "$PANEL_PLUGIN_PROPERTY" \
    --create \
    --force-array \
    "${panel_plugin_args[@]}"

xfdesktop --reload 2>/dev/null || true
xfce4-panel -r 2>/dev/null || true

echo "Making VS Code the default editor for course file types..."
for mime_type in \
    text/plain \
    text/markdown \
    text/x-python \
    text/x-shellscript
do
    xdg-mime default code.desktop "$mime_type"
done

echo "Configuring IT 140 Google Chrome bookmarks..."

# Create the Google Chrome managed-policy directory.
sudo install -d -m 0755 /etc/opt/chrome/policies/managed

# Create a managed bookmarks folder on Chrome's bookmarks bar containing
# course repositories, Python learning resources, and SNHU support links.
sudo tee /etc/opt/chrome/policies/managed/it140_bookmarks.json > /dev/null <<'JSON_CHROME_BOOKMARKS'
{
  "BookmarkBarEnabled": true,
  "ManagedBookmarks": [
    {
      "toplevel_name": "IT 140"
    },
    {
      "name": "GitHub Repositories",
      "children": [
        {
          "name": "Main Course Repository",
          "url": "https://github.com/GC-STEM/it140"
        },
        {
          "name": "Module 1 - Setup",
          "url": "https://github.com/GC-STEM/it140-m1-setup-tasks"
        },
        {
          "name": "Module 2",
          "url": "https://github.com/GC-STEM/it140-m2-assignment"
        },
        {
          "name": "Module 3",
          "url": "https://github.com/GC-STEM/it140-m3-assignment"
        },
        {
          "name": "Module 4",
          "url": "https://github.com/GC-STEM/it140-m4-assignment"
        },
        {
          "name": "TAG Projects",
          "url": "https://github.com/GC-STEM/it140-projects"
        }
      ]
    },
    {
      "name": "Learn Python",
      "children": [
        {
          "name": "Python Video Tutorials",
          "url": "https://www.youtube.com/playlist?list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU"
        },
        {
          "name": "Microsoft Learn Course",
          "url": "https://learn.microsoft.com/en-us/shows/intro-to-python-development/"
        },
        {
          "name": "VS Code for EDU Course",
          "url": "https://vscodeedu.com/courses/intro-to-python"
        }
      ]
    },
    {
      "name": "Python Resources",
      "children": [
        {
          "name": "Python Visualizer",
          "url": "https://pythontutor.com/visualize.html#mode=edit"
        },
        {
          "name": "Python Docs v3.12",
          "url": "https://docs.python.org/3.12/contents.html"
        },
        {
          "name": "PEP 8 - Style Guide for Python",
          "url": "https://peps.python.org/pep-0008/"
        },
        {
          "name": "PEP 257 - Docstring Conventions",
          "url": "https://peps.python.org/pep-0257/"
        },
        {
          "name": "Google Python Style Guide",
          "url": "https://google.github.io/styleguide/pyguide.html"
        }
      ]
    },
    {
      "name": "Course Resources",
      "children": [
        {
          "name": "IT 140 - Intro to Python Workshop",
          "url": "https://snhuacademicresourcecenter.screenstepslive.com/a/1834032-group-sessions-schedule-workshops-office-hours-and-peer-groups#workshops"
        },
        {
          "name": "IT Basics Office Hours",
          "url": "https://snhuacademicresourcecenter.screenstepslive.com/a/1834032-group-sessions-schedule-workshops-office-hours-and-peer-groups#office-hours"
        },
        {
          "name": "Academic Resource Center",
          "url": "https://snhuacademicresourcecenter.screenstepslive.com/m/138398"
        },
        {
          "name": "Shapiro Library",
          "url": "https://libguides.snhu.edu/c.php?g=708165&p=9774924"
        },
        {
          "name": "Zotero Group Library",
          "url": "https://www.zotero.org/groups/6612597/it140/library"
        }
      ]
    }
  ]
}
JSON_CHROME_BOOKMARKS

# Apply standard system-policy ownership and permissions.
sudo chown root:root /etc/opt/chrome/policies/managed/it140_bookmarks.json
sudo chmod 0644 /etc/opt/chrome/policies/managed/it140_bookmarks.json

# Validate the policy JSON before the CVD master is published.
python3 -m json.tool \
    /etc/opt/chrome/policies/managed/it140_bookmarks.json \
    > /dev/null

echo "IT 140 Google Chrome bookmarks configured successfully."

echo "Removing unneeded packages and cleaning package caches..."
sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

trap - ERR
echo "===== Codio course IDE provisioning completed successfully. ====="
echo "Setup log: $LOG_FILE"
