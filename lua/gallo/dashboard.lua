local status_ok, startup = pcall(require, 'startup')
if not status_ok then
  return
end
math.randomseed(os.time())

local quotes = {
  'La ley manda, y cuando manda la ley, hiere en seguida. - Alexandre Dumas',
  'La Justicia toca vengar a los que ha sabido defender - Alexandre Dumas',
  'La alegría causa a veces un efecto extraño; oprime al corazón casi tanto como el dolor. - Alexandre Dumas',
  'No existen emociones intermedias en un corazón ulcerado por una desesperación suprema. - Alexandre Dumas',
}

local quote = quotes[math.random(#quotes)]

local settings = {
  -- every line should be same width without escaped \
  header = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Header',
    margin = 5,
    content = {
      '          ▀████▀▄▄              ▄█ ',
      '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
      '    ▄        █          ▀▀▀▀▄  ▄▀  ',
      '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
      '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
      '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
      '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
      '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
      '   █   █  █      ▄▄           ▄▀   ',
    },
    highlight = 'Statement',
    default_color = '',
    oldfiles_amount = 0,
  },
  -- name which will be displayed and command
  body = {
    type = 'mapping',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Basic Commands',
    margin = 5,
    content = {
      { ' Find File', "lua require'gallo.finder'.ff()", 'f' },
      { ' Find Word', 'Telescope live_grep', 't' },
      { '  Find project', ":lua require'gallo.finder'.pr()", 'p' },
      { ' Recent Files', "lua require'gallo.finder'.of()", 'r' },
      { ' Colorschemes', 'Telescope colorscheme', 'cs' },
      { ' New File', "lua require'startup'.new_file()", 'n' },
    },
    highlight = 'String',
    default_color = '',
    oldfiles_amount = 0,
  },
  footer = {
    type = 'text',
    oldfiles_directory = false,
    align = 'center',
    fold_section = false,
    title = 'Footer',
    margin = 5,
    content = {
      quote,
    },
    -- content = { 'La Justicia toca vengar a los que ha sabido defender - Alexandre Dumas' },
    highlight = 'Number',
    default_color = '',
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 5, 2, 0 },
  },
  mappings = {
    execute_command = '<CR>',
    open_file = 'o',
    open_file_split = '<c-o>',
    open_section = '<TAB>',
    open_help = '?',
  },
  colors = {
    background = '#1f2227',
    folded_section = '#56b6c2',
  },
  parts = { 'header', 'body', 'footer' },
}

startup.setup(settings)
