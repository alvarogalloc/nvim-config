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

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Enable nvim commentary
require('nvim_comment').setup({ comment_empty = false })
-- Enable nvim autopairs
require('nvim-autopairs').setup()
-- git signs
require('gitsigns').setup()
-- css colorizer
require('colorizer').setup()
-- Telescope
require('telescope').setup({ defaults = { file_ignore_patterns = { 'node_modules' } } })

require('luasnip/loaders/from_vscode').load()

-- Tresitter
require('nvim-treesitter.configs').setup({
  highlight = { enable = true, additional_vim_regex_highlighting = false },
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true, -- false will disable the whole extension.
  },
  autotag = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim.
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm.
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
})
