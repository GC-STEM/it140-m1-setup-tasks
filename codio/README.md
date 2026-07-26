<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks | Codio Virtual Desktop (CVD)

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Codio Virtual Desktop (CVD)
- **Activity Type**: Required, non-graded, no submission

## Table of Contents

- [IT 140 Module One: Setup Tasks | Codio Virtual Desktop (CVD)](#it-140-module-one-setup-tasks--codio-virtual-desktop-cvd)
  - [Table of Contents](#table-of-contents)
  - [What is a Codio Virtual Desktop (CVD)?](#what-is-a-codio-virtual-desktop-cvd)
  - [0. Prerequisites](#0-prerequisites)
  - [1. Launch the Codio Virtual Desktop (CVD)](#1-launch-the-codio-virtual-desktop-cvd)
  - [2. Clone the Main Course Repository to the CVD](#2-clone-the-main-course-repository-to-the-cvd)
  - [3. Update the CVD](#3-update-the-cvd)
  - [4. Configure the CVD](#4-configure-the-cvd)
  - [5. Sign into Cloud Storage Services (Optional)](#5-sign-into-cloud-storage-services-optional)
  - [6. Configure Visual Studio Code in the CVD](#6-configure-visual-studio-code-in-the-cvd)
  - [7. Verify Your CVD Configuration](#7-verify-your-cvd-configuration)
  - [Next Step](#next-step)
  - [Troubleshooting](#troubleshooting)

## What is a Codio Virtual Desktop (CVD)?

A Codio Virtual Desktop (CVD) is a cloud-based Linux desktop that you access through your web browser. It includes the IT 140 development environment (course IDE), so you can begin working on course assignments without installing software on your own computer.

The CVD is the course's reference development environment. Assignment instructions, screenshots, and instructional videos use the CVD, and instructors and technical support staff can most easily help you when you are using it.

Even if you plan to complete most of your work on your own computer, launch and configure the CVD at least once. If your local course IDE stops working or you need to use another computer, you can switch to the CVD and continue working with little or no interruption.

## 0. Prerequisites

To complete CVD configuration, you will need the following:

- [ ] Access to an IT 140 course in D2L Brightspace

- [ ] GitHub credentials (username, password)

- [ ] SNHU credentials (email, password), if using OneDrive for persistent storage

- [ ] Google credentials (email, password), if using Google Workspace for account sync and persistent storage

> [!TIP]
> You can find your GitHub username at [https://github.com/settings/profile](https://github.com/settings/profile)
>
> You can find your GitHub public noreply email address on [https://github.com/settings/emails](https://github.com/settings/emails) under the **Keep my email addresses private** section.
>
> It will look similar to `302326151+petey-penmen@users.noreply.github.com` but with your GitHub user ID and username.

## 1. Launch the Codio Virtual Desktop (CVD)

1. Go to [https://learn.snhu.edu/](https://learn.snhu.edu/) and log into Brightspace using your SNHU credentials.

2. Under **My Courses**, find and open your IT 140 course

3. From the Course Menu, select **Learning Modules**

4. Click on the **Start Here** learning module.

5. Scroll down and click on the **Optional Codio Virtual Desktop** web page.

6. Click on the **Codio Learning Environment** link to launch Codio in a new browser tab.

7. Read the *IT 140 Codio Virtual Desktop Guide* all the way through at least once.

8. Click the **Collapse** button when done reading to hide the guide. You can always expand the guide again later if you need to reference it.

9. Consider bookmarking the Codio Virtual Desktop (CVD) page in your local browser for direct access later.

## 2. Clone the Main Course Repository to the CVD

1. Click once on the **Terminal** icon in the CVD task bar to open a terminal window.

2. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below

```bash
platform="cvd"
mkdir -p "$HOME/it140"
temp_dir="$(mktemp -d)"
git clone --depth 1 \
"https://github.com/GC-STEM/it140.git" \
"$temp_dir/it140"
rm -rf "$temp_dir/it140/.git"
cp -a "$temp_dir/it140/." "$HOME/it140/"
rm -rf "$HOME/it140/.git"
rm -rf "$temp_dir"
scripts_dir="$HOME/it140/scripts/$platform"
chmod +x "$scripts_dir/"*.sh
path_line="export PATH=\"\$HOME/it140/scripts/$platform:\$PATH\""
grep -qxF "$path_line" "$HOME/.bashrc" || printf '\n%s\n' "$path_line" >> "$HOME/.bashrc"
case ":$PATH:" in
    *":$scripts_dir:"*) ;;
    *) export PATH="$scripts_dir:$PATH" ;;
esac
hash -r
```

3. In the terminal window, right-click at the end of the command prompt and select **Paste**.
   - Do NOT use keyboard shortcuts. If you use keyboard shortcuts (e.g., **Ctrl** + **V**), you will introduce unwanted characters into the command and it will not work.
   - If you receive a pop-up message warning of potentially unsafe paster, click **Paste**.

4. Press **Enter** to run the pasted commands.

5. Close the terminal window by typing `exit` and pressing **Enter**. You must close the terminal window and open a new one before running the update script in the next step.

## 3. Update the CVD

> [!IMPORTANT]
> If you update the CVD after starting work on course activities, save your work on another platform (e.g., GitHub, OneDrive, your local machine) before running the update script, just in case the update fails and we need to reset your VM. You do not need to backup if you have not save any work in the CVD yet.

1. Click once on the **Terminal** icon in the CVD task bar to open a terminal window.

2. Type `update_cvd.sh` into the terminal window and press **Enter**to run the automated CVD update script. Be patient, as this may take several minutes to complete.

3. Review the **Update Summary** notices to see if a VM restart is required.

4. Close the terminal window by typing `exit` and pressing **Enter**.

5. If a VM restart is required,
   1. Save any open work and close all windows in the CVD.
   2. Click on **RESTART VM** on the VM tab menu bar
   3. Wait for the CVD to restart and reconnect. It will take a few minutes.

## 4. Configure the CVD

1. Click once on the **Terminal** icon in the CVD task bar to open a terminal window.

2. Type `config_cvd.sh` in the terminal window and press **Enter** to configure the CVD with an interactive script.

3. Close the terminal window by typing `exit` and pressing **Enter**.

## 5. Sign into Cloud Storage Services (Optional)

1. Double-click on the "OneDrive" icon on the CVD desktop to open the OneDrive login page in Chrome. Be patient, as it may take a few seconds for the browser to open.

2. Sign into Chrome using your Google Account credentials if you wish to synchronize your Google Account settings, bookmarks, and extensions with the CVD, or use G-Drive as persistent storage. Otherwise, you may skip this step.

3. Sign into OneDrive using your SNHU credentials if you wish to use OneDrive as persistent storage for your work in the CVD. Otherwise, you may skip this step. If you choose to sign into OneDrive, follow the steps below:
   1. Enter your SNHU email address and click **Next**.
   2. Enter your SNHU password and click **Sign in**.
   3. If you see an **Install** button on the browser address bar, click it to install the OneDrive desktop app. If you do not see an **Install** button, skip this step.
   4. If prompted, click **Allow** to allow OneDrive to access resources on the CVD.

4. Close the browser window in the CVD when done signing into OneDrive and/or Chrome.

> [!NOTE]
> The first time you double-click on the OneDrive icon, you may see an **Untrusted Application** warning. If you see this message, click **OK**.

## 6. Configure Visual Studio Code in the CVD

1. Double-click on the **Visual Studio Code** icon on the CVD desktop.

2. Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (highly recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**

   > [!NOTE]
   > If you do not see the Welcome page, click the blue **Sign in** button on the VS Code menu bar.

3. If prompted, authorize VS Code to access GitHub or other linked account(s).

4. If prompted, **Open xdg-open?**, check the "Always allow" box and click **Open xdg-open** button.

5. If prompted, select your color theme. Course screenshots and videos show the "Dark High Contrast" theme, but you may choose the theme you prefer.

6. Click the **Get Started** button on the **Welcome** page to dismiss it.

   > [!IMPORTANT]
   > If you ever see an **Update** button on the VS Code menu bar in the CVD, don't press it. You can ignore it or update the CVD by re-running `update_cvd.sh`. Be sure to save your work on another platform (e.g., GitHub, OneDrive, your local machine) before updating the CVD, just in case the update fails and we need to reset your VM.

## 7. Verify Your CVD Configuration

{{SME TODO: Develop CVD verification script and add verification instructions for CVD configuration.}}

## Next Step

Once you have completed Codio Virtual Desktop (CVD) configuration, you may stop here. You may complete all course activities from web-based learning platforms–Brightspace, zyBooks, and Codio.

However, we recommend you set up the course IDE on at least one local computer, if possible. Doing so provides an alternative development environment in case the CVD is unavailable and provides access after the course. Your VS Code and your GitHub account will synchronize your work between the CVD and your local course IDE, so you can continue working on assignments from either environment.

- **Set Up the Course IDE on Your Local Computer(s)**
  - [Windows](../local/windows/README.md)
  - [MacOS](../local/macos/README.md)
  - [Linux](../local/linux/README.md)

## Troubleshooting

{{SME TODO: Add troubleshooting information for CVD configuration.}}
