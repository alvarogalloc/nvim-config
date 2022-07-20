vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})
local cmd = vim.cmd

local present, packer = pcall(require, 'packer')
if not present then
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  print 'Cloning packer..'
  -- remove the dir before cloning
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '20',
    packer_path,
  }
  cmd 'packadd packer.nvim'
  present, packer = pcall(require, 'packer')

  if not present then
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
  end
end
packer.init {
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 800, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  -- compile_path = vim.fn.stdpath 'config' .. '/lua/gallo/compiled.lua',
}
local lsp_ft = {
  json = true,
  css = true,
  html = true,
  yaml = true,
  cpp = true,
  php = true,
  cmake = true,
  c = true,
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
  lua = true,
  rust = true,
  python = true,
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'gallo.lsp'
      require 'gallo.lsp.lua-ls'
      -- require 'gallo.lsp.emmet-ls'
      require 'gallo.lsp.rust-ls'
      require 'gallo.lsp.python-ls'
      require 'gallo.lsp.js-ts-ls'
      require 'gallo.lsp.cpp-ls'
      require 'gallo.lsp.cmake-ls'
      require 'gallo.lsp.css-ls'
      require 'gallo.lsp.php-ls'
      require 'gallo.lsp.json-ls'
      require 'gallo.lsp.tailwind-ls'
      require('gallo.lsp').setup()
    end,
    requires = 'hrsh7th/cmp-nvim-lsp',
  }
  use { 'kkharji/lspsaga.nvim' }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require 'gallo.lsp.nullls-ls'
    end,
  }
  -- Completion
  use {
    'rafamadriz/friendly-snippets',
    event = { 'InsertEnter', 'CmdlineEnter' },
  }
  use {
    'hrsh7th/vim-vsnip',
    after = 'friendly-snippets',
  }
  use {
    'hrsh7th/nvim-cmp',
    after = 'vim-vsnip',
    requires = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
    },
    config = function()
      require 'gallo.cmp'
    end,
  }
  use {
    'github/copilot.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.copilot_filetypes = lsp_ft
      vim.cmd [[imap <silent><script><expr> <C-c> copilot#Accept("<CR>")]]
      vim.cmd [[let g:copilot_no_tab_map = v:true]]
      vim.cmd [[let g:copilot_assume_mapped = v:true]]
      vim.cmd [[highlight CopilotSuggestion guifg=#255AB4 ctermfg=8]]
    end,
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    config = function()
      require 'gallo.treesitter'
    end,
  }
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    config = function()
      require 'gallo.tree'
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'rmagatti/session-lens', 'rmagatti/auto-session' },
    config = function()
      require 'gallo.finder'
    end,
  }
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      -- git signs
      require('gitsigns').setup()
    end,
  }

  -- Theme
  -- 'folke/tokyonight.nvim',
  -- 'olimorris/onedarkpro.nvim',
  use 'projekt0n/github-nvim-theme'
  use 'themercorp/themer.lua'

  -- Plugin used
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Startup Time
  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- Bufferline / statusline
  use { 'akinsho/bufferline.nvim', events = { 'BufNewFile', 'BufRead', 'TabEnter' } }
  use { 'hoob3rt/lualine.nvim' , events = { 'BufNewFile', 'BufRead', 'TabEnter' }}
  use {
    'goolord/alpha-nvim',
    after = 'nvim-web-devicons',
    config = function()
      require 'gallo.startup'
    end,
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    event = 'InsertEnter',
    config = function()
      require('Comment').setup {
        pre_hook = function(ctx)
          local U = require 'Comment.utils'
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end
          return require('ts_context_commentstring.internal').calculate_commentstring {
            key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
            location = location,
          }
        end,
      }
    end,
  }

  -- Emmet
  use {
    'mattn/emmet-vim',
    event = 'InsertEnter',
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.cmd [[autocmd FileType css, html, javascript, javascriptreact EmmetInstall]]
    end,
  }
  -- Color hex, rgb, hsl
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufRead',
    config = function()
      require('colorizer').setup()
    end,
  }
end)
