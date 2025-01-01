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
  { 'nvim-java/nvim-java' },
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
}
