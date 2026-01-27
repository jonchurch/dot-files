-- Keymaps configuration

-- Map ; to :
vim.keymap.set("n", ";", ":")

-- Switch to previous buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Buffer navigation
vim.keymap.set("n", "<leader>h", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })

-- Git shortcuts (using vim-fugitive)
vim.keymap.set('n', '<leader>ga', ':Git add %<CR>', { desc = "[G]it [A]dd current file" })
vim.keymap.set('n', '<leader>gc', ':Git commit <CR>', { desc = "[G]it [C]ommit" })

-- Disable space in normal/visual mode (used as leader alternative)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Copy diagnostic message under cursor to clipboard
vim.keymap.set('n', '<leader>y', function()
  local diag = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })[1]
  if diag then
    vim.fn.setreg('+', diag.message)
    vim.notify("Copied diagnostic: " .. diag.message)
  else
    vim.notify("No diagnostic found", vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic message under cursor" })
