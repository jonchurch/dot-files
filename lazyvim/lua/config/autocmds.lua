-- Custom autocommands

-- Highlight on yank (LazyVim has this, but keeping for reference)
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- ESLint fix on save for JS/TS files
local eslint_group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
  command = "silent! EslintFixAll",
  group = eslint_group,
})

-- Toggle command
vim.api.nvim_create_user_command("ToggleEslintFix", function()
  local enabled = #vim.api.nvim_get_autocmds({ group = "EslintFixAll" }) > 0
  if enabled then
    vim.api.nvim_clear_autocmds({ group = "EslintFixAll" })
    vim.notify("ESLint auto-fix disabled")
  else
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
      command = "silent! EslintFixAll",
      group = eslint_group,
    })
    vim.notify("ESLint auto-fix enabled")
  end
end, {})
