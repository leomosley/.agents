# Rust variant

Use only when the user explicitly asks for Rust. A Rust project can still be a
Bun/Turbo monorepo (mixed TS + Rust, like r6fetch) or pure Rust.

## Root files (`templates/rust/`)

| Template              | Dest                  | Notes                                        |
| --------------------- | --------------------- | -------------------------------------------- |
| `Cargo.toml`          | `Cargo.toml`          | Cargo workspace, edition 2024, strict lints. |
| `rust-toolchain.toml` | `rust-toolchain.toml` | Pins toolchain 1.92.0 + clippy/rustfmt.      |

- Members glob `packages/*` and `apps/*`. Crates get added later, not now.
- Append `templates/common/.gitignore.extra` to `.gitignore` (adds `target/`).
- If the crate targets WASM (Cloudflare Workers), add
  `targets = ["wasm32-unknown-unknown"]` to `rust-toolchain.toml` and the CI
  toolchain step.

## Workspace crate skeleton

For each crate create `packages/<crate>/Cargo.toml` + empty `src/` (`.gitkeep`).
Do NOT write `lib.rs` / `main.rs` logic.

```toml
[package]
name = "{{NAME}}"
version = "0.1.0"
edition.workspace = true
license.workspace = true
rust-version.workspace = true

[dependencies]
serde.workspace = true

[lints]
workspace = true
```

## CI

Use `templates/github/workflows/check.yml` it runs `cargo fmt --check`,
`cargo clippy -D warnings`, and `cargo test`. For a pure-Rust repo drop the
`typescript` job.

## Mixed TS + Rust

Keep the Bun/Turbo root (`package.json`, `turbo.json`) AND the Cargo workspace.
Root `package.json` `typecheck` script can chain both:

```json
"typecheck": "turbo run typecheck && cargo check"
```
