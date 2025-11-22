return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "csv",
                    "go",
                    "gomod",
                    "gosum",
                    "gotmpl",
                    "graphql",
                    "html",
                    "javascript",
                    "jq",
                    "json",
                    "lua",
                    "make",
                    "proto",
                    "python",
                    "rust",
                    "toml",
                    "typescript",
                    "query",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = { enable = true },
                modules = {},
            })
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "buf_ls",
                "biome",
                "clangd",
                "eslint",
                "gopls",
                "lua_ls",
                "terraformls",
                "tflint",
                "ts_ls",
                -- "pyright",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            -- library = {
                            --     vim.env.VIMRUNTIME
                            --     -- Depending on the usage, you might want to add additional paths here.
                            --     -- "${3rd}/luv/library"
                            --     -- "${3rd}/busted/library",
                            -- }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            })

            vim.lsp.config("buf_ls", {})
            vim.lsp.config("clangd", {})
            vim.lsp.config("gopls", {})
            vim.lsp.config("ts_ls", {})
            vim.lsp.config("terraformls", {})
            vim.lsp.config("tflint", {})
            vim.lsp.config("biome.setup", {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end,
            })

            vim.lsp.config("eslint", {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
    },
    -- {
    --     "creativenull/efmls-configs-nvim"
    -- },
}
