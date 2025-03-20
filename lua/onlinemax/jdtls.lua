local function setupjdtls()
  local config = {
    cmd = { '/usr/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

    -- This is for nvim-dap, For more information go to the following sites
    -- https://github.com/microsoft/java-debug?tab=readme-ov-file#usage-with-eclipsejdtls
    -- https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#configuration-verbose
    init_options = {
      bundles = {
        vim.fn.glob('/home/max/builds/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.1.jar', 1),
      },
    },
  }

  require('jdtls').start_or_attach(config)
end

M = {
  setup = setupjdtls,
}

return M
