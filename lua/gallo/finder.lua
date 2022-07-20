-- Telescope
local actions = require 'telescope.actions'

local previewers = require 'telescope.previewers'

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    preview = {
      timeout = false,
    },
    prompt_prefix = ' ',
    selection_caret = ' ',
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    entry_prefix = '  ',

    file_ignore_patterns = { 'node_modules', '.cache', '.git' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<Leader><Leader>'] = actions.close,
        ['<C-Space>'] = actions.close,
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<CR>'] = actions.select_default,
      },
      n = {
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
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
  auto_session_suppress_dirs = { '~/', '~/code', '~/.local', '~/.cache' },
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
  opts.git = true
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
