# glab-tui Scoop Bucket

[![Tests](https://github.com/rcieri/scoop-glab-tui/actions/workflows/ci.yml/badge.svg)](https://github.com/rcieri/scoop-glab-tui/actions/workflows/ci.yml)
[![Excavator](https://github.com/rcieri/scoop-glab-tui/actions/workflows/excavator.yml/badge.svg)](https://github.com/rcieri/scoop-glab-tui/actions/workflows/excavator.yml)

Scoop bucket for [glab-tui](https://github.com/rcieri/glab-tui) — a terminal
user interface (TUI) for GitLab and GitHub, built on top of `glab` and `gh`.

## Installation

```pwsh
scoop bucket add glab-tui https://github.com/rcieri/scoop-glab-tui
scoop install glab-tui/glab-tui
```

The manifest uses `checkver` and `autoupdate` — version bumps are pulled
automatically from GitHub releases.
