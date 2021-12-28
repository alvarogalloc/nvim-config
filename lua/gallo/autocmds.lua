-- quit if there are no buffers left
vim.cmd(
  [[autocmd BufDelete * if len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 | quit | endif]]
)

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

