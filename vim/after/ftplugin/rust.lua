vim.keymap.set('n', 'ga', ':RustLsp codeAction<cr>', { buffer = 0 })
vim.keymap.set('n', '<leader>e', ':RustLsp expandMacro<cr>', { buffer = 0 })

vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
        vim.lsp.buf.format()
    end,
})
