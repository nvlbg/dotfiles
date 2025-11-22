return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "fredrikaverpil/neotest-golang",
                version = "*",
                build = function()
                  vim.system({"go", "install", "gotest.tools/gotestsum@latest"}):wait()
                end,
            },
        },
        enabled = true,
        config = function()
            require("neotest").setup({
                consumers = {
                    notify = function(client)
                        client.listeners.run = function(_, _, _)
                            vim.notify(("🏃🏻‍♂️‍➡️ Tests are running..."), vim.log.levels.INFO)
                        end
                        client.listeners.results = function(_, results, partial)
                            if partial then
                                return
                            end
                            local total, passed, failed = 0, 0, 0
                            for _, result in pairs(results) do
                                if result.status == "passed" then
                                    passed = passed + 1
                                elseif result.status == "failed" then
                                    failed = failed + 1
                                end
                                total = total + 1
                            end
                            if failed > 0 then
                                vim.notify(("🔴 Tests failed: %d/%d"):format(failed, total), vim.log.levels.ERROR)
                            else
                                vim.notify(("🟢 All %d tests passed"):format(total), vim.log.levels.INFO)
                            end
                        end
                    end,
                },
                adapters = {
                    require('rustaceanvim.neotest'),
                    require("neotest-golang")({
                        testify_enabled = true,
                        runner = "gotestsum",
                    }),
                },
            })

            vim.keymap.set('n', '<leader>t', '<Cmd>lua require("neotest").run.run()<CR>',                   { silent = true })
            vim.keymap.set('n', '<leader>T', '<Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { silent = true })
        end,
    },
}
