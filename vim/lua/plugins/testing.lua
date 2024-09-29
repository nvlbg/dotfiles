return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        enabled = true,
        config = function()
            require("neotest").setup({
                adapters = {
                    require('rustaceanvim.neotest'),
                },
            })

            vim.keymap.set('n', '<leader>t', '<Cmd>lua require("neotest").run.run()<CR>',                   { silent = true })
            vim.keymap.set('n', '<leader>T', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { silent = true })
        end,
    },
}
