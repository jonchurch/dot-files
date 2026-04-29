-- Formatting via conform.nvim
return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    keys = {
      { '<leader>cf', function() require('conform').format({ async = true }) end, desc = 'Format buffer' },
    },
    opts = {
      notify_no_formatters = false,
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
      },
      format_on_save = function(bufnr)
        -- Only format if the formatter is available and has a config in the project
        -- Disable for files where you don't want auto-formatting
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 2000, lsp_format = 'never' }
      end,
      formatters = {
        prettier = {
          -- Only run prettier if a config file exists in the project
          require_cwd = true,
        },
      },
    },
    init = function()
      -- Toggle formatting commands
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
        vim.notify('Format on save disabled')
      end, { bang = true, desc = 'Disable format on save (! for buffer only)' })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
        vim.notify('Format on save enabled')
      end, { desc = 'Enable format on save' })
    end,
  },
}
