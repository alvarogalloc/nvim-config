vim.g.dashboard_custom_header = {
    '          ▀████▀▄▄              ▄█ ', '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ', '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ', '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ', '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   '
}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
    a = {description = {'    Recent files     '}, command = 'lua require\'finder\'.of()'},
    b = {description = {'    Recent Projects  '}, command = 'lua require\'finder\'.pr()'},
    e = {description = {'    Find  File       '}, command = 'lua require\'finder\'.ff()'},
    f = {description = {'    Find  word       '}, command = 'Telescope live_grep'}
}

-- vim.cmd('autocmd FileType dashboard set showtabline=0')
-- vim.cmd('autocmd WinLeave <buffer> set showtabline=2')
