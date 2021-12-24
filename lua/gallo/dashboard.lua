local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ":lua require'gallo.finder'.ff() <CR>"),
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('p', '  Find project', ":lua require'gallo.finder'.pr() <CR>"),
  dashboard.button('r', '  Recently used files', ":lua require'gallo.finder'.of() <CR>"),
  dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
  dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
  dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}
dashboard.section.header.val = {
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

local function footer()
  return 'Alvaro Gallo'
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
