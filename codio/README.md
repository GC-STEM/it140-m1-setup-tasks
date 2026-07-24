<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks | Codio Virtual Desktop (CVD)

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Codio Virtual Desktop (CVD)
- **Activity Type**: Required, non-graded, no submission

## Table of Contents

- [IT 140 Module One: Setup Tasks | Codio Virtual Desktop (CVD)](#it-140-module-one-setup-tasks--codio-virtual-desktop-cvd)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [0. Prerequisites](#0-prerequisites)
  - [1. Launch the Codio Virtual Desktop (CVD)](#1-launch-the-codio-virtual-desktop-cvd)
  - [2. Clone the Main Course Repository to the CVD](#2-clone-the-main-course-repository-to-the-cvd)
  - [3. Update the CVD](#3-update-the-cvd)
  - [4. Configure the CVD](#4-configure-the-cvd)
  - [5. Sign into Cloud Storage Services (Optional)](#5-sign-into-cloud-storage-services-optional)
  - [6. Configure Visual Studio Code in the CVD](#6-configure-visual-studio-code-in-the-cvd)

## Overview

{{TODO: Explain why students may want to use the CVD for course assignments.}}

## 0. Prerequisites

To complete these setup tasks, you will need the following:

- [ ] Access to an IT 140 course in D2L Brightspace

- [ ] GitHub credentials (username, password)

- [ ] SNHU credentials (username, password), if using OneDrive for persistent storage in the CVD

- [ ] Google credentials (username, password), if using G-Drive for persistent storage in the CVD

> [!TIP]
> You can find your GitHub username at [https://github.com/settings/profile](https://github.com/settings/profile).  
>  
> You can find your GitHub public noreply email address on [https://github.com/settings/emails](https://github.com/settings/emails) under the **Keep my email addresses private** section. It will look similar to: `302326151+peteypenmen@users.noreply.github.com`

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
   mkdir -p "$HOME/it140"
   temp_dir="$(mktemp -d)"
   git clone --depth 1 \
   "https://github.com/GC-STEM/it140.git" \
   "$temp_dir/it140"
   rm -rf "$temp_dir/it140/.git"
   cp -a "$temp_dir/it140/." "$HOME/it140/"
   rm -rf "$HOME/it140/.git"
   rm -rf "$temp_dir"
   chmod +x "$HOME/it140/scripts/"*.sh
   echo 'export PATH="$HOME/it140/scripts:$PATH"' >> "$HOME/.bashrc"
   source "$HOME/.bashrc"
   ```

3. In the terminal window, right-click and select **Paste**. Do NOT use keyboard shortcuts. If you use keyboard shortcuts (e.g., `Ctrl+V`), you will introduce unwanted characters into the command and it will not work.

4. Press **Enter** to run the pasted commands.

5. Close the terminal window by typing `exit` and pressing **Enter**.

## 3. Update the CVD

> [!IMPORTANT]
> If you update the CVD after starting work on course activities, save your work on another platform (e.g., GitHub, OneDrive, your local machine) before running the update script, just in case the update fails and we need to reset your VM. You do not need to backup if you have not save any work in the CVD yet.

1. Click once on the **Terminal** icon in the CVD task bar to open a terminal window.

2. Type or copy the following command into the terminal window to update the CVD. Be patient, as this may take several minutes to complete.

   ```bash
   bash update_cvd.sh
   ```

3. Review the **Update Summary** notices to see if a VM restart is required.

4. Close the terminal window by typing `exit`.

5. If a VM restart is required,
   1. Save any open work and close all windows in the CVD.
   2. Click on **RESTART VM** on the VM tab menu bar
   3. Wait for the CVD to restart and reconnect. It will take a few minutes.

## 4. Configure the CVD

1. Click once on the **Terminal** icon in the CVD task bar to open a terminal window.

2. Type or copy the following command into the terminal window to run an automated update script.

   ```bash
   bash config_cvd.sh
   ```

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

3. If prompted, authorize VS Code to access GitHub or another linked account.

4. If prompted, **Open xdg-open?**, check the "Always allow" box and click **Open xdg-open**.

5. If prompted, select your color theme. Course screenshots show the "Dark High Contrast" theme, but you may choose the theme you prefer.

6. Click the **Get Started** button on the Welcome page to dismiss it.

   > [!IMPORTANT]
   > If you ever see an **Update** button on the VS Code menu bar in the CVD, don't press it. You can ignore it or update the CVD by re-running `bash update_cvd.sh`. Be sure to save your work on another platform (e.g., GitHub, OneDrive, your local machine) before updating the CVD, just in case the update fails and we need to reset your VM.
