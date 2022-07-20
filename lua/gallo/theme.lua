-- require('themer').setup({
--   colorscheme = 'gruvbox-material-dark-hard',
--   styles = {
--     ['function'] = { style = 'italic' },
--     functionbuiltin = { style = 'italic' },
--     variable = { style = 'italic' },
--     variableBuiltIn = { style = 'italic' },
--     parameter = { style = 'italic' },
--   },
-- })

require('github-theme').setup {
  -- theme_style = 'light_default',
  theme_style = 'dark',
  function_style = 'italic',
  dark_float = true,
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = 'orange', error = '#ff0000' },

  -- Overwrite the highlight groups
  overrides = function()
    return {
      -- htmlTag = { fg = c.red, bg = '#282c34', sp = c.hint },
      DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
      -- -- this will remove the highlight groups
      TSField = {},
    }
  end,
}
