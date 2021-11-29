local set_keymap = vim.api.nvim_set_keymap;
local opts = {noremap = true, silent = true}

set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "

set_keymap('n', '<Leader>x', ':exit<CR>', opts)
set_keymap('n', '<Leader>w', ':w<CR>', opts)
set_keymap('n', '<Leader>f', ':NvimTreeToggle<CR>', opts)

-- Buffer bar
set_keymap("n", "<TAB>", ":bnext<CR>", opts)
set_keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
set_keymap('n', '<Leader>q', ':bdelete<CR>', opts)

-- Move selected line / block of text in visual mode
set_keymap('v', '<C-j>', ':m \'>+1<CR>gv=gv', opts)
set_keymap('v', '<C-k>', ':m \'<-2<CR>gv=gv\')', opts)

set_keymap('n', '<C-j>', ':m .+1<CR>==', opts)
set_keymap('n', '<C-k>', ':m .-2<CR>==', opts)

set_keymap('i', '<C-j>', '<Esc>:m .+1<CR>==gi', opts)
set_keymap('i', '<C-k>', '<Esc>:m .-2<CR>==gi', opts)
set_keymap('n', '<C-s>', ':lua require\'finder\'.ff()<CR>', opts)
set_keymap('i', '<C-s>', '<Esc>:lua require\'finder\'.ff()<CR>', opts)
set_keymap('n', '<C-p>', ':lua require\'finder\'.pr()<CR>', opts)
set_keymap('i', '<C-p>', '<Esc>:lua require\'finder\'.pr()<CR>', opts)

-- Highlight
set_keymap('n', '<Leader>hl', ':set hlsearch!<CR>', opts)
-- Github Copilot
vim.cmd[[imap <silent><script><expr> <C-c> copilot#Accept("")]]
vim.cmd('let g:copilot_no_tab_map = v:true')
