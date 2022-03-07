local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- map to leave insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<Leader>f', ':NvimTreeToggle<CR>', opts)

-- Resize with arrows
keymap('n', '<A-Up>', ':resize -2<CR>', opts)
keymap('n', '<A-Down>', ':resize +2<CR>', opts)
keymap('n', '<A-Right>', ':vertical resize -2<CR>', opts)
keymap('n', '<A-Left>', ':vertical resize +2<CR>', opts)

-- Buffer bar
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<Leader>q', ':bdelete<CR>', opts)
keymap('n', '<C-q>', ':qall<CR>', opts)

-- Move Line up and down
keymap('n', '<S-j>', ':m .+1<CR>==', opts)
keymap('n', '<S-k>', ':m .-2<CR>==', opts)

-- Move selection up and down
keymap('v', '<S-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<S-k>', ":m '<-2<CR>gv=gv", opts)
keymap('v', 'p', '"_dP', opts)

-- Telescope
keymap('n', '<C-p>', ":lua require'gallo.finder'.pr()<CR>", opts)
keymap('n', '<Leader>cs', ":Telescope colorscheme <CR>", opts)
keymap('n', '<Leader><Leader>', ":lua require'gallo.finder'.ff()<CR>", opts)
keymap('n', 'rr', ":lua require'gallo.finder'.of()<CR>", opts)
keymap('n', '<C-Space>', ":lua require'gallo.finder'.lg()<CR>", opts)

-- Highlight
keymap('n', '<Leader>hl', ':set hlsearch!<CR>', opts)

-- Github Copilot
vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("")]])
vim.cmd([[let g:copilot_no_tab_map = v:true]])
