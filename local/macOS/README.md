<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Local Setup on macOS

This document provides instructions for optionally setting up the IT 140 development environment (course IDE) on a supported Apple silicon Mac. The local setup is intended for students who can authorize software installation with an administrator account. It installs and configures the programming software and developer tools needed to complete IT 140 course activities.

> [!IMPORTANT]
> Installing the course IDE on your Mac is optional. The following setup phases are sequential, so do **not** proceed to the next phase until the current phase is complete. Refer to the [Troubleshooting](#troubleshooting) section for additional help. If you get stuck, you can use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until your local course IDE is working.

## 0. Check System Compatibility

Before setting up the course IDE, confirm that your Mac uses Apple silicon and that your account can authorize software installation. A Mac owned or managed by an employer, school, or another person may restrict these actions.

1. Click the **Apple menu** in the upper-left corner of the screen and select **About This Mac**.

2. Find the **Chip** entry.

   - **GO**: The chip name begins with **Apple M**, such as Apple M1, M2, M3, M4, or a later Apple chip. Continue to Step 3.

   <!--SME TODO: Add screenshots for GO.-->

   - **NO GO**: The chip entry identifies an Intel processor. The current IT 140 macOS automation does not support Intel-based Macs.

   **Recommendation**: Use the CVD. Go to the [Codio README.md](../../codio/README.md) to configure the CVD, if you have not done so already. Otherwise, return to the main [README.md](../../README.md) to complete any outstanding tasks.

   <!--SME TODO: Add screenshots for NOGO.-->

   <!--SME TODO: Add link(s) to remedial instructions for NOGO when they are developed.  -->

3. Open the **Apple menu**, select **System Settings**, and then select **Users & Groups**. Locate the account you are currently using.

   - **GO**: Your account is an **Administrator** account, which may be shown as **Admin**. Continue with the local setup.

   - **NO GO**: Your account is a **Standard** account, or the Mac is managed by an organization that restricts software installation or administrator-level changes.

   > [!IMPORTANT]
   > The account used for the IT 140 setup must be an Administrator account. Knowing the password for a different administrator account is not sufficient.

   **Recommendation**: Ask the Mac owner or IT administrator whether they can make the account you will use for IT 140 an Administrator and permit the required software installations. Do not attempt to bypass management restrictions. Otherwise, use the CVD.

4. Confirm that the Mac is connected to the internet and has at least 5 GB of available storage. To check storage, open **System Settings**, select **General**, and then select **Storage**.

## 1. Back Up Your Mac

This step is optional, but highly recommended. Before installing software, make sure important personal files are backed up. **Time Machine** is the backup feature included with macOS.

1. Connect an external storage device that you can use for backups.

2. Open **System Settings**, select **General**, and then select **Time Machine**.

3. Select **Add Backup Disk**, choose the external storage device, and follow the on-screen instructions.

4. Allow the initial backup to finish before continuing.

> [!NOTE]
> If you already use Time Machine or another reliable backup service, confirm that a recent backup completed successfully. Apple provides additional guidance in [Back up your Mac with Time Machine](https://support.apple.com/en-us/104984).

### Restore Your Mac (*if needed*)

> [!NOTE]
> If you need to recover files or restore your Mac later, follow Apple's [Time Machine recovery instructions](https://support.apple.com/en-us/102551).

## 2. Update the Operating System

Before installing the course IDE, install current macOS and security updates. The update process may take several minutes and may restart the Mac more than once.

1. Save your work and close any open applications.

2. If you are using a MacBook, connect it to power. Keep the Mac connected to the internet throughout the update.

3. Open the **Apple menu**, select **System Settings**, select **General**, and then select **Software Update**.

4. Wait while the Mac checks for available software.

5. Follow the instruction that applies:

   - **Update available**: Select **Update Now** or **Restart Now**, and then follow the on-screen instructions.

   - **Mac is up to date**: Continue to Step 7.

   - **Major macOS upgrade available**: If the Mac is already running macOS 14 Sonoma, macOS 15 Sequoia, or macOS 26 Tahoe, you do not need to install a major release upgrade (e.g., macOS 15 Sequoia to macOS 26 Tahoe). Just install any available updates for your current macOS release instead.

   - **Unsupported macOS version**: If the Mac is running a version earlier than macOS 14 Sonoma, install the latest compatible macOS upgrade offered by Software Update.

   > [!IMPORTANT]
   > Do not install a beta version of macOS. If **Beta Updates** appears in Software Update, make sure it is set to **Off**.

6. Enter the administrator password when prompted. Allow the update to finish without shutting down the Mac, closing its lid, or disconnecting it from power. The screen may become blank and the Mac may restart several times.

7. Sign back in to the account that you will use for IT 140.

8. Return to **System Settings** > **General** > **Software Update**. Install any remaining updates and repeat this check until the Mac reports that it is up to date.

After updating macOS, restart the Mac if prompted. Sign back in to the account that you will use for IT 140 before continuing.

## 3. Clone the Main Course Repository

<!--SME TODO: Add brief explanation of what 'bootstrap' means in this context and high level summary of what the bootstrap commands do.-->

1. Press **Command (⌘)** + **Space bar** to open Spotlight Search.

2. Type ***Terminal*** and press **Return**.

3. Verify that a Terminal window opens and displays a command prompt. The prompt and Terminal colors may look different from examples in this guide.

4. Using your pointing device, click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   set -euo pipefail
   readonly ARTIFACT_VERSION="0.5.3"
   readonly VERSION_DATE="2026-07-30"
   readonly COURSE_ROOT="${HOME}/it140"
   readonly SCRIPT_DIR="${COURSE_ROOT}/scripts/mac"
   readonly ARCHIVE_URL="https://github.com/GC-STEM/it140/archive/refs/heads/main.zip"
   readonly TEMP_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/it140-bootstrap.XXXXXX")"
   readonly ARCHIVE_PATH="${TEMP_ROOT}/it140-main.zip"
   readonly EXTRACT_ROOT="${TEMP_ROOT}/extract"
   cleanup() {
      set +e
      [ -d "$TEMP_ROOT" ] && [ ! -L "$TEMP_ROOT" ] && rm -rf -- "$TEMP_ROOT"
   }
   trap cleanup EXIT INT TERM
   [ "$(uname -s)" = "Darwin" ] || {
      printf '[ERROR] This bootstrap supports macOS only.\n' >&2
      exit 2
   }
   [ "$(id -u)" -ne 0 ] || {
      printf '[ERROR] Do not run this bootstrap with sudo or as root.\n' >&2
      exit 3
   }
   mkdir -p -- "$COURSE_ROOT/logs" "$EXTRACT_ROOT"
   chmod -- 0700 "$COURSE_ROOT/logs"
   LOG_FILE="$COURSE_ROOT/logs/prepare_ide_$(date +%Y%m%d_%H%M%S).log"
   exec > >(tee -a "$LOG_FILE") 2>&1
   printf '\n============================================================\n'
   printf 'IT 140 macOS BOOTSTRAP\n'
   printf '============================================================\n'
   printf '[INFO] Artifact version : %s\n' "$ARTIFACT_VERSION"
   printf '[INFO] Version date     : %s\n' "$VERSION_DATE"
   printf '[INFO] Current user     : %s\n' "$(id -un)"
   printf '[INFO] Log file         : %s\n' "$LOG_FILE"
   /usr/bin/curl --fail --location --show-error --retry 5 --retry-delay 5 \
      "$ARCHIVE_URL" --output "$ARCHIVE_PATH"
   /usr/bin/ditto -x -k "$ARCHIVE_PATH" "$EXTRACT_ROOT"
   SOURCE_ROOT=""
   for candidate in "$EXTRACT_ROOT"/it140-*; do
      [ -f "$candidate/scripts/mac/install_it140zsh" ] && SOURCE_ROOT="$candidate" && break
   done
   [ -n "$SOURCE_ROOT" ] || {
      printf '[ERROR] The downloaded archive does not contain install_it140zsh.\n' >&2
      exit 4
   }
   /usr/bin/ditto "$SOURCE_ROOT" "$COURSE_ROOT"
   rm -rf -- "$COURSE_ROOT/.git"
   chmod -- 0755 "$SCRIPT_DIR"/*.zsh
   readonly SHELL_STARTUP_FILE="$HOME/.zshrc"
   readonly PATH_LINE="export PATH=\"\$HOME/it140/scripts/mac:\$PATH\""
   grep -qxF "$PATH_LINE" "$SHELL_STARTUP_FILE" 2>/dev/null || printf '\n%s\n' "$PATH_LINE" >> "$SHELL_STARTUP_FILE"
   case ":$PATH:" in
      *":$SCRIPT_DIR:"*) ;;
      *) export PATH="$SCRIPT_DIR:$PATH" ;;
   esac
   hash -r
   printf '[SUCCESS] The current IT 140 course package is available at:\n'
   printf '[SUCCESS] %s\n' "$COURSE_ROOT"
   printf '[NOTICE] Next step: cd ~/it140/scripts/mac && ./install_it140zsh\n'
   printf '[NOTICE] Bootstrap log: %s\n' "$LOG_FILE"

   ```

5. Click in the Terminal window and press **Command (⌘)** + **V** or right-click and select **Paste** to paste the commands.

6. Press **Return** once to ensure that all pasted commands run.

7. Wait for the `[Process completed]` message.This may take several minutes.

8. Click the red 'X' close button to close the Terminal window.

## 4. Install the Course IDE

1. Open a new Terminal window using Spotlight Search, as described in Steps 3.1–3.2, or click on the Terminal icon in the Dock.

   > [!IMPORTANT]
   > Run the setup script from your regular macOS account. Do **not** add `sudo` before the script command. The script will request administrator authorization only when it is required.

2. Copy the following commands.

   ```zsh
   "$HOME/it140/scripts/mac/install_it140zsh"
   ```

3. Click in the Terminal window and press **Command (⌘)** + **V** to paste the commands.

4. Press **Return** if the setup script does not start automatically.

5. Follow the on-screen instructions. If Terminal requests your password, type the password that you use to sign in to your Mac and press **Return**.

   > [!NOTE]
   > Terminal does not display dots, asterisks, or other characters while you type a password. This is normal.

6. Keep the Terminal window open until the script displays its final setup summary. Review any warnings or errors and follow the script's stated next step.

7. The script saves its log in `~/it140/logs/`.

8. Type `exit` and press **Return** to close the Terminal window.

## 5. Configure the Course IDE

1. Open a **new** Terminal window using Spotlight Search.

   > [!IMPORTANT]
   > Run the configuration script from the macOS account that you will use for course work. Do **not** run it with `sudo`.

2. Copy the following commands.

   ```zsh
   "$HOME/it140/scripts/mac/configure_it140zsh"
   ```

3. Paste the commands into Terminal with **Command (⌘)** + **V**, and then press **Return** if the script does not start automatically.

4. Follow the on-screen prompts. The script may open a browser so that you can sign in to GitHub.

5. Keep the Terminal window open until the script displays its final configuration summary. Review any warnings or errors and follow the script's stated next step.

6. The script saves its log in `~/it140/logs/`.

7. Type `exit` and press **Return** to close the Terminal window.

## 6. Verify the Course IDE

1. Open a **new** Terminal window using Spotlight Search.

   > [!IMPORTANT]
   > Run the verification script as your regular macOS user. Do **not** run it with `sudo`.

2. Copy the following commands.

   ```zsh
   "$HOME/it140/scripts/mac/verify_it140zsh"
   ```

3. Paste the commands into Terminal with **Command (⌘)** + **V**, and then press **Return** if the script does not start automatically.

4. Wait for the script to finish.

5. Review the verification summary.

   - **PASS**: Continue to Step 7.
   - **PASS WITH WARNINGS**: Review each warning and any recommended action before continuing.
   - **FAIL**: Follow the remediation instructions in the summary, and then run `verify_it140zsh` again.

6. The script saves its log in `~/it140/logs/`.

7. Type `exit` and press **Return** to close the Terminal window.

## 7. Configure Visual Studio Code

<!--SME TODO: Check what is needed after configure VS Code on one platform. -->

1. Open Visual Studio Code using either method:

   - Press **Command (⌘)** + **Space bar**, type ***Visual Studio Code***, and press **Return**.
   - Open **Finder**, select **Applications**, and double-click **Visual Studio Code**.

2. Sign in with GitHub if you want to synchronize supported VS Code settings across computers. You may also continue without signing in.

   > [!NOTE]
   > If you do not see the Welcome page, select the **Accounts** icon in the lower-left corner of the Visual Studio Code window to access sign-in options.

3. If prompted, authorize Visual Studio Code to access GitHub.

4. If macOS asks whether to open Visual Studio Code from the browser, select **Open**.

5. If prompted, select a color theme. Course screenshots and videos show the **Dark High Contrast** theme, but you may choose the theme you prefer.

6. Complete or dismiss the remaining Welcome page items.

7. Optionally, keep Visual Studio Code in the Dock:

   1. Control-click the Visual Studio Code icon in the Dock.
   2. Select **Options**.
   3. Select **Keep in Dock**.

> [!IMPORTANT]
> Use `update_it140zsh` for periodic maintenance of the course IDE instead of updating its managed components individually. Save current course work to GitHub or another backup location before running an update.

## 8. Periodic Updates to the Course IDE

{{SME TODO: Add instructions for updating the course IDE on macOS. Note that VS Code releases updates weekly.}}

## Next Step

Once you have completed setting up the course IDE on one local computer, you may stop here until you are ready to start the Module Two assignment. However, we recommend that you also configure the course IDE in Codio, if you have not done so already.

- **[Configure the course IDE in Codio](../../codio/README.md)**

Optionally, if you have another local computer, you can also set up the course IDE on that machine:

- [Windows](../windows/README.md)
- [Linux](../linux/README.md)

## Troubleshooting

<!--SME TODO: Add troubleshooting information for macOS configuration.-->
