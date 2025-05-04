-- For comments:
require('Comment').setup()
-- Some general settings because i really need it:

-- Don't change my clipboard
vim.api.nvim_set_option_value('clipboard', '', { scope = 'local' })
-- Change the shiftwidth and the tabstop to 4 globally
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- Override the shiftwidth and tabstop for html to 4
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.html',
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})
-- Change the behavior of renaming a variable
vim.keymap.set('n', '<leader>rn', function()
  vim.ui.input({ prompt = 'New name: ' }, function(input)
    if input == '' then
      return
    end
    vim.lsp.buf.rename(input)
  end)
end, { desc = '[R]e[n]ame variable' })

-- Needed for nvim-ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all the Folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all the folds' })

vim.api.nvim_set_keymap('v', '<M-k>', '[egv', {})
vim.api.nvim_set_keymap('v', '<M-j>', ']egv', {})

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
