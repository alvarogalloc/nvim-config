local lsp = require 'lspconfig'
lsp.rls.setup {on_attach = require'lsp'.on_attach, settings = {rust = {unstable_features = true, build_on_save = false, all_features = true}}}

-- lsp.rust_analyzer.setup({
--     on_attach = require'lsp'.on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {importGranularity = "module", importPrefix = "by_self"},
--             cargo = {loadOutDirsFromCheck = true},
--             procMacro = {enable = true}
--         }
--     }
-- })
