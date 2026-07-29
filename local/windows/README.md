<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Development Environment Local Setup on Windows

This document provides instructions for optionally setting up the IT 140 development environment (course IDE) on a modern Windows operating system. It covers the software and tools needed to complete all course activities.

> [!IMPORTANT]
> The following setup phases are sequential. Do NOT proceed with the next phase of the installation until you have fully completed the preceding phases. Refer to the [Troubleshooting](#troubleshooting) section of this guide for additional help. If you get stuck, you can always use the course IDE in the Codio Virtual Desktop (CVD) to complete assignments until you get your local course IDE working.

## 0. Run the System Compatibility Check

Before setting up the course IDE on Windows, we must verify that your computer's security permissions allow you to run software developer tools. It is common for users of computers owned by others to have restricted account privileges or (such as a parental controls or [Windows S Mode](https://support.microsoft.com/en-us/windows/experience/platform-variants/windows-10-and-windows-11-in-s-mode-faq)) to block local programming commands entirely. This simple 5-second test will determine if your machine can support local setup of the course IDE, or if you should bypass it and use just the Codio Virtual Desktop (CVD) option.

1. On your keyboard, press the **Windows** (⊞) + **R** keys at the same time to open the **Run** dialog box.

2. Type `cmd` into the box and press **Enter**.

3. Observe what happens on your screen:

   - **GO**: A terminal window opens and shows a blinking cursor after the command prompt. Your computer's operating system likely allows local command-line tools.
   **Recommendation**: Continue with local setup of the course IDE.

   <!--SME TODO: Add screenshots for GO.-->

   - **NO GO**: An error popup appears, or the window immediately closes. Your computer's operating system or employer-managed security policy blocks local command-line tools. You will not be able to install or run the course IDE locally unless you resolve these issues.  
   **Recommendation**: Use just the CVD. Go to the [Codio README.md](../../codio/README.md) to configure the CVD, if you have not done so already. Otherwise, return to the main [README.md](../../README.md) to complete any outstanding tasks.

   <!--SME TODO: Add screenshots for NOGO.-->

   <!--SME TODO: Add link(s) to remedial instructions for NOGO when they are developed. For example, disable Windows S Mode, -->

## 1. Create a Restore Point

Before installing any software, it is best practice to enable system protection and create a restore point using **Windows System Protection**. That way, you can undo system changes if something goes wrong during setup.

1. On your keyboard, hold down the **Windows** (⊞) key and press the **S** key to open the **Search** application. In the search box, start typing ***Create a restore point***. Select the **Create a restore point** app from the results when it appears.

   ![Create a restore point](./assets/11_search_for_restore_point.png)
   ![System Protection Tab](./assets/12_system_protection_tab.png)

2. If the **Create…** button is selectable in the preceding image, skip to Step 4. If the **Create…** button is not selectable, as shown in the above second image, click the **Configure…** button.

3. Select the **Turn on system protection** radio button and adjust the **Max Usage** slider to 5%.
Click the **OK** button.

   ![System Protection for Drive Off](./assets/13_system_protection_for_drive_off.png)
   ![System Protection for Drive On](./assets/14_system_protection_for_drive_on.png)

4. Click the **Create…** button. Enter a descriptive name for the restore point in the **System Protection** popup window, such as ***Before General Update*** and click the **Create** button.

   ![System Protection Create Restore Point](./assets/15_create_restore_point.png)
   ![System Protection Created Restore Point](./assets/16_created_restore_point.png)

5. After the restore point is created, click the **Close…** button.

### Restore System (*if needed*)

> [!NOTE]
> If you ever want to restore your system to the state before you created a restore point without affecting your personal files, repeat Step 1 and click the System Restore button and then the **Next>** button. Select the desired restore point from the list and click the second **Next>** button. Then, click the **Finish** button.
>
> ![System Restore Step 1: Information](./assets/17_system_restore_1.png)
> ![System Restore Step 2: Select Restore Point](./assets/18_system_restore_2.png)
> ![System Restore Step 3: Finish Restore](./assets/19_system_restore_3.png)

## 2. Update Windows

{{SME TODO: Add instructions and screenshots for the most reliable and novice-friendly way of updating Windows.}}

9. Create another restore point after updating Windows, as described in Step 1.4. A good name for this restore point is ***Before IT140 Course IDE Setup***. This way, if these is a problem with the course IDE setup, you can restore your system to the state it was in after updating Windows.

## 3. Clone the Main Course Repository to Windows

<!--SME TODO: Add brief explanation of how what 'bootstrap' means in this context and high level summary of what the bootstrap commands do.-->

1. Hold down the **Windows** (⊞) key on your keyboard and press the **R** key to open the **Run** application.

2. In the **Run** dialog box, type ***powershell*** and press **Ctrl** + **Shift** + **Enter** to open with administrator privileges, regardless of which version of Run you see.

   ![Run Dialog: Open PowerShell](./assets/21_run_powershell_user.png)
   ![Run Dialog: Open PowerShell as User](./assets/21_run_powershell_user.png)

3. Verify the PowerShell terminal window title bar shows **Administrator: Windows PowerShell**, as shown in the image below. If it does not, close the window and repeat Steps 1–2.

   ![PowerShell Terminal: Administrator Privileges](./assets/23_powershell_admin.png)

   >[!NOTE]
   > The colors of your terminal window and prompt path (C:\Users\USERNAME) may be different than those shown in the screenshots, which is fine. Just make sure the window title bar shows **Administrator: Windows PowerShell**

4. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below

   {{SME TODO: Replace with the current actual code block for the bootstrap commands. The following is functional but outdated.}}

   ```powershell
   Start-Transcript -Path "$env:USERPROFILE\Desktop\it140_setup.log" -Force
   # Installing and updating system dependencies...
   Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
   Install-PackageProvider -Name NuGet -Force | Out-Null
   Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
   Repair-WinGetPackageManager -AllUsers
   winget source update
   # Installing course IDE components...
   winget install --id Git.Git -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
   winget install --id GitHub.cli -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
   winget install --id Python.Python.3.12 -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
   winget install --id Microsoft.VisualStudioCode -e -s winget --silent --disable-interactivity --accept-source-agreements --accept-package-agreements --verbose-logs
   # Updating the terminal environment...
   [System.Environment]::GetEnvironmentVariables('Machine').GetEnumerator() | ForEach-Object { Set-Item -Path "Env:\$($_.Key)" -Value $_.Value }; [System.Environment]::GetEnvironmentVariables('User').GetEnumerator() | ForEach-Object { Set-Item -Path "Env:\$($_.Key)" -Value $_.Value }; $env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')
   # Configuring course IDE components...
   python.exe -m pip install --upgrade pip pytest pytest-cov ruff
   git config --global init.defaultBranch main
   git config --global core.editor "code --wait"
   # Installing code editor extensions...
   $env:NODE_NO_WARNINGS = "1"
   code --install-extension ms-python.python --force
   code --install-extension charliermarsh.ruff --force
   code --install-extension hediet.vscode-drawio --force
   code --install-extension streetsidesoftware.code-spell-checker --force
   code --install-extension i2p-hub.i2p-pseudo --force
   code --install-extension cweijan.vscode-office --force
   Remove-Item Env:NODE_NO_WARNINGS -ErrorAction SilentlyContinue
   # ===== Course IDE installation complete. =====
   # Before continuing, review the messages above.
   # Look for words like Error, Failed, Exception, Access denied, or not recognized.
   # Some errors may appear in red text, but text color can vary.
   # If you do not see an error message, continue to the next step.
   # If you see an error, see the Troubleshooting section of the setup repo.
   # A setup log was saved to your Desktop as: it140_setup.log.
   # Detailed WinGet logs are available if tech support needs them; run: winget --logs.
   Stop-Transcript

   ```

2. Paste clipboard contents into the **Administrator: Windows PowerShell** terminal at the command prompt by right-clicking immediately after **PS C:\WINDOWS\system32>**.

3. Press **Enter** once to ensure all the commands run.

4. Wait for the commands to complete as evidenced by the return of the command prompt. This may take several minutes.

5. Type `exit` and press **Enter** to close the PowerShell terminal window.

## 4. Install the Course IDE on Windows

1. Open a new PowerShell terminal window with administrator privileges, as you did in Steps 3.1 to 3.3.

2. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below

   ```powershell
   cd "C:\Users\$env:USERNAME\it140\scripts\win\"
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
   .\setup_cvd.ps1

   ```

3. Paste clipboard contents into the **Administrator: Windows PowerShell** terminal at the command prompt by right-clicking immediately after the prompt.

4. If the script did not start, press **Enter** to run it.

5. Wait for the script to complete as evidenced by the return of the command prompt. This may take several minutes.

6. Close the terminal window by typing `exit` and pressing **Enter**.

## 5. Configure the Course IDE on Windows

1. Open a new PowerShell terminal window as a **regular user**.
   1. Hold down the **Windows** (⊞) key on your keyboard and press the **R** key to open the **Run** application.
   2. In the **Run** dialog box, type ***powershell*** and press just **Enter**.
   3. Make sure that **Administrator** does NOT appear in the terminal window title bar. If it does, close the window and repeat Steps 5.1.1–5.1.2.

2. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below

   ```powershell
   cd "C:\Users\$env:USERNAME\it140\scripts\win\"
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
   .\config_cvd.ps1

   ```

3. Paste clipboard contents into the **Windows PowerShell** terminal at the command prompt by right-clicking immediately after the prompt.

4. If the script did not start, press **Enter** to run it.

5. Follow the on-screen prompts to complete the configuration script.

6. Close the terminal window by typing `exit` and pressing **Enter**.

## 6. Verify the Course IDE on Windows

1. Open a new PowerShell terminal window as a **regular user**.
   1. Hold down the **Windows** (⊞) key on your keyboard and press the **R** key to open the **Run** application.
   2. In the **Run** dialog box, type ***powershell*** and press just **Enter**.
   3. Make sure that **Administrator** does NOT appear in the terminal window title bar. If it does, close the window and repeat Steps 6.1.1–6.1.2.

2. Using your pointing device (mouse, trackpad, etc.), click the **Copy** button in the top-right corner of the code block below

   ```powershell
   cd "C:\Users\$env:USERNAME\it140\scripts\win\"
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
   .\verify_cvd.ps1

   ```

3. Paste clipboard contents into the **Windows PowerShell** terminal at the command prompt by right-clicking immediately after the prompt.

4. If the script did not start, press **Enter** to run it.

5. Review the verification summary and follow any instructions provided to resolve issues, if any.

6. Close the terminal window by typing `exit` and pressing **Enter**.

7. Create

## 7. Configure Visual Studio Code in the Windows

1. Double-click on the **Visual Studio Code** icon on the Windows desktop.

2. Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (highly recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**

   > [!NOTE]
   > If you do not see the Welcome page, click the blue **Sign in** button on the VS Code menu bar.

3. If prompted, authorize VS Code to access GitHub or other linked account(s).

4. If prompted, check the "Always allow" box and click **Open** button.

5. If prompted, select your color theme. Course screenshots and videos show the "Dark High Contrast" theme, but you may choose the theme you prefer.

6. Click the **Get Started** button on the **Welcome** page to dismiss it.

   > [!IMPORTANT]
   > If you ever see an **Update** button on the VS Code menu bar in the Windows, don't press it. You can ignore it or update the Windows by re-running `update_cvd.sh`. Be sure to save your work on another platform (e.g., GitHub, OneDrive, your local machine) before updating the Windows, just in case the update fails and we need to reset your VM.

## Next Step

Once you have completed Codio Virtual Desktop (Windows) configuration, you may stop here. You may complete all course activities from web-based learning platforms–Brightspace, zyBooks, and Codio.

However, we recommend you set up the course IDE on at least one local computer, if possible. Doing so provides an alternative development environment in case the Windows is unavailable and provides access after the course. Your VS Code and your GitHub account will synchronize your work between the Windows and your local course IDE, so you can continue working on assignments from either environment.

- **Set Up the Course IDE on Your Local Computer(s)**
  - [Windows](../local/windows/README.md)
  - [MacOS](../local/macos/README.md)
  - [Linux](../local/linux/README.md)

## Troubleshooting

<!--SME TODO: Add troubleshooting information for Windows configuration.-->
