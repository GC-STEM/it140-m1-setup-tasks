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
  - [7. Verify the CVD](#7-verify-the-cvd)
  - [Next Steps](#next-steps)
  - [Troubleshooting](#troubleshooting)

## What is a Codio Virtual Desktop (CVD)?

A Codio Virtual Desktop (CVD) is a cloud-based Linux desktop that you access through your web browser. It includes the IT 140 development environment (course IDE), so you can begin working on course assignments without installing software on your own computer.

The CVD is the course's reference development environment. Assignment instructions, screenshots, and instructional videos use the CVD, and instructors and technical support staff can most easily help you when you are using it.

Even if you plan to complete most of your work on your own computer, launch and configure the CVD at least once. If your local course IDE stops working or you need to use another computer, you can switch to the CVD and continue working with little interruption.

## 0. Prerequisites

To complete CVD configuration, you will need the following:

- [ ] Access to an IT 140 course in D2L Brightspace

- [ ] GitHub credentials (username, password, noreply email address)

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

9. Bookmark the Codio Virtual Desktop (CVD) page in your local browser for direct access later.

## 2. Clone the Main Course Repository to the CVD

1. From the CVD desktop, click once on the **Terminal** icon in the taskbar to open a new terminal.

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

3. In the CVD terminal window, right-click at the end of the command prompt and select **Paste** from the popup menu.
   - Do NOT use keyboard shortcuts. If you use keyboard shortcuts (e.g., **Ctrl** + **V**), you will introduce unwanted characters into the command and it will not work.
   - If you receive a pop-up message warning of potentially unsafe paste, click **Paste**.

4. Press **Enter** to run the pasted commands.

   > 🎉 Congratulations! You just ran your first command set. The command set cloned the main course repository to your CVD and configured your environment so you can run course automation scripts with just one command. You will do this in the very near future.

5. Close the terminal window by typing `exit` and pressing **Enter**. You must close the terminal window and open a new one before running the update script in the next step.

## 3. Update the CVD

> [!IMPORTANT]
> If you update the CVD after starting work on course activities, save your work on another platform, such as GitHub, OneDrive, or your local computer, before running the update script. This protects your work in case the update fails and the VM must be reset. You do not need to create a backup if you have not saved any work in the CVD yet.

1. Click once on the **Terminal** icon in the CVD taskbar to open a new terminal window.

2. Type `update_cvd.sh` in the terminal window and press **Enter** to run the automated CVD update script. Be patient. The update may take several minutes to complete.

3. Review the **Update Summary**:
   - Confirm that **Result** is `PASS`.
   - Confirm that **Failures** is `0`.
   - Check the notices to determine whether a VM restart is required.

   <!--SME TODO: Add what to do if Result is not PASS or Failures is not 0.-->

4. Close the terminal window by typing `exit` and pressing **Enter**.

5. If a VM restart is required:

   1. Save any open work and close all windows in the CVD.
   2. Click **RESTART VM** on the VM tab menu bar.
   3. Wait for the CVD to restart and reconnect. This may take a few minutes.

   > [!TIP]
   > If you are not sure if a restart is required, restart. It does not hurt and only takes a few minutes.

6. Continue to the next section, **[Configure the CVD](#4-configure-the-cvd)**.

## 4. Configure the CVD

1. Click once on the **Terminal** icon in the CVD taskbar to open a new terminal window.

2. Type `config_cvd.sh` in the terminal window and press **Enter** to configure the CVD with an interactive script. *Interactive* means you will be prompted to provide input to the script during the configuration process.

3. Close the terminal window by typing `exit` and pressing **Enter**.

## 5. Sign into Cloud Storage Services (Optional)

1. Double-click on the "OneDrive" icon on the CVD desktop to open the OneDrive login page in Chrome. Be patient, as it may take a few seconds for the browser to open.

2. Sign into Chrome using your Google Account credentials if you wish to synchronize your Google Account settings, bookmarks, and extensions with the CVD, or use G-Drive as persistent storage. Otherwise, you may skip this step.

3. Sign into OneDrive using your SNHU credentials if you wish to use OneDrive as persistent storage for your work in the CVD. Otherwise, you may skip this step. If you choose to sign into OneDrive, follow the steps below:
   1. Enter your SNHU email address and click **Next**.
   2. Enter your SNHU password and click **Sign in**.
   3. If you see an **Install** button on the browser address bar, click it to install the OneDrive desktop app. It makes it easier to access your OneDrive files in the CVD. If you do not see an **Install** button, you can skip this step.
   4. If prompted to Keep OneDrive fully optimized, click **Allow** to allow OneDrive to local devices.

4. Close the browser and/or OneDrive window in the CVD when done signing into OneDrive and/or Chrome.

> [!NOTE]
> The first time you double-click on the OneDrive icon, you may see an **Untrusted application launcher** warning. If you see this message, click **Launch Anyway**.

## 6. Configure Visual Studio Code in the CVD

1. Double-click on the **Visual Studio Code** icon on the CVD desktop.

2. Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (highly recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**

   > [!NOTE]
   > If you do not see the Welcome page, click the blue **Sign in** button on the VS Code menu bar. If there is no **Sign in** button, you are likely already signed in.

3. If prompted to "Authorize Visual Studio Code", click **Continue**.

4. If prompted, **Open xdg-open?**, check the "Always allow" box and click **Open xdg-open** button.

5. If prompted, select your color theme. Course screenshots and videos show the "Dark High Contrast" theme, but you may choose the theme you prefer. Just keep in mind that screenshots and videos may look different than your VS Code environment if you choose a different theme.

6. Click the **Get Started** button.

7. Open the `it140` course repository by folder.
   1. Click the **Open Folder...** link. If you do not see the **Open Folder...** link, click **File** > **Open Folder...** from the VS Code menu bar.
   2. In the **Open Folder** popup window, click once on the `it140` folder. Click the **Select** button to open the folder in VS Code.
   3. Wait for the `it140` folder to open in VS Code. You should see the folder name in the Explorer pane on the left side of the VS Code window.
   4. Look for a popup message just below the VS Code main menu that says something about "Restricted Model" and click the **Manage** button.
   5. In the popup message, click the **Trust** button or press **Ctrl** + **Enter**.
   6. Close the **Workspace Trust** popup message by clicking the **X** in the upper-right corner of the message.

8. Optional: If you plan on working in both the CVD and a local course IDE, enable "Backup and Sync Settings..." in VS Code.
   1. Click on the gear icon in the lower-left corner of VS Code and select **Backup and Sync Settings...**.
   2. De-select any settings you do not want to synchronize between the CVD and your local course IDE. We recommend synchronizing all settings, but you may choose to exclude some if you prefer different settings in the CVD and your local course IDE.
   3. Click the **Sign in** button and select **Sign in with GitHub**.
   4. Follow the prompts to sign into your GitHub account and authorize VS Code to access your GitHub account.

9. Optional: If this is your first time using VS Code, we recommend you complete the VS Code **Walkthroughs** to familiarize yourself with the IDE. You will use VS Code for all course assignments and projects, so it is worth your time to learn how to use it effectively.

   > [!TIP]
   > If you ever see an **Update** button on the VS Code menu bar in the CVD, don't press it. You can ignore it or update the CVD by re-running `update_cvd.sh`. Be sure to save your work on another platform (e.g., GitHub, OneDrive, your local machine) before updating the CVD, just in case the update fails and we need to reset your VM.

10. When you are done configuring VS Code, press **Ctrl** + **Q** to close the VS Code window or click the **X** in the upper-right corner of the window.

## 7. Verify the CVD

1. Click once on the **Terminal** icon in the CVD taskbar to open a new terminal window.

2. Type `verify_cvd.sh` in the terminal window and press **Enter** to verify the CVD with an automated script.

3. Review the output of the verification script to ensure that all checks passed successfully.

4. Address any issues reported by the verification script. The script may provide instructions for resolving specific issues. Re-running the setup and configuration scripts may resolve other issues. If you encounter problems that you cannot resolve, see the [**Troubleshooting**](#troubleshooting) section for assistance.

5. Close the terminal window by typing `exit` and pressing **Enter**.

## Next Steps

When you are done configuring the CVD, close the CVD browser tab. DO NOT use the **Shut Down** option within the Ubuntu desktop. Codio will keep trying to reconnect to the CVD, which will prevent you from accessing it again until you log out of Codio and log back in.

Once you have completed Codio Virtual Desktop (CVD) configuration, you may stop here until you are ready to start on the Module Two assignment. However, we recommend you set up the course IDE on at least one local computer, if possible. Doing so provides an alternative development environment in case the CVD is unavailable and provides access after the course. Your VS Code and your GitHub account will synchronize your work between the CVD and your local course IDE, so you can continue working on assignments from either environment.

- **Set Up the Course IDE on Your Local Computer(s)**
  - [Windows](../local/windows/README.md)
  - [MacOS](../local/macos/README.md)
  - [Linux](../local/linux/README.md)

## Troubleshooting

{{< SME TODO: Add troubleshooting information for CVD configuration. >}}
