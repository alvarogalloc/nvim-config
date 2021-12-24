local fn = vim.fn

-- Install packer automatically
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end


local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- stylua: ignore start
return packer.startup(function()
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
  use'goolord/alpha-nvim'
  use 'olimorris/onedarkpro.nvim'

  -- MISC
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'akinsho/bufferline.nvim'
  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'terrortylor/nvim-comment'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'mattn/emmet-vim'
  use 'lewis6991/impatient.nvim'
end)
-- stylua: ignore end
