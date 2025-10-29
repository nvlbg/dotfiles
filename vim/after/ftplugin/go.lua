vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<cr>', { buffer = 0 })

vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
        vim.lsp.buf.format()
    end,
})
