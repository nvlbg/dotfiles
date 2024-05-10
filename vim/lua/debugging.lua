require('telescope').load_extension('dap')

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

if not os.getenv("VIRTUAL_ENV") == nil then
    command = os.getenv("VIRTUAL_ENV") .. "/bin/python"
    require('dap-python').setup(command)
end


local dap = require('dap')

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})

dap.adapters.bazel = {
  type = 'server',
  port = 2345,
}

dap.configurations.go = {
    {
        type = 'bazel',
        request = 'attach',
        name = 'Debug Bazel Target [DAP]',
        mode = 'remote',
        substitutePath = {
            {
                from = "${env:WORKSPACE_ROOT}/src",
                to = "src",
            },
            {
                from = "${env:WORKSPACE_ROOT}/bazel-go-code/external/",
                to = "external/",
            },
            {
                from = "${env:WORKSPACE_ROOT}/bazel-out/",
                to = "bazel-out/",
            },
            {
                from = "${env:WORKSPACE_ROOT}/bazel-go-code/external/go_sdk",
                to = "GOROOT/",
            }
        }
    },
}

require("dapui").setup()
