---
name: create-project-skeleton
description: >
  Scaffolds a new project skeleton in the current directory monorepo layout,
  tooling, DevOps (Terraform infra, GitHub Actions, VSCode, Prettier), git init
  and an initial 'init' commit. Everything except the actual app/package source
  code. Use when the user says "scaffold a project", "create a project
  skeleton", "set up a new repo", or invokes /create-project-skeleton.
---

# create-project-skeleton

Build skeleton for new project in current dir. Skeleton = monorepo root config +
tooling + DevOps. NOT the actual app/package source code (that comes later).

Templates and reference docs live in this skill dir. Copy templates literally,
then substitute placeholders. Placeholders always look like `{{NAME}}`.

## Step 1 Gather requirements

Ask the user (skip any already answered in the prompt):

1. **Project name** used for repo, root `package.json` name, `@scope`. Default scope `@leomosley`.
2. **Project type** one or more of:
   - `web` website / frontend app
   - `package` reusable library
   - `cli` command-line tool
3. **Language** `typescript` (default) or `rust`.
   - For `web` with no framework specified, default to **Astro + TypeScript + TailwindCSS**.
   - If the user asks for **Next.js**, follow `references/web-nextjs.md`.
   - For `package`/`cli` default to **TypeScript + Bun**.
   - Only use Rust when the user explicitly asks.
4. **Infra / DevOps** does the project need Terraform infra + deploy workflows?
   Default yes for `web`, no for `package`/`cli` (those get a release workflow instead).

If anything is ambiguous, ask before scaffolding. Do not guess the project name.

## Step 2 Read the relevant reference docs

Read only what applies:

| Situation                    | Read                               |
| ---------------------------- | ---------------------------------- |
| Always                       | `references/devops.md`             |
| type includes `web`, Astro   | `references/web-astro.md`          |
| type includes `web`, Next.js | `references/web-nextjs.md`         |
| type includes `package` (TS) | `references/typescript-package.md` |
| type includes `cli` (TS)     | `references/cli.md`                |
| language is `rust`           | `references/rust.md`               |

Each reference lists which templates to copy and how to fill placeholders.

## Step 3 Scaffold

Layout (monorepo, Turborepo + Bun):

```
<root>/
  apps/           # web apps live here (create empty dir, no source)
  packages/       # libraries + clis live here (create empty dir, no source)
  infra/          # terraform (only if infra needed)
  scripts/        # empty dir for helper scripts
  .github/
  .vscode/
  package.json    # root workspace
  turbo.json
  tsconfig.json   # ts projects
  bunfig.toml     # ts projects
  .prettierrc .prettierignore
  .gitignore
  README.md LICENSE CONTRIBUTING.md
  Cargo.toml rust-toolchain.toml   # rust only
```

Do NOT create source files inside `apps/*` or `packages/*` only the empty
workspace dirs. This skill produces a skeleton, not an implementation.

**Prefer official scaffolders** to initialise an app inside `apps/<name>/` where
one exists they stay current with framework defaults. Run them non-interactively
with the flags the reference specifies, then strip any generated boilerplate the
skeleton doesn't want (demo pages, sample content, git init they may add).

- Astro: `bun create astro@latest`
- Next.js: `bunx create-next-app@latest`

The framework reference doc (`web-astro.md` / `web-nextjs.md`) gives the exact
invocation and the post-scaffold cleanup. If a scaffolder isn't available or the
user wants a bare workspace, fall back to just `apps/<name>/package.json`.

Rules:

- Copy template files from `templates/`, then replace every `{{NAME}}`,
  `{{SCOPE}}`, `{{DESCRIPTION}}`, `{{DOMAIN}}` placeholder.
- Merge `.gitignore` fragments (common + rust if applicable).
- Never write secrets. `*.tfvars` stays gitignored; only ship `terraform.tfvars.example`.

## Step 4 Git

- If no git repo exists (`git rev-parse --is-inside-work-tree` fails), run
  `git init` and set branch `main`. Ask the user for the repo name if not
  already known (default to project name).
- Stage everything: `git add -A`.
- Commit exactly: `git commit -m "init"`.

## Step 5 Report

Summarise what was created and list obvious next steps (e.g. "run `bun install`",
"add your first app under `apps/`"). Keep it short.
