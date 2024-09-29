return {
    {
        "tpope/vim-unimpaired",
    },
    {
        "tpope/vim-commentary",
    },
    {
        "tpope/vim-repeat",
    },
    {
        "tpope/vim-surround",
    },
    {
        "linrongbin16/lsp-progress.nvim",
        config = function()
            require('lsp-progress').setup({})
            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
                group = "lualine_augroup",
                pattern = "LspProgressStatusUpdated",
                callback = require("lualine").refresh,
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local theme = 'base16'
            local colors = require('lualine.themes.' .. theme)

            require('lualine').setup({
                options = {
                    theme = theme,
                    globalstatus = true,
                    section_separators = '',
                    component_separators = '',
                },
                sections = {
                    lualine_a = {"branch"},
                    lualine_b = {
                        {
                            "filename",
                            path = 1, -- 1: Relative path
                        },
                    },
                    lualine_c = {
                    },
                    lualine_x = {
                        function()
                            return require('lsp-progress').progress()
                        end,
                        -- "nvim_treesitter#statusline"
                    },
                    lualine_y = {"progress"},
                    lualine_z = {"location"},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "tabs",
                            mode = 2,
                            tabs_color = {
                                active = { fg = colors.normal.a.fg, bg = colors.normal.a.bg, gui = "bold" },
                                inactive = { fg = colors.inactive.a.fg, bg = colors.inactive.a.bg }
                            },
                        },
                    },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
            })
        end,
    },
    {
        "jiangmiao/auto-pairs",
    },
    {
        "vim-scripts/argtextobj.vim",
    },
    {
        "vimwiki/vimwiki",
        config = function()
            -- vimwiki
            vim.g.vimwiki_list = {
                { path = '~/Notes/wiki/', ext = '.md' },
                { path = '~/Notes/vimwiki/' },
                { path = '~/Notes/work/', ext = '.md' }
            }
        end,
    },
    {
        "chrisbra/csv.vim",
    },
    {
        "ojroques/nvim-osc52",
        init = function()
            -- Clipboard synchronization
            vim.api.nvim_create_autocmd('TextYankPost', {
                callback = function()
                    if vim.v.event.operator == 'y' then
                        -- copies contents from the given register to the clipboard via osc52 escape sequence
                        require('osc52').copy_register(vim.v.event.regname)
                    end
                end
            })
        end,
    },
    -- {
    --   "thinca/vim-visualstar",
    -- },
    -- {
    --   "github/copilot.vim",
    --   init = function()
    --     -- Copilot commands in insert mode
    --     vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
    --     vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
    --     vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
    --   end,
    -- },
}
