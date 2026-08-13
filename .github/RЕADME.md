<!--
MAINTAINER NOTE:
This filename intentionally contains a Cyrillic capital IE: Е (U+0415)
instead of the ASCII capital E: E (U+0045).

It is visually similar to README.md, but GitHub does not treat it as the
special .github/README.md file that would override the repository-root README.

Do not "correct" the filename unless this behavior is no longer desired.
-->

# About the `.github` Folder

> [!IMPORTANT]
> **Are You in the Right GitHub Folder?**
>
> This is **`.github/`** — with a period at the beginning.
>
> If you are completing the IT 140 setup activity and need instructions for **creating or configuring your GitHub account**, you want the **`github/`** folder instead (no period at the beginning).
>
> **[Go to `github/README.md`](../github/README.md)**
>
> The `.github/` folder contains files used to configure and maintain this repository. You do **not** need to use or modify these files to complete IT 140.

## Optional: Learn What the `.github/` Folder Is

This page is optional reading for students who are curious about how professional software repositories are configured and maintained. The material below goes beyond the requirements of this course.

A repository's `.github/` directory is a normal directory that is tracked by **Git**, the version control system used to record changes to files. GitHub gives certain files and subdirectories inside `.github/` special meanings. These files can configure repository automation, contribution workflows, security guidance, dependency updates, and other GitHub features.

The leading period is significant. On Unix-like operating systems, a name that begins with a period is traditionally treated as a hidden name. The period does **not** make the directory private or secure. If `.github/` is committed to a public repository, its contents are normally public.

Also, do not confuse `.github/` with `.git/`:

- **`.github/`** is a project directory that may be committed to the repository. GitHub recognizes certain files stored there.
- **`.git/`** is Git's internal repository database on a local computer. It stores objects, references, configuration, and other information Git needs to manage the local repository. It is not a normal project folder that you commit to GitHub.

## Why Repositories Use `.github/`

A software repository contains more than source code. It may also contain documentation, tests, build instructions, automation, contribution rules, and maintenance information.

In software engineering, these work products can be treated as **configuration items**: identifiable artifacts placed under **configuration management** so that their versions and changes can be controlled. **Software configuration management (SCM)** is the discipline of identifying software work products, controlling changes to them, recording their status, and maintaining their integrity throughout the software life cycle.

Git provides **version control**, which records versions and changes to files. Version control is an important part of SCM, but SCM is broader than version control alone.

Files in `.github/` often support SCM and related software engineering activities by documenting processes, standardizing change requests, assigning review responsibility, and automating verification or maintenance work.

## Common `.github/` Subdirectories

Not every repository contains all of these directories. A project normally includes only the ones it needs.

### `.github/workflows/`

Contains **GitHub Actions workflows**.

A **workflow** is a configurable automated process defined in a YAML file. A workflow can run when an event occurs, on a schedule, or when someone starts it manually.

For example:

```text
.github/
└── workflows/
    ├── ci.yml
    ├── documentation.yml
    └── release.yml
```

A workflow can contain one or more **jobs**. Each job runs on a **runner**, which is a machine that GitHub Actions uses to execute the job's steps.

Common workflow tasks include:

- Running automated tests
- Checking Python syntax or code style
- Building software
- Validating documentation
- Scanning for security problems
- Packaging a release
- Deploying software or documentation

You may hear the term **continuous integration (CI)** when workflows automatically verify changes as developers integrate them into a shared codebase. Workflows may also support **continuous delivery or deployment (CD)** by automating preparation or deployment of releasable software. Not every GitHub Actions workflow is a CI/CD workflow.

GitHub requires workflow files to be stored directly in `.github/workflows/`. Subdirectories inside `workflows/` are not supported for workflow files.

### `.github/ISSUE_TEMPLATE/`

Contains templates or forms used when someone creates a GitHub **issue**.

An issue is a repository work item used to report a problem, request an improvement, ask a question, or track other work. An issue does not necessarily represent a software defect.

An `ISSUE_TEMPLATE/` directory may contain:

