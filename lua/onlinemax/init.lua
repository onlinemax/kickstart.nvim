require 'onlinemax.general'
require 'onlinemax.dap'
require 'onlinemax.jdtls'
require 'onlinemax.typst'
require 'onlinemax.luasnip'
require 'onlinemax.snippets'

vim.api.nvim_create_autocmd({ 'FIleType' }, { pattern = 'tex', group = optional_group, command = 'TSBufDisable highlight' })
