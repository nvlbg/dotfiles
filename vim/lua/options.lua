-- Start filetype detection (with indentation and plugin support)
vim.cmd.filetype({ 'plugin', 'indent', 'on' })

-- Enable matchit plugin
-- TODO: see if this can be part of the plugin manager
vim.cmd.runtime('macros/matchit.vim')

-- Enable syntax highlighting
vim.cmd.syntax('enable')

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Show line numbers
vim.opt.number = true

-- Highlight current line
vim.opt.cursorline = true

-- Set smartcase for searching
vim.opt.smartcase = true

-- Highlight matching parentheses
vim.opt.showmatch = true

-- Scroll before cursor hits bottom line
vim.opt.scrolloff = 6

-- Always show tab line
vim.opt.showtabline = 2

-- Set update time and timeout length
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250

-- Enable mouse support
vim.opt.mouse = 'a'

-- Set grepprg and grepformat
vim.opt.grepprg = 'rg --no-heading --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- Set guicursor for insert mode
vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor'

-- Highlight terminal cursor
vim.api.nvim_set_hl(0, 'TermCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'TermCursorNC', {
    bg = 'red',   -- background color
    fg = 'green', -- foreground color
    ctermbg = 1,  -- terminal background color
    ctermfg = 15  -- terminal foreground color
})

-- Disable cursorline highlighting in terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = function() vim.opt_local.cursorline = false end,
})
