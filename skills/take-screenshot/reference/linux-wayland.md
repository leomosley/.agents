# Linux Wayland, Slint application snapshots

## GTK / Tauri on XWayland

Run the app with `GDK_BACKEND=x11`. For Mole, the ctypes X11 helper at
`/tmp/opencode/mole-pr-x11.py` captures only the named window using XGetImage,
then saves its pixels with Pillow. It can also click client-relative coordinates.
This avoids ImageMagick builds without X11 support and does not expose the desktop.

For automation, unset inherited `NO_AT_BRIDGE=1` when launching the app:
`env -u NO_AT_BRIDGE GDK_BACKEND=x11 GTK_MODULES=atk-bridge ACCESSIBILITY_ENABLED=1 <app>`.
Use Python GI Atspi actions via `/tmp/opencode/mole-pr-accessibility.py`.
XTest clicks may be ignored by Wayland, even when XGetImage succeeds.

```sh
python /tmp/opencode/mole-pr-x11.py capture Mole /tmp/opencode/mole-ui.png
python /tmp/opencode/mole-pr-x11.py click Mole 150 230
```

The helper searches XQueryTree/XFetchName for an exact title. Check the image
with the read tool before uploading. No screen-capture permission is needed.

For `/home/mosly/code/pi`, capture only the native app, without desktop content:

```sh
cd /home/mosly/code/pi
./target/debug/player --preview --capture /tmp/opencode/pi-display-clock.png
magick identify /tmp/opencode/pi-display-clock.png
```

The player uses Slint `Window::take_snapshot()` and writes PNG through the `png`
crate. It opens for 1.5 seconds, captures its rendered client area, and exits.
Requires the existing Wayland/X11 session. The default image is 800 × 528 pixels,
with an 800 × 480 target area plus 48 pixels of preview controls. No capture
permission is needed because the application captures its own renderer.

`spectacle -a` can capture another window if the user changes focus. Do not upload
such captures. For other apps, use a tool that targets a specific window ID or
derive another capture method rather than relying on active-window timing.

## r6swap

From `/home/mosly/code/cli/r6swap`, use the real Slint renderer after an isolated
synthetic end-to-end run. It captures only the application client area, no desktop.

```sh
TMPDIR=/tmp/opencode SLINT_BACKEND=winit-software ./target/debug/r6swap-desktop --simulate --smoke-test /tmp/opencode/r6swap-preview.png
```

The output PNG must not already exist. Read it to check dimensions and clipping before
sharing. This command needs the existing display session. ImageMagick's `import` on
this host no longer has X11 support; prefer Slint's own `Window::take_snapshot()`.
