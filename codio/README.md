<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks | Codio Virtual Desktop (CVD)

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Codio Virtual Desktop (CVD)
- **Activity Type**: Required, non-graded, no submission

---

## ⚠️ Under Construction

This repository is under active development. Code, documentation, structure, and features may change before the course begins. Check back periodically for updates.

---

## Overview

{{TODO: Explain why students may want to use the CVD for course assignments.}}

## 1. Launch the Codio Virtual Desktop (CVD)

{{TODO: Add instructions and screenshots for launching the CVD from within D2L Brightspace and from codio.com.}}

The course IDE is already installed on the master Codio Virtual Desktop (CVD) image. You do not need to install it yourself.

## 2. Sign into SNHU OneDrive

{{TODO: Explain why students should sign into OneDrive and how to use it as persistent storage for their work in the CVD.}}

1. [ ] Double-click on the "OneDrive" icon on the desktop to open the OneDrive login page in Chrome. Be patient, as it may take a few seconds for the page to load.
2. [ ] Sign into Chrome using your Google Account credentials if you wish to synchronize your Google Account settings, bookmarks, and extensions with the CVD, or use G-Drive as persistent storage. Otherwise, you may skip this step.
3. [ ] Sign into OneDrive using your SNHU credentials.

## 3. Create a GitHub Account

{{TODO: Explain why students should create a GitHub account and how it will be used in the course.}}

A GitHub account is recommended for all IT 140 students. Having a GitHub account will make it easier to access assignment materials, synchronize your work across platforms, and save your work to the cloud when working in the CVD. If you already have a GitHub account that you want to use for your academic program, skip this step.

1. [ ] Double-click on the "GitHub" icon on the CVD desktop to open the [GitHub login page](https://github.com/login) in Chrome. Be patient, as it may take a few seconds for the page to load.
2. [ ] Create a new GitHub account using your preferred method from the list below:

  - **Continue with Google** (to create an account with your Google credentials)
  - **Continue with Apple** (to create an account with your Apple credentials)
  - **Create an account** to manually enter a username or other email address and password

> [!Note]
> {{TODO: Add instructions for CS students to select a professional username and email address for their GitHub account.}}

## 4. Configure GitHub Account

This step is required if using a GitHub account in this course. This step assumes you already have a GitHub account that you want to use. If you do not have a GitHub account, you will need to create one by following the instructions in Step 3.

1. [ ] If not already logged into your GitHub account, double-click on the **GitHub** icon on the CVD desktop to open the [GitHub login page](https://github.com/login) in Chrome. Be patient, as it may take a few seconds for the page to load.
2. [ ] Go to [`https://github.com/settings/emails`](https://github.com/settings/emails)
3. Add and verify the following email addresses:
   1. [ ] Your SNHU email address;
   2. [ ] A personal email address that you will access to after you leave SNHU;
   3. [ ] A third email address as another backup (recommended).
4. [ ] Turn **Keep my email addresses private** to **On** to reduce spam and phishing attacks.
5. [ ] Note your new public profile email address. It ends in `@users.noreply.github.com`.
6. [ ] OPTIONAL: If desired, update your Public profile at ([https://github.com/settings/profile](https://github.com/settings/profile))

## 5. Configure Visual Studio Code

1. [ ] Launch VS Code by double-clicking the **Visual Studio Code** icon on the CVD desktop.
2. [ ] Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**
3. [ ] If prompted, authorize VS Code to access your linked account.
4. [ ] Select your color theme. Course screenshots show the "Solarized Dark" theme, but you may choose the theme you prefer.

## 6. Download Course Assignment Materials

### GitHub

1. [ ] Open a terminal in VS Code by pressing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.
2. [ ] Copy and paste the following commands into the terminal to create a working directory for your course assignments, log into GitHub, and fork and clone the course assignment repositories:

```bash
gh auth login --hostname github.com --git-protocol https --web --clipboard

```

3. [ ] If prompted, to "Authenticate Git with your GitHub credentials? (Y/n)", type `Y`.

If prompted...
> First copy your one-time code: HHHH-HHHH (your code will be different)
> Press **Enter** to open https://github.com/login/device in your browser.

4. [ ] Remember the one-time code. You will need it to complete the authentication process.
5. [ ] Press **Enter** to open the GitHub login page in the default browser.
6. [ ] Follow the prompts to activate GitHub on this device.
