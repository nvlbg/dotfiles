-- Debugging mappings
vim.keymap.set('n', '<Up>',      '<Cmd>lua require("dap").continue()<CR>',          { silent = true })
vim.keymap.set('n', '<Down>',    '<Cmd>lua require("dap").step_over()<CR>',         { silent = true })
vim.keymap.set('n', '<Left>',    '<Cmd>lua require("dap").step_out()<CR>',          { silent = true })
vim.keymap.set('n', '<Right>',   '<Cmd>lua require("dap").step_into()<CR>',         { silent = true })
vim.keymap.set('n', '<leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { silent = true })
vim.keymap.set('n', '<F9>',      '<Cmd>lua require("dapui").toggle()<CR>',          { silent = true })
vim.keymap.set('n', '<leader>D', '<Cmd>lua require("dapui").toggle()<CR>',          { silent = true })

return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = { "codelldb", "js", "delve" },
        },
        handlers = {
            function(config)
                require('mason-nvim-dap').default_setup(config)
            end,
            javascript = function(config)
                config.adapters["pwa-node"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "node",
                        args = {
                            vim.fn.stdpath("data")
                                .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                            "${port}",
                        },
                    },
                }
                config.configurations.javascript = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file (JavaScript)",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                        console = "integratedTerminal",
                        internalConsoleOptions = "neverOpen",
                    },
                }
                require('mason-nvim-dap').default_setup(config)
            end,
        },
        -- filetypes = {
        --     ['js'] = { 'javascriptreact', 'typescriptreact', 'typescript', 'javascript' },
        -- },
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "leoluz/nvim-dap-go",
        config = true,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        keys = {
          {
            "<leader>dt",
            function() require('dap-go').debug_test() end,
            desc = "Debug test"
          },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        opts = {},
        init = function()
            vim.api.nvim_set_hl(0, 'DapBreakpointHL', { fg = '#D75F87' })
            vim.api.nvim_set_hl(0, 'DapStoppedHL', { fg = '#6AD75F' })
            vim.fn.sign_define('DapBreakpoint', { text = "", texthl = "DapBreakpointHL", linehl = "", numhl = "" })
            vim.fn.sign_define('DapBreakpointRejected', { text = "", texthl = "DapBreakpointHL", linehl = "", numhl = "" })
            vim.fn.sign_define('DapStopped', { text = "󰜴", texthl = "DapStoppedHL", linehl = "Visual", numhl = "Visual" })
        end,
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
            require('telescope').load_extension('dap')
        end,
    },
}
