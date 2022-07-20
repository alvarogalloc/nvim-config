local lsp = {}
lsp.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    -- underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

local floatopts = {
  focusable = true,
  close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
  border = 'rounded',
  source = 'always',
  prefix = ' ',
  scope = 'cursor',
}
OpenDiagFloat = function()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  vim.diagnostic.open_float(floatopts)
end

function lsp.on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local function buf_set_keymap(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, opts)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('n', 'gr', vim.lsp.buf.references)
  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration)
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition)
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation)
  buf_set_keymap('n', 'gk', vim.lsp.buf.hover)
  buf_set_keymap('n', 'gs', vim.lsp.buf.signature_help)
  buf_set_keymap('n', '<space>rn', vim.lsp.buf.rename)
  buf_set_keymap('n', 'ca', vim.lsp.buf.code_action)
  buf_set_keymap('n', '<C-m>', function()
    vim.diagnostic.goto_prev { float = floatopts }
  end)
  buf_set_keymap('n', '<C-n>', function()
    vim.diagnostic.goto_next { float = floatopts }
  end)
  buf_set_keymap('n', '<S-f>', function()
    vim.lsp.buf.format { async = true }
  end)
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = OpenDiagFloat,
  })
end

return lsp
