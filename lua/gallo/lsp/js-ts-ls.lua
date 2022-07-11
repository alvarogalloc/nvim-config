local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    require('gallo.lsp').on_attach(client, bufnr)
  end,
  init_options = {
    suggest = {
      autoImports = true,
    },
    preferences = {
      ['completions.completeFunctionCalls'] = true,
      jsxAttributeCompletionStyle = 'auto',
    },
  },
}
