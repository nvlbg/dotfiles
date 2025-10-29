vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<cr>', { buffer = 0 })
