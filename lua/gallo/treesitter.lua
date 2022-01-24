require('nvim-treesitter.configs').setup({
  ensure_installed = { 'cpp', 'lua', 'javascript' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  autotag = { enable = true },
  autopairs = {
    enable = true,
  },
})
