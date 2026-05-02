vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

vim.keymap.set('n', 'ga', ':lua vim.lsp.buf.code_action()<cr>', { buffer = 0 })
