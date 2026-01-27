-- Neovim Configuration
-- Modernized for Neovim 0.11+

-- Set leader keys BEFORE loading plugins
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Load configuration modules
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- Bootstrap and load plugins via lazy.nvim
require('config.lazy')

-- vim: ts=2 sts=2 sw=2 et
