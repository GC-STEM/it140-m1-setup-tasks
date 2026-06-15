<!-- To see this file in a clean, formatted view, right-click on the filename and choose “Open Preview.” -->

# IT 140 Module One: Setup Tasks

---

## ⚠️ Under Construction

This repository is incomplete and under active development. Code, documentation, structure, and features may change frequently. Use with caution, and check back for updates.

Note the Linux and macOS local setup guides are still in development and have not been completed. The Windows local setup guide is complete, tested and ready to use.

---

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks
- **Activity Type**: Required, non-graded, no submission

## Overview

In this activity, you will prepare the IT 140 development environment, also called the course IDE. An integrated development environment (IDE) is software that helps you design, write, run, test, and manage code in one place.

You may complete this activity using the Codio Virtual Desktop (CVD), your local machine, or both (recommended). The CVD already includes the required software, so you will only need to complete a few configuration steps. Local setup is optional and allows you to work on your own computer. If you are short on time or have technical issues, use the CVD to complete course assignments until you can complete the local setup.

Completing this activity on one platform is required because you will use the course IDE to complete all later course assignments and projects. You will use it for software design (flowcharts and pseudocode), construction (writing and building programs), and testing (checking that programs work correctly). This activity also supports the course competency: Develop a fully functional program using industry-relevant tools. The course IDE includes common software development tools, as listed in a recent [StackOverflow Developer Survey](https://survey.stackoverflow.co/2025/).

### Course IDE Software

The course IDE includes the software tools and extensions listed below.

| # | **Software Category**  | **Software Name**                     |
|:-:|:---------------------- |:------------------------------------- |
| 0 | Version Control        | Git, GitHub CLI                       |
| 1 | Programming Language   | Python 3.12                           |
| 2 | Test Runner            | pytest, pytest-cov                    |
| 3 | Code Editor / IDE      | Visual Studio Code                    |
|---| **IDE Extensions**     | ------------------------              |
| 4 | Language Support       | ms-python.python                      |
| 5 | Code Linter/Formatter  | charliermarsh.ruff                    |
| 6 | Diagram Support        | hediet.vscode-drawio                  |
| 7 | Pseudocode Support     | i2p-hub.i2p-pseudo                    |
| 8 | Code Spell Checker     | streetsidesoftware.code-spell-checker |
| 9 | File Viewers           | cweijan.vscode-office                 |

*Note*. The software listed above is recommended and supported for this course. You may use other software if it provides the same basic functionality. However, other software may cause compatibility issues, and your instructor or the IT Service Desk may not be able to provide support for it.

### Activity Repository

This repository is organized by setup topic. Each main folder contains files related to one part of the course IDE setup process, such as GitHub, Codio, or local setup.

A repository usually includes at least one README.md file. A README file explains the purpose, contents, and important details of a repository or folder. In any GitHub repository, the main README.md file is usually the best place to start because it gives you an overview before you open the other files and folders.

```text
it140_m1_ide_setup/
│
├── codio/               # 2. Configure the course IDE on Codio
│   ├── assets/          # Screenshots for configuring the course IDE
│   └── README.md        # Instructions for configuring the course IDE
│
├── github/              # 1. Setup a GitHub account (optional)
│   ├── assets/          # Screenshots for setting up a GitHub account
│   └── README.md        # Instructions for setting up a GitHub account
│
├── local_setup/         # 3. Setup the course IDE on your local machine
│   ├── linux/           # Linux local setup: Debian/Ubuntu by default
│   │   ├── assets/      # Screenshots for Debian/Ubuntu local setup
│   │   ├── distros/     # Setup guides for other Linux distributions
│   │   └── README.md    # Instructions for Debian/Ubuntu local setup
│   │
│   ├── macOS/           # macOS local setup folder
│   │   ├── assets/      # Screenshots for macOS local setup
│   │   └── README.md    # Instructions for macOS local setup
│   │
│   └── windows/         # Windows local setup folder
│       ├── assets/      # Screenshots for Windows local setup
│       └── README.md    # Instructions for Windows local setup
│
└── README.md            # 0. Start here: IDE setup activity overview
```

*Note*. This repository includes additional folders and files that are not shown in the main structure above. These files help maintain the repository, support settings, or organize development work. They are not part of your setup tasks, and you should not modify them.

## Directions

Follow the instructions in this repository to complete the course IDE setup before starting the Module Two software development assignment.

### 1. Create and configure a GitHub account (optional)

- [ ] 1.1. Open the [`github/README.md`](github/README.md) file.
- [ ] 1.2. Follow the instructions to create a new GitHub account.
- [ ] 1.3. Follow the instructions to configure your new or existing GitHub account.

### 2. Configure the course IDE on Codio

- [ ] 2.1. Open the [`codio/README.md`](codio/README.md) file.
- [ ] 2.2. Follow the Configure Course IDE instructions to configure the course IDE in the Codio Virtual Desktop (CVD).

### 3. Setup the course IDE on your local machine

- [ ] 3.1. Open the [`local_setup/README.md`](local_setup/README.md) file.
- [ ] 3.2. Follow the instructions for your operating system (OS) to setup the course IDE on your local machine.
- [ ] 3.3. Follow the Configure Course IDE instructions in the [`codio/README.md`](codio/README.md) file to configure the course IDE on your local machine.

## Supporting Materials

The following external resources may help support your work on the project:

- {{TODO: Add SNHU and external resources here}}

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
