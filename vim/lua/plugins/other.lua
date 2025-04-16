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
                        function()
                            return require('lsp-progress').progress()
                        end,
                    },
                    lualine_x = {
                        "nvim_treesitter#statusline",
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
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- add any opts here
            -- for example
            provider = "openai",
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
                timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
                temperature = 0,
                max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
                --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
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
