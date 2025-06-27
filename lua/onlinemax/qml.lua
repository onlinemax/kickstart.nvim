local function getparams()
  if vim.uv.fs_stat './.qmlls.ini' then
    return { 'qmlls6' }
  else
    return { 'qmlls6', '--build-dir ./build', '-d ./doc' }
  end
end

vim.lsp.config('qmlls', {
  cmd = { 'qmlls6' },
  filetypes = { 'qml', 'qmljs' },
  root_markers = { '.git' },
})

vim.lsp.enable 'qmlls'
