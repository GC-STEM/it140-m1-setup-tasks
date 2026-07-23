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

- [ ] SNHU credentials (username and password)

- [ ] GitHub credentials (username, password, and public noreply email address that you configured in [Set Up A GitHub Account](../github/README.md))

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

## 2. Sign into Cloud Storage Services (Optional)

1. Double-click on the "OneDrive" icon on the CVD desktop to open the OneDrive login page in Chrome. Be patient, as it may take a few seconds for the page to load.

2. Optional: Sign into Chrome using your Google Account credentials if you wish to synchronize your Google Account settings, bookmarks, and extensions with the CVD, or use G-Drive as persistent storage. Otherwise, you may skip this step.

3. Optional: Sign into OneDrive using your SNHU credentials if you wish to use OneDrive as persistent storage for your work in the CVD. Otherwise, you may skip this step. If you choose to sign into OneDrive, follow the steps below:
   1. Enter your SNHU email address and click **Next**.
   2. Enter your SNHU password and click **Sign in**.
   3. If prompted, click **Allow** to allow OneDrive to access resources on the CVD.

4. Close the browser window in the CVD when done signing into OneDrive and/or Chrome.

## 3. Sign into GitHub from the CVD

```bash
gh auth login --clipboard
```

1. Double-click on the **GitHub** icon on the CVD desktop to open the GitHub login page in Chrome. Be patient, as it may take a few seconds for the page to load.

2. Sign into GitHub using the same method you used to [Set Up A GitHub Account](../github/README.md). You may use your GitHub username and password, or sign in with Google or Apple if you linked those accounts to your GitHub account.

3. Follow the prompts to authorize the CVD to access your GitHub account.

4. If prompted, to "Authenticate Git with your GitHub credentials? (Y/n)", type `Y`.

   1. Copy your one-time code: HHHH-HHHH (your code will be different)You will need it to complete the authentication process.
   2. Press **Enter** to open https://github.com/login/device in your browser.
   3. Press **Enter** to open the GitHub login page in the default browser.

5. Follow the prompts to activate GitHub on this device.

6. Close the browser window in the CVD when done signing into GitHub.

## 4. Configure Visual Studio Code in the CVD

1. Double-click on the **Visual Studio Code** icon on the CVD desktop.

2. Sign into VS Code using one of the following methods:
   - **Continue with GitHub** (recommended)
   - **Sign in with Google** (click on **G** icon)
   - **Sign in with Apple** (click on Apple icon)
   - **Continue without Signing in**

3. If prompted, authorize VS Code to access your linked account.

4. If prompted, **Open xdg-open?**, check the "Always allow" box and click **Open xdg-open**.

5. If prompted, select your color theme. Course screenshots show the "Solarized Dark" theme, but you may choose the theme you prefer.

6. If you see an **Update** button in the top VS Code menu bar, ignore it for now.

## 5. Clone the Main Course Repository in the CVD

1. In **Visual Studio Code** on the CVD desktop, open a terminal by pressing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.

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

3. In the **VS Code** terminal, right-click and select **Paste**. Do NOT use keyboard shortcuts.

4. Press **Enter** to run the pasted commands.

5. Verify your `~/it140` directory now contains a `scripts/` folder.

6. If continuing with the next step, do not close the VS Code terminal. Otherwise, you may close the terminal and VS Code when done.

## 6. Configure Git in the CVD

1. If at anytime during this process you see a message bar towards the top of the VS Code window starting with "Restricted Mode"
   1. Click the **Manage** link
   2. Click **Trust** to run scripts in the `it140/` folder
   3. Close the **Workspace Trust** window.
2. If a VS Code terminal is not already open, open a terminal by pressing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.


2. Click the **it140** folder and then the **Select** button

3. If you see a message bar starting with "Restricted Mode"
   1. Click the **Manage** link
   2. Click **Trust** to run scripts in the it140 folder
   3. Close the **Workspace Trust** window.

4. From VS Code main menu bar, select **File > New File**.

5. Name the file `gitconfig.sh` 

6. In your home directory (e.g., `/home/codio/gitconfig.sh`) and copy and paste the following commands into the file, replacing `<your-github-username>` and `<your-github-noreply-email>` with your GitHub username and public noreply email address that you configured in [Set Up A GitHub Account](../github/README.md):

```bash
2. Open a terminal in VS Code by pressing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.
3. 

Clone the Main Course Repository

### GitHub

1. Open a terminal in VS Code by prelick it to update VS Code to the latest version. Close any browser windows that popped up. Youssing **Ctrl** + **`** (backtick key--to the left of the **1** key) or selecting **View > Terminal** from the menu bar.
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
