local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup {capabilities = capabilities, on_attach = require'lsp'.on_attach}
