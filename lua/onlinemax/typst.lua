vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.typ',
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local cwd = vim.fn.getcwd(vim.api.nvim_get_current_win())
    print(os.execute('!typst watch -f pdf ' .. name .. ' ' .. cwd .. '/tmp.pdf &'))
    -- vim.cmd('!zathura ' .. cwd .. '/tmp.pdf')
    print 'allo'
    print(cwd, name)
  end,
})
