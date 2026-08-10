<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->
# IT 140 Development Environment Local Setup on macOS

This document provides step-by-step instructions for installing the IT 140 development environment (course IDE) on a supported Apple silicon Mac running macOS 14 Sonoma, macOS 15 Sequoia, or macOS 26 Tahoe. These local installation files and automation scripts are designed for students who use an Administrator account on their Mac.

Following these steps will configure the programming software and developer tools required to complete IT 140 course activities.

> [!IMPORTANT]
> Installing the course IDE on your Mac is optional. The following setup phases are sequential. Do **not** proceed to the next phase until you have fully completed the preceding phase. Refer to the [Troubleshooting](#troubleshooting) section for additional help. If you get stuck, you can use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until your local course IDE is working.

## Activity Metadata

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Local Setup | macOS
- **Activity Type**: Optional, non-graded, no submission
- **Activity Purpose**: Prepare the IT 140 development environment for completing course assignments on your local macOS computer.
- **Activity Description**: This activity provides step-by-step instructions for installing the IT 140 development environment (course IDE) on a supported Apple silicon Mac. These local installation files and automation scripts are designed for students who use an Administrator account on their Mac. Following these steps will configure the programming software and developer tools required to complete IT 140 course activities.
- **Artifact Version**: 0.10.0-beta.1
- **Artifact Date**: 2026-08-09
- **Development Status**: Beta Testing

## 0. Check System Compatibility

Before setting up the course IDE, confirm that your Mac uses Apple silicon, runs a supported version of macOS, and uses an account that can authorize software installation. Macs owned or managed by an employer, school, or another person may restrict these actions.

1. Click the **Apple menu** in the upper-left corner of the screen and select **About This Mac**.

2. Check the **Chip** and **macOS** information.

   - **GO**: The chip name begins with **Apple M**, such as Apple M1, M2, M3, M4, or a later Apple silicon chip, and the Mac is running macOS 14 Sonoma, macOS 15 Sequoia, or macOS 26 Tahoe. Continue to Step 3.
   - **NO GO — Intel Mac**: The chip entry identifies an Intel processor. The current IT 140 macOS automation does not support Intel-based Macs.
   - **NO GO — older macOS**: The Mac is running a version earlier than macOS 14 Sonoma. Continue to **Step 2: Update the Operating System** only if Software Update offers a supported macOS version for this Mac.

   ![About This Mac showing the Apple silicon chip and macOS version](./assets/01_macos_about_this_mac_chip.png)

   **Recommendation for an unsupported Mac**: Use the CVD. Go to the [Codio README.md](../../codio/README.md) to configure the CVD, if you have not done so already. Otherwise, return to the main [README.md](../../README.md) to complete any outstanding tasks.

3. Open the **Apple menu**, select **System Settings**, and then select **Users & Groups**. Locate the account you are currently using.

   - **GO**: Your account is an **Administrator** account, which may be shown as **Admin**. Continue with the local setup.
   - **NO GO**: Your account is a **Standard** account, or the Mac is managed by an organization that restricts software installation or administrator-level changes.

   ![Users and Groups showing the current macOS account as an Administrator](./assets/02_macos_users_groups_admin.png)

   > [!IMPORTANT]
   > The macOS account used for IT 140 must be an **Administrator** account. The automation scripts must be started from your regular account, not with `sudo`. The scripts request administrator authorization only when it is required.

   **Recommendation**: Ask the Mac owner or IT administrator whether they can make the account you will use for IT 140 an Administrator and permit the required software installations. Do not attempt to bypass management restrictions. Otherwise, use the CVD.

4. Confirm that the Mac is connected to the internet and has at least **5 GB of available storage**. To check storage, open **System Settings**, select **General**, and then select **Storage**.

   ![macOS Storage settings showing available storage](./assets/03_macos_storage.png)

## 1. Back Up Your Mac

This step is optional, but highly recommended. Before installing software, make sure important personal files are backed up. **Time Machine** is the backup feature included with macOS.

1. Connect an external storage device that you can use for backups.

2. Open **System Settings**, select **General**, and then select **Time Machine**.

   ![macOS Time Machine settings](./assets/11_macos_time_machine.png)

3. Select **Add Backup Disk**, choose the external storage device, and follow the on-screen instructions.

4. Allow the initial backup to finish before continuing.

> [!NOTE]
> If you already use Time Machine or another reliable backup service, confirm that a recent backup completed successfully. Apple provides additional guidance in [Back up your Mac with Time Machine](https://support.apple.com/en-us/104984).

### Restore Your Mac (*if needed*)

> [!NOTE]
> If you need to recover files or restore your Mac later, follow Apple's [Time Machine recovery instructions](https://support.apple.com/en-us/102551).

## 2. Update the Operating System

Before installing the course IDE, install current macOS and security updates. The IT 140 automation scripts maintain the course IDE software, but they do **not** install macOS operating-system upgrades.

1. Save your work and close any open applications.

2. If you are using a MacBook, connect it to power. Keep the Mac connected to the internet throughout the update.

3. Open the **Apple menu**, select **System Settings**, select **General**, and then select **Software Update**.

   ![macOS Software Update in System Settings](./assets/21_macos_software_update.png)

4. Wait while the Mac checks for available software.

5. Follow the instruction that applies:

   - **Update available**: Select **Update Now** or **Restart Now**, and follow the on-screen instructions.
   - **Mac is up to date**: Continue to Step 7.
   - **Major macOS upgrade available**: If the Mac is already running macOS 14 Sonoma, macOS 15 Sequoia, or macOS 26 Tahoe, you do not need to install a major release upgrade for this course. Install the available updates for your current macOS release.
   - **Unsupported macOS version**: If the Mac is running a version earlier than macOS 14 Sonoma, install a supported macOS upgrade offered by Software Update before continuing with the local course IDE setup.

   > [!IMPORTANT]
   > Do not install a beta version of macOS for the course IDE. If **Beta Updates** appears in Software Update, make sure it is set to **Off**.

6. If prompted, enter your macOS password. Allow the update to finish without shutting down the Mac or disconnecting it from power. The Mac may restart during the update.

7. Sign back in to the Administrator account that you will use for IT 140.

8. Return to **System Settings** > **General** > **Software Update**. Install any remaining updates and repeat this check until the Mac reports that it is up to date.

Once macOS is up to date, continue to **Step 3**.

## 3. Prepare the Course Automation Package

Before the course IDE can be installed, you need the current IT 140 automation package. This first setup action is sometimes called **bootstrapping**. The commands below download the current Prepare script. The Prepare script then downloads and validates the IT 140 automation package, places it in your `~/it140` folder, makes the macOS lifecycle scripts executable, and configures the command path used by the course scripts.

> [!IMPORTANT]
> Run this step from a **regular Terminal** window. Do **not** add `sudo` before any of these commands.

1. Press **Command (⌘)** + **Space bar** to open Spotlight Search.

2. Type ***Terminal*** and press **Return**.

   ![Spotlight Search opening Terminal on macOS](./assets/31_macos_terminal_spotlight.png)

3. Verify that a Terminal window opens and displays a command prompt. The prompt and Terminal colors may look different from the screenshots in this guide.

4. Click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   (
   set -e
   PREPARE_SCRIPT="$(mktemp "${TMPDIR:-/tmp}/it140-prepare-script.XXXXXX")"
   trap 'rm -f -- "$PREPARE_SCRIPT"' EXIT
   CACHE_BUSTER="$(date +%s)-$$"
   /usr/bin/curl --fail --location --show-error --header 'Cache-Control: no-cache' --header 'Pragma: no-cache' "https://raw.githubusercontent.com/GC-STEM/it140/main/scripts/mac/prepare_it140.zsh?it140=${CACHE_BUSTER}" --output "$PREPARE_SCRIPT"
   /bin/zsh "$PREPARE_SCRIPT"
   )
   ```

5. Click in the Terminal window and press **Command (⌘)** + **V** to paste the commands.

6. Press **Return** once if the commands do not start automatically.

7. Wait for the Prepare script to finish and for the command prompt to return. Review the final **IT 140 macOS PREPARE SUMMARY** before continuing. Make sure:

   - **Result**: `PASS`
   - **Exit code**: `0`

   ![Successful IT 140 macOS Prepare summary](./assets/32_macos_prepare_summary.png)

8. Type `exit` and press **Return** to close Terminal. Open a **new** Terminal window before continuing to Step 4.

> [!NOTE]
> The Prepare script saves its log in `~/it140/logs/`. If the script reports an error, review the final summary and the log file identified there before continuing.

## 4. Install the Course IDE

The Install script adds or repairs the system-level software required for IT 140. This includes Apple Command Line Tools, Homebrew, and the manifest-declared course software such as Git, GitHub CLI, Python 3.12, and Visual Studio Code.

> [!IMPORTANT]
> Run the Install script from your regular macOS Administrator account. Do **not** add `sudo` before the script command. The script requests administrator authorization only when it is required.

1. Open a **new Terminal** window using Spotlight Search, as described in Steps 3.1–3.2.

2. Click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   "$HOME/it140/scripts/mac/install_it140.zsh"
   ```

3. Paste the copied command into Terminal with **Command (⌘)** + **V**.

4. Press **Return** once if the script does not start automatically.

5. Follow the on-screen instructions.

   - If **Apple Command Line Tools** are not installed, macOS may open a separate installer window. Complete the installer. The IT 140 Install script will stop with a `PARTIAL` result and tell you to rerun `install_it140.zsh` after the Apple installer finishes.
      > *Important.* The Apple Command Line Tools installer may open **behind Terminal or another window**, so it may not be immediately visible. If the Install script appears to be waiting:
      > - Check the Dock at the bottom of the screen for another open or minimized installer window.
      > - Move or minimize your open windows, especially Terminal, and look for the Apple Command Line Tools installer.
      > - Complete the installation and wait for it to finish. Do not close Terminal while the installer is running.
      > After the Apple installer finishes, return to Terminal. The IT 140 Install script will finish with a PARTIAL result and tell you to run install_it140.zsh again.

   - If **Homebrew** is not installed, the script uses the official Homebrew installer. Terminal may request the password for your current Administrator account.

   - When Terminal requests a password, type the password that you use to sign in to your Mac and press **Return**.

   > [!NOTE]
   > Terminal does not display dots, asterisks, or other characters while you type a password. This is normal.

   ![Apple Command Line Tools installation prompt during IT 140 setup](./assets/41_macos_command_line_tools_prompt.png)

6. Keep the Terminal window open until the script displays its final **IT 140 macOS INSTALL SUMMARY**.

7. On a successful run, make sure:

   - **Result**: `PASS`
   - **Failures**: `0`
   - **Exit code**: `0`

   ![Successful IT 140 macOS Install summary](./assets/42_macos_install_summary.png)

8. Follow the summary's **Next step** instructions. The expected next lifecycle script after a successful Install is:

   ```text
   $HOME/it140/scripts/mac/configure_it140.zsh
   ```

9. Type `exit` and press **Return** to close Terminal. Open a **new** Terminal window before continuing to Step 5.

## 5. Configure the Course IDE

The Configure script sets up the course IDE for your macOS user account. It authenticates the GitHub CLI, configures your Git identity, creates the `~/Repos` folder used for course repositories, creates a **Repos** link on your Desktop, creates the course Python virtual environment, installs the required Python tools and VS Code extensions, and applies the course-managed VS Code settings.

This process is similar to configuring the course IDE in the Codio Virtual Desktop (CVD). If you need more detailed GitHub authentication guidance, see the **[Codio README.md](../../codio/README.md#5-configure-the-cvd)**.

> [!IMPORTANT]
> Run Configure from the macOS account that you will use for course work. Do **not** run it with `sudo`.

1. Open a **new Terminal** window.

2. Click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   "$HOME/it140/scripts/mac/configure_it140.zsh"
   ```

3. Paste the copied command into Terminal with **Command (⌘)** + **V**.

4. Press **Return** once if the script does not start automatically.

5. Follow the on-screen prompts to complete GitHub authentication.

   1. When the script says GitHub authentication is required, press **Return** to begin. Type `C` only if you want to cancel the configuration.
   2. Follow the GitHub CLI instructions shown in Terminal and in the browser window that opens.
   3. Sign in to the GitHub account that you will use for IT 140 and authorize the GitHub CLI when prompted.
   4. Return to Terminal after GitHub authentication is complete.

   ![GitHub authentication opened from the macOS Configure script](./assets/51_macos_github_authentication.png)

6. The script displays a proposed **Git commit display name** based on your GitHub account.

   - Press **Return** to accept the displayed name.
   - Or type a professional name that you want associated with your Git commits and press **Return**.

   The script automatically configures your Git email address using the private GitHub `users.noreply.github.com` address associated with your account.

7. Wait for the script to finish. Review the final **CONFIGURATION SUMMARY** and make sure:

   - **Result**: `PASS`
   - **Failures**: `0`
   - **Exit code**: `0`

   ![Successful IT 140 macOS Configuration summary](./assets/52_macos_configure_summary.png)

8. Confirm that a **Repos** item now appears on your Desktop. Opening it should show your `~/Repos` folder. This is where your course repositories will be stored.

   ![macOS Desktop showing the Repos folder link created by Configure](./assets/53_macos_desktop_repos.png)

9. Follow the summary's **Next step** instructions. The expected next lifecycle script is `verify_it140.zsh`.

10. Type `exit` and press **Return** to close Terminal. Open a **new** Terminal window before continuing to Step 6.

## 6. Verify the Course IDE

The Verify script checks that the required course software, GitHub authentication, Git settings, VS Code settings and extensions, Python environment, `~/Repos` workspace, and Desktop **Repos** link are ready to use. Verify is read-only except for its transcript log; it does not install or repair the course IDE.

> [!IMPORTANT]
> Run Verify as your regular macOS user. Do **not** run it with `sudo`.

1. Open a **new Terminal** window.

2. Click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   "$HOME/it140/scripts/mac/verify_it140.zsh"
   ```

3. Paste the copied command into Terminal with **Command (⌘)** + **V**.

4. Press **Return** once if the script does not start automatically.

5. Wait for the script to finish and review the final **VERIFICATION SUMMARY**.

   - **Ready to continue**: `Result` is `COMPLIANT` and `Failed` is `0`.
   - **Warnings**: Review any warning and its recommended action. A warning does not by itself make the course IDE noncompliant.
   - **Problem found**: If `Result` is `NOT COMPLIANT` or `Failed` is greater than `0`, follow the **Remediation** instructions shown below the summary and run Verify again after correcting the problem.

   ![Successful IT 140 macOS Verification summary showing COMPLIANT and zero failed checks](./assets/61_macos_verify_summary.png)

6. Type `exit` and press **Return** to close Terminal.

## 7. Configure Visual Studio Code

The automation scripts install the required VS Code extensions and course-managed settings. This step completes the first-launch options and prepares VS Code to work with your `~/Repos` folder.

1. Open Visual Studio Code using either method:

   - Press **Command (⌘)** + **Space bar**, type ***Visual Studio Code***, and press **Return**.
   - Open **Finder**, select **Applications**, and double-click **Visual Studio Code**.

   ![Visual Studio Code Welcome page on macOS](./assets/71_macos_vscode_welcome.png)

2. If macOS displays a security prompt because Visual Studio Code is being opened for the first time, confirm that you want to open the application.

3. Sign into VS Code using one of the available options if you want to synchronize supported VS Code settings between computers. **Continue with GitHub** is recommended because you already use GitHub for IT 140. You may also continue without signing in.

   > [!NOTE]
   > If you do not see the Welcome page or a sign-in option, select the **Accounts** icon in the lower-left corner of the VS Code window.

4. If prompted, authorize Visual Studio Code to access GitHub or another account used for VS Code sign-in.

5. If the browser asks permission to open Visual Studio Code, select **Open**.

6. If prompted, select a color theme. Course screenshots and videos show the **Dark High Contrast** theme, but you may choose the theme you prefer.

7. Open the course repository workspace:

   1. In VS Code, select **File** > **Open Folder...**.
   2. Select the **Repos** folder in your home directory (`~/Repos`).
   3. Select **Open**.

8. If VS Code asks **Do you trust the authors of the files in this folder?**, choose the option to trust the `~/Repos` folder and continue.

   If the prompt does not appear and you need to review Workspace Trust later:

   1. Press **Command (⌘)** + **Shift** + **P** to open the Command Palette.
   2. Type `Workspaces: Manage Workspace Trust` and select that command.
   3. Trust the `~/Repos` folder.
   4. Close the Workspace Trust page.

   ![Visual Studio Code Workspace Trust prompt for the Repos folder](./assets/72_macos_vscode_workspace_trust.png)

9. Optional: Keep Visual Studio Code in the Dock.

   1. Control-click the Visual Studio Code icon in the Dock.
   2. Select **Options**.
   3. Select **Keep in Dock**.

10. Optional: If you work in both the CVD and a local course IDE, enable VS Code settings synchronization using your preferred VS Code sign-in account.

> [!IMPORTANT]
> If VS Code reports that an update is available, you do not need to update the course-managed copy separately from VS Code. The IT 140 Update script maintains VS Code and the other managed course IDE components. See **Step 8: Periodic Updates to Course IDE**.

## 8. Periodic Updates to Course IDE

The IT 140 Update script keeps the managed course IDE software, course automation files, Python tools, VS Code extensions, and course-managed VS Code settings current. It does **not** perform a major macOS upgrade and does not manage files inside your `~/Repos` workspace. Continue using **System Settings** > **General** > **Software Update** for macOS operating-system updates.

Run the IT 140 Update script when your course instructions ask you to update the IDE or when you need to bring the managed course software up to date.

> [!IMPORTANT]
> Before updating after you have started course work, commit and push current work to GitHub or save another backup copy. Do **not** run the Update script with `sudo`.

1. Open a **new Terminal** window as your regular macOS Administrator user.

2. Click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   "$HOME/it140/scripts/mac/update_it140.zsh"
   ```

3. Paste the copied command into Terminal with **Command (⌘)** + **V** and press **Return** once if the script does not start automatically.

4. If Terminal requests your password during maintenance of system-wide software, type your macOS password and press **Return**. The script requests administrator authorization only when it is required.

5. Wait for the Update script to finish. Review the final **IT 140 macOS UPDATE SUMMARY** and make sure:

   - **Result**: `PASS`
   - **Failures**: `0`
   - **Exit code**: `0`

   ![Successful IT 140 macOS Update summary](./assets/81_macos_update_summary.png)

6. Follow the summary's **Next step** instructions. After a successful update, the expected next lifecycle script is:

   ```text
   $HOME/it140/scripts/mac/verify_it140.zsh   ```

7. Type `exit` and press **Return** to close Terminal. Open a **new** Terminal window and run Verify using the instructions in Step 6.

## Next Step

Once you have completed setting up the course IDE on one local computer, you may stop here until you are ready to start the Module Two assignment. However, we recommend that you also configure the course IDE in Codio, if you have not done so already.

- **[Configure the course IDE on Codio](../../codio/README.md)**

Optionally, if you have another local computer, you can also set up the course IDE on that machine:

- **Set up the course IDE on another local computer**
  - [Windows](../windows/README.md)
  - [Linux](../linux/README.md)

## Troubleshooting

If a setup or verification script reports an error, review the final summary and the log file identified by the script. IT 140 automation logs are stored in your `~/it140/logs/` folder.

Follow any **Next step** or **Remediation** instructions displayed by the script. Do not proceed to the next lifecycle phase until the current phase completes successfully.

For troubleshooting guidance and information to include when asking for help, see the main activity's **[Technical Support](../../README.md#technical-support)** section.
