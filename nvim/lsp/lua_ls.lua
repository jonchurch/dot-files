return {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
