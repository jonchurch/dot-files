-- UI plugins configuration
return {
  -- Dracula theme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('dracula')
    end,
  },

  -- Lualine statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'dracula',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- Which-key for keybindings
  {
    'folke/which-key.nvim',
    opts = {},
  },
}
