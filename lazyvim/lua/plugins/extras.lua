-- Extra plugins and overrides
return {
  -- Git (fugitive - LazyVim uses lazygit by default, but add fugitive for your workflow)
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },

  -- Tmux navigation
  {
    "alexghergh/nvim-tmux-navigation",
    opts = {
      disable_when_zoomed = true,
      keybindings = {
        left = "<C-h>",
        down = "<C-k>",
        up = "<C-j>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    },
  },

  -- Override lualine to use dracula theme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "dracula",
      },
    },
  },

  -- Remap neo-tree to <leader>n (frees <leader>e for harpoon)
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },  -- Disable default
      { "<leader>E", false },  -- Disable default
      { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Neo-tree" },
      { "<leader>N", "<cmd>Neotree reveal<cr>", desc = "Neo-tree (reveal)" },
    },
  },

  -- Disable plugins you don't want/need
  { "folke/flash.nvim", enabled = false },           -- Fancy motion (you have your own workflow)
  { "echasnovski/mini.surround", enabled = false },  -- LazyVim default, you might not use it
}
