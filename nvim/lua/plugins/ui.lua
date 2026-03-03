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

  -- Dashboard
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require('alpha')
      local theta = require('alpha.themes.theta')
      local dashboard = require('alpha.themes.dashboard')

      theta.header = {
        type = 'text',
        val = {
          [[  _   _                 _            ]],
          [[ | \ | | ___  _____   (_)_ __ ___   ]],
          [[ |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  ]],
          [[ | |\  |  __/ (_) \ V /| | | | | | | ]],
          [[ |_| \_|\___|\___/ \_/ |_|_| |_| |_| ]],
        },
        opts = { position = 'center', hl = 'Type' },
      }

      theta.buttons.val = {
        { type = 'text', val = 'Quick actions', opts = { hl = 'SpecialComment', position = 'center' } },
        { type = 'padding', val = 1 },
        dashboard.button('e',   '  new file',    ':ene <BAR> startinsert<CR>'),
        dashboard.button(',n',  '  file tree',   ':Neotree toggle<CR>'),
        dashboard.button(',sf', '  find file',   ':Telescope find_files<CR>'),
        dashboard.button(',sg', '  search text', ':Telescope live_grep<CR>'),
        dashboard.button('q',   '  quit',        ':qa<CR>'),
      }

      alpha.setup(theta.config)
    end,
  },

  -- File tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    cmd = { 'Neotree' },
    keys = {
      { '<leader>n', ':Neotree toggle<CR>', desc = 'Toggle file tree' },
      { '<leader>N', ':Neotree reveal<CR>', desc = 'Reveal current file in tree' },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 35,
        mappings = {
          ['w'] = 'none',
        },
      },
    },
  },
}
