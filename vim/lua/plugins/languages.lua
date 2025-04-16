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
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
        },
        opts = {
            automatic_installation = false,

            ensure_installed = {
                "lua_ls",
                "clangd",
                "gopls",
                "eslint",
                "ts_ls",
                "biome",
                -- "pyright",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
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
            }

            lspconfig.clangd.setup {}
            lspconfig.gopls.setup {}
            lspconfig.ts_ls.setup {}
            lspconfig.biome.setup {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end,
            }

            lspconfig.eslint.setup {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            }
        end,
    },
    {
        "mrcjkb/rustaceanvim",
    },
    -- {
    --     "creativenull/efmls-configs-nvim"
    -- },
}
