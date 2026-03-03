-- LSP Configuration (Neovim 0.11+ native APIs)
return {
  -- Mason for installing LSP servers
  {
    'mason-org/mason.nvim',
    opts = {},
  },

  -- Mason-lspconfig for auto-installing and auto-enabling servers
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
      },
      automatic_enable = true,
    },
  },

  -- Fidget for LSP status updates
  {
    'j-hui/fidget.nvim',
    opts = {},
  },

  -- Lazydev for Neovim Lua development (replaces neodev)
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- nvim-cmp for completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'lazydev', group_index = 0 },
        },
      })
    end,
  },

  -- LSP keymaps and formatting on attach
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- LSP attach callback for keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local bufnr = event.buf

          local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Toggle between hover and diagnostic
          nmap('K', function()
            local kbufnr = vim.api.nvim_get_current_buf()
            local line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local diagnostics = vim.diagnostic.get(kbufnr, { lnum = line })

            -- Close all floating windows
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              if vim.api.nvim_win_get_config(win).relative ~= '' then
                vim.api.nvim_win_close(win, true)
              end
            end

            if #diagnostics > 0 then
              if vim.g.show_diag_first == nil or vim.g.show_diag_first then
                vim.diagnostic.open_float()
              else
                vim.lsp.buf.hover()
              end
              vim.g.show_diag_first = not vim.g.show_diag_first
            else
              vim.lsp.buf.hover()
            end
          end, 'Toggle between hover and diagnostic')

          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')

          -- Create :Format command
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
            vim.lsp.buf.format()
          end, { desc = 'Format current buffer with LSP' })
        end,
      })
    end,
  },
}
