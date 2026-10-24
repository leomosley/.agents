# Linux X11 terminals in a Wayland session

`xterm` runs through the existing XWayland `DISPLAY`. Capture by a unique window
title with ImageMagick, never the active window or the desktop:

```sh
xterm -title unique-preview-title -fa 'DejaVu Sans Mono' -fs 14 -geometry 92x32 -bg '#101218' -fg '#dce0e8' -e bash /absolute/path/show.sh
import -window unique-preview-title /tmp/opencode/preview.png
magick identify /tmp/opencode/preview.png
```

Launch xterm in the background. The display script must wait for input after
running the target command so the window remains available for capture. Give
each capture a distinct title. `import -window` captures only that window's
client area, including the real terminal output, without desktop content.
No additional capture permission was needed. Read the PNG to verify it before
uploading. Close only windows/processes created for this capture afterwards.
