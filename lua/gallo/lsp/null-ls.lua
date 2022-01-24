local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
  b.formatting.prettier.with({
    extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
  }),
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
  b.formatting.black.with({ extra_args = { '--fast' } }),
  b.diagnostics.flake8,
  b.formatting.stylua,
}

null_ls.setup({ on_attach = require('gallo.lsp').on_attach, sources = sources, debug = false })
