return {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
