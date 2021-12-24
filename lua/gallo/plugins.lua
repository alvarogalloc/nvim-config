local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute('packadd packer.nvim')
end

-- stylua: ignore start
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- LSP
  use  'neovim/nvim-lspconfig' 
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
  }
  use  'L3MON4D3/LuaSnip' 
  use 'rafamadriz/friendly-snippets'
  use 'github/copilot.vim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Tresitter syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use  'windwp/nvim-ts-autotag' 

  -- Tree
  use  'kyazdani42/nvim-tree.lua' 

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup { path_display = { 'shorten' } }
    end,
  }

  -- git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Theme
  use 'glepnir/dashboard-nvim'
  use 'olimorris/onedarkpro.nvim'

  -- MISC
  use 'kyazdani42/nvim-web-devicons'
  use 'akinsho/bufferline.nvim'
  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'terrortylor/nvim-comment'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'mattn/emmet-vim'
end)
-- stylua: ignore end
