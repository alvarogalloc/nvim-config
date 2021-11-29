local eslint = {
    lintCommand = "eslint_d --cache -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,

    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --cache --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}


local luaformat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
    formatStdin = true
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)
table.insert(tsserver_args, eslint)

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact", "html", "css", "sass", "scss", "json", "lua"},
    on_attach = require'lsp'.on_attach,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
            typescript = tsserver_args,
            typescriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            sass = {prettier},
            scss = {prettier},
            json = {prettier},
            lua = {luaformat}
        }
    }
}
