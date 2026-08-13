---
name: babysit-pr
description: Monitor a pull request through review and CI. Use when the user asks to monitor, watch, or babysit a PR.
---

# Babysit PR

Most repos we work in have various AI review bots. They're helpful, even if they are not always right.

If your harness offerts tools to monitor a PR, use them so you can respond when comments arrive. Otherwise, ppoll the PR for new comments and checks.

Only act on checks and comments newer than the latest push. Verify every bot finding against the source before changing code. Fix real findings and CI failures, distinguish repostory failures from infrastructure flakes, and reply wit ha writtn reason when dismissing false positives.

Only respond as a user when you are 100% on your answer and always be aware that you could be responding to a a real human, don't ever be rude or condecending.

When responding to a comment as an agent always respond in this format:

```
Agent ([model-slug]) response:

-----

[actual response]
```

Do not let review feedback expand the PR beyond the user's original goal. Address real shortcomings, but avoid scope creep. You can always suggest changes be put into their own seperate ticket/issue.

If nothing has changed, stay quiet rather than posting filler comments. Stop when the review bots and required checks are gree on the latest commit. Unless leomosley is the repo owner you are not allowed to merge PRs.