- Markdown (`.md`) issue templates
- YAML (`.yml`) **issue forms**, which create structured forms with fields
- `config.yml`, which configures the issue-template chooser

For example:

```text
.github/
└── ISSUE_TEMPLATE/
    ├── bug-report.yml
    ├── feature-request.yml
    └── config.yml
```

Templates improve **problem reporting** by asking contributors for consistent information such as expected behavior, actual behavior, reproduction steps, environment details, and logs.

This Setup Tasks repository currently uses issue forms for reporting problems and requesting improvements.

### `.github/PULL_REQUEST_TEMPLATE/`

May contain multiple templates for **pull requests**.

A **pull request (PR)** is a GitHub mechanism for proposing a set of changes and requesting that those changes be reviewed and merged into another branch.

For example:

```text
.github/
└── PULL_REQUEST_TEMPLATE/
    ├── bug-fix.md
    └── documentation-change.md
```

A repository that needs only one template may instead use:

```text
.github/PULL_REQUEST_TEMPLATE.md
```

Pull request templates can remind contributors to explain a change, identify related issues, describe testing, or complete review checklists. This helps standardize the repository's **change control** process — the process used to evaluate, approve, implement, and verify changes.

### `.github/DISCUSSION_TEMPLATE/`

May contain forms used for GitHub Discussions categories.

GitHub Discussions are intended for conversations that may not belong in the issue tracker, such as questions, ideas, announcements, or community discussions. Discussion forms can standardize the information requested when a new discussion is created.

## Common `.github/` Files

Some files below have GitHub-defined behavior. Others provide human-readable policy or guidance.

### `CODEOWNERS`

A `CODEOWNERS` file identifies people or teams responsible for particular files or directories.

For example, a repository might assign:

- Documentation files to a documentation team
- Security-sensitive files to a security team
- Build or deployment files to repository maintainers

When a pull request changes files covered by `CODEOWNERS`, GitHub can automatically request review from the appropriate code owners. Repository rules can also require code-owner approval before changes are merged.

`CODEOWNERS` does not, by itself, give someone permission to access a repository or automatically prevent changes from being merged. Access permissions and repository rules are configured separately.

GitHub supports `CODEOWNERS` in `.github/`, the repository root, or `docs/`.

### `dependabot.yml`

Configures **Dependabot**, GitHub's dependency-management automation.

A **dependency** is software that another program or project relies on, such as a Python package or a GitHub Action.

A `.github/dependabot.yml` file can specify:

- Which package ecosystems to monitor
- Which directories contain dependency files
- How often to check for updates
- How update pull requests should be grouped or labeled
- Which dependencies should be ignored
- How private package registries should be accessed

Dependabot can help maintain the software **supply chain**, meaning the external packages, tools, and services used to build or run software.

### `release.yml`

Configures GitHub's automatically generated release notes.

A `.github/release.yml` file can define categories for changes and specify which pull-request labels or contributors should be included or excluded from generated release notes.

A **release** is an identified version of software or another project artifact made available for use or distribution.

### `SECURITY.md`

Defines the project's **security policy**, especially how security vulnerabilities should be reported.

A security policy may explain:

- Which versions are currently supported
- How to report a suspected vulnerability
- Which communication channel should be used
- What information a security report should contain

Security vulnerabilities should often be reported privately rather than through a public issue.

### `SUPPORT.md`

Explains how users should obtain help with the project.

For example, it may direct users to:

- Documentation
- A discussion forum
- An issue tracker
- A support organization
- Another appropriate support channel

Separating support questions from defect reports can make the issue tracker easier to maintain.

### `CONTRIBUTING.md`

Provides **contribution guidelines** for people who want to propose changes to the project.

It may describe:

- How to set up a development environment
- Branch and naming conventions
- Coding or documentation standards
- Required tests
- How to submit a pull request
- Review expectations

### `CODE_OF_CONDUCT.md`

Defines expected standards of behavior for people participating in the project's community.

A code of conduct may also explain how unacceptable behavior should be reported and handled.

### `GOVERNANCE.md`

May explain how an open-source project is governed.

