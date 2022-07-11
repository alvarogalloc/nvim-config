local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
require('lspconfig').intelephense.setup {
  capabilities = capabilities,
  on_attach = require('gallo.lsp').on_attach,
}
