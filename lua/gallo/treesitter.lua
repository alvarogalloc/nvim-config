require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  autotag = { enable = true },
  -- autopairs = {
  --   enable = true,
  -- },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