For example, it might document:

- Project roles
- Maintainer responsibilities
- Decision-making processes
- How contributors become maintainers

### `FUNDING.yml`

Configures GitHub's sponsor button for projects that accept financial support.

A `.github/FUNDING.yml` file can identify GitHub Sponsors accounts, supported external funding platforms, or approved funding URLs.

This file is common in some open-source projects but is not relevant to most course repositories.

### `README.md`

A `.github/README.md` file, such as this one, can document the purpose of the directory for human readers.

Unlike files such as `dependabot.yml` or files inside `workflows/`, this README does not configure a GitHub automation feature merely because it is named `README.md`. Its purpose here is documentation.

## Tool-Specific Configuration Files

You may also see other files inside `.github/`, such as configuration files used by a particular GitHub Action or external development tool.

For example:

```text
.github/
├── workflows/
│   └── labels.yml
└── labeler.yml
```

In a case like this, `labeler.yml` has meaning only because a workflow, action, or other tool is configured to read it. GitHub does not automatically assign special behavior to every file placed in `.github/`.

This distinction is important:

> A file can be located in `.github/` either because **GitHub requires or recognizes that location** or simply because **the repository's maintainers chose that location for a tool-specific configuration file**.

## What Should Not Be Stored in `.github/`

The `.github/` directory is not a secure storage location.

Do **not** commit:

- Passwords
- Personal access tokens
- API keys
- Private cryptographic keys
- Authentication codes
- Other secrets or private information

GitHub Actions can use **secrets**, but the secret values are normally stored in GitHub's encrypted repository, environment, or organization settings and referenced by workflows. They should not be written directly into workflow files.

Some repository configuration also lives in GitHub's web settings instead of `.github/`. For example, repository access permissions, branch protection, rulesets, and many security settings are normally configured through GitHub rather than represented as ordinary files in this directory.

## How This Relates to Software Engineering

The `.github/` directory is a useful example of how modern software engineering includes both the software product and the processes used to develop and maintain it.

Depending on the repository, files in `.github/` may support several software engineering activities:

| Software engineering activity | Example `.github/` support |
| --- | --- |
| Software configuration management | Versioned workflow, policy, template, and ownership files |
| Change control | Pull request templates, review workflows, and `CODEOWNERS` |
| Problem reporting and tracking | Issue templates and issue forms |
| Software testing | Automated test workflows |
| Software quality | Linting, formatting, validation, and quality checks |
| Software security | Security policies, dependency updates, and security workflows |
| Release management | Release workflows and `release.yml` |
| Software engineering operations | Build, packaging, deployment, and operational automation |

The exact process differs from project to project. A `.github/` directory does not replace a software engineering process; it stores some of the artifacts and automation used to implement that process.

## In This Repository

For the IT 140 Setup Tasks repository, `.github/` is **repository infrastructure**, not part of the student setup procedure.

Its structure includes:

```text
.github/
├── README.md
└── ISSUE_TEMPLATE/
    ├── report-a-problem.yml
    └── request-an-improvement.yml
```

The issue forms help faculty, staff, and other contributors report setup problems and proposed improvements in a consistent format.

If you arrived here while trying to complete the IT 140 GitHub account setup, return to:

**[Set Up a GitHub Account (`github/README.md`)](../github/README.md)**

## Learn More

For students who want to explore these topics further:

- [GitHub Docs: Workflows](https://docs.github.com/en/actions/concepts/workflows-and-actions/workflows)
- [GitHub Docs: About issue and pull request templates](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/about-issue-and-pull-request-templates)
- [GitHub Docs: About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [GitHub Docs: About the `dependabot.yml` file](https://docs.github.com/en/code-security/concepts/supply-chain-security/about-the-dependabot-yml-file)
- [GitHub Docs: Creating a default community health file](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file)
- [GitHub Docs: Automatically generated release notes](https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes)
- [IEEE Computer Society: Guide to the Software Engineering Body of Knowledge (SWEBOK)](https://www.computer.org/education/bodies-of-knowledge/software-engineering)
