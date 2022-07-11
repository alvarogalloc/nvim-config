local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('lspconfig').tailwindcss.setup {
  on_attach = require('gallo.lsp').on_attach,
  capabilities = capabilities,
}
