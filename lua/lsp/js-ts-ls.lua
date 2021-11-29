local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.document_formatting = false

require'lspconfig'.tsserver.setup {capabilities = capabilities, on_attach = require'lsp'.on_attach}
