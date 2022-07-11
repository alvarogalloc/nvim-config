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
  compile_on_sync = false,
  -- compile_path = vim.fn.stdpath 'config' .. '/lua/gallo/compiled.lua',
}
local lsp_ft = {
  'json',
  'css',
  'html',
  'yaml',
  'cpp',
  'php',
  'cmake',
  'c',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'lua',
  'rust',
  'python',
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'gallo.lsp'
      require 'gallo.lsp.lua-ls'
      require 'gallo.lsp.nullls-ls'
      -- require 'gallo.lsp.emmet-ls'
      require 'gallo.lsp.rust-ls'
      require 'gallo.lsp.python-ls'
      require 'gallo.lsp.js-ts-ls'
      require 'gallo.lsp.cpp-ls'
      require 'gallo.lsp.cmake-ls'
      require 'gallo.lsp.css-ls'
      require 'gallo.lsp.php-ls'
      require 'gallo.lsp.json-ls'
      -- require 'gallo.lsp.tailwind-ls'
      require('gallo.lsp').setup()
    end,
    event = 'BufWinEnter',
    requires = 'hrsh7th/cmp-nvim-lsp',
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    after = 'nvim-lspconfig',
  }
  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    event = 'BufRead',
    requires = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      {
        'hrsh7th/vim-vsnip',
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
    },
    config = function()
      require 'gallo.cmp'
    end,
  }
  use 'rafamadriz/friendly-snippets'
  use {
    'github/copilot.vim',
    event = 'InsertEnter',
    ft = lsp_ft,
    after = 'nvim-lspconfig',
    config = function()
      vim.cmd [[imap <silent><script><expr> <C-c> copilot#Accept("<CR>")]]
      vim.cmd [[let g:copilot_no_tab_map = v:true]]
      vim.cmd [[let g:copilot_assume_mapped = v:true]]
      vim.cmd [[highlight CopilotSuggestion guifg=#255AB4 ctermfg=8]]
    end,
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    event = 'BufRead',
    ft = {
      'cpp',
      'c',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'lua',
      'rust',
      'python',
    },
    config = function()
      require 'gallo.treesitter'
    end,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require 'gallo.tree'
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'rmagatti/session-lens' },
    config = function()
      require 'gallo.finder'
    end,
  }
  use 'rmagatti/auto-session'
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
  use 'akinsho/bufferline.nvim'
  use 'hoob3rt/lualine.nvim'

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
    ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    config = function()
      vim.cmd [[let g:user_emmet_install_global = 0]]
      vim.cmd [[autocmd FileType html,css,javascript,javascriptreact EmmetInstall]]
      vim.cmd [[  let g:user_emmet_leader_key = ',']]
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
