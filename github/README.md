# Set Up a GitHub Account

## Table of Contents

- [Set Up a GitHub Account](#set-up-a-github-account)
  - [Table of Contents](#table-of-contents)
  - [What Are Git and GitHub?](#what-are-git-and-github)
  - [0. Sign Up for a New GitHub Account](#0-sign-up-for-a-new-github-account)
  - [1. Configure Your GitHub Email Addresses](#1-configure-your-github-email-addresses)
  - [2. Secure Your GitHub Account](#2-secure-your-github-account)
  - [3. Configure Your GitHub Profile (Optional)](#3-configure-your-github-profile-optional)
  - [4. Join GitHub Education (Optional)](#4-join-github-education-optional)
  - [Next Step](#next-step)
  - [Troubleshooting](#troubleshooting)

## What Are Git and GitHub?

**[Git](https://git-scm.com/)** is a version control system included in the course integrated development environment (IDE). Git allows developers to track changes to project files, restore earlier versions, and maintain a history of their work. It also supports multiple developers working on the same project without overwriting each other’s changes. Employers consider Git a foundational skill for entry-level software developers [[1](https://doi.org/10.1109/ESEM64174.2025.00055)].

**[GitHub](https://github.com/)**, which is owned by Microsoft, is a widely used web-based platform for storing and sharing Git repositories, reviewing changes, and collaborating on software projects. A repository, or repo, is a folder that stores project files and their change history. In a recent survey, developers ranked GitHub as the most admired community platform and the most desired code documentation and collaboration tool [[2](https://survey.stackoverflow.co/2025/technology#2-community-platforms), [3](https://survey.stackoverflow.co/2025/technology#2-code-documentation-and-collaboration-tools)]. This course uses GitHub to host its code repositories.

National job-posting data identifies both Git and GitHub as in-demand technologies for software-development positions [[4](https://www.onetonline.org/link/demand/15-1252.00)]. IT 140 introduces these tools so students can learn to organize, track, and manage programming projects. These skills support both course work and future professional use.

## 0. Sign Up for a New GitHub Account

If you already have a GitHub account that you want to use for this course, skip to [Step 1](#1-configure-your-github-email-addresses).  
Otherwise, follow the instructions below to create a new GitHub account.

1. Go to [https://github.com/signup](https://github.com/signup)
2. Select a sign-up method
   - Continue with Google
   - Continue with Apple
   - Manually enter your information
     - Use a personal email address. Do **not** use your SNHU account credentials here
     - Select a [professional username](github_username.md)
3. Leave optional checkboxes unchecked for increased privacy and security.
4. Review GitHub’s *Terms of Service* and *Privacy Statement*
5. Click the **Create account** button
6. Check your email for a verification message from GitHub
7. Follow the instructions in the email to complete the sign-up process

## 1. Configure Your GitHub Email Addresses

1. Go to [https://github.com/settings/emails](https://github.com/settings/emails)
2. Sign in using the method you configured when creating your account
3. In the **Add email address** field, enter your SNHU email address and click **Add**
   - Optional: Add another personal email address as a backup
4. Check your SNHU email for a verification message from GitHub
5. Follow the instructions in the email to verify the address
6. Confirm that your SNHU email address is listed as verified
7. Scroll down and turn on **Keep my email addresses private**
8. Note your GitHub-provided public email address. It will look similar to:<br>
   `302326151+peteypenmen@users.noreply.github.com`<br>
   You will need this address later when configuring Git.
9. Turn on **Block command line pushes that expose my email**

## 2. Secure Your GitHub Account

GitHub requires users who contribute code to configure [two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/about-mandatory-two-factor-authentication) (2FA). Two-factor authentication requires an additional form of verification when you sign in and helps protect your account if someone obtains your password.

You may use the same 2FA method that you use for your SNHU account, such as an authenticator app, if GitHub supports it. Your GitHub and SNHU accounts remain separate; do not use your SNHU password for GitHub.

1. Go to [https://github.com/settings/security](https://github.com/settings/security)
2. Under **Two-factor authentication**, click **Enable two-factor authentication**
3. Follow GitHub’s on-screen instructions to configure an authentication method
4. Download or copy your recovery codes when prompted
5. Store your recovery codes in a secure location separate from the device you normally use to sign in
6. Do not share your password, authentication codes, passkeys, or recovery codes with anyone
7. Optional: Add a passkey if your device supports one

> [!IMPORTANT]
> Recovery codes can help you regain access to your account if you lose access to your normal authentication method. Store them securely. Do not save your only copy on a device that could be lost or damaged.

## 3. Configure Your GitHub Profile (Optional)

If desired, you can make your GitHub profile private or add an avatar, bio, and other information. You can always change your profile settings later. To configure your GitHub profile, follow the instructions below.

1. Go to [https://github.com/settings/profile](https://github.com/settings/profile)
2. Sign in, if not already
3. Make your profile private, if desired
   1. Scroll down to **Contributions & activity**
   2. Check the **Make profile private and hide activity** option
   3. Click the **Update preferences** button to save your changes
4. Add or change other profile information as desired
5. Click the **Update profile** button when done to save your changes

## 4. Join GitHub Education (Optional)

[GitHub Education](https://education.github.com/) provides eligible students with free access to GitHub benefits and professional development tools. These tools are not required for IT 140 but may be useful if you take additional programming or technical courses. You may skip this section and apply later.

1. Go to https://github.com/settings/education/benefits
2. Sign in, if needed
3. Click **Learn more** to review the available benefits
4. Click **Start an application**
5. Complete and submit the **Education Benefits Application**
6. Check your email for follow-up messages from GitHub Education
   - GitHub may request additional information to verify your student status

## Next Step

Once your GitHub account is created, your SNHU email address is verified, and you have recorded your GitHub username and public noreply email address, you are ready to configure the course IDE on the Codio Virtual Desktop (CVD).

- [Set Up the Course IDE on Codio](../codio/README.md)

## Troubleshooting

{{SME TODO: Add troubleshooting information for GitHub account creation and configuration.}}
