require('gallo.dep.bootstrap')
require('dep')({
  -- LSP
  'neovim/nvim-lspconfig',

  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',

  -- Snippets
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'github/copilot.vim',
  'jose-elias-alvarez/null-ls.nvim',

  -- Startup Screen
  'goolord/alpha-nvim',

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      vim.cmd([[TSUpdate]])
    end,
  },
  'windwp/nvim-ts-autotag',
  'p00f/nvim-ts-rainbow',

  'kyazdani42/nvim-tree.lua',
  'nvim-telescope/telescope.nvim',
  'rmagatti/auto-session',
  'windwp/nvim-autopairs',
  'rmagatti/session-lens',
  'lewis6991/gitsigns.nvim',

  -- Theme
  'folke/tokyonight.nvim',
  'olimorris/onedarkpro.nvim',
  'projekt0n/github-nvim-theme',

  -- Plugin used
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Startup Time
  'lewis6991/impatient.nvim',

  -- Bufferline / statusline
  'akinsho/bufferline.nvim',
  'hoob3rt/lualine.nvim',

  -- Comment
  'terrortylor/nvim-comment',

  -- Color hex, rgb, hsl
  'norcalli/nvim-colorizer.lua',

  -- Emmet
  'mattn/emmet-vim',
})
