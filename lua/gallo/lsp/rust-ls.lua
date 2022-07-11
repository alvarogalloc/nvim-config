local lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lsp.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = require('gallo.lsp').on_attach,
  settings = {
    ['rust-analyzer'] = {
      -- checkOnSave = {
      --   enable = false,
      -- },
    },
  },
}
