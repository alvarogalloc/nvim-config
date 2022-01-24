vim.cmd('set iskeyword+=-')
vim.cmd('set shortmess+=c')
vim.cmd('syntax on')
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = 'utf-8' -- The encoding written to file
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.breakindent = true
vim.o.smartcase = true
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = 'a' -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.cmd('set shiftwidth=2')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set expandtab')
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.o.swapfile = false
vim.wo.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.clipboard = 'unnamedplus' -- Copy paste between vim and everything else
vim.cmd('filetype plugin on')
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

require('nvim-autopairs').setup({})
-- Enable nvim commentary
require('nvim_comment').setup({ comment_empty = false })
-- git signs
require('gitsigns').setup()
-- css colorizer
require('colorizer').setup({
  css = { rgb_fn = true },
  html = { names = false },
  javascript = { names = false },
  javascriptreact = { names = false },
})
-- Telescope
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { 'node_modules', '.cache' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<Leader><Leader>'] = actions.close,
      },
    },
  },
})
