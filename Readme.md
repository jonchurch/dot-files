# Dot Files

Config files for my editor and terminal setup.

## Setup

```bash
./install.sh
```

Symlinks configs and installs dependencies via brew (macOS) or cargo (Linux).

**Requires:** [oh-my-zsh](https://ohmyz.sh/#install), [Neovim 0.11+](https://github.com/neovim/neovim/releases)

## What's Included

### Shell Tools

| Tool | Replaces | What it does |
|------|----------|--------------|
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax-highlighted file viewer |
| [eza](https://github.com/eza-community/eza) | `ls` | Modern ls with colors and git status |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `cd` / `z` | Smart directory jumper — learns your most-used dirs |
| [fzf](https://github.com/junegunn/fzf) | `ctrl+r` | Fuzzy finder for history, files, and anything piped to it |

### Shell Aliases

| Alias | Expands to | Purpose |
|-------|-----------|---------|
| `cat` | `bat` | Syntax-highlighted cat |
| `ls` | `eza` | Modern ls |
| `ll` | `eza -la` | Long listing |
| `tree` | `eza --tree` | Tree view |
| `vim` / `vi` | `nvim` | Always use neovim |
| `yeet` | `rm -rf` | Delete with conviction |
| `jqs` | `jq .scripts package.json` | Dump npm scripts |
| `jqd` | `jq .dependencies package.json` | Dump npm deps |
| `cdr` | `cd $(git root)` | Jump to git repo root |
| `mcdir <dir>` | `mkdir -p && cd` | Create dir and cd into it |
| `vimmod` | `vim $(git ls-files -m)` | Open all modified files |
| `lastcommit` | `git rev-parse HEAD` | Print current commit SHA |

### Shell Keybindings

| Key | What it does | Provided by |
|-----|-------------|-------------|
| `ctrl+r` | Fuzzy search shell history | fzf |
| `ctrl+t` | Fuzzy find files from cwd | fzf |
| `z <query>` | Jump to best-matching directory | zoxide |
| `zi <query>` | Interactive directory picker (with fzf) | zoxide |

### Neovim

See [nvim/README.md](nvim/README.md) for full plugin list, keybindings, and LSP setup.
