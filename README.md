<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks

---

## 🧪 Beta Testing

This activity has completed **end-to-end (E2E) Alpha Testing** and is now in **Beta Testing with faculty and staff**. E2E testing verifies that the complete setup process works from start to finish.

The **Codio Virtual Desktop (CVD)** automation is expected to be reliable because each CVD begins from a standardized environment. The local Windows, macOS, and Linux automation scripts have been tested primarily on fresh operating system installations. Real-world computers have different software, settings, permissions, security controls, and prior configurations, so Beta Testing may uncover conditions not encountered during Alpha Testing.

**Beta testers**: Please report issues and feature requests using [GitHub Issues](https://github.com/GC-STEM/it140-m1-setup-tasks/issues). An **issue** is any error, failed step, unexpected result, missing or incorrect behavior, or instruction that prevents or makes the setup difficult to complete. A **feature request** is a suggestion for improving the setup process, automation, documentation, or user experience.

---

> [!TIP]
GitHub provides several ways to interact with this repository in the upper-right corner of the page. Recommended options for this repo:
>
> * **Star** – Click to bookmark this repo so it is easier to find later.
> * **Watch** – Click only if you want notifications about repo activity.
> * **Fork** – Not recommended for this repo.

## Activity Metadata

* **Course**: IT 140 - *Introduction to Scripting*
* **Activity Title**: 1-1 Setup Tasks
* **Activity Type**: Required, non-graded, no submission
* **Activity Purpose**: Prepare your IT 140 development environment (course IDE) for completing course assignments.
* **Artifact Version**: 0.10.1-beta.1
* **Artifact Date**: 2026-08-11
* **Development Status**: Beta Testing

## Overview

In this activity, you will prepare your software development environment, also called the **course IDE**. An integrated development environment (IDE) is software that helps you design, write, run, test, debug, and manage programs and related files in one place.

Course instructions beginning with the Module Two Assignment assume that you have a **GitHub account** and access to a **configured course IDE**. The setup sequence below begins with GitHub and the **Codio Virtual Desktop (CVD)**, the course reference environment. You may also configure the course IDE on a supported Windows, macOS, or Linux computer.

The recommended course IDE includes VS Code, Python 3.12, Git and GitHub tools, testing tools, and course extensions. The same core toolset is used across supported environments so that course instructions, examples, automated tests, and technical support work as consistently as possible.

> [!TIP]
> Want to understand the tools before or after setup? See the Wiki pages [What Is the Course IDE?](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/What-Is-the-Course-IDE) and [Setup Options](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Setup-Options). You do not need to understand every tool before starting setup.

## Setup Progress

**0 Start Here** → [1 GitHub](github/README.md) → [2 Codio](codio/README.md) → [3 Local Computer](local/README.md) → **Done**

Follow the links below rather than browsing the repository folders. Each guide tells you what to do, how to recognize a successful result, and where to go next.

### 1. Set Up a GitHub Account

Course instructions beginning in Module Two assume that you can access a GitHub account and identify the account information used by the course IDE.

* [ ] Open **[Set Up a GitHub Account](github/README.md)**.
* [ ] Follow that guide through its **GitHub Account Ready Check**.
* [ ] At the end of the GitHub guide, use its link to continue directly to the Codio guide.

### 2. Set Up the Course IDE on Codio

The CVD is the course reference environment used in assignment instructions, screenshots, and instructional videos. It already contains the main system software for IT 140; the setup process updates, configures, and verifies it. **We recommend configuring the CVD even if you also plan to work on your own computer.**

* [ ] **Students:** Open **[Set Up the Course IDE on Codio](codio/README.md)**.
* [ ] **Faculty and staff:** Use the **[Faculty CVD Setup Guide](.faculty/README.md)** where directed.
* [ ] Continue until the CVD **Verification Summary** reports the successful completion values shown in the guide.

### 3. Set Up the Course IDE on Your Local Computer (Optional)

After you have access to a configured course IDE, you may also configure the course IDE on a supported local computer, if desired. Students need at most one local installation.

Choose the guide for the computer you want to use:

* [Windows](local/windows/README.md)
* [macOS](local/macOS/README.md)
* [Linux](local/linux/README.md)

If a local computer is managed by an employer, school, or another person, do not bypass security controls or installation restrictions. Use the CVD while you determine whether you have permission to install software.

## When Setup Is Complete

When you have access to a configured and verified course IDE, return to your IT 140 course in [D2L Brightspace](https://learn.snhu.edu/) and complete any remaining Module One activities before the end of Week 1.

If you have time remaining, see **[Explore Your Course IDE](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Explore-Your-Course-IDE)** for resources you can use to become more comfortable with VS Code, GitHub, and Markdown.

## If Something Goes Wrong

If a setup script reports `FAIL`, `PARTIAL`, `NOT COMPLIANT`, a nonzero exit code, or another unexpected result, **do not guess at a repair or automatically continue to the next setup phase**. Follow the instructions in the script summary and the README for that step.

Before asking for help, save the exact error message and note the step where it occurred. Setup scripts also save diagnostic logs under `~/it140/logs/` or the corresponding `it140/logs` folder in your user profile.

See **[Setup Problems and Support](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Setup-Problems-and-Support)** for troubleshooting guidance, what information to collect, and where to ask for help.

> [!WARNING]
> Never share passwords, authentication or verification codes, recovery codes, personal access tokens, or other credentials in screenshots, logs, GitHub posts, or support requests.

## Learn More About This Repository

You do not need to understand the GitHub repository structure to complete setup. Use the direct links in the guides.

If you want to learn what a repository, README, or Markdown file is, or see how this Setup Tasks repository is organized, visit **[Using the Setup Tasks Repository](https://github.com/GC-STEM/it140-m1-setup-tasks/wiki/Using-the-Setup-Tasks-Repository)**.
