---
name: symlink-skills
description: >
  Symlinks every skill in ~/.agents/skills (the source of truth) into the
  Claude and opencode skills directories, creating only the links that are
  missing. Use when the user says "symlink skills", "sync skills", or invokes
  /symlink-skills.
---

`~/.agents/skills` is the single source of truth for skills. Each skill lives in
its own directory containing a `SKILL.md`. The Claude and opencode skill
directories should mirror it via symlinks.

Target directories:

- Claude: `~/.claude/skills`
- opencode: `~/.config/opencode/skills`

For each target directory:

1. Ensure the target directory exists (create it if missing).
2. List the skill directories in `~/.agents/skills`.
3. For every skill that does not already have an entry in the target directory,
   create a symlink pointing to the skill in `~/.agents/skills`. Use absolute
   paths so links resolve regardless of directory depth.
4. Never overwrite or delete existing entries. Only create links that are
   missing. Skip any skill that already exists in the target (symlink, file, or
   directory).

Run this to do it in one pass for both targets:

```sh
SRC="$HOME/.agents/skills"
for DEST in "$HOME/.claude/skills" "$HOME/.config/opencode/skills"; do
  mkdir -p "$DEST"
  for skill in "$SRC"/*/; do
    name="$(basename "$skill")"
    [ -e "$DEST/$name" ] && continue
    ln -s "$SRC/$name" "$DEST/$name"
    echo "linked $name -> $DEST/$name"
  done
done
```

After running, report which skills were newly linked and which were already
present in each target.
