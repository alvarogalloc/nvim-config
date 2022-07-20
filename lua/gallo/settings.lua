vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = 'utf-8' -- The encoding written to file
vim.o.hlsearch = false
vim.o.termguicolors = true -- set term gui colors most terminals support this

-- Search options
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true

-- Line options
vim.o.showmatch = true
vim.o.showbreak = '+++'
vim.o.textwidth = 80
vim.o.scrolloff = 5
vim.wo.linebreak = true
-- vim.wo.colorcolumn = '120'

-- Indent options
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.backspace = 'indent,eol,start'
vim.o.breakindent = true

vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = 'a' -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right

-- Line display
vim.wo.number = true -- set numbered lines
-- vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line

vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- vim.cmd [[set formatoptions-=cro]] -- for comments

vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.o.swapfile = false

-- Lazy redraw
vim.o.lazyredraw = true

-- Set spelling
vim.o.spell = false

-- For git
vim.wo.signcolumn = 'yes'

vim.o.updatetime = 300 -- faster updates
vim.cmd [[set timeoutlen=400]]
vim.o.clipboard = 'unnamedplus' -- Copy paste between vim and everything else
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
