---
name: file-pr
description: File a concise pull request. Use when the user asks to file, open, or create a PR.
---

# File PR

Before filing, check whether a PR for this breanch already exists. Review teh diff locally against the default branch of the repo (could be main, master, dev, or develop) to make sure its contents match the goal.

PR titles usually become commit messages, so follow the repositories title conventions. Look at recently merged PRs and Git history examples

Prefer a concise, human redable title that explains why the change matters:

Bad = perf(server): negoitiate permessage-defalte on websocket

Good = perf(server): cut websocket frame size by 70% with gzipping

Open the description with a simple explanation of the problem based on the high level of what needed to be changed / implemented.

Do not lead with an implementation theory:

Bad:

- Removed implicit workspace carry-over from every 'new thread' entry point (cmd+n / cmd + shift + o, sidebar v1/v2 buttons, command pallete). New threads inherit only the porject from context; branch, wotree, and env).
- Deleted buildContextualThreadsOptions, startNewThreadInProjectFromContext, and teh v1 sidebars's seed-context machinery.

Good:

- The 'new worktree' default was ignored when starting new threads on existing worktrees. Now preferences always apply.

For UI or other visual changes, include a screenshot in the PR description so reviewers can see the result. Use the `take-screenshot` skill to capture the image, and the `pigeon` skill to upload it this returns a public URL you can embed directly with `![...](url)`.

pen a real PR rather than a draft so review bots run. IF the user also asked to babysit it, continue with 'babysit-pr' skill.
