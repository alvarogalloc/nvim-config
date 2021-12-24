local autosessionopts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = false,
  auto_session_suppress_dirs = {'~/', '~/code'}
}
require('auto-session').setup(autosessionopts)
require('telescope').load_extension('projects')

local searchfile = require('telescope.themes').get_dropdown({
  borderchars = {
    { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
    results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
  },
  previewer = false,
  prompt_title = false,
})

local finder = {}

-- Find files with_preview settings
finder.ff = function()
  local opts = vim.deepcopy(searchfile)
  require('telescope.builtin').fd(opts)
end

-- oldfiles
finder.of = function()
  local opts = vim.deepcopy(searchfile)
  require('telescope.builtin').oldfiles(opts)
end

-- projects
finder.pr = function()
  local opts = vim.deepcopy(searchfile)
  require('session-lens').search_session(opts)
end

return finder
