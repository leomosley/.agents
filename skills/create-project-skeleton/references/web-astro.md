# Web Astro + TypeScript + TailwindCSS

Default web stack when the user names no framework.

## Initialise with the official scaffolder

Prefer `create astro` over hand-writing files:

```sh
bun create astro@latest apps/web -- \
  --template minimal --typescript strict --no-install --no-git --skip-houston
```

Then integrate Tailwind + React (if wanted):

```sh
cd apps/web && bunx astro add tailwind react --yes
```

Post-scaffold cleanup:

- Delete demo content in `src/pages` / `src/components` leave a minimal
  `src/pages/index.astro` or nothing. This skill ships a skeleton, not a demo.
- Ensure the workspace `package.json` name is `{{SCOPE}}/{{NAME}}-web`.
- Remove any `.git` the scaffolder created inside `apps/web`.

If the scaffolder is unavailable, fall back to the `package.json` below and an
empty `apps/web/` dir.

## `apps/web/package.json`

```json
{
  "name": "{{SCOPE}}/{{NAME}}-web",
  "version": "0.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "astro dev",
    "build": "astro build",
    "preview": "astro preview",
    "typecheck": "astro check",
    "clean": "rm -rf dist .astro"
  },
  "dependencies": {
    "@astrojs/react": "^5.0.3",
    "@tailwindcss/vite": "^4.2.2",
    "astro": "^5.7.3",
    "lucide-react": "^1.8.0",
    "react": "^19.2.5",
    "react-dom": "^19.2.5",
    "tailwindcss": "^4.2.2"
  },
  "devDependencies": {
    "@astrojs/check": "^0.9.4",
    "@types/react": "^19.2.14",
    "@types/react-dom": "^19.2.3",
    "typescript": "^5.7.3"
  }
}
```

Drop `@astrojs/react`, `react*`, `lucide-react` if the user wants Astro without
React islands.

## Notes

- Use `.prettierrc.astro` (adds `prettier-plugin-astro`) at the repo root, and
  add `prettier-plugin-astro` to root `devDependencies`.
- Tailwind v4 wires in via `@tailwindcss/vite` in `astro.config` (created later).
- Root workflow: `ci.yml`. Add `deploy.yml` + `infra/` if the user wants hosting.
