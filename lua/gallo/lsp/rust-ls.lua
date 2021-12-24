local lsp = require 'lspconfig'

lsp.rust_analyzer.setup({
    on_attach = require'gallo.lsp'.on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {importGranularity = "module", importPrefix = "by_self"},
            cargo = {loadOutDirsFromCheck = true},
            procMacro = {enable = true}
        }
    }
})
