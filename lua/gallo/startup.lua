local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end
math.randomseed(os.time())

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
