local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end
math.randomseed(os.time())

local quotes = {
  'La ley manda, y cuando manda la ley, hiere en seguida. - Alexandre Dumas',
  'La Justicia toca vengar a los que ha sabido defender - Alexandre Dumas',
  'La alegría causa a veces un efecto extraño; oprime al corazón casi tanto como el dolor. - Alexandre Dumas',
  'No existen emociones intermedias en un corazón ulcerado por una desesperación suprema. - Alexandre Dumas',
  'No es posible que el mal ni el bien sean durables, y de aquí se sigue que, \nhabiendo durado mucho el mal, el bien está ya cerca. - Miguel de Cervantes (Don Quijote)',
  'Se admiró al pensar de que hilos tan frágiles y desconocidos penden muchas veces el destino de los pueblos y las vidas de los hombres. - Alexandre Dumas',
  'Los locos y los héroes, dos clases de imbéciles que se parecen bastante. - Alexandre Dumas',
}
local function footer()
  return quotes[math.random(#quotes)]
end

local dashboard = require 'alpha.themes.dashboard'
dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ":lua require'gallo.finder'.ff() <CR>"),
  dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('p', '  Find project', ":lua require'gallo.finder'.pr() <CR>"),
  dashboard.button('r', '  Recently used files', ":lua require'gallo.finder'.of() <CR>"),
  dashboard.button('t', '  Find text', ':Telescope live_grep <CR>'),
  dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
  dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

dashboard.section.footer.val = footer()
dashboard.section.header.val = {
  ' █████   ██████  ██████  ███████ ',
  '██      ██    ██ ██   ██ ██      ',
  '██      ██    ██ ██   ██ █████   ',
  '██      ██    ██ ██   ██ ██      ',
  ' ██████  ██████  ██████  ███████ ',
  '                                 ',
  '                                 ',
}
alpha.setup(dashboard.config)
-- Disable folding on alpha buffer
vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
]]
