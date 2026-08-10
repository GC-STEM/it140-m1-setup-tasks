
<!-- To see this file in a clean, formatted view, right-click on the filename and choose "Open Preview." -->

# IT 140 Faculty Setup Instructions

---

## 🧪 Beta Testing

The Module One Setup Tasks have completed end-to-end (E2E) Alpha Testing and are now in Beta Testing with faculty and staff. The Codio Virtual Desktop (CVD) automation is expected to be reliable because each CVD begins from a standardized environment. Local Windows, macOS, and Linux computers vary in software, settings, permissions, security controls, and prior configurations, so Beta Testing may uncover conditions that were not encountered during Alpha Testing.

For course-wide information about the Beta, course IDE, repository model, GitHub workflow, activity-repository releases, and common faculty questions, see the [IT 140 Faculty Guide](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md).

If you choose to work through the Module One setup and encounter an issue or have a feature request, you are welcome to submit it using [GitHub Issues](https://github.com/GC-STEM/it140-m1-setup-tasks/issues).

---

## Activity Metadata

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | Faculty & Staff Setup
- **Activity Type**: Recommended
- **Activity Purpose**: Prepare faculty and staff to use the IT 140 course IDE and GitHub repositories for teaching the course.
- **Activity Description**: This activity provides instructions for faculty and staff to set up the IT 140 course IDE and GitHub repositories. It includes steps for creating a GitHub account, accessing the Codio Virtual Desktop (CVD), and setting up the course IDE both in the CVD and on a local machine.
- **Artifact Version**: 0.10.0-beta.1
- **Artifact Date**: 2026-08-09
- **Development Status**: Beta Testing

## Overview of the Course IDE

This README supplements the course-wide [IT 140 Faculty Guide](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md).

The **IT 140 Faculty Guide** is the primary reference for:

- The purpose and components of the course IDE
- How course automation handles software installation and configuration
- The IT 140 GitHub repository model and student GitHub workflow
- Activity-repository release status and scheduling
- Common faculty questions
- Course-wide questions, concerns, technical issues, and feature requests

This README is the primary reference for **faculty-specific Module One setup and access instructions**.

Faculty who would like to become familiar with the student experience may choose to work through the same Module One setup process. Doing so can provide a reference environment for viewing the course IDE and understanding the steps students will encounter.

The course automation manages the supported installation and configuration of Visual Studio Code (VS Code), Python, Git, GitHub CLI, course extensions, and related settings. Separate manual installation or installer-option instructions are therefore not part of the standard setup workflow. For more information, see [Course IDE](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md#course-ide) and [Common Faculty Questions](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md#common-faculty-questions) in the IT 140 Faculty Guide.

## 1. Set Up A GitHub Account

As IT 140 faculty, you will need a GitHub account linked to your SNHU email address. You can add your SNHU email address to an existing GitHub account or create a new one specifically for this purpose.

1. Follow the [Set Up a GitHub Account](../github/README.md) instructions.
2. Return to this page after completing the GitHub setup. Faculty first access the Codio Virtual Desktop (CVD) differently than students.

For an explanation of how GitHub is used later in IT 140, see [GitHub in IT 140](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md#github-in-it-140) in the IT 140 Faculty Guide.

## 2. Set Up the Course IDE on Codio

Faculty who would like to experience the reference course IDE can use the steps below to access a faculty CVD instance and then follow the student-facing first-time setup.

1. From your IT 140 course site in [D2L Brightspace](https://learn.snhu.edu), select **Learning Modules** from the **Course Menu**.

    ![Learning Modules in D2L Brightspace](../codio/assets/03_d2l_it140_course_menu.png)

2. Type **codio** in the search bar to see all pages that include the string.

    ![List of Codio pages in D2L Brightspace](./assets/02_fac_d2l_codio.png)

    For future reference,
    - *Optional Codio Virtual Desktop* is under **Start Here**
    - *Using Codio for Instructors* is under **Instructor Resources**

3. Click the **Optional Codio Virtual Desktop** on the *Search Results* page.

4. Click the **Codio Learning Environment** link on the *Optional Codio Virtual Desktop* page to open the Codio instructor dashboard.

    ![Optional Codio Virtual Desktop page](./assets/04_fac_d2l_ocvd.png)

5. On the left menu bar of the *Codio instructor dashboard*, click **Overview**.

    ![Codio Learning Environment link](./assets/05_fac_codio_overview1.png)

    *Note*. The Codio instructor dashboard is used in IT 140 only to access the Codio Virtual Desktop (CVD). Assignment submissions, grading, and student management remain in D2L Brightspace.

6. Click the **Preview** button (looks like an eye) on the *Overview* page to open the Codio Virtual Desktop (CVD) landing page in a new browser tab.

    ![Codio Overview page](./assets/06_fac_codio_overview2.png)

7. This is the student landing page when they click on the **Optional Codio Virtual Desktop** link in D2L Brightspace. Consider bookmarking this CVD landing page for direct access in the future. <!-- If you are teaching more than one section of IT 140, you may want to bookmark both CVD URLs. -->

    ![Codio Virtual Desktop landing page](../codio/assets/11_cvd_it140_landing_page.png)

    *Note*. In IT 140, all work is done within the **VM** tab that contains the Codio Virtual Desktop and the **Guide** tab. Neither students nor faculty need to use any items on the main  Codio menu bar.

8. Read the *IT 140 Codio Virtual Desktop Guide* all the way through at least once so you are familiar with what your students will see and do in the CVD.

9. In the *IT 140 Codio Virtual Desktop Guide*, follow the student-facing Codio [**First-Time Setup**](../codio/README.md) instructions.

    *Note*. In Section 1, review how students access their CVD. Begin following the setup instructions in Section 2, where the course IDE is configured inside the CVD.

## 3. Set Up the Course IDE Locally

It is also recommended that you set up the official course IDE on your local machine. Again, this will allow you to view assignments and projects outside the Codio Virtual Desktop. You may also choose to set up the course IDE on a supported local computer.

If desired, you can install the course IDE on a local virtual machine (VM) instead of your host machine directly.

Follow the student-facing instructions in the appropriate local setup guide for your operating system:

- [Windows](local/windows/README.md)
- [macOS](local/macos/README.md)
- [Linux](local/linux/README.md)

## Questions, Concerns, and Issues

The course-wide [IT 140 Faculty Guide](https://github.com/GC-STEM/it140/blob/main/.faculty/README.md#questions-concerns-or-issues) is the primary reference for faculty questions, concerns, and support channels.

For the initial pilot term, please post any questions or concerns about the new course IDE or GitHub repositories in the [IT 140 Community of Practice](https://teams.microsoft.com/l/team/19:165fa3c3a9904a1999ca640d2ed13d27%40thread.tacv2/conversations?groupId=61d85fe7-44f7-4918-896f-bb83a07883c1&tenantId=2baef15b-b8de-423f-9d8a-46f3686d8848)

Please do **NOT** post faculty-sensitive questions or concerns in [GitHub Discussions](https://github.com/GC-STEM/it140/discussions) as it is also a student-facing forum.

For a technical issue or feature request specific to the Module One Setup Tasks, you are welcome to submit an issue in the [`it140-m1-setup-tasks` repository](https://github.com/GC-STEM/it140-m1-setup-tasks/issues).

When reporting an issue, include the relevant platform, step, expected result, actual result, and any error message or screenshot that may help reproduce the problem. Do not include passwords, authentication codes, access tokens, student information, or other private information.
