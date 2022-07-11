-- Telescope
local actions = require 'telescope.actions'
require('telescope').setup {
  defaults = {
    preview = {
      timeout = false,
    },
    file_ignore_patterns = { 'node_modules', '.cache', '.git' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<Leader><Leader>'] = actions.close,
        ['<C-Space>'] = actions.close,
      },
    },
  },
}
require('session-lens').setup { path_display = { 'shorten' } }

local autosessionopts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath 'data' .. '/sessions/',
  auto_session_enabled = true,
  auto_session_create_enabled = false,
  auto_save_enabled = true,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = { '~/', '~/code' },
}
require('auto-session').setup(autosessionopts)

-- Dropdown list theme using a builtin theme definitions :
local pickeropts = require('telescope.themes').get_dropdown {
  winblend = 10,
  hidden = true,
  prompt_title = false,
  width = 0.5,
  results_height = 15,
  previewer = false,
}
-- Settings for with preview option
local with_preview = {
  winblend = 10,
  prompt_title = false,
  show_line = false,
  results_title = false,
  preview_title = false,
  layout_config = {
    preview_width = 0.5,
  },
}

local finder = {}

-- Find files with_preview settings
finder.ff = function()
  local opts = vim.deepcopy(pickeropts)
  opts.hidden = true
  require('telescope.builtin').fd(opts)
end

-- oldfiles
finder.of = function()
  local opts = vim.deepcopy(pickeropts)
  require('telescope.builtin').oldfiles(opts)
end

-- projects
finder.pr = function()
  local opts = vim.deepcopy(pickeropts)
  require('session-lens').search_session(opts)
end

-- Live grep / serach words
finder.lg = function()
  local opts = vim.deepcopy(with_preview)
  opts.hidden = true
  require('telescope.builtin').live_grep(opts)
end

return finder
