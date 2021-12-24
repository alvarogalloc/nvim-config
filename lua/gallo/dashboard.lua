vim.g.dashboard_custom_header = {
  '          ▀████▀▄▄              ▄█ ',
  '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
  '    ▄        █          ▀▀▀▀▄  ▄▀  ',
  '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
  '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
  '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
  '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
  '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
  '   █   █  █      ▄▄           ▄▀   ',
}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = { description = { '    Recent files     ' }, command = "lua require'gallo.finder'.of()" },
  b = { description = { '    Recent Projects  ' }, command = "lua require'gallo.finder'.pr()" },
  e = { description = { '    Find  File       ' }, command = "lua require'gallo.finder'.ff()" },
  f = { description = { '    Find  word       ' }, command = 'Telescope live_grep' },
}

-- vim.cmd('autocmd FileType dashboard set showtabline=0')
-- vim.cmd('autocmd WinLeave <buffer> set showtabline=2')
