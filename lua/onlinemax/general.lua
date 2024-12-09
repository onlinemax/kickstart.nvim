-- For comments:
require('Comment').setup()
-- Some general settings because i really need it:
-- Open Neotree when using Ctrl-N
vim.keymap.set('n', '<C-n>', function()
  vim.cmd ':Neotree'
end, { desc = 'Open Neotree' })

vim.keymap.set('n', '<C-b>', function()
  vim.cmd ':Neotree toggle show buffers right<cr>'
end, { desc = 'Open buffers' })
-- Don't change my clipbard

vim.api.nvim_set_option_value('clipboard', '', { scope = 'local' })
