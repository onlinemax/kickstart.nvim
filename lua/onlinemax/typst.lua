local handlers = {}
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.typ',
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local cwd = vim.fn.getcwd(vim.api.nvim_get_current_win())
    handlers.typst = io.popen('typst watch -f pdf ' .. name .. ' ' .. cwd .. '/tmp.pdf  > /dev/null 2>&1 &', 'r')
    handlers.zathura = io.popen('zathura ' .. cwd .. '/tmp.pdf > /dev/null 2>&1 &', 'r')
  end,
})

vim.api.nvim_create_autocmd('BufDelete', {
  pattern = '*.typ',
  callback = function()
    handlers.typst:close()
    handlers.zathura:close()
  end,
})
