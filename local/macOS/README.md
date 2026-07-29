<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Local Setup on macOS

This document provides instructions for optionally setting up the IT 140 development environment (course IDE) on a supported Apple silicon Mac. The local setup is intended for students who can authorize software installation with an administrator account. It installs and configures the programming software and developer tools needed to complete IT 140 course activities.

> [!IMPORTANT]
> Installing the course IDE on your Mac is optional. The following setup phases are sequential, so do **not** proceed to the next phase until the current phase is complete. Refer to the [Troubleshooting](#troubleshooting) section for additional help. If you get stuck, you can use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until your local course IDE is working.

## 0. Run the System Compatibility Check

Before setting up the course IDE, confirm that your Mac uses Apple silicon and that your account can authorize software installation. A Mac owned or managed by an employer, school, or another person may restrict these actions.

1. Click the **Apple menu** in the upper-left corner of the screen and select **About This Mac**.

2. Find the **Chip** entry.

   - **GO**: The chip name begins with **Apple M**, such as Apple M1, M2, M3, M4, or a later Apple chip. Continue to Step 3.

   <!--SME TODO: Add screenshots for GO.-->

   - **NO GO**: The chip entry identifies an Intel processor. The current IT 140 macOS automation does not support Intel-based Macs.

   **Recommendation**: Use the CVD. Go to the [Codio README.md](../../codio/README.md) to configure the CVD, if you have not done so already. Otherwise, return to the main [README.md](../../README.md) to complete any outstanding tasks.

   <!--SME TODO: Add screenshots for NOGO.-->

   <!--SME TODO: Add link(s) to remedial instructions for NOGO when they are developed.  -->

3. Open **System Settings**, select **Users & Groups**, and find your account.

   - **GO**: Your account is identified as an **Admin** or **Administrator** account. Continue with the local setup.
   - **NO GO**: Your account is a **Standard** account, or your Mac is managed and does not allow software installation.

   **Recommendation**: Ask the Mac owner or administrator whether they can authorize the required installations. Otherwise, use the CVD.

4. Confirm that the Mac is connected to the internet and has at least 5 GB of available storage.

   To check storage, open **System Settings**, select **General**, and then select **Storage**.

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

{{SME TODO: Add instructions and screenshots for the most reliable and novice-friendly way of updating macOS.}}

After updating macOS, restart the Mac if prompted. Sign back in to the account that you will use for IT 140 before continuing.

## 3. Clone the Main Course Repository

<!--SME TODO: Add brief explanation of what 'bootstrap' means in this context and high level summary of what the bootstrap commands do.-->

1. Press **Command (⌘)** + **Space bar** to open Spotlight Search.

2. Type ***Terminal*** and press **Return**.

3. Verify that a Terminal window opens and displays a command prompt. The prompt and Terminal colors may look different from examples in this guide.

4. Using your pointing device, click the **Copy** button in the top-right corner of the code block below.

   ```zsh
   {{SME TODO: Replace with the current actual code block for the bootstrap commands. The following is functional but outdated.}}
   ```

5. Click in the Terminal window and press **Command (⌘)** + **V** to paste the commands.

6. Press **Return** once to ensure that all pasted commands run.

7. Wait for the commands to finish and for the command prompt to return. This may take several minutes.

8. Type `exit` and press **Return** to close the Terminal window.

## 4. Install the Course IDE

1. Open a new Terminal window using Spotlight Search, as described in Steps 3.1–3.2.

   > [!IMPORTANT]
   > Run the setup script from your regular macOS account. Do **not** add `sudo` before the script command. The script will request administrator authorization only when it is required.

2. Copy the following commands.

   ```zsh
   cd "$HOME/it140/scripts/mac"
   ./setup_mac.sh
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
   cd "$HOME/it140/scripts/mac"
   ./config_mac.sh
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
   cd "$HOME/it140/scripts/mac"
   ./verify_mac.sh
   ```

3. Paste the commands into Terminal with **Command (⌘)** + **V**, and then press **Return** if the script does not start automatically.

4. Wait for the script to finish.

5. Review the verification summary.

   - **PASS**: Continue to Step 7.
   - **PASS WITH WARNINGS**: Review each warning and any recommended action before continuing.
   - **FAIL**: Follow the remediation instructions in the summary, and then run `verify_mac.sh` again.

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
> Use `update_mac.sh` for periodic maintenance of the course IDE instead of updating its managed components individually. Save current course work to GitHub or another backup location before running an update.

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
