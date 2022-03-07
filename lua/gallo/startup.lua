local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

math.randomseed(os.time())

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
local quotes = {
  'La ley manda, y cuando manda la ley, hiere en seguida. - Alexandre Dumas',
  'La Justicia toca vengar a los que ha sabido defender - Alexandre Dumas',
  'La alegría causa a veces un efecto extraño; oprime al corazón casi tanto como el dolor. - Alexandre Dumas',
  'No existen emociones intermedias en un corazón ulcerado por una desesperación suprema. - Alexandre Dumas',
}

local function footer()
  return quotes[math.random(#quotes)]
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.opts)
