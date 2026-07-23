# DevOps & shared tooling

Applies to every project. Copy these from `templates/` into the repo root.

## Root files (`templates/common/`)

| Template          | Dest              | Notes                                            |
| ----------------- | ----------------- | ------------------------------------------------ |
| `package.json`    | `package.json`    | Replace `{{NAME}}`. Root workspace, Turbo + Bun. |
| `turbo.json`      | `turbo.json`      | —                                                |
| `tsconfig.json`   | `tsconfig.json`   | TS projects only.                                |
| `bunfig.toml`     | `bunfig.toml`     | TS projects only.                                |
| `.prettierrc`     | `.prettierrc`     | Use `.prettierrc.astro` instead for Astro webs.  |
| `.prettierignore` | `.prettierignore` | —                                                |
| `.gitignore`      | `.gitignore`      | Append `.gitignore.extra` if Rust and/or infra.  |
| `README.md`       | `README.md`       | Replace `{{NAME}}`, `{{DESCRIPTION}}`.           |
| `LICENSE`         | `LICENSE`         | Replace `{{YEAR}}`.                              |
| `CONTRIBUTING.md` | `CONTRIBUTING.md` | Replace `{{NAME}}`.                              |

Create empty dirs: `apps/`, `packages/`, `scripts/`. Put a `.gitkeep` in each so
git tracks them (they hold no source yet).

## VSCode (`templates/vscode/` → `.vscode/`)

- `settings.json` — format-on-save via Prettier, Astro formatter for `.astro`.
- `tasks.json` — `dev`, `typecheck` (default test task), `build`.

## GitHub (`templates/github/` → `.github/`)

- `CODEOWNERS` — always.
- `dependabot.yml` — always. Drop the `terraform` block if no `infra/`.
- Workflows (`.github/workflows/`), pick by project type:
  - `ci.yml` — TS typecheck + lint. Use for **web** and **package**.
  - `release.yml` — npm publish + git-cliff changelog + GitHub release. Use for **cli**. Replace `{{NAME}}`.
  - `deploy.yml` — Cloudflare Workers + OpenTofu. Use for **web with infra**.
  - `check.yml` — combined TS + Rust checks. Use when the repo has **Rust**.

## Infra (`templates/infra/` → `infra/`) — only when infra is needed

Terraform / OpenTofu targeting Cloudflare, R2-backed remote state.

- `providers.tf` — replace `{{NAME}}` (R2 state bucket name).
- `state.tf` — doc note, replace `{{NAME}}`.
- `variables.tf` — replace `{{DOMAIN}}`.
- `outputs.tf` — —
- `terraform.tfvars.example` — replace `{{DOMAIN}}`. Never create `terraform.tfvars`.

Add resource `.tf` files (workers, dns, kv, etc.) as the app requires — the
skeleton ships only the backend + variable scaffolding.
