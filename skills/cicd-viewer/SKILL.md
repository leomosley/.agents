---
name: cicd-viewer
description: >
  View progress, status, and failures of GitHub Actions CI/CD pipelines using the
  GitHub CLI. Use when the user asks to check CI checks on a PR, view the status of a
  deploy action, or investigate CI/CD failures (e.g. "why did the QA deploy fail",
  "check the CI on my PR", "is the prod deploy done"). Read-only inspection only.
version: 1.0.0
---

# CI/CD Viewer

Inspect GitHub Actions CI/CD runs with `gh`. Report progress, status, and failures.

## Absolute rule — never re-run CI/CD

STRICTLY FORBIDDEN. Never trigger, re-run, or restart any CI/CD run. This means:

- No `gh run rerun`, no `gh workflow run`, no `gh pr` mutations.
- No empty commits, no `--allow-empty`, no amend/push to nudge a pipeline.
- No commit, push, tag, or any git write intended to make CI run again.

This skill is READ-ONLY. Only inspect and report. If the user asks you to re-run,
refuse and explain that re-running is out of scope for this skill.

## Workflow

### Step 1 — Infer which run the user means

Gather context before acting. Combine three signals:

1. **Request context** — what user said (e.g. "QA deploy failed", "CI on my PR").
2. **Available actions** — list workflows in the repo. Common names:
   `deploy-dev`, `deploy-version` (prod), `deploy-qa-preview`. List them:
   ```bash
   gh workflow list
   ```
   Also check `.github/workflows/` for the exact file names.
3. **Current branch** — the runs tied to where the user is working:
   ```bash
   git rev-parse --abbrev-ref HEAD
   ```

Map intent → target:

- "CI checks on my PR" → the PR for the current branch.
- "deploy to QA" → `deploy-qa-preview` workflow.
- "prod / version deploy" → `deploy-version` workflow.
- "dev deploy" → `deploy-dev` workflow.

### Step 2 — Confirm before inspecting

ALWAYS confirm the target with the user before pulling logs. State exactly what you
will look at (workflow name, branch, PR number, run id) and wait for confirmation.

> "I think you mean the **deploy-qa-preview** run on branch **feature/x** (run #123,
> triggered 10m ago, status: failure). Inspect that one?"

If ambiguous (multiple candidate runs), list the candidates and ask which one.

### Step 3 — Inspect (read-only)

#### CI checks on a PR

```bash
gh pr checks                    # checks for current branch's PR
gh pr checks <pr-number>        # explicit PR
```

#### List recent runs for a workflow

```bash
gh run list --workflow deploy-qa-preview --branch <branch> --limit 10
gh run list --limit 20          # all recent runs
```

Columns: status, conclusion, workflow, branch, event, run id, elapsed.

#### View a specific run's status / progress

```bash
gh run view <run-id>            # summary + per-job status
gh run view <run-id> --json status,conclusion,jobs
```

For an in-progress run, report which jobs are queued / running / done.

#### View failures

```bash
gh run view <run-id> --log-failed   # logs of only the failed steps
gh run view <run-id> --job <job-id> --log   # full log of one job
```

Read `--log-failed` first; it is the fastest path to the error. Only pull full
logs if the failed-step output lacks the root cause.

### Step 4 — Report

Summarise concisely:

- Which run (workflow, branch, run id, url via `gh run view <id> --json url`).
- Overall status/conclusion.
- For failures: the failing job/step and the quoted error line(s).
- If in progress: which stage it's at and what remains.

## Notes

- If `gh` is not authenticated (`gh auth status` fails), tell the user and stop.
- If the current branch has no PR, `gh pr checks` errors — fall back to `gh run list --branch`.
- Never guess a run id; resolve it from `gh run list` and confirm.
- Quote error messages exactly. Do not paraphrase failure output.
