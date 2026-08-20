# Package TypeScript + Bun

Reusable library published to npm. Lives under `packages/<name>/`.

## Skeleton only

Create `packages/<name>/` with `package.json` + `tsconfig.json`. No `src/`
implementation just an empty `src/` dir with `.gitkeep`.

## `packages/<name>/package.json`

```json
{
  "name": "{{SCOPE}}/{{NAME}}",
  "version": "0.1.0",
  "description": "{{DESCRIPTION}}",
  "type": "module",
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/leomosley/{{NAME}}.git"
  },
  "main": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "files": ["dist", "README.md"],
  "scripts": {
    "build": "bun build src/index.ts --outdir dist --target bun --format esm",
    "dev": "bun run src/index.ts",
    "clean": "rm -rf dist",
    "typecheck": "tsc --noEmit"
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

## `packages/<name>/tsconfig.json`

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "lib": ["ESNext"],
    "strict": true,
    "skipLibCheck": true,
    "noUncheckedIndexedAccess": true,
    "declaration": true,
    "types": ["bun-types"],
    "paths": { "@/*": ["./src/*"] }
  },
  "include": ["src/**/*"]
}
```

## Notes

- Root workflow: `ci.yml`. Add `release.yml` if the package publishes to npm.
