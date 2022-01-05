require('lualine').setup({
  options = {
    -- ... your lualine config
    theme = 'tokyonight',
    -- ... your lualine config
  },
  sections = { lualine_c = { require('auto-session-library').current_session_name } },
})
