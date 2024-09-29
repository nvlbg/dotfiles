return {
    {
        "RRethy/base16-nvim",
        init = function()
            require('base16-colorscheme').with_config({
                telescope = false,
            })
            vim.cmd.colorscheme('base16-circus')
        end,
    },
}
