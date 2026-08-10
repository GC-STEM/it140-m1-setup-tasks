<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Module One: Setup Tasks | Local Setup

---

## 💻 Optional Local Setup

Setting up the IT 140 development environment (course IDE) on a local computer is **optional**. First configure and verify the course IDE in the [Codio Virtual Desktop (CVD)](../codio/README.md). The CVD is the course reference environment and is available from a web browser.

After your CVD is working, you may also install the course IDE on one or more supported Windows, macOS, or Linux computers. You can do this now, later in the course, or not at all.

If local setup does not work as expected, you can stop and continue your coursework in the CVD. You do not need a working local installation to complete IT 140.

---

## Activity Metadata

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Local Setup
- **Activity Type**: Optional, non-graded, no submission
- **Activity Purpose**: Optionally prepare the IT 140 development environment for completing course assignments on a local computer after configuring the course IDE in the Codio Virtual Desktop (CVD).
- **Activity Description**: This activity provides an overview of the optional local course IDE setup process and directs students to operating-system-specific instructions for Windows, macOS, and Linux. The automation installs and configures the supported programming tools and course settings while the CVD remains available as the course reference environment.
- **Artifact Version**: 0.10.0-beta.1
- **Artifact Date**: 2026-08-09
- **Development Status**: Beta Testing

## Overview

The IT 140 course IDE includes Visual Studio Code (VS Code), Python, Git, GitHub CLI, course-supported VS Code extensions, and other tools and settings used throughout the course.

The course IDE is already installed in the CVD. Local setup uses automation scripts to create a similar environment on a supported personal computer. The scripts handle most software installation and configuration choices for you, so you normally should not need to install or configure the individual course IDE components manually.

### Why Set Up the Course IDE Locally?

A local course IDE can be useful if you want to:

- Work on your own computer using its keyboard, display, files, and other familiar features.
- Work when a stable connection to the CVD is not available, except when internet access is required for downloads, GitHub, or other online services.
- Continue developing experience with programming tools installed directly on a computer.
- Use more than one computer for course work by setting up the course IDE separately on each supported computer.

A local installation is a convenience, not a course requirement.

## Why Local Automation May Not Always Work

The CVD is a standardized environment. Each course CVD starts from a known configuration, which makes its setup process predictable.

Personal computers are different. Two computers running the same operating system may have very different software, settings, security controls, and histories. The local automation scripts have been designed and tested to handle common configurations, but no automation can safely anticipate every possible computer state.

A local setup script may therefore encounter a problem even when you follow every instruction correctly. Common causes include:

- Software that was previously installed using a different version or installation method.
- Operating-system settings, updates, user permissions, or administrator restrictions.
- Antivirus, firewall, network, proxy, or other security controls that block a download or command.
- Employer-, school-, or family-managed computers that restrict software installation or command-line tools.
- Existing developer tools, environment variables, shell settings, or other customizations that conflict with the course configuration.
- Temporary internet, software repository, or service outages.

A script failure does **not** necessarily mean that you made a mistake or that there is something wrong with your computer. It may simply mean that your computer has a configuration the automation has not encountered before.

If a script reports an error, do not repeatedly rerun commands, uninstall software, disable security features, or make other system changes unless the course instructions specifically tell you to do so. Review the troubleshooting guidance for your operating system and report the issue if needed.

## Choose Your Operating System

Use the instructions for the operating system installed on the computer where you want to set up the course IDE:

- **[Windows](windows/README.md)** - Supported Windows computers where you can approve administrator actions.
- **[macOS](macOS/README.md)** - Supported Mac computers.
- **[Linux](linux/README.md)** - Supported Linux computers and information about supported distributions.

The operating-system-specific README is the primary source for system requirements, preparation, commands, screenshots, verification, updates, and troubleshooting for that platform.

If your computer does not meet the requirements in its guide, use the CVD instead of trying to work around the requirement.

## Setup Process

Although the exact instructions differ by operating system, the local automation follows the same general lifecycle:

> **Prepare → Install → Configure → Verify → Update**

1. **Check** - Confirm that the computer and operating system meet the requirements in the platform-specific guide.

2. **Prepare** - Obtain the current IT 140 course automation package and prepare it for your computer.

3. **Install** - Install or repair the system-level software managed by the course.

4. **Configure** - Apply course settings and configure the course IDE for your user account.

5. **Verify** - Check that the required software and settings are ready to use.

6. **Update** - Maintain or repair course-managed software and automation files when an update is needed.

Complete these phases in the order shown in your operating-system-specific guide. Do not skip ahead if a script reports a failure or tells you that another action, such as restarting the computer, is required first.

## Report a Local Setup Issue

The local automation is in Beta Testing. Reports from computers with different configurations can help identify conditions that were not encountered during development and testing.

If you encounter a problem with the local setup scripts or instructions, you may report it using [GitHub Issues](https://github.com/GC-STEM/it140-m1-setup-tasks/issues).

Before creating a new issue:

1. Review the **Troubleshooting** section in the README for your operating system.

2. Search the existing [GitHub Issues](https://github.com/GC-STEM/it140-m1-setup-tasks/issues) to see whether the same problem has already been reported.

3. If you do not find the same problem, click **New issue** and describe what happened.

Use a short, specific title. For example:

`Windows: Install script stops while installing VS Code`

Include as much of the following information as you can:

- Your operating system and version.
- The setup phase or step where the problem occurred.
- The script or command you were running.
- What you expected to happen.
- What actually happened.
- The complete error message or unexpected result.
- Any troubleshooting steps you already tried.
- The relevant setup log file or log excerpt, when available.
- A screenshot if the problem appeared in a graphical interface.

Do **not** include passwords, authentication codes, access tokens, student identification numbers, personal contact information, or other private information. Review screenshots and logs before posting them.

GitHub Issues are useful for reporting problems with the course automation or documentation. For broader technical-support guidance, including other ways to ask for help, see the [Technical Support](../README.md#technical-support) section of the main Module One Setup Tasks README.

## Next Step

Local setup is **optional**. If you want to install the course IDE locally, continue with the README for your operating system:

- [Windows](windows/README.md)
- [macOS](macOS/README.md)
- [Linux](linux/README.md)

If local setup becomes difficult, takes more time than you want to spend on it, or stops working later in the course, you can return to the [Codio Virtual Desktop (CVD)](../codio/README.md) and continue your coursework there. The CVD remains the course reference environment and does not depend on a successful local installation.
