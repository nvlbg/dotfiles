return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            on_attach = function(bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                -- api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set('n', 'C',     api.tree.change_root_to_node,    opts('CD'))
                vim.keymap.set('n', '<S-k>', api.node.show_info_popup,        opts('Info'))
                vim.keymap.set('n', 'mm',    api.fs.rename_full,              opts('Move'))
                vim.keymap.set('n', 'mr',    api.fs.rename,                   opts('Rename'))
                vim.keymap.set('n', 'md',    api.fs.remove,                   opts('Delete'))
                vim.keymap.set('n', 'ma',    api.fs.create,                   opts('Create File Or Directory'))
                vim.keymap.set('n', 'mx',    api.fs.cut,                      opts('Cut'))
                vim.keymap.set('n', 'mc',    api.fs.copy.node,                opts('Copy'))
                vim.keymap.set('n', 'mp',    api.fs.paste,                    opts('Paste'))
                vim.keymap.set('n', 't',     api.node.open.tab,               opts('Open: New Tab'))
                vim.keymap.set('n', 'v',     api.node.open.vertical,          opts('Open: Vertical Split'))
                vim.keymap.set('n', 's',     api.node.open.horizontal,        opts('Open: Horizontal Split'))
                vim.keymap.set('n', '<CR>',  api.node.open.edit,              opts('Open'))
                vim.keymap.set('n', 'p',     api.node.navigate.parent,        opts('Parent Directory'))
                vim.keymap.set('n', '[c',    api.node.navigate.git.prev,      opts('Prev Git'))
                vim.keymap.set('n', ']c',    api.node.navigate.git.next,      opts('Next Git'))
                vim.keymap.set('n', 'E',     api.tree.expand_all,             opts('Expand All'))
                vim.keymap.set('n', 'W',     api.tree.collapse_all,           opts('Collapse'))
                vim.keymap.set('n', 'g?',    api.tree.toggle_help,            opts('Help'))
                vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,  opts('Last Sibling'))
                vim.keymap.set('n', 'K',     api.node.navigate.sibling.first, opts('First Sibling'))
                vim.keymap.set('n', 'o',     api.node.run.system,             opts('Run System'))

            end,
        },
        init = function()
            -- Toggle NvimTree mapping
            vim.keymap.set('', '<C-n>', ':NvimTreeFindFileToggle<CR>')
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                -- Other configurations
                path_display = {
                    "truncate"
                },
                dynamic_preview_title = true,
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        },
        init = function()
            -- File searching mappings
            vim.keymap.set('', '<C-p>', ':Telescope find_files<CR>')

            -- Debugging mappings
            vim.keymap.set('n', '<leader>d', ':Telescope dap configurations<CR>', { silent = true })

            -- Telescope LSP commands
            vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
            vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
        end,
    },
}
