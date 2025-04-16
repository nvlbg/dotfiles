require('cyrillic')

vim.keymap.set('c', '%%', '<C-R>=expand("%:h").."/"<CR>', { silent = true })
-- switch , and \
vim.g.mapleader = ','
vim.keymap.set('', '\\', ',')
vim.keymap.set('n', '<leader>,', ',')

-- clear search highlights
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { silent = true })

-- easier fold toggling
vim.keymap.set('n', '<CR>', 'za')

-- more intuitive semantics for Y
vim.keymap.set('n', 'Y', 'y$')

-- switch moving on real and display lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '0', 'g0')
vim.keymap.set('n', '^', 'g^')
vim.keymap.set('n', '$', 'g$')

vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')
vim.keymap.set('v', '0', 'g0')
vim.keymap.set('v', '^', 'g^')
vim.keymap.set('v', '$', 'g$')

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('n', 'g0', '0')
vim.keymap.set('n', 'g^', '^')
vim.keymap.set('n', 'g$', '$')

vim.keymap.set('v', 'gj', 'j')
vim.keymap.set('v', 'gk', 'k')
vim.keymap.set('v', 'g0', '0')
vim.keymap.set('v', 'g^', '^')
vim.keymap.set('v', 'g$', '$')

-- easier window management
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>n', ':tabnew<CR>')
vim.keymap.set('n', '<leader>x', ':tabclose<CR>')

-- easier switching between splits
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- use esc to enter normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
-- send esc to the terminal
vim.keymap.set('t', '<C-v><Esc>', '<Esc>')

-- go to alternate buffer
vim.keymap.set('n', '<space><space>', '<C-^>')

-- filter commands when recalling
vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- show available completions
vim.keymap.set('c', '<C-space>', '<C-d>')

vim.keymap.set('n', 'L', ':lua vim.diagnostic.open_float()<CR>')
