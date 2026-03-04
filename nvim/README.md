# Neovim Config

Neovim 0.11+ config using [lazy.nvim](https://github.com/folke/lazy.nvim). Leader key is `,`.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and textobjects |
| [telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers |
| [mason](https://github.com/mason-org/mason.nvim) | Auto-install LSP servers |
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Fast autocompletion (Rust-based) |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Format-on-save (prettier, stylua) |
| [fugitive](https://github.com/tpope/vim-fugitive) | Git integration |
| [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File tree sidebar |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard start screen |
| [dracula](https://github.com/Mofiqul/dracula.nvim) | Color scheme |
| [lualine](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [which-key](https://github.com/folke/which-key.nvim) | Keybinding hints popup |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |

## Key Bindings

### Navigation

| Key | What it does |
|-----|-------------|
| `,sf` | Find files (telescope) |
| `,sg` | Live grep (telescope) |
| `,sb` | Search buffers |
| `,n` | Toggle file tree |
| `,N` | Reveal current file in tree |
| `,h` / `,l` | Prev/next buffer |
| `,,` | Switch to previous buffer |
| `;` | Same as `:` (command mode) |

### LSP

| Key | What it does |
|-----|-------------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover docs |
| `,rn` | Rename symbol |
| `,ca` | Code action |
| `[g` / `]g` | Prev/next diagnostic |
| `,y` | Copy diagnostic message to clipboard |
| `,q` | Open diagnostics list |

### Git

| Key | What it does |
|-----|-------------|
| `,ga` | Git add current file |
| `,gc` | Git commit |

### Formatting

| Key | What it does |
|-----|-------------|
| `,cf` | Format buffer |

Format-on-save via conform.nvim. Only runs prettier when a project config exists.

- `:FormatDisable` / `:FormatDisable!` — disable globally / for buffer
- `:FormatEnable` — re-enable

## LSP Servers (auto-installed via Mason)

- `ts_ls` — TypeScript/JavaScript
- `eslint` — ESLint
- `lua_ls` — Lua
