# Web — Next.js

Use when the user explicitly asks for Next.js. Lives under `apps/web/`.

## Required preferences

Non-negotiable defaults for a Next.js app in these repos:

- **App Router** (not Pages Router)
- **Cache Components** enabled
- **No `src/` directory** — `app/` sits at the app root
- **TailwindCSS**
- **No React Compiler**
- **Custom import alias `~/`** instead of the default `@/`

## Initialise with the official scaffolder

```sh
bunx create-next-app@latest apps/web \
  --ts --app --tailwind --no-src-dir \
  --import-alias "~/*" --use-bun --eslint --yes
```

- `--no-src-dir` → satisfies "no `src/`".
- `--import-alias "~/*"` → satisfies the `~/` alias requirement.
- Do NOT pass `--react-compiler` / answer no if prompted.
- If the scaffolder created a `.git` inside `apps/web`, remove it (the repo git
  is managed at the root).

## Enable Cache Components

`create-next-app` won't set this — edit `apps/web/next.config.ts`:

```ts
import type { NextConfig } from "next";

const config: NextConfig = {
  cacheComponents: true,
};

export default config;
```

Verify the flag name against the installed Next version. In older releases this
lived under `experimental: { cacheComponents: true }` (previously `dynamicIO`).
Use whatever the installed major expects.

## Post-scaffold cleanup

- Strip demo boilerplate from `app/page.tsx` and `app/globals.css` down to a
  minimal shell — this skill ships a skeleton, not a landing page.
- Set the workspace `package.json` name to `{{SCOPE}}/{{NAME}}-web`.
- Confirm `tsconfig.json` `paths` maps `~/*` → `./*` (or `./app/*` as desired).

## Notes

- Root workflow: `ci.yml`. Add `deploy.yml` + `infra/` if the user wants hosting
  (adjust the deploy target — Next.js typically deploys to Vercel or a Node/edge
  runtime rather than a bare Cloudflare Worker).
