-- Debugging mappings
vim.keymap.set('n', '<Up>',      '<Cmd>lua require("dap").continue()<CR>',          { silent = true })
vim.keymap.set('n', '<Down>',    '<Cmd>lua require("dap").step_over()<CR>',         { silent = true })
vim.keymap.set('n', '<Left>',    '<Cmd>lua require("dap").step_out()<CR>',          { silent = true })
vim.keymap.set('n', '<Right>',   '<Cmd>lua require("dap").step_into()<CR>',         { silent = true })
vim.keymap.set('n', '<leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { silent = true })
vim.keymap.set('n', '<F9>',      '<Cmd>lua require("dapui").toggle()<CR>',          { silent = true })

return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = { "codelldb" },
        },
    },
    {
        "mfussenegger/nvim-dap",
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
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    },
}
