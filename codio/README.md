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

## 0. Prerequisites

To complete these setup tasks, you will need the following:

- [ ] Access to an IT 140 course in D2L Brightspace
- [ ] Your GitHub username, password, and public noreply email address that you configured in [Set Up A GitHub Account](../github/README.md)

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
7. Read the *IT 140 Codio Virtual Desktop Guide* on the right all the way through at least once.
8. Click the **Collapse** button when done reading to hide the guide. You can always expand the guide again later if you need to reference it.
9. Consider bookmarking the Codio Virtual Desktop (CVD) page in your local browser for direct access later.

## 2. Sign into Cloud Services

{{TODO: Explain why students should sign into OneDrive and how to use it as persistent storage for their work in the CVD.}}

1. Double-click on the "OneDrive" icon on the desktop to open the OneDrive login page in Chrome. Be patient, as it may take a few seconds for the page to load.
2. Sign into Chrome using your Google Account credentials if you wish to synchronize your Google Account settings, bookmarks, and extensions with the CVD, or use G-Drive as persistent storage. Otherwise, you may skip this step.
3. Sign into OneDrive using your SNHU credentials.


## 3. Configure Visual Studio Code

1. Launch VS Code by double-clicking the **Visual Studio Code** icon on the CVD desktop.
2. Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**
3. If prompted, authorize VS Code to access your linked account.
4. Select your color theme. Course screenshots show the "Solarized Dark" theme, but you may choose the theme you prefer.

## 6. Download Course Assignment Materials

### GitHub

1. Open a terminal in VS Code by pressing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.
2. Copy and paste the following commands into the terminal to create a working directory for your course assignments, log into GitHub, and fork and clone the course assignment repositories:

```bash
gh auth login --hostname github.com --git-protocol https --web --clipboard

```

3. If prompted, to "Authenticate Git with your GitHub credentials? (Y/n)", type `Y`.

If prompted...
> First copy your one-time code: HHHH-HHHH (your code will be different)
> Press **Enter** to open https://github.com/login/device in your browser.

4. Remember the one-time code. You will need it to complete the authentication process.
5. Press **Enter** to open the GitHub login page in the default browser.
6. Follow the prompts to activate GitHub on this device.
