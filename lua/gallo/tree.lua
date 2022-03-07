local tree_cb = require('nvim-tree.config').nvim_tree_callback

-- Keymaps
local tree_keybindings = {
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, cb = tree_cb('edit') },
  { key = { '<2-RightMouse>', '<C-]>', '<' }, cb = tree_cb('cd') },
  { key = 'v', cb = tree_cb('vsplit') },
  { key = 's', cb = tree_cb('split') },
  { key = '<C-t>', cb = tree_cb('tabnew') },
  { key = 'P', cb = tree_cb('parent_node') },
  { key = '<BS>', cb = tree_cb('close_node') },
  { key = '<S-CR>', cb = tree_cb('close_node') },
  { key = '<Tab>', cb = tree_cb('preview') },
  { key = 'K', cb = tree_cb('first_sibling') },
  { key = 'J', cb = tree_cb('last_sibling') },
  { key = 'I', cb = tree_cb('toggle_ignored') },
  { key = 'H', cb = tree_cb('toggle_dotfiles') },
  { key = 'R', cb = tree_cb('refresh') },
  { key = 'a', cb = tree_cb('create') },
  { key = 'd', cb = tree_cb('remove') },
  { key = 'r', cb = tree_cb('rename') },
  { key = '<C-r>', cb = tree_cb('full_rename') },
  { key = 'x', cb = tree_cb('cut') },
  { key = 'c', cb = tree_cb('copy') },
  { key = 'p', cb = tree_cb('paste') },
  { key = 'y', cb = tree_cb('copy_name') },
  { key = 'Y', cb = tree_cb('copy_path') },
  { key = 'gy', cb = tree_cb('copy_absolute_path') },
  { key = '[c', cb = tree_cb('prev_git_item') },
  { key = ']c', cb = tree_cb('next_git_item') },
  { key = { '-', '>' }, cb = tree_cb('dir_up') },
  { key = 'q', cb = tree_cb('close') },
  { key = '?', cb = tree_cb('toggle_help') },
}

-- vim.g.nvim_tree_quit_on_open = 1
-- vim.g.nvim_tree_hide_dotfiles = 1

require('nvim-tree').setup({
  actions = { open_file = { quit_on_open = true } },
  filters = { dotfiles = true, custom = {} },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = true,
  open_on_tab = false,
  update_to_buf_dir = { enable = true, auto_open = true },
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
    auto_resize = true,
    mappings = { custom_only = true, list = tree_keybindings },
  },
})

local tree = {}

tree.open = function()
  require('bufferline.state').set_offset(31, 'FileTree')
  require('nvim-tree').find_file(true)
end

tree.close = function()
  require('bufferline.state').set_offset(0)
  require('nvim-tree').close()
end

return tree
