<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks | Local Computer

Setup progress: [0 Start Here](../README.md) → [1 GitHub](../github/README.md) → [2 Codio](../codio/README.md) → **3 Local Computer**

## Optional Local Setup

Installing the IT 140 development environment (**course IDE**) on your local computer is **optional**.

The [Codio Virtual Desktop (CVD)](../codio/README.md) is the course reference environment. Course instructions, screenshots, and instructional videos use the CVD as their reference. You can complete IT 140 using the CVD without installing the course IDE on your own computer.

If you prefer to work directly on your own computer, you may also install the course IDE locally. You can do this now, later in the course, or not at all.

> **If local setup becomes difficult or stops working, use the CVD.**
> A working local installation is not required to complete IT 140.

## Activity Metadata

* **Course:** IT 140 - *Introduction to Scripting*
* **Activity Title:** 1-1 Setup Tasks | Local Computer
* **Activity Type:** Optional, non-graded, no submission
* **Activity Purpose:** Optionally prepare the IT 140 development environment for completing course assignments on a local computer.
* **Activity Description:** This activity directs students using supported operating systems to the appropriate automated setup guide and provides a manual setup option for other computers or students who prefer to install and configure the course tools themselves.
* **Artifact Version:** 0.10.0-beta.1
* **Artifact Date:** 2026-08-09
* **Development Status:** Beta Testing

## Choose a Local Setup Method

### Recommended: Use a Supported Setup Guide

If your computer uses one of the supported operating systems below, use its README. These guides use IT 140 automation to install, configure, and verify the course IDE as consistently as possible.

* **Windows:** [Windows 10 22H2 or Windows 11](windows/README.md)
* **macOS:** [Sonoma 14, Sequoia 15, or Tahoe 26](macOS/README.md)
* **Linux:** [Ubuntu with GNOME Desktop](linux/README.md)

The operating-system-specific README is the primary source for system requirements, preparation, installation, configuration, verification, updates, and troubleshooting for that platform. Just click on one of the links above to continue with the recommended setup.

If your operating system is supported but you prefer to install the course tools yourself, you may instead continue with the **Manual Local Setup** below.

> **Having trouble?** You can stop local setup at any time and continue your coursework in the [Codio Virtual Desktop (CVD)](../codio/README.md).

### Manual Local Setup Option

Continue with the remainder of this README if:

* Your operating system is not currently supported by an IT 140 automated setup guide.
* Your computer does not meet all requirements of a supported setup guide.
* You use another Linux distribution or desktop environment.
* You use an older version of Windows or macOS.
* You prefer to install and configure the course tools manually.

The manual instructions use graphical installers and application settings where practical. A few short terminal commands are included where they are the simplest way to configure or verify developer tools.

> **Important**
>
> Manual setup is a best-effort alternative and is not a fully supported IT 140 configuration. Operating systems, package managers, application installers, and security settings differ between computers.
>
> If your operating system no longer receives security updates from its publisher, using the CVD or another supported computer is recommended instead.
>
> Do not disable security software, bypass administrator restrictions, or make major system changes just to complete the optional local setup.

## What You Will Install

The manual setup uses the same core tools used by the supported IT 140 course IDE:

| Category             | Software                                |
| -------------------- | --------------------------------------- |
| Version control      | Git                                     |
| GitHub tools         | GitHub CLI                              |
| Programming language | Python 3.12                             |
| Testing              | pytest and pytest-cov                   |
| Code quality         | Ruff                                    |
| Code editor / IDE    | Visual Studio Code                      |
| Python support       | `ms-python.python`                      |
| Ruff support         | `charliermarsh.ruff`                    |
| Diagram support      | `hediet.vscode-drawio`                  |
| Pseudocode support   | `i2p-hub.i2p-pseudo`                    |
| Spell checking       | `streetsidesoftware.code-spell-checker` |
| File viewing         | `cweijan.vscode-office`                 |

Python **3.12** is used to remain consistent with the CVD, zyBooks, course examples, and provided tests.

---

## Manual Local Setup Instructions

### 1. Prepare Your Computer

Before installing software:

1. Save or back up important personal files.

2. Install operating-system updates that are available for your computer.

3. Make sure your account is allowed to install applications.

4. If the computer is managed by an employer, school, family member, or another organization, follow its software-installation policies.

5. Open your file manager:

   * **Windows:** File Explorer
   * **macOS:** Finder
   * **Linux:** Files or your distribution's file manager

6. Open your user home folder.

7. Create a folder named:

   `Repos`

Later in the course, assignment and project repositories will normally be stored in this folder.

> **Having trouble?** Local setup is optional. You can use the [Codio Virtual Desktop (CVD)](../codio/README.md) and return to local setup later.

### 2. Install Git

Git is the version-control software used to work with course repositories.

