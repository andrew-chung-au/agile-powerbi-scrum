# Team Playbook: GitHub, Jira, and Power BI Workflow

This playbook explains how we work together using GitHub, Jira, and Power BI.

The goal is to:
- keep the project organized,
- let each teammate keep a showcase copy on their own GitHub account,
- reduce merge conflicts,
- make work easy to review,
- and help both teammates follow the process.

---

## How we work

We use a **fork-and-PR workflow**.

That means:
- each teammate keeps their own fork of the repository on their GitHub account,
- day-to-day work happens on feature branches in that fork,
- Pull Requests (PRs) are used to review and merge changes back to the team repository,
- and Jira tracks the task status and links the work to the issue.

---

## What the main terms mean

- **Repository:** The project folder stored on GitHub.
- **Upstream repository:** The team repository where the official version lives, used to pull updates and merge finished work.
- **Fork:** Your personal copy of the repository on your own GitHub account.
- **Main branch:** The stable branch in the team repository. We do not edit it directly.
- **Feature branch:** A temporary branch for one task or one piece of work.
- **Commit:** A saved checkpoint of your work.
- **Push:** Sending your commits to GitHub.
- **Pull Request (PR):** A request to review and merge your changes.
- **Jira issue key:** The ticket identifier, like `SCRUM-16`, used to link work in GitHub back to Jira.
- **Handoff slot:** A temporary claim on the live Power BI file so only one person edits it at a time.

---

## First-time setup

### 1. Fork the repository

On GitHub, open the team repository and choose **Fork**.

Tip: the exact button position in the UI can change, but the action is still called **Fork**.

### 2. Clone your fork

```bash
git clone https://github.com/YOUR-USERNAME/agile-powerbi-scrum.git
# Downloads your personal fork to your computer.

cd agile-powerbi-scrum
# Moves you into the project folder.
```

### 3. Add the team repo as upstream

```bash
git remote add upstream https://github.com/andrew-chung-au/agile-powerbi-scrum.git
# Saves a link to the team repository.
```

### 4. Confirm your remotes

```bash
git remote -v
# Shows which repositories your local copy is connected to.
```

---

## Git workflow

Use this for documentation, scripts, notes, cleaned data, or other non-Power BI tasks.

### 1. Sync with the team repository

```bash
git fetch upstream
# Downloads the latest changes from the team repository.

git checkout main
# Switches to your local main branch.

git pull upstream main
# Updates your local main branch with the newest shared changes.
```

### 2. Create a feature branch

Use a descriptive branch name.

Examples:
- `SCRUM-15-data-cleaning`
- `SCRUM-22-docs-update`
- `SCRUM-16-dashboard-export`

```bash
git checkout -b SCRUM-15-data-cleaning
# Creates a new branch for your task.
```

Tip: include the Jira issue key in the branch name so Jira can link the work automatically.

### 3. Make your changes

Edit your files locally, then check what changed.

```bash
git status
# Shows which files changed.
```

### 4. Commit your work

```bash
git add .
# Stages your changes.

git commit -m "SCRUM-15 cleaned customer date fields"
# Saves the work and links it to the Jira issue.
```

Tip: keep the Jira key at the start of the commit message if your team uses Jira-GitHub linking.

### 5. Push to your fork

```bash
git push origin SCRUM-15-data-cleaning
# Sends your branch to your personal fork on GitHub.
```

### 6. Open a Pull Request

After you push your branch to your fork, open a Pull Request from your branch into the team repository.

Tip: include the Jira issue key in the PR title or description so Jira can link the work to the correct ticket.

Example PR title:
- `SCRUM-15 Clean customer date fields`

#### Simple steps on GitHub
1. Go to your fork on GitHub.
2. Find your recently pushed branch.
3. Open the Pull Request view.
4. Set the base repository to the team repo and the base branch to `main`.
5. Set the head repository to your fork and the compare branch to your feature branch.
6. Add a short title and description.
7. Create the Pull Request.

---

## Jira workflow

Jira is the task tracking layer. GitHub is the code collaboration layer.

Use the Jira issue key everywhere you can:
- branch name,
- commit message,
- PR title.

Example:
- Branch: `SCRUM-16-dashboard-export`
- Commit: `SCRUM-16 updated dashboard screenshots`
- PR title: `SCRUM-16 Update dashboard export assets`

Before you start a task:
- move the Jira issue to in progress,
- or assign it to yourself if your team does that.

When the PR is opened or merged:
- update the Jira issue,
- add a short comment if needed,
- and mark the task as ready for review or done based on your process.

Note: Jira and GitHub UI labels can change, so use the general actions rather than relying on a specific button name.

---

## Commit message style

Good commit messages are short and specific.

Good:
- `SCRUM-11 added sprint review notes`
- `SCRUM-15 cleaned raw sales CSV`
- `SCRUM-16 updated dashboard screenshots`
- `SCRUM-22 refined onboarding steps`

