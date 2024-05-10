-- Disable vi compatibility
vim.opt.compatible = false

-- Start filetype detection (with indentation and plugin support)
vim.cmd('filetype plugin indent on')

-- Enable matchit plugin
vim.cmd('runtime macros/matchit.vim')

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Set airline theme
vim.g.airline_theme = 'base16'

-- Set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Show line numbers
vim.opt.number = true

-- Indent new lines based on previous ones
vim.opt.autoindent = true

-- Always display cursor position in the low right corner
vim.opt.ruler = true

-- Display incomplete commands in the low right corner
vim.opt.showcmd = true

-- Highlight current line
vim.opt.cursorline = true

-- Enable hidden buffers
vim.opt.hidden = true

-- Set smartcase for searching
vim.opt.smartcase = true

-- Display matches while typing
vim.opt.incsearch = true

-- Highlight matches
vim.opt.hlsearch = true

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

-- Highlight terminal cursor
vim.cmd('highlight! link TermCursor Cursor')
vim.cmd('highlight! TermCursorNC guibg=red guifg=green ctermbg=1 ctermfg=15')

-- Disable cursorline in terminal buffers
vim.cmd('autocmd TermOpen term://* setlocal nocursorline')

-- Use zsh for terminal
vim.opt.shell = '/bin/zsh'

-- Set grepprg and grepformat
vim.opt.grepprg = 'rg --no-heading --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.g.gitgutter_grep_command = 'rg'

-- Set guicursor for insert mode
vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor'

-- Don't restrict jsx plugin to only .jsx files
vim.g.jsx_ext_required = 0

-- vimwiki
vim.g.vimwiki_list = {
    { path = '~/Notes/wiki/', ext = '.md' },
    { path = '~/Notes/vimwiki/' },
    { path = '~/Notes/work/', ext = '.md' }
}

vim.cmd('colorscheme gruvbox')

require('telescope').setup{
    defaults = {
        -- Other configurations
        path_display = {
            "truncate"
        },
        dynamic_preview_title = true,
    }
}

-- Set up indication for LSP status in the status line
require("fidget").setup({})
