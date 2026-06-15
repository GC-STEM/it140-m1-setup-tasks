# IT 140 Development Environment Specifications

## Project Information

- **Course**: IT 140 - Introduction to Scripting
- **Activity Title**: 1-1 Setup Tasks
- **Activity Type**: Required, non-graded, no submission
- **Project Purpose**: Develop, test, and document the setup process for the course IDE in Codio, currently using Ubuntu 24.04 LTS, and supported local desktop environments, including Windows, macOS, and Debian/Ubuntu-based Linux distributions. This includes creating a comprehensive command set, testing it across supported platforms, and providing clear student-facing instructions in the README.md file.

## Table of Contents

- [IT 140 Development Environment Specifications](#it-140-development-environment-specifications)
  - [Project Information](#project-information)
  - [Table of Contents](#table-of-contents)
  - [0. General Description](#0-general-description)
    - [0.1. User Story](#01-user-story)
    - [0.2. Scope and Exclusions](#02-scope-and-exclusions)
    - [0.3. Assumptions and Dependencies](#03-assumptions-and-dependencies)
    - [0.4. Requirement Attributes](#04-requirement-attributes)
  - [1. Functional Requirements](#1-functional-requirements)
  - [2. Nonfunctional Requirements](#2-nonfunctional-requirements)
  - [3. Technology Constraints](#3-technology-constraints)
  - [4. Quality of Service Constraints](#4-quality-of-service-constraints)
  - [5. Acceptance Test Cases](#5-acceptance-test-cases)
  - [Appendix A: Preliminary Course IDE Software Stack](#appendix-a-preliminary-course-ide-software-stack)

## 0. General Description

The IT 140 Development Environment (course IDE) is the standard development environment students use to complete course software development assignments and projects that require designing, writing, editing, running, testing, or submitting code. The course IDE is intended to provide a consistent, beginner-friendly programming environment across the Codio Virtual Desktop (CVD) and supported local desktop environments.

The primary reference environment is the CVD, which is preconfigured for students and does not require them to install the course IDE tools inside Codio. Students who choose to work on their own computers may install a local version of the course IDE on supported Windows, macOS, or Debian/Ubuntu-based Linux systems. The local setup should match the CVD environment as closely as practical so students experience similar tools, commands, workflows, and expected results regardless of where they complete their work.

The course IDE includes industry-standard tools for programming, code editing, version control, test execution, diagrams, pseudocode, spelling support, and file viewing. These tools support the learning goals of an introductory programming course while reducing unnecessary setup complexity for students who may have little or no prior experience installing software or using the command line.

This specification defines the functional requirements, nonfunctional requirements, technology constraints, quality-of-service constraints, and acceptance criteria for developing, testing, documenting, and maintaining the Course IDE setup process.

### 0.1. User Story

As an IT 140 student with limited programming experience, I need a reliable course IDE that works consistently in Codio and supported local desktop environments, so I can focus on learning the programming fundamentals and completing course software development assignments instead of troubleshooting software setup or learning additional new tools.

### 0.2. Scope and Exclusions

This specification applies to the Course IDE used for software development assignments and projects that require students to design, write, edit, run, test, or submit code.

This specification does not apply to activities completed entirely in other course platforms or formats, including zyBooks Participation, Challenge, and Lab Activities; discussions; quizzes; or other LMS-based submissions that do not require code development.

The Codio Virtual Desktop (CVD) is the primary supported environment and is expected to be preconfigured for students. Local desktop environment setup is optional and is intended to provide a comparable development environment for students who choose to work on their own computers.

### 0.3. Assumptions and Dependencies

This specification assumes that students have access to the Codio Virtual Desktop (CVD) through the course.

This specification assumes that local desktop setup is optional and that students who cannot complete local setup may use the Codio Virtual Desktop (CVD) as the supported fallback environment.

This specification depends on the version of each required course programming language used in the course zyBooks Lab Activities, the operating system version used by the Codio Virtual Desktop (CVD), [SNHU’s published minimum hardware specifications](https://snhu.ink/TechnicalRequirements), and the availability of supported software installers or package managers for Windows, macOS, and Debian/Ubuntu-based Linux distributions.

This specification should be reviewed when zyBooks, Codio, required course programming language(s), code editor, version control tools, operating system support policies, or SNHU technical requirements change.

### 0.4. Requirement Attributes

Each requirement should be evaluated using the following attributes:

- **Priority**: Shall, should, or may.
- **Rationale**: The reason the requirement exists, especially its connection to student experience, course consistency, supportability, or instructional alignment.
- **Verification Method**: Inspection, demonstration, command output, clean-environment test, or stakeholder review.
- **Traceability**: Connection to course competencies, student workflow needs, platform constraints, or acceptance test cases.

## 1. Functional Requirements

- [ ] 1.1. The course IDE shall enable students to complete all course software development assignments and projects that require code creation, editing, execution, testing, or submission, excluding activities completed in other course platforms or formats, such as zyBooks activities, discussions, or quizzes. Rationale: This ensures that the course IDE supports the course software development work it is intended to support without implying that all course activities must be completed inside the IDE.

- [ ] 1.2. The course IDE shall provide the tools needed to design, write, edit, run, debug, and test programs written in the required course programming language(s). Rationale: This ensures that students have a complete development workflow for course programming tasks and do not need to locate or configure additional tools on their own.

- [ ] 1.3. The course IDE shall include or support installation of tools needed for course repository access, version control, and assignment workflow. Rationale: This supports consistent repository access and version-control practices across the course while reducing setup differences that could interfere with assignment completion.

- [ ] 1.4. The course IDE shall include a verification process that allows students and support staff to confirm that required tools are installed and working. Rationale: This gives students and support staff a clear way to identify whether setup succeeded and reduces uncertainty when troubleshooting installation problems.

- [ ] 1.5. The course IDE shall support execution of instructor-provided test programs or test files when such tests are included in course software development assignments or projects. Rationale: This allows students to check their work using the same type of testing workflow expected by the course without requiring them to create their own tests.

## 2. Nonfunctional Requirements

- [ ] 2.1. The course IDE shall provide a substantially similar student experience across supported Windows, macOS, and Linux environments, including similar tools, workflows, command names, and expected outputs where platform differences allow. Rationale: A similar experience across platforms reduces student confusion, makes instructions easier to follow, and improves consistency when students move between Codio and local desktop environments.

- [ ] 2.2. The course IDE shall minimize student cognitive load by using consistent tool names, folder structures, commands, screenshots, and terminology across Codio and local setup instructions where possible. Rationale: Consistency helps beginning programming students focus on course concepts instead of having to interpret different names, paths, commands, or workflows for the same task.

- [ ] 2.3. The course IDE shall support a setup process that can be completed by students with little or no prior command-line experience by using clear step-by-step instructions and copy-ready commands. Rationale: IT 140 serves students with varied technical backgrounds, so the setup process must be accessible to students who are new to installing development tools or using a command line.

- [ ] 2.4. The course IDE shall be documented in a way that supports troubleshooting by students, instructors, and technical support staff, including setup logs, verification output, or other diagnostic information where practical. Rationale: Troubleshooting documentation and diagnostic output reduce support time and help students provide useful information when they request help.

- [ ] 2.5. The course IDE shall provide a supported fallback path through the Codio Virtual Desktop (CVD) when a student cannot complete or maintain a local desktop installation. Rationale: A supported fallback path protects student access and progress when local hardware, operating system, permissions, or installation problems prevent successful local setup.

- [ ] 2.6. The course IDE documentation shall distinguish between required course IDE tools and optional supporting tools or extensions. Rationale: Clear distinction between required and optional tools helps students prioritize essential setup steps and reduces unnecessary installation burden.

## 3. Technology Constraints

- [ ] 3.1. The course IDE shall support a Linux-based Codio Virtual Desktop (CVD) as the primary reference environment. Rationale: Using the CVD as the reference environment provides a controlled, preconfigured baseline that supports consistency, testing, documentation, and technical support.

- [ ] 3.2. The course IDE shall use the same major and minor version of each required course programming language as the version used in the course zyBooks Lab Activities unless a documented technical constraint requires an exception. This alignment reduces student confusion by helping ensure that code behavior, syntax support, error messages, and instructional examples remain consistent across zyBooks, Codio, and local desktop environments.

- [ ] 3.3. The course IDE shall use tools, services, and licenses that do not require student or university payment during the course term, with preference given to options that remain free beyond the course. Rationale: Cost-free access during the course supports equity and ensures that students can complete required work without additional financial barriers.

- [ ] 3.4. The course IDE shall support local installation on Windows, macOS, and Debian/Ubuntu-based Linux distributions that are currently receiving security updates from their operating system vendor or maintainer. Rationale: Supporting common, security-maintained operating systems allows students to use typical personal computers while avoiding unsupported environments that may create security, compatibility, or support risks.

- [ ] 3.5. The course IDE shall use development tools that reflect current professional practice, supported by recent evidence of broad developer adoption, such as leading placement in relevant categories of the Stack Overflow Developer Survey or comparable evidence or instructional justification. Rationale: Industry-relevant tools help align the course environment with professional practice while allowing flexibility when an instructional reason supports a different tool choice.

- [ ] 3.6. The course IDE shall use required course programming language versions, package managers, and development tools that are currently vendor-supported or community-supported and receiving security updates. Rationale: Supported software reduces security risk, improves compatibility with current operating systems, and lowers the chance that students will encounter obsolete or unsupported tool behavior.

- [ ] 3.7. The course IDE shall avoid tools that require students to create unnecessary third-party accounts unless the account is required for course activities. Rationale: Limiting unnecessary accounts reduces student friction, privacy concerns, credential-management burden, and avoidable dependency on external services.

- [ ] 3.8. The course IDE should prefer tools that provide both desktop and web-based options when those options support a similar student experience across Codio and local environments. This allows students to choose the option that best fits their needs and preferences while maintaining a consistent learning experience.

- [ ] 3.9. The course IDE should prefer open-source tools with licenses that allow the university to fork, customize, document, and redistribute course-specific configurations or supporting materials at no cost for instructional use. Rationale: Open-source tools with permissive course-use options improve maintainability, reduce vendor lock-in, and support course-specific customization when needed.

## 4. Quality of Service Constraints

- [ ] 4.1. The course IDE shall be designed, tested, and documented to run acceptably on computers that meet the lower of SNHU’s published minimum hardware specifications for online or campus students. This ensures that the course IDE does not impose hardware expectations beyond the university baseline for students eligible to enroll in IT 140, including students taking the course as a general education elective.

- [ ] 4.2. The course IDE shall include setup procedures that can be tested from clean baseline environments before being released to students. Rationale: Clean-environment testing helps confirm that the instructions work from a known starting point and do not depend on tools, settings, or cached files already present on a developer’s computer.

- [ ] 4.3. The course IDE shall provide a reliable verification command set that confirms required tool versions and identifies common setup failures. Rationale: Version and availability checks make the setup process measurable and help students and support staff identify problems quickly.

- [ ] 4.4. The course IDE shall avoid requiring administrator or elevated privileges after initial installation unless required by the operating system or tool vendor. Rationale: Limiting elevated privilege requirements reduces security risk, prevents avoidable permission problems, and supports students who may not have full administrative control of their computer.

- [ ] 4.5. The course IDE shall be maintainable across course terms, with version numbers, supported platforms, and setup commands reviewed before each major course refresh or platform change. Rationale: Regular review helps keep the environment aligned with course tools, supported platforms, security updates, and student-facing documentation.

## 5. Acceptance Test Cases

- [ ] AT-1: Codio Reference Environment Verification. Given a clean IT 140 Codio Virtual Desktop (CVD), when the verification command set is run, then the required course IDE tools and expected versions are confirmed without errors.

- [ ] AT-2: Windows Local Setup Verification. Given a supported Windows computer or sandbox that meets SNHU’s minimum hardware specifications, when the Windows setup procedure is completed from a clean baseline environment, then the verification command set confirms that all required course IDE tools are installed and working.

- [ ] AT-3: macOS Local Setup Verification. Given a supported Mac that is receiving Apple security updates, when the macOS setup procedure is completed from a clean baseline environment, then the verification command set confirms that all required course IDE tools are installed and working.

- [ ] AT-4: Linux Local Setup Verification. Given a supported Debian/Ubuntu-based Linux distribution that is receiving security updates, when the Linux setup procedure is completed from a clean baseline environment, then the verification command set confirms that all required course IDE tools are installed and working.

- [ ] AT-5: Programming Language Version Alignment. Given the version of each required course programming language used in the course zyBooks Lab Activities, when the same required course programming language is checked in Codio and supported local environments, then the installed major and minor version matches the zyBooks version unless a documented exception exists.

- [ ] AT-6: Course Assignment Completion. Given the configured course IDE, when a representative IT 140 software development assignment or project is opened, edited, run, and tested, then the assignment workflow can be completed without requiring unsupported software.

- [ ] AT-7: Beginner Setup Documentation Review. Given the student-facing setup instructions, when they are reviewed by a user with limited command-line experience or by an instructional design reviewer, then the instructions are understandable, sequential, and include verification or troubleshooting guidance.

- [ ] AT-8: Supportability Review. Given a failed or partially completed setup, when a student, instructor, or support staff member reviews the setup log or verification output, then the output provides enough information to identify the likely failing tool or installation step.

## Appendix A: Preliminary Course IDE Software Stack

The software stack below is an initial proposed stack that appears to meet the course IDE requirements based on preliminary analysis. It has not yet been fully verified through clean-environment testing across Codio, Windows, macOS, and Debian/Ubuntu-based Linux environments. Final inclusion depends on successful installation, verification, assignment workflow testing, and stakeholder review.

|  #  | Software Category     | Software Name                         | Student Use Cases in Course                                 |
| :-: | :-------------------- | :------------------------------------ | :---------------------------------------------------------- |
|  0  | Version Control       | Git, GitHub CLI                       | Access course repos with assignment materials               |
|  1  | Programming Language  | Python 3.12                           | Develop software for assignments in code editor             |
|  2  | Test Runner           | pytest, pytest-cov                    | Run provided tests and review results in code editor        |
|  3  | Code Editor / IDE     | Visual Studio Code                    | Develop software for assignments in code editor             |
|  4  | Language Support      | ms-python.python extension            | Develop software for assignments in code editor             |
|  5  | Code Linter/Formatter | charliermarsh.ruff extension          | Identify style issues and apply consistent code formatting  |
|  6  | Diagram Support       | hediet.vscode-drawio extension        | Read and edit flowcharts and the project map in code editor |
|  7  | Pseudocode Support    | i2p-hub.i2p-pseudo extension          | Read and edit pseudocode files in code editor               |
|  8  | Code Spell Checker    | streetsidesoftware.code-spell-checker | Checking spelling in code and text files in code editor     |
|  9  | File Viewers          | cweijan.vscode-office extension       | View course Office and PDF files in code editor             |

Students may use other software if it provides the same basic functionality. However, other software may cause compatibility issues, and the instructor or IT Service Desk may not be able to provide support for it.
