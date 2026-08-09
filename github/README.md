# Set Up a GitHub Account

Setting up a GitHub account is **recommended for all students**. Having a GitHub account makes it easier to back up your work, sync your work across devices, and recover earlier versions of your code if you make a mistake. It also allows you to start building a professional portfolio of your work.

Technology majors will need a GitHub account later in their degree programs and as part of their portfolio.

## Table of Contents

- [Set Up a GitHub Account](#set-up-a-github-account)
  - [Table of Contents](#table-of-contents)
  - [Activity Metadata](#activity-metadata)
  - [What Are Git and GitHub?](#what-are-git-and-github)
  - [0. Sign Up for a New GitHub Account](#0-sign-up-for-a-new-github-account)
  - [1. Configure Your GitHub Email Addresses](#1-configure-your-github-email-addresses)
  - [2. Secure Your GitHub Account](#2-secure-your-github-account)
  - [3. Customize Your GitHub Profile](#3-customize-your-github-profile)
  - [4. Optional: Join GitHub Education](#4-optional-join-github-education)
  - [Next Step](#next-step)
  - [Troubleshooting](#troubleshooting)

## Activity Metadata

- **Course**: IT 140 - *Introduction to Scripting*
- **Activity Title**: 1-1 Setup Tasks | GitHub Account Setup
- **Activity Type**: Recommended, non-graded, no submission
- **Activity Purpose**: Set up a GitHub account for use in the IT 140 course.
- **Activity Description**: This activity guides students through the process of creating a GitHub account, configuring email addresses, enabling two-factor authentication, and optionally customizing their profile and joining GitHub Education. These steps are essential for managing code repositories and collaborating on programming projects throughout the course.
- **Artifact Version**: 0.10.0-beta.1
- **Artifact Date**: 2026-08-09
- **Development Status**: Beta Testing

## What Are Git and GitHub?

**[Git](https://git-scm.com/)** is a version control system included in the course integrated development environment (IDE). Git allows developers to track changes to project files, restore earlier versions, and maintain a history of their work. It also supports multiple developers working on the same project without overwriting each other’s changes. Employers consider Git a foundational skill for entry-level software developers [[1](https://doi.org/10.1109/ESEM64174.2025.00055)].

**[GitHub](https://github.com/)**, which is owned by Microsoft, is a widely used web-based platform for storing and sharing Git repositories, reviewing changes, and collaborating on software projects. A repository, or "repo", is a folder that stores project files and their change history. In a recent survey, developers ranked GitHub as the most admired community platform and the most desired code documentation and collaboration tool [[2](https://survey.stackoverflow.co/2025/technology#2-community-platforms), [3](https://survey.stackoverflow.co/2025/technology#2-code-documentation-and-collaboration-tools)]. This course uses GitHub to host its code repositories.

National job-posting data identifies both Git and GitHub as in-demand technologies for software-development positions [[4](https://www.onetonline.org/link/demand/15-1252.00)]. IT 140 introduces these tools so students can learn to organize, track, and manage programming projects. These skills support both course work and future professional use.

## 0. Sign Up for a New GitHub Account

If you already have a GitHub account that you want to use for this course, skip to [Step 1](#1-configure-your-github-email-addresses). Otherwise, follow the instructions below to create a new GitHub account.

1. Go to [https://github.com/signup](https://github.com/signup).

2. Enter your email address and password:
   - **Students**: Continue with Google or Apple or manually enter another personal email address. Do **NOT** use your SNHU email or password here.
   - **Faculty and Staff**: Use your SNHU email address. Do **NOT** use your SNHU password here.

3. Enter a professional username that you are comfortable sharing publicly. For guidance on selecting a professional username, see [github_username.md](github_username.md).

4. Check or uncheck optional checkboxes, as desired. You do not need to check any of the optional boxes for this course.

5. Review GitHub’s *Terms of Service* and *Privacy Statement*, if desired. An AI chatbot can help you understand these documents.

6. Click the **Create account** button.

7. Check your email for a verification message from GitHub.

8. Follow the instructions in the verification email to complete the sign-up process.

## 1. Configure Your GitHub Email Addresses

1. Go to [https://github.com/settings/emails](https://github.com/settings/emails).

2. Sign in using the method you used when creating your GitHub account.

3. In the **Add email address** field, enter at least one other email address and click **Add**.
   - **Students**: Add your SNHU email address to your GitHub account.
   - **Faculty & Staff**: Add a personal address to your GitHub account.
   - *Optional*. Add other email addresses as backups, if desired.

   ![GitHub Email settings page](./assets/13_github_email_add.png)

4. Check your email inbox for a verification message from GitHub.
   - If you do not see a message for each email address added, check your Junk or Spam folder.
   - Click the **Verify email address** button in the message to confirm that you own the email address, or copy and paste the URL into your browser.
   - Repeat this step for each email address you added to your GitHub account.

5. Back in [GitHub > Settings > Emails](https://github.com/settings/emails), refresh the page to confirm that all email addresses are listed as verified.

   ![GitHub verification email](./assets/15_github_email_addresses.png)

6. **Optional**. Change your **Primary email address** from the list of verified addresses to the one you desire. This is the address that GitHub will use for notifications and other communications.

   ![GitHub primary email address settings](./assets/16_github_email_primary.png)

7. Scroll down and turn on **Keep my email addresses private**.

   ![GitHub Keep my email addresses private](./assets/17_github_email_private.png)

8. Remember your GitHub-provided public email address. You will need it to configure the course IDE. The public email address will look similar to `302346351+your-username@users.noreply.github.com`.

9. Turn on **Block command line pushes that expose my email**.

   ![GitHub block command line pushes that expose my email](./assets/19_github_email_block.png)

## 2. Secure Your GitHub Account

GitHub requires users who contribute code to configure [two-factor authentication](https://docs.github.com/authentication/securing-your-account-with-two-factor-authentication-2fa/about-two-factor-authentication) (2FA). Two-factor authentication requires an additional form of verification when you sign in and helps protect your account if someone obtains your password.

You may use the same 2FA method that you use for your SNHU account, such as [Microsoft Authenticator](https://www.microsoft.com/en-us/security/mobile-authenticator-app). Your GitHub and SNHU accounts remain separate; do not use your SNHU password for GitHub.

1. Go to [https://github.com/settings/security](https://github.com/settings/security).

2. Under **Two-factor authentication**, click the **Enable two-factor authentication** button.

   ![GitHub enable two-factor authentication](./assets/22_github_security_enable_2FA.png)

3. Follow GitHub’s on-screen instructions to configure a two-factor authentication (2FA) method. This step is time-sensitive. One-time codes expire quickly.

   *TIP*. Use the same authenticator app you use for your SNHU account. This is usually the [Microsoft Authenticator](https://support.microsoft.com/en-us/authenticator/download-microsoft-authenticator) app from the [Apple](https://apps.apple.com/us/app/microsoft-authenticator/id983156458) or [Google Play](https://play.google.com/store/apps/details?id=com.azure.authenticator) stores.

   *WARNING*. Only enable SMS text messages authentication if you have no other option. SMS is less secure than other methods, such as an authenticator app or a security key.

4. Download or copy your recovery codes when prompted.

5. Store your recovery codes in a secure location separate from the device you normally use to sign in.

   *Important*. Recovery codes can help you regain access to your account if you lose access to your normal authentication method. Store them securely. Do not save your only copy on a device that could be lost or damaged.

6. **Recommended**. Add a passkey if your device and browser support one.

> [!WARNING]
> Do not share your password, passkey, authentication codes, or recovery codes with anyone. Neither GitHub nor SNHU will ever ask you for this information. If someone asks for it, report the request to GitHub and SNHU immediately.

## 3. Customize Your GitHub Profile

1. Go to [https://github.com/settings/profile](https://github.com/settings/profile).

2. Sign in to GitHub, if prompted.

3. **Optional**. Add or change profile information that you wish to share publicly. Remove any information you do not want to be public. For example, you can:
   - Add an avatar image;
   - Include a brief bio;
   - Add links to social media;
   - Add a [profile README](https://docs.github.com/en/account-and-profile/how-tos/profile-customization/managing-your-profile-readme) (advanced);
   - Click the **Update profile** button to save your changes.

   For an example user profile with custom README, see [Petey Penmen's profile](https://github.com/petey-penmen).

4. Scroll down to **Contributions & activity**.

   1. Consider leaving the **Make profile private and hide activity** checkbox unchecked. Checking this box only hides your contributions and activity from public view. It does not hide other information in your profile, such as your username, avatar, or bio.

   2. Consider checking the **Include private contributions on my profile** checkbox. This lets your GitHub contribution graph reflect work you do in private repositories (e.g., course assignments) without revealing the repositories or their contents.

   3. Click the **Update preferences** button to save your changes.

5. Scroll down to **Profile settings**.

   1. Check the **Show Achievements on my profile** checkbox, if desired. This lets your GitHub profile display badges for achievements you earn.

   2. Click the **Update preferences** button to save your changes.

6. If your preferred spoken language is not English, scroll down to **Trending settings** and update your **Preferred spoken language**, if desired, and **Save Trending settings**.

## 4. Optional: Join GitHub Education

If an `.edu` email address is associated with your GitHub account, you may see an invitation to **Join GitHub Education!** on your [GitHub dashboard](https://github.com/), like the one shown below.

> ![GitHub Education invitation](assets/41_github_education_invite.png)

**GitHub Education is not required or recommended for this course.** The additional tools and services it provides are not needed for IT 140 and may add unnecessary complexity for beginning programmers.

You may find [GitHub Education](https://github.com/education) useful later if you take more advanced computing courses or want to explore additional developer tools on your own.

Applying for GitHub Education is optional and outside the scope of this course and SNHU technical support. If you choose to apply, you will need to complete the application process independently.

## Next Step

Once your GitHub account is set up, your SNHU email address is verified, and you have recorded your GitHub username and public noreply email address, you are ready to configure the course IDE on the Codio Virtual Desktop (CVD).

- [Set Up the Course IDE on Codio](../codio/README.md)

## Troubleshooting

{{SME TODO: Add troubleshooting information for GitHub account creation and configuration. >}}
