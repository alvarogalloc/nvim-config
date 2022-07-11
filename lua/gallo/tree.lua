local tree_cb = require('nvim-tree.config').nvim_tree_callback

-- Keymaps
local tree_keybindings = {
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, cb = tree_cb 'edit' },
  { key = { '<2-RightMouse>', '<C-]>', '<' }, cb = tree_cb 'cd' },
  { key = { '>' }, cb = tree_cb 'dir_up' },
  { key = 'v', cb = tree_cb 'vsplit' },
  { key = 's', cb = tree_cb 'split' },
  { key = 't', cb = tree_cb 'tabnew' },
  { key = '<BS>', cb = tree_cb 'close_node' },
  { key = '<Tab>', cb = tree_cb 'preview' },
}

-- vim.g.nvim_tree_quit_on_open = 1
-- vim.g.nvim_tree_hide_dotfiles = 1

require('nvim-tree').setup {
  actions = { open_file = { quit_on_open = true } },
  filters = { dotfiles = true, custom = {} },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  --auto_close = true,
  auto_reload_on_write = true,
  open_on_tab = false,
  -- update_to_buf_dir = { enable = true, auto_open = true },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = true,
  update_cwd = true,
  update_focused_file = { enable = false, update_cwd = false, ignore_list = {} },
  system_open = { cmd = nil, args = {} },
  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    mappings = { custom_only = false, list = tree_keybindings },
  },
}

