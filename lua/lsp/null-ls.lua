local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {b.formatting.prettier, b.diagnostics.eslint_d, b.formatting.eslint_d, b.code_actions.eslint_d, b.formatting.black, b.diagnostics.flake8}

null_ls.config({sources = sources, debug=false})

require("lspconfig")["null-ls"].setup({on_attach = require'lsp'.on_attach})
