# IT 140 Development Environment Software Design Document

## Project Information

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks
- **Activity Type**: Required, non-graded, no submission
- **Design Subject**: IT 140 Development Environment, also called the course IDE
- **Design Purpose**: Define the software design for the IT 140 Development Environment (course IDE) setup process, including the target architecture, supported environments, setup workflow, verification process, support artifacts, and design decisions needed to implement and maintain the course IDE across Codio and supported local desktop environments.

## Table of Contents

- [IT 140 Development Environment Software Design Document](#it-140-development-environment-software-design-document)
  - [Project Information](#project-information)
  - [Table of Contents](#table-of-contents)
  - [0. Design Overview](#0-design-overview)
    - [0.1. Design Scope](#01-design-scope)
    - [0.2. Design Goals](#02-design-goals)
    - [0.3. Design Assumptions](#03-design-assumptions)
    - [0.4. Design Constraints](#04-design-constraints)
  - [1. Architectural Design](#1-architectural-design)
    - [1.1. Architecture Summary](#11-architecture-summary)
    - [1.2. Primary Design Components](#12-primary-design-components)
    - [1.3. External Interfaces](#13-external-interfaces)
  - [2. Mid-Level Design](#2-mid-level-design)
    - [2.1. Setup Process Flowchart](#21-setup-process-flowchart)
    - [2.2. Setup Workflow Summary](#22-setup-workflow-summary)
  - [3. Low-Level Design](#3-low-level-design)
    - [3.1. Setup Process Pseudocode](#31-setup-process-pseudocode)
  - [4. Data and Artifact Design](#4-data-and-artifact-design)
    - [4.1. Inputs](#41-inputs)
    - [4.2. Outputs](#42-outputs)
    - [4.3. Student-Facing Artifacts](#43-student-facing-artifacts)
    - [4.4. Support Artifacts](#44-support-artifacts)
  - [5. Component Design](#5-component-design)
    - [5.1. Codio Virtual Desktop Component](#51-codio-virtual-desktop-component)
    - [5.2. Local Desktop Setup Component](#52-local-desktop-setup-component)
    - [5.3. Verification Component](#53-verification-component)
    - [5.4. Documentation Component](#54-documentation-component)
    - [5.5. Support and Troubleshooting Component](#55-support-and-troubleshooting-component)
  - [6. Error Handling and Recovery Design](#6-error-handling-and-recovery-design)
  - [7. Security and Privacy Design](#7-security-and-privacy-design)
  - [8. Maintainability Design](#8-maintainability-design)
  - [9. Design Traceability](#9-design-traceability)
  - [10. Design Verification](#10-design-verification)
  - [Appendix A: Preliminary Course IDE Software Stack](#appendix-a-preliminary-course-ide-software-stack)

## 0. Design Overview

The IT 140 Development Environment, also called the course IDE, is designed to provide students with a consistent programming environment for completing course software development assignments and projects. The design supports two major usage paths:

- A preconfigured Codio Virtual Desktop (CVD), which is the primary supported and reference environment.
- An optional local desktop setup for students who choose to work on supported Windows, macOS, or Debian/Ubuntu-based Linux systems.

The design emphasizes consistency, low cognitive load, supportability, verifiability, and maintainability. The Codio environment provides the baseline student experience. The local desktop setup process is designed to reproduce that experience as closely as practical using the same or comparable tools.

### 0.1. Design Scope

This Software Design Document (SDD) describes the design of the course IDE setup process and supporting artifacts. It covers the design of the setup workflow, software stack, verification process, documentation structure, support outputs, and platform-specific implementation approach.

This SDD does not design the internal behavior of the third-party tools included in the stack, such as the code editor, programming language runtime, version control tools, package managers, or IDE extensions.

This SDD does not apply to course activities completed entirely in other course platforms, such as zyBooks activities, discussions, quizzes, or LMS-based submissions that do not require code development.

### 0.2. Design Goals

The course IDE design should:

- Provide a consistent student experience across Codio and supported local desktop environments.
- Reduce setup-related frustration for students with little or no prior command-line experience.
- Support completion of IT 140 software development assignments and projects.
- Align the local setup environment with the Codio reference environment where practical.
- Use industry-standard tools that are free to students and the university during the course term.
- Provide verification output that helps students, instructors, instructional designers, technical support staff, and academic leadership confirm that the setup works as intended.
- Remain maintainable across course terms and platform changes.

### 0.3. Design Assumptions

This design assumes that the CVD is available to students through the course and is preconfigured before students begin the setup activity.

This design assumes that local desktop setup is optional and that students may use the CVD as the supported fallback path if local setup fails or is not feasible.

This design assumes that the course IDE software stack can be installed or accessed through supported installers, package managers, command-line tools, or extension marketplaces for the target operating systems.

This design assumes that clean-environment testing will be performed before student-facing instructions are released or substantially revised.

### 0.4. Design Constraints

The design is constrained by the IT 140 Development Environment Specifications, including requirements for platform support, security-supported software, cost-free access during the course term, programming language version alignment, beginner-friendly documentation, and supportability.

The design is also constrained by the availability and behavior of third-party tools, including Codio, operating system package managers, software installers, the code editor, programming language runtime, version control tools, test runner, and supported extensions.

## 1. Architectural Design

### 1.1. Architecture Summary

The course IDE uses a reference-and-replication architecture.

The Codio Virtual Desktop (CVD) serves as the reference environment. Local desktop setup procedures are designed to replicate the CVD toolchain and workflow as closely as practical on supported student computers.

The setup process contains both manual and automated elements. Manual elements guide students through operating system preparation, installation prompts, account sign-in steps when required by course workflow, and verification review. Automated elements install supported tools, configure available command-line components, install supported extensions, and produce verification output where practical.

### 1.2. Primary Design Components

The course IDE design includes the following primary components:

- **Reference Environment Component**: The Codio Virtual Desktop (CVD) baseline used to define the expected course IDE stack, workflows, commands, and tool behavior.
- **Local Setup Component**: Platform-specific setup instructions and commands for supported Windows, macOS, and Debian/Ubuntu-based Linux environments.
- **Verification Component**: Commands or scripts that confirm required tools are installed, available, and reporting expected versions.
- **Documentation Component**: Student-facing README.md instructions, screenshots, notes, warnings, and troubleshooting guidance.
- **Support Component**: Setup logs, verification output, and diagnostic information that students can share with instructors or technical support staff.
- **Maintenance Component**: Version review, platform review, clean-environment testing, and update process for future course terms.

### 1.3. External Interfaces

The course IDE setup process interacts with the following external interfaces:

- **Student User Interface**: README.md instructions, screenshots, terminal commands, code editor interface, and verification output.
- **Operating System Interface**: Windows, macOS, or Debian/Ubuntu-based Linux environment, including system permissions and shell behavior.
- **Package Manager or Installer Interface**: Operating system package managers, official installers, or supported software distribution channels.
- **Code Editor Interface**: Visual Studio Code interface, command-line launcher, and extension management.
- **Programming Language Interface**: Required course programming language runtime and package-management tooling.
- **Version Control Interface**: Git and GitHub CLI or equivalent repository-access tooling.
- **Testing Interface**: Test runner used to execute instructor-provided test programs or test files.
- **Filesystem Interface**: Course repository folders, downloaded files, setup logs, screenshots, and student-created files.
- **Support Interface**: Setup logs, verification output, and student-provided error messages used for troubleshooting.

## 2. Mid-Level Design

### 2.1. Setup Process Flowchart

The mid-level design for the course IDE setup process is represented in the flowchart file below.

![Course IDE Setup Flowchart](./course_ide_setup.drawio.png)

The flowchart represents the combined manual and automated setup process, including environment selection, prerequisite checks, installation steps, verification, error handling, fallback to CVD, and support escalation.

### 2.2. Setup Workflow Summary

The setup workflow follows this general sequence:

- Identify whether the student will use the CVD or an optional local desktop environment.
- If the student uses the CVD, verify that the preconfigured course IDE tools are available.
- If the student chooses local setup, confirm that the operating system is supported and receiving security updates.
- Confirm that the student’s computer meets the applicable university minimum hardware baseline.
- Run the platform-specific setup commands or guide the student through required manual installation steps.
- Install or verify the required course IDE software stack.
- Install or verify supported IDE extensions.
- Run the verification command set.
- Review verification output for expected tool availability and versions.
- Direct students to troubleshooting guidance or CVD fallback if setup cannot be completed.

## 3. Low-Level Design

### 3.1. Setup Process Pseudocode

The low-level design for the setup process is maintained in the OS-agnostic pseudocode file below.

```pseudo
TODO: Paste low-level OS-agnostic pseudocode from ./course_ide_setup.pseudo here.
```

## 4. Data and Artifact Design

### 4.1. Inputs

The setup process uses the following inputs:

- Student-selected environment path: CVD or local desktop setup.
- Student operating system: Windows, macOS, or Debian/Ubuntu-based Linux.
- Supported software stack definition.
- Platform-specific setup commands.
- Platform-specific screenshots and instructions.
- Required course programming language version.
- Required IDE extensions.
- Course repository access requirements.
- Verification command set.

### 4.2. Outputs

The setup process produces the following outputs:

- Installed or verified course IDE software stack.
- Installed or verified IDE extensions.
- Setup log where practical.
- Verification output showing required tool availability and versions.
- Student-facing confirmation that the course IDE is ready for use.
- Error messages, diagnostic output, or support artifacts when setup fails.

### 4.3. Student-Facing Artifacts

Student-facing artifacts include:

- README.md setup instructions.
- OS-specific setup sections or files.
- Screenshots showing expected setup steps.
- Copy-ready commands.
- Notes distinguishing required tools from optional tools.
- Troubleshooting guidance.
- Verification instructions.
- CVD fallback guidance.

### 4.4. Support Artifacts

Support artifacts include:

- Setup logs where practical.
- Verification output.
- Common failure indicators.
- Expected version output.
- Screenshots of expected successful setup states.
- Notes for instructors and technical support staff about where setup failures are most likely to occur.

## 5. Component Design

### 5.1. Codio Virtual Desktop Component

The Codio Virtual Desktop (CVD) component provides the primary reference environment for the course IDE. It is preconfigured before students begin the setup activity.

The CVD component should include the required course IDE tools, supported extensions, expected folder structure, and verification capability. Students should not need to install the course IDE tools inside the CVD.

The CVD component also serves as the fallback environment when local desktop setup is not possible.

### 5.2. Local Desktop Setup Component

The local desktop setup component provides optional setup procedures for supported Windows, macOS, and Debian/Ubuntu-based Linux environments.

The local setup component should reproduce the CVD student experience as closely as practical while accounting for operating system differences. Platform-specific commands and screenshots may differ, but tool names, workflows, folder structures, and expected outcomes should remain as consistent as possible.

The local setup component includes both manual and automated steps. Manual steps should be clearly identified, and automated commands should be copy-ready where practical.

### 5.3. Verification Component

The verification component confirms that required tools are installed and working.

The verification component should report expected tool versions, identify missing tools, and help students or support staff determine where setup failed.

The verification component should be usable in the CVD and supported local desktop environments.

### 5.4. Documentation Component

The documentation component provides the student-facing setup instructions.

The documentation should use clear headings, short steps, screenshots, copy-ready commands, and consistent terminology. It should distinguish required tools from optional supporting tools or extensions.

The documentation should be written for students with limited programming or command-line experience.

### 5.5. Support and Troubleshooting Component

The support and troubleshooting component helps students, instructors, and technical support staff identify and resolve setup problems.

This component should include common error indicators, setup log locations where practical, verification output, and guidance for using the CVD fallback path if local setup cannot be completed.

## 6. Error Handling and Recovery Design

The setup process should help students identify and recover from common setup failures.

Common failure categories include:

- Unsupported operating system.
- Operating system not receiving security updates.
- Missing package manager or installer support.
- Failed software installation.
- Missing command-line path configuration.
- Incorrect required course programming language version.
- Missing IDE extension.
- Permission or administrator-rights issue.
- Network or download failure.
- Repository access or authentication issue.

The recovery design should provide:

- Clear error indicators.
- Verification output that identifies the likely failing tool or step.
- Troubleshooting guidance written for beginning students.
- Instructions to retry only the failed step where practical.
- Guidance to use the CVD fallback path when local setup cannot be completed.

## 7. Security and Privacy Design

The course IDE design should use operating systems, programming language versions, package managers, development tools, and extensions that are currently vendor-supported or community-supported and receiving security updates.

The design should avoid unnecessary third-party accounts unless the account is required for course activities. This reduces privacy concerns, credential-management burden, and avoidable dependency on external services.

The setup process should avoid requiring administrator or elevated privileges after initial installation unless required by the operating system or tool vendor.

The design should avoid collecting student data beyond what is needed for setup, verification, troubleshooting, or required course workflows.

## 8. Maintainability Design

The course IDE design should be maintainable across course terms.

Maintainability activities should include:

- Reviewing supported software versions before each major course refresh or platform change.
- Confirming that the CVD stack still matches the documented software stack.
- Confirming that the required course programming language version still matches zyBooks Lab Activities.
- Reviewing Windows, macOS, and Debian/Ubuntu-based Linux setup instructions.
- Retesting setup commands from clean baseline environments.
- Updating screenshots when platform user interfaces change.
- Updating troubleshooting guidance based on student and support feedback.
- Reviewing whether optional extensions remain useful and supported.

## 9. Design Traceability

The design elements in this SDD trace to the IT 140 Development Environment Specifications as follows:

| Design Element                   | Related Requirement Areas                                                                     |
| :------------------------------- | :-------------------------------------------------------------------------------------------- |
| CVD reference environment        | Functional requirements, nonfunctional requirements, technology constraints, fallback support |
| Local desktop setup process      | Cross-platform support, optional local setup, student experience consistency                  |
| Verification command set         | Verification process, supportability, acceptance testing                                      |
| Setup logs and diagnostic output | Troubleshooting, supportability, error handling                                               |
| Supported software stack         | Required tools, industry-standard tools, security-supported tools, cost-free access           |
| Student-facing documentation     | Cognitive load, beginner-friendly setup, consistency, troubleshooting                         |
| CVD fallback path                | Access, equity, recovery, continuity of student work                                          |
| Clean-environment testing        | Quality of service, reliability, acceptance testing                                           |
| Maintenance review process       | Long-term maintainability, platform changes, security updates                                 |

## 10. Design Verification

The design should be verified through inspection, demonstration, clean-environment testing, and stakeholder review.

Design verification should confirm that:

- The CVD provides the expected reference environment.
- Local setup procedures work on supported Windows, macOS, and Debian/Ubuntu-based Linux environments.
- Verification commands confirm required tools and versions.
- Setup logs or diagnostic output support troubleshooting where practical.
- Student-facing instructions can be followed by users with limited command-line experience.
- The local desktop setup matches the CVD environment as closely as practical.
- Representative course software development assignments and projects can be completed using the configured course IDE.
- The design remains aligned with the requirements in the IT 140 Development Environment Specifications.

## Appendix A: Preliminary Course IDE Software Stack

The software stack below is an initial proposed stack that appears to meet the IT 140 Development Environment requirements based on preliminary analysis. It has not yet been fully verified through clean-environment testing across Codio, Windows, macOS, and Debian/Ubuntu-based Linux environments. Final inclusion depends on successful installation, verification, assignment workflow testing, and stakeholder review.

|  #  | Software Category     | Software Name                         | Student Use Cases in Course                                           |
| :-: | :-------------------- | :------------------------------------ | :-------------------------------------------------------------------- |
|  0  | Version Control       | Git, GitHub CLI                       | Access course repositories and download assignment materials          |
|  1  | Programming Language  | Python 3.12                           | Write, run, and troubleshoot course programs                          |
|  2  | Test Runner           | pytest, pytest-cov                    | Run instructor-provided tests and review test results                 |
|  3  | Code Editor / IDE     | Visual Studio Code                    | Design, write, test, debug, and manage course files                   |
|  4  | Language Support      | ms-python.python extension            | Provide Python editing, running, debugging, and environment support   |
|  5  | Code Linter/Formatter | charliermarsh.ruff extension          | Identify style issues and apply consistent code formatting            |
|  6  | Diagram Support       | hediet.vscode-drawio extension        | Create or edit flowcharts, logic diagrams, and project maps           |
|  7  | Pseudocode Support    | i2p-hub.i2p-pseudo extension          | Write, preview, and organize pseudocode files                         |
|  8  | Code Spell Checker    | streetsidesoftware.code-spell-checker | Check spelling in code comments, pseudocode, Markdown, and text files |
|  9  | File Viewers          | cweijan.vscode-office extension       | View course-provided Office and PDF files inside VS Code              |
