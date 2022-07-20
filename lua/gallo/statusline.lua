require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' ' },
    section_separators = { left = ' ', right = ' ' },
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:lower()
        end,
      },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', require('auto-session-library').current_session_name },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
