require('cyrillic')

vim.api.nvim_set_keymap('c', '%%', '<C-R>=expand("%:h").."/"<CR>', { noremap = true, silent = true })
-- switch , and \
vim.g.mapleader = ','
vim.api.nvim_set_keymap('', '\\', ',', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>,', ',', { noremap = true })

-- clear search highlights
vim.api.nvim_set_keymap('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- easier fold toggling
vim.api.nvim_set_keymap('n', '<CR>', 'za', { noremap = true })

-- more intuitive semantics for Y
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- switch moving on real and display lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '0', 'g0', { noremap = true })
vim.api.nvim_set_keymap('n', '^', 'g^', { noremap = true })
vim.api.nvim_set_keymap('n', '$', 'g$', { noremap = true })

vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', '0', 'g0', { noremap = true })
vim.api.nvim_set_keymap('v', '^', 'g^', { noremap = true })
vim.api.nvim_set_keymap('v', '$', 'g$', { noremap = true })

vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'g0', '0', { noremap = true })
vim.api.nvim_set_keymap('n', 'g^', '^', { noremap = true })
vim.api.nvim_set_keymap('n', 'g$', '$', { noremap = true })

vim.api.nvim_set_keymap('v', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('v', 'gk', 'k', { noremap = true })
vim.api.nvim_set_keymap('v', 'g0', '0', { noremap = true })
vim.api.nvim_set_keymap('v', 'g^', '^', { noremap = true })
vim.api.nvim_set_keymap('v', 'g$', '$', { noremap = true })

-- easier window management
vim.api.nvim_set_keymap('n', '<leader>s', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':quit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':tabclose<CR>', { noremap = true })

-- easier switching between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- switch between splits
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true })

-- use esc to enter normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- send esc to the terminal
vim.api.nvim_set_keymap('t', '<C-v><Esc>', '<Esc>', { noremap = true })

-- go to alternate buffer
vim.api.nvim_set_keymap('n', '<space><space>', '<C-^>', { noremap = true })

-- filter commands when recalling
vim.api.nvim_set_keymap('c', '<C-p>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-n>', '<Down>', { noremap = true })

-- show available completions
vim.api.nvim_set_keymap('c', '<C-space>', '<C-d>', { noremap = true })

-- useful toggles
vim.api.nvim_set_keymap('', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true })

-- Debugging mappings
vim.api.nvim_set_keymap('n', '<Up>', '<Cmd>lua require"dap".continue()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Cmd>lua require"dap".step_over()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Cmd>lua require"dap".step_out()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Cmd>lua require"dap".step_into()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':Telescope dap configurations<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F9>', '<Cmd>lua require"dapui".toggle()<CR>', { silent = true })

-- Telescope LSP commands
vim.api.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gi', ':Telescope lsp_implementations<CR>', { noremap = true })

-- Copilot commands in insert mode
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-next)', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-previous)', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(copilot-accept-word)', { noremap = true })
