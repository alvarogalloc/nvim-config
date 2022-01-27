-- vim.g.tokyonight_style = 'night'
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }

-- require('onedarkpro').load()

require("github-theme").setup({
  theme_style = "dark",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})
