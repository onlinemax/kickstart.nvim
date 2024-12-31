-- For comments:
require('Comment').setup()
-- Some general settings because i really need it:

-- Don't change my clipboard
vim.api.nvim_set_option_value('clipboard', '', { scope = 'local' })
-- Change the shiftwidth and the tabstop to 4 globally
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
