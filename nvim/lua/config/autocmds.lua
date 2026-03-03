-- Autocommands configuration

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- ESLint format on save for JS/TS files
local eslint_group = vim.api.nvim_create_augroup('EslintAutoFix', { clear = true })

local function create_eslint_autocmd()
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
    command = 'silent! EslintFixAll',
    group = eslint_group,
  })
end

-- Create initial autocmd
create_eslint_autocmd()

-- Toggle ESLint auto-fix
local eslint_enabled = true
local function toggle_eslint_autofix()
  eslint_enabled = not eslint_enabled
  if eslint_enabled then
    create_eslint_autocmd()
    vim.notify("ESLint auto-fix enabled")
  else
    vim.api.nvim_clear_autocmds({ group = eslint_group })
    vim.notify("ESLint auto-fix disabled")
  end
end

vim.api.nvim_create_user_command('ToggleEslintFix', toggle_eslint_autofix, {})

