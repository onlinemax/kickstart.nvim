local pids = {}
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.typ',
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local cwd = vim.fn.getcwd(vim.api.nvim_get_current_win())
    local command = '/home/max/Documents/Programs/Bash/latest.sh'
    os.execute(' typst watch -f pdf ' .. name .. ' ' .. cwd .. '/tmp.pdf  > /dev/null 2>&1 &')
    os.execute('zathura ' .. cwd .. '/tmp.pdf > /dev/null 2>&1 &')
    pids.typst = io.popen(command .. ' typst'):read '*n'
    pids.zathura = io.popen(command .. ' zathura'):read '*n'
  end,
})

vim.api.nvim_create_autocmd('BufUnload', {
  pattern = '*.typ',
  callback = function()
    vim.print 'allo'
    os.execute('kill ' .. pids.typst)
    os.execute('kill ' .. pids.zathura)
  end,
})
