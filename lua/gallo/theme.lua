local theme = vim.fn.system('defaults read -g AppleInterfaceStyle')

if string.find(theme, 'Dark') then
  vim.o.background = 'dark'
else
  vim.o.background = 'light'
end
if vim.fn.has('unix') == 1 then
  vim.o.background = 'dark'
end
require('onedarkpro').load()
