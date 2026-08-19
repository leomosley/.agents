---
name: implement
description: Use when the user asks to implement, build, add, fix, or ship a feature or bug in a repo and wants it taken all the way to a babysat PR.
---

# Implement

Start by understanding the repo you are in. Read the relevant code, conventions, and recent history before writing anything. Match the existing style rather than imposing your own.

Checkout a new branch off the default branch (could be main, master, dev, or develop). Name it after the user's description, following the repositories branch naming conventions.

Implement the feature or fix. Keep the change focused on the user's goal and don't let it sprawl. Reuse existing code where you can, and lean on the repo's own patterns. Verify your work with the repo's tests or build before moving on.

Once the change is ready, file a PR using the `file-pr` skill, if there are any visual changes always include screenshots of what this change is using /take-screenshot and /pigeon,

After the PR is open, babysit it with the `babysit-pr` skill until the review bots and required checks are green.