1. Open the official [Git downloads](https://git-scm.com/downloads) page.

2. Choose the download for your operating system.

3. Follow the publisher's installation instructions.

4. If the installer presents options that you do not recognize, keep the recommended or default settings unless your operating system requires something different.

5. Close and reopen any terminal windows after installation.

#### Check Git

If your computer provides **Git Bash**, Terminal, or another command-line application, open it and enter:

```bash
git --version
```

You should see a Git version number.

Do not worry if the exact version differs from the CVD.

> **Having trouble?** You do not need Git installed locally to continue the course. Use the CVD while you troubleshoot the local installation.

### 3. Configure Your Git Identity

Git records an author name and email address with changes that you save to version control.

You identified your GitHub account information during [Step 1: Set Up a GitHub Account](../github/README.md).

#### Configure Your Display Name

Open Git Bash or a terminal and enter:

```bash
git config --global user.name "Your Display Name"
```

Replace `Your Display Name` with the name you want recorded in Git history.

Your Git display name may become public if you later publish a repository.

#### Configure Your GitHub Noreply Email Address

Enter:

```bash
git config --global user.email "YOUR-NOREPLY-EMAIL"
```

Replace `YOUR-NOREPLY-EMAIL` with the GitHub-provided public noreply address you recorded during GitHub setup.

For example:

```text
302346351+your-username@users.noreply.github.com
```

#### Check Your Git Identity

Enter:

```bash
git config --global user.name
git config --global user.email
```

Confirm that Git displays the name you selected and your GitHub noreply email address.

> **Having trouble?** You can continue your coursework in the CVD. Do not substitute a password, access token, or other credential for your Git email address.

### 4. Install Python 3.12

IT 140 uses **Python 3.12**.

1. Open the official [Python downloads](https://www.python.org/downloads/) page.

2. Locate a Python **3.12** release that is available for your operating system.

3. Download the appropriate installer or package.

4. Follow the publisher's installation instructions.

5. If a Windows installer provides an option to add Python to your `PATH`, enable that option.

6. Complete the installation and close the installer.

#### Check Python

Open Git Bash or a terminal and try:

```bash
python --version
```

Some operating systems use:

```bash
python3 --version
```

At least one command should report **Python 3.12.x**.

If your operating system cannot install or run Python 3.12 reliably, use the CVD instead of substituting another major or minor Python version.

> **Having trouble?** Python 3.12 is already available in the CVD, so a local Python problem will not prevent you from completing IT 140.

### 5. Install Visual Studio Code

Visual Studio Code (**VS Code**) is the primary application you will use to work with IT 140 programming files.

1. Open the official [Visual Studio Code download](https://code.visualstudio.com/Download) page.

2. Choose the installer or package for your operating system.

3. Follow the installation instructions.

4. If the installer offers options to:

   * add VS Code to your `PATH`,
   * add **Open with Code** to your file manager, or
   * register VS Code as an editor,

   you may enable them.

5. Start Visual Studio Code.

6. If VS Code displays a Welcome page, you may close it after reviewing it.

> **Having trouble?** You can use VS Code in the CVD while you troubleshoot your local installation.

### 6. Install the Required VS Code Extensions

VS Code extensions add the language, diagram, pseudocode, spell-checking, and file-viewing features used in IT 140.

1. Open VS Code.

2. Select the **Extensions** icon on the Activity Bar on the left side of the window.

3. Search for and install each extension below.

| Extension           | Extension ID                            |
| ------------------- | --------------------------------------- |
| Python              | `ms-python.python`                      |
| Ruff                | `charliermarsh.ruff`                    |
| Draw.io Integration | `hediet.vscode-drawio`                  |
| Code Spell Checker  | `streetsidesoftware.code-spell-checker` |
| I2P Pseudocode      | `i2p-hub.i2p-pseudo`                    |
| Office Viewer       | `cweijan.vscode-office`                 |

When searching, use the **Extension ID** if more than one extension has a similar name.

4. When finished, leave VS Code open.

> **Having trouble?** Missing local extensions do not affect the CVD. You can complete course activities there while resolving the local issue.

### 7. Select Python 3.12 in VS Code

VS Code must know which Python installation to use.

1. In VS Code, open the **Command Palette**:

   * Select **View > Command Palette**, or
   * use the keyboard shortcut shown by VS Code for your operating system.

2. Start typing:

   `Python: Select Interpreter`

3. Select **Python: Select Interpreter**.

4. Choose the Python **3.12** installation you installed earlier.

5. If several Python installations appear, select the one whose version begins with `3.12`.

VS Code should now use Python 3.12 when you run Python programs.

> **Having trouble?** If Python 3.12 does not appear, do not randomly remove other Python installations. You can use the CVD while you review your local Python installation.

### 8. Install the Course Python Packages

IT 140 uses several Python packages in addition to Python itself:

* `pytest` runs automated tests.
* `pytest-cov` can measure which parts of a program were exercised by tests.
* `ruff` checks and formats Python code.

In VS Code:

1. Select **Terminal > New Terminal**.

2. Confirm that the terminal opens at the bottom of the VS Code window.

3. Enter:

   ```bash
   python -m pip install --user pytest pytest-cov ruff
   ```

   If your operating system uses `python3` instead of `python`, enter:

   ```bash
   python3 -m pip install --user pytest pytest-cov ruff
   ```

4. Wait for the installation to finish.

#### Check the Packages

Using the same Python command that worked above, check pytest:

```bash
python -m pytest --version
```

and Ruff:

```bash
python -m ruff --version
```

If your system uses `python3`, substitute `python3` in those commands.

Both commands should display version information without an error.

> **Having trouble?** Do not repeatedly reinstall Python or delete existing Python environments. Use the CVD while you investigate the local problem.

### 9. Install GitHub CLI

GitHub CLI (`gh`) allows developer tools on your computer to communicate with GitHub.

1. Open the official [GitHub CLI installation](https://cli.github.com/) page.

2. Follow the installation instructions for your operating system.

3. After installation, close and reopen Git Bash or your terminal.

4. Check the installation:

   ```bash
   gh --version
   ```

You should see GitHub CLI version information.

> **Having trouble?** Your GitHub account and CVD remain available even if GitHub CLI does not work on your local computer.

### 10. Connect GitHub CLI to Your GitHub Account

In Git Bash or a terminal, enter:

```bash
gh auth login
```

Follow the prompts:

1. Select **GitHub.com** if asked where you use GitHub.

2. Select **HTTPS** if asked which protocol Git should use.

3. Choose the option to authenticate using your web browser.

4. Follow the browser instructions to sign in to the GitHub account you prepared for IT 140.

5. Return to the terminal when authentication is complete.

Check the connection:

```bash
gh auth status
```

The result should show that you are logged in to `github.com`.

Then connect Git to the GitHub CLI authentication:

```bash
gh auth setup-git
```

> **Security:** Never paste a GitHub password, authentication code, recovery code, personal access token, or other credential into a course document, GitHub Issue, screenshot, or support request.
>
> **Having trouble?** GitHub authentication is already configured separately in your CVD. You can continue your coursework there while troubleshooting the local connection.

### 11. Open Your Repos Folder in VS Code

1. Open VS Code.

2. Select **File > Open Folder**.

3. Browse to the `Repos` folder you created in Step 1.

4. Select the folder and open it.

5. If VS Code asks whether you trust the authors of the files in this folder, review the prompt before continuing.

Your `Repos` folder will be the normal location for assignment and project repositories that course instructions direct you to clone later.

Do **not** manually clone:

* the main `GC-STEM/it140` repository, or
* the `GC-STEM/it140-m1-setup-tasks` repository.

Those repositories provide course infrastructure and setup information. Beginning with Module Two, course instructions will identify the assignment or project repository you should clone.

You may create a desktop shortcut, alias, favorite, or other convenient link to your `Repos` folder if your operating system supports one.

> **Having trouble?** You can use the `Repos` folder already configured in the CVD instead.

### 12. Manual Course IDE Ready Check

Before relying on your local course IDE, confirm the following:

* [ ] Your GitHub account is accessible.
* [ ] Your CVD has already been configured and verified, or you know that it remains available if needed.
* [ ] A `Repos` folder exists in your user home folder.
* [ ] Git is installed.
* [ ] Git uses your intended display name.
* [ ] Git uses your GitHub noreply email address.
* [ ] Python reports version **3.12.x**.
* [ ] Visual Studio Code opens normally.
* [ ] VS Code is using Python 3.12.
* [ ] All required VS Code extensions are installed.
* [ ] `pytest` is installed.
* [ ] `pytest-cov` is installed.
* [ ] Ruff is installed.
* [ ] GitHub CLI is installed.
* [ ] `gh auth status` shows that you are signed in to GitHub.

If all of these checks are complete, your manually configured local course IDE should provide the core tools needed for IT 140.

Because this installation was configured manually, its exact behavior may differ from the CVD or an automated supported installation.

### If Something Goes Wrong

Do not disable antivirus software, bypass security controls, remove unrelated developer tools, or make major operating-system changes just to make the optional local setup work.

For setup troubleshooting, diagnostic guidance, and support options, see:

[Setup Problems and Support](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Setup-Problems-and-Support)

When asking for help, record:

* Your operating system and version.
* The step where the problem occurred.
* What you expected to happen.
* What actually happened.
* The complete error message, if one appeared.
* A screenshot when it helps explain the problem.

Do not include passwords, authentication or verification codes, recovery codes, personal access tokens, student identification numbers, or other private information.

Support for operating-system-specific problems may be limited on systems that are not supported by the IT 140 automated setup.

> **Remember:** A local setup problem does not need to stop your progress in IT 140. Return to the [Codio Virtual Desktop (CVD)](../codio/README.md) and continue your coursework there.

### Local Setup Is Complete

Your manual local setup is complete when the **Manual Course IDE Ready Check** above is satisfied.

You now have two possible places to complete IT 140 programming work:

* the **Codio Virtual Desktop (CVD)**, which remains the course reference environment, and
* your **local course IDE**.

You may switch between them as needed. Store each Git repository in only one working location at a time unless you understand how Git is being used to synchronize your work.

Return to your IT 140 course in **Brightspace** and complete any remaining Module One activities.

If you want to learn more about the tools you just configured, see [Explore Your Course IDE](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Explore-Your-Course-IDE).
