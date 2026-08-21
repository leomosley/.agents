---
name: take-screenshot
description: >
  Capture a screenshot of the screen, a window, or a web page, then share it
  with the user through Pigeon. Use when asked to take, grab, capture, or show a
  screenshot.
---

# Take a screenshot

Capture an image, then upload it with the `pigeon` skill and return the URL.

## First, reuse what already worked

This skill remembers what works on each platform. Before anything else, look in
the `reference/` directory next to this file for a note matching the current
platform for example `reference/macos.md`, `reference/windows.md`,
`reference/linux-wayland.md`, `reference/linux-x11.md`, or `reference/headless.md`.
If a matching note exists, follow it verbatim instead of re-deriving the method.

## When there is no matching note

1. Identify the target: the whole screen, a specific window, or a URL / headless
   page. For a URL, drive a headless browser; for a desktop, use whatever capture
   tool the platform provides.
2. Try the available options until one produces a valid, non-empty image. Verify
   the result is a real image (sensible file size and expected dimensions).
3. On the **first** success, immediately record how you did it: write a concise
   note to `reference/<platform>.md` in this skill's directory, named after the
   platform you succeeded on. Create `reference/` if it does not exist. Keep it
   short the exact command(s), the tool used, any authorization quirk, and how
   you targeted a specific window. This makes the next capture instant.

## Then share it

Hand the saved image to the `pigeon` skill to upload it, then return the public
URL and the local file path.

Never capture or share screens that expose secrets without the user's go-ahead.
