local handlers = {}
vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.typ',
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local cwd = vim.fn.getcwd(vim.api.nvim_get_current_win())
    local executable = '~/Documents/Programs/C/command/command'
    handlers.typst = io.popen(executable .. ' typst watch -f pdf ' .. name .. ' ' .. cwd .. '/tmp.pdf  > /dev/null 2>&1 &', 'r')
    local pid = handlers.typst:read '*n'
    print(pid)
    handlers.zathura = io.popen(executable .. ' zathura ' .. cwd .. '/tmp.pdf > /dev/null 2>&1 &', 'r')
  end,
})

vim.api.nvim_create_autocmd('BufDelete', {
  pattern = '*.typ',
  callback = function()
    handlers.typst:close()
    handlers.zathura:close()
  end,
})
