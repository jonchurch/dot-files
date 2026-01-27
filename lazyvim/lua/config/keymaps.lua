-- Custom keymaps (loaded after LazyVim)
local map = vim.keymap.set

-- Your custom mappings
map("n", ";", ":")                                    -- ; as :
map("n", "<leader><leader>", "<c-^>")                 -- Switch to previous buffer
map("n", "<leader>h", ":bprev<CR>")                   -- Previous buffer
map("n", "<leader>l", ":bnext<CR>")                   -- Next buffer

-- Git shortcuts (fugitive)
map("n", "<leader>ga", ":Git add %<CR>")
map("n", "<leader>gc", ":Git commit<CR>")

-- Note: j/k word wrap is already handled by LazyVim

-- Diagnostic copy
map("n", "<leader>y", function()
  local diag = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })[1]
  if diag then
    vim.fn.setreg("+", diag.message)
    vim.notify("Copied: " .. diag.message)
  else
    vim.notify("No diagnostic found", vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic message" })
