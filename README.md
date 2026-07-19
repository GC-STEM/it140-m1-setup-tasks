<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks

---

## ⚠️ Under Construction

This repository is under active development. Code, documentation, structure, and features may change before the course begins. Check back periodically for updates.

The Linux and macOS local setup guides are still in development. The Windows local setup guide is complete, tested, and ready to use.

---

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks
- **Activity Type**: Required, non-graded, no submission

## Overview

In this activity, you will prepare your software development environment, also called the **course IDE**. An integrated development environment (IDE) is software that helps you design, write, run, test, debug, and manage programs and related files in one place.

You may complete this activity using the Codio Virtual Desktop (CVD), your local computer, or both. The CVD already includes the required software, so you only need to complete a few configuration steps. A local installation is optional and allows you to work on your own computer. If you are short on time or experience technical issues, use the CVD to complete course assignments until you can configure the course IDE locally.

You must complete this activity on at least one platform because you will use the course IDE throughout the course. You will use it to create software designs, including flowcharts and pseudocode; write and debug Python programs; run automated tests; and manage assignment files. This activity also supports the course competency: *Develop a fully functional program using industry-relevant tools*. The recommended course IDE includes software commonly used by professional developers, including tools identified in the recent [Stack Overflow Developer Survey](https://survey.stackoverflow.co/2025/).

### Course IDE Software

The recommended course IDE includes the software and extensions listed below.

| **#** | **Software Category** | **Software** | **Student Use in IT 140** |
| :-: | ---------------------- | ------------------------------- | --------------------------------------------- |
| 0 | Version Control | Git and GitHub CLI | Download assignment materials; optionally publish portfolio artifacts |
| 1 | Programming Language | Python 3.12 | Write, run, and debug Python programs |
| 2 | Test Runner | pytest, pytest-cov | Run provided tests and review results |
| 3 | Code Editor / IDE | Visual Studio Code (VS Code) | Design, write, test, debug, and manage assignment files |
| 4 | Language Support | ms-python.python | Provide Python language support in VS Code |
| 5 | Code Linter / Formatter | charliermarsh.ruff | Identify style issues and format code consistently |
| 6 | Diagram Support | hediet.vscode-drawio | View, create, and edit flowcharts and game world maps |
| 7 | Pseudocode Support | i2p-hub.i2p-pseudo | View, create, and edit pseudocode files with syntax highlighting |
| 8 | Code Spell Checker | streetsidesoftware.code-spell-checker | Check spelling in source code and documentation |
| 9 | File Viewers | cweijan.vscode-office | View course-provided Office and PDF files within VS Code |

> [!NOTE]
> The software listed above is recommended and fully supported for this course. You may use other software if it provides the required file formats and equivalent functionality. However, other software may cause compatibility issues, and your instructor and the IT Service Desk may be unable to provide technical support for it.

### Activity Repository

This repository is organized by setup topic. Each main folder contains the files needed to complete one part of the course IDE setup process, such as GitHub, Codio, or local setup.

Most GitHub repositories include one or more `README.md` files. A README explains the purpose and contents of a repository or folder and usually provides instructions for getting started. When working in a GitHub repository, begin with the top-level `README.md` file unless directed otherwise.

```text
it140_m1_ide_setup/
│
├── README.md        # 0. Start here: IDE setup activity overview
│
├── codio/           # Configure the course IDE on Codio (already installed)
│   ├── assets/      # Screenshots for configuring the course IDE
│   └── README.md    # Instructions for configuring the course IDE
│
├── linux/           # Set up course IDE on your Linux local computer
│   ├── assets/      # Screenshots for Debian/Ubuntu local setup
│   ├── distros/     # Instructions for other Linux distributions
│   └── README.md    # Instructions for Debian/Ubuntu local setup
│
├── macOS/           # Set up course IDE on your macOS local computer
│   ├── assets/      # Screenshots for macOS local setup
│   └── README.md    # Instructions for macOS local setup
│
└── windows/         # Set up course IDE on your Windows local computer
    ├── assets/      # Screenshots for Windows local setup
    └── README.md    # Instructions for Windows local setup
```

> [!NOTE]
> This repository also contains folders and files that are not shown above. These files support repository maintenance, configuration, and development. They are not part of this activity, so you can safely ignore them.

## Directions

Before starting the Module Two software development assignment, choose and configure a development environment that provides the required file formats and basic functionality. The recommended course IDE may be used either on the Codio Virtual Desktop (CVD) or your local computer. You are not required to use the recommended course IDE, but it is the environment supported by the course and highly recommended.

<!--
### Configure a GitHub Account (optional)

This step is optional for all IT 140 students. It is recommended for students in Computer Science (CS), Game Design & Development (GAM), and other students who want to use GitHub to build a professional programming portfolio.

- [ ] Open the [`github/README.md`](github/README.md) file and follow the instructions.
  -->

### Set Up the Course IDE

- [ ] **TODO**: Set up the course IDE on at least one of the following platforms, preferably on Codio and your local computer.
  - [ ] **Codio**: Open the [`codio/README.md`](codio/README.md) file and follow the instructions.
  - [ ] **Windows**: Open the [`windows/README.md`](windows/README.md) file and follow the instructions.
  - [ ] **macOS**: Open the [`macOS/README.md`](macOS/README.md) file and follow the instructions.
  - [ ] **Linux**: Open the [`linux/README.md`](linux/README.md) file and follow the instructions.

[!NOTE]
The recommended course software stack is fully supported for IT 140. If you choose a different software stack, it must provide the required file formats and equivalent functionality. Your instructor and the IT Service Desk may be unable to provide technical support for software outside the recommended environment.

## Supporting Materials

The following resources may help you complete this activity:

{{TODO: Add SNHU and external resources here}}

## Technical Support

Software setup can be frustrating, especially if you have not used command line interface (CLI) tools before. If something does not work, pause and collect information before asking for help. Clear details make it much easier for others to understand the problem and help you solve it.

When asking for technical support, include as much of the following information as possible:

- Your operating system, such as Windows 11, macOS, or Linux
- The step number or section where the problem happened
- What you were trying to do
- What you expected to happen
- What actually happened
- The exact command you entered, if you were using the CLI
- Any error messages you saw
- A screenshot, if the issue happened in a graphical user interface (GUI)
- Any setup log files created during the process

A command line interface (CLI) is a text-based way to use your computer by typing commands. Windows PowerShell, macOS Terminal, and Linux Bash are examples of CLI tools. A graphical user interface (GUI) is the more familiar point-and-click type of interface, such as a settings window or installer screen.

Some setup commands create transcript or log files. These files record what happened during setup and can help technical support troubleshoot the issue. If a log file was created, include it when asking for help.

### Artificial Intelligence (AI)

You may use an AI assistant to help troubleshoot technical issues. AI can help explain error messages, suggest next steps, or help you understand what a command is doing.

When using AI for technical support, provide clear details. Do not only say, “It does not work.” Include the task, the step where the issue happened, the command you entered, the error message, and what you already tried.

You can use this prompt template:

```text
I am a beginner programming student. I am trying to [describe the task], but I am having trouble at [step number or section name].

My operating system is [Windows 11 / macOS / Linux].

Here is the command I entered, if any:
[paste the command]

Here is the message or error I received:
[paste the full message or error]

Here is what I expected to happen:
[describe the expected result]

Here is what actually happened:
[describe the result]

Here is what I have already tried:
[list any steps you already tried]

Please explain what might be causing the issue in beginner-friendly language. Give me one suggestion at a time, and explain how to try it before moving to the next suggestion.
```

Review AI suggestions carefully before running commands. If a suggestion asks you to delete files, change security settings, download unknown software, or run a command you do not understand, ask your instructor or the IT Service Desk before continuing.

### IT Service Desk

Contact the **IT Service Desk** if you need help with SNHU systems, Codio access, account access, software installation, or technical problems you cannot resolve.

To contact the **IT Service Desk**:

- Log in to the [course site](https://learn.snhu.edu/d2l/home).
- Click the **Help** drop-down menu near the top right of the page.
- Click **IT Service Desk**.
- Click **Ask for Technology Help**.
- If the issue is time sensitive, click **Chat Now** or call the listed phone number.
- If the issue is not time sensitive, submit a support ticket.

When you contact the **IT Service Desk**, include the details listed at the start of this section. If a setup log file was created, attach it to your ticket or mention that it is available.

### Instructor and Classmates

Post technical support questions in the **General Questions** course discussion forum. This allows the whole class to benefit from the question and answer. If you had the problem, another student may have the same problem too.

When posting, include the same information listed at the start of this section: the step where the issue happened, what you tried, and any error message you received. Do not post private information such as passwords, personal access tokens, or security codes.

If you solve a problem, consider posting the solution in the forum. Sharing what worked can help your classmates and build good troubleshooting habits.
