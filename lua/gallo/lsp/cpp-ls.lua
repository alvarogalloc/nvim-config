local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('lspconfig').clangd.setup({
  cmd = { 'clangd', '--background-index', '-header-insertion=never' },
  capabilities = capabilities,
  on_attach = require('gallo.lsp').on_attach,
})
