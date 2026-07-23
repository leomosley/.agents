# CLI — TypeScript + Bun

Command-line tool published to npm, run via `bunx`/`npx`. Lives under
`packages/cli/`.

## Skeleton only

Create `packages/cli/` with `package.json` + `tsconfig.json` and an empty
`src/` (`.gitkeep`). No command implementation.

## Preferred libraries

The user's usual CLI toolkit — include the ones relevant to the tool:

- `commander` — arg parsing / command tree
- `@clack/prompts` — interactive prompts
- `chalk` — terminal colors
- `ora` — spinners
- `zod` — schema validation / config parsing

## `packages/cli/package.json`

```json
{
  "name": "{{NAME}}",
  "version": "0.1.0",
  "description": "{{DESCRIPTION}}",
  "type": "module",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/leomosley/{{NAME}}.git"
  },
  "bin": { "{{NAME}}": "./dist/index.js" },
  "main": "./dist/index.js",
  "files": ["dist", "README.md"],
  "scripts": {
    "build": "bun build src/index.ts --outdir dist --target bun --format esm --minify",
    "dev": "bun run src/index.ts",
    "clean": "rm -rf dist",
    "typecheck": "tsc --noEmit"
  },
  "dependencies": {
    "@clack/prompts": "^0.7.0",
    "chalk": "^5.3.0",
    "commander": "^12.1.0",
    "ora": "^8.1.0",
    "zod": "^3.23.0"
  },
  "devDependencies": {
    "bun-types": "latest"
  },
  "engines": {
    "bun": ">=1.1.0"
  },
  "publishConfig": {
    "access": "public"
  }
}
```

Use the same `tsconfig.json` as `references/typescript-package.md`.

## Notes

- Root workflows: `ci.yml` + `release.yml` (npm publish + git-cliff).
- Copy `templates/cli/cliff.toml` to the repo root for changelog generation.
