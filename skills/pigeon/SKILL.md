---
name: pigeon
description: >
  Share a local artifact with the user through Pigeon and return a public URL.
  Use when asked to share a file, upload output, or provide an artifact link.
  To capture a screenshot first, use the take-screenshot skill.
---

# Pigeon

Upload an artifact to the user's Cloudflare R2 bucket and return its public URL.
Never expose credentials or print the raw output of `pigeon env`.

## Upload an artifact

1. Load the route into the environment. Do this and the upload in a single shell
   invocation so the secrets never linger:

   - sh: `eval "$(npx -y p1geon env --shell sh)"`
   - PowerShell: `Invoke-Expression (& npx -y p1geon env --shell powershell | Out-String)`

   This runs Pigeon via `npx`, so it works whether or not `pigeon` is on `PATH`.
   If `pigeon` (or `p1geon`) is already installed globally you may call it
   directly instead. It sets `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`,
   `AWS_REGION` (`auto`), `PIGEON_BUCKET`, `PIGEON_ENDPOINT`, and
   `PIGEON_PUBLIC_BASE_URL`.

2. Choose a random UUID object key that keeps the file's original extension.

3. Upload with a single authenticated S3 `PUT` request to
   `$PIGEON_ENDPOINT/$PIGEON_BUCKET/<key>`, signed with AWS SigV4 using the loaded
   credentials and region `auto`, with `Content-Type` set to the file's MIME type.

   Do a **direct signed HTTP PUT**. This is the primary method: write the handful
   of SigV4 lines in whatever runtime is already available (Python, Node, Go, a
   curl invocation, etc.). Do not assume the `aws` CLI or any other tool is
   installed — only reach for something like `aws s3 cp` if it already exists and
   is genuinely simpler.

4. Return the public URL `$PIGEON_PUBLIC_BASE_URL/<key>` and the local file path.

Set the real extension and MIME type. Clear the credentials from the environment
when done. Never upload files that carry secrets (`.env`, keys, tokens).
