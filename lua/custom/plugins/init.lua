-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
  },
  {
    'barrett-ruth/live-server.nvim',
    ft = 'html',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation, { desc = 'Emmet Wrap with Abbreveviation ' })
    end,
  },
  { 'numToStr/Comment.nvim' },
  {
    'mfussenegger/nvim-jdtls',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = 'java',
    config = function()
      require('onlinemax.jdtls').setup()
    end,
  },
  { 'norcalli/nvim-colorizer.lua' },
  { 'Issafalcon/lsp-overloads.nvim' },
  {
    'jalvesaq/dict.nvim',
    init = function()
      vim.keymap.set('n', '<Leader>dd', '<Cmd>lua require("dict").lookup()<CR>', { desc = '[D]ocument [D]efinition' })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'catppuccin/nvim',
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
  },

  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    'edluffy/hologram.nvim',
    opts = {
      auto_display = true,
    },
  },
  {
    'tummetott/unimpaired.nvim',
    event = 'VeryLazy',
    opts = {
      -- add options here if you wish to override the default settings

      -- Change the behavior of ALT-K and ALT-J to move line up and down in normal mode
      keymaps = {
        exchange_above = {
          mapping = '<M-k>',
          description = 'Exchange line with [count] lines above',
          dot_repeat = true,
        },
        exchange_below = {
          mapping = '<M-j>',
          description = 'Exchange line with [count] lines below',
          dot_repeat = true,
        },
      },
    },
  },
  {
    'brianhuster/autosave.nvim',
    ft = 'tex',
  },
  {
    'lervag/vimtex',
    dependencies = { 'micangl/cmp-vimtex' },
    ft = 'tex',
    lazy = true, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.tex_flavor = 'latex'
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_quickfix_mode = 0
      vim.opt.conceallevel = 1
    end,
  },
  {
    'mireq/luasnip-snippets',
    dependencies = { 'L3MON4D3/LuaSnip' },
    init = function()
      -- Mandatory setup function
      require('luasnip_snippets.common.snip_utils').setup()
    end,
  },
}
