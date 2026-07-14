-- Options configuration
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode (disabled)
vim.o.mouse = ''

-- Sync clipboard between OS and Neovim
vim.o.clipboard = 'unnamedplus'

-- Over SSH, use OSC 52 so yanks reach the local machine's clipboard
if os.getenv('SSH_TTY') then
  local osc52 = require('vim.ui.clipboard.osc52')
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = { ['+'] = osc52.copy('+'), ['*'] = osc52.copy('*') },
    paste = { ['+'] = osc52.paste('+'), ['*'] = osc52.paste('*') },
  }
end

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Line number settings
vim.o.number = true
vim.o.relativenumber = true

-- Indenting
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Enable true colors
vim.o.termguicolors = true