Avoid:
- `update`
- `changes`
- `stuff`
- `final`

---

## Power BI workflow

The repository supports two Power BI collaboration modes. The detailed, version-aware instructions are in the [Power BI source-control workflow](powerbi-git-workflow.md).

### Git-native PBIP mode (preferred for this repository)

The checked-in report is already a Power BI Desktop Project using PBIR report definitions and a TMDL semantic model. Contributors can therefore use ordinary feature branches and PRs for many report and model changes.

Before editing:

- sync `main` and create a feature branch;
- state which page, visual, measure, relationship, or table you will own;
- avoid overlapping ownership when another contributor is changing the same report/model object.

After editing:

- inspect the PBIR/TMDL diff;
- do not stage `.pbi/cache.abf` or `.pbi/localSettings.json`;
- export a screenshot or PDF for user-visible changes;
- validate the merged project in Power BI Desktop before publishing.

Concurrent work is practical when contributors touch separate source files. Merge conflicts and semantic conflicts are still possible when the same report element or model object is edited, so coordination remains necessary.

### Legacy binary mode (`.pbix` fallback)

Use the handoff slot when the working artifact is a binary `.pbix`, when a contributor cannot use the PBIP preview features, or when a preview limitation blocks the project workflow.

The slot holder must:

- announce `[SLOT ACQUIRED]` in the team channel and Jira issue;
- edit, save, document, commit, and push the binary file;
- export screenshots or a PDF for review;
- open a PR and announce `[SLOT RELEASED - PR #…]`.

Only one person edits the same `.pbix` at a time because Git cannot merge its binary contents safely. The slot is a fallback for binary work, not the only Power BI collaboration model.

#### 1. Claim the slot

Before opening the binary file, post in the pinned Slack thread in `agile-powerbi-scrum` and, where useful, in the Jira issue:

```text
[SLOT ACQUIRED]
Working on dashboard visuals and DAX updates for SCRUM-16.
```

#### 2. Sync and branch

```bash
git fetch upstream
git checkout main
git pull upstream main
git checkout -b SCRUM-16-powerbi-updates
```

#### 3. Edit the Power BI file

Make the assigned visual, DAX, layout, formatting, or model changes in Power BI Desktop and save when finished. Keep the slot until the work is documented, committed, pushed, and handed off.

#### 4. Export review assets

Export at least one screenshot, PDF, or page image and store it in the branch, for example:

```text
visuals/dashboard-screenshots/
```

This lets teammates review progress without opening Power BI Desktop.

#### 5. Document the handoff

Leave a concise update in Jira, the project notes, or the relevant issue:

```text
Updated sales overview page, cleaned KPI labels, and revised filter layout.
Pending: stakeholder review on regional breakdown chart.
```

#### 6. Commit and push

```bash
git add reports/ visuals/dashboard-screenshots/ docs/
git commit -m "SCRUM-16 updated Power BI dashboard layout"
git push origin SCRUM-16-powerbi-updates
```

Stage intended paths instead of using `git add .`, so caches, local settings, and unrelated work cannot enter the commit accidentally.

#### 7. Open the PR and release the slot

Open a Pull Request from the fork to the team repository. Update Jira and release the slot in the pinned Slack thread:

```text
[SLOT RELEASED - PR #12]
```

If the slot is occupied, continue with work that does not require the binary:

- documentation;
- sample-data cleanup;
- sprint notes;
- screenshot organisation;
- presentation preparation;
- issue review;
- README improvements.

---

## If you get stuck

If Git gives you an error or something feels unclear:

1. Stop.
2. Do not force a push.
3. Take a screenshot of the error.
4. Share the error with the team.
5. Say what you were trying to do and which branch you were on.

Example:
> “I was trying to push `SCRUM-15-data-cleaning` and got an error. Can someone help?”

---

## Documentation expectations

Keep the repo easy to understand.

Update these when relevant:
- `README.md`
- `docs/team-workflow.md`
- `docs/sprint-notes/`
- `docs/decisions/`
- `visuals/`

Keep notes short, practical, and current.

---

## Quick workflow summary

### Standard task

```text
Fork -> clone -> add upstream -> sync main -> create branch -> complete task -> commit -> push to fork -> open PR
```

### Power BI task

```text
PBIP: sync main -> create branch -> claim report/model objects -> edit -> inspect PBIR/TMDL diff -> export review assets -> PR -> Desktop validation

PBIX fallback: claim slot -> sync main -> create branch -> edit binary -> export review assets -> PR -> release slot
```

---

## Final rule

When in doubt:
- coordinate ownership before editing the same Power BI object;
- use the handoff slot for binary `.pbix` work;
- and always leave enough documentation for the next teammate to continue smoothly.
