local null_ls = require 'null-ls'

local b = null_ls.builtins

local sources = {
  b.formatting.prettier,
  b.formatting.black.with { extra_args = { '--fast' } },
  b.diagnostics.flake8,
  b.formatting.stylua,
}

null_ls.setup { on_attach = require('gallo.lsp').on_attach, sources = sources, debug = false }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- Check which is faster
require('lspconfig').eslint.setup {
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    require('gallo.lsp').on_attach(client, bufnr)
  end,
}
