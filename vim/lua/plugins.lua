local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- file management and navigation
Plug('scrooloose/nerdtree', { ['on'] = 'NERDTreeToggle' })
Plug('Xuyuanp/nerdtree-git-plugin', { ['on'] = 'NERDTreeToggle' })
Plug('nvim-lua/plenary.nvim') -- required for telescope
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })

-- git
Plug('airblade/vim-gitgutter')
Plug('tpope/vim-fugitive')

-- languages
Plug('rust-lang/rust.vim')
Plug('elixir-lang/vim-elixir')
Plug('pangloss/vim-javascript')
Plug('mxw/vim-jsx')
Plug('solarnz/thrift.vim')
Plug('uarun/vim-protobuf')
Plug('gurpreetatwal/vim-avro')
Plug('pallets/jinja')
Plug('jeetsukumaran/vim-pythonsense')
Plug('jparise/vim-graphql')
Plug('j-hui/fidget.nvim', { ['tag'] = 'legacy' })
Plug('creativenull/efmls-configs-nvim', { ['branch'] = 'main' })

-- color schemes
Plug('altercation/vim-colors-solarized')
Plug('morhetz/gruvbox')

-- testing
Plug('janko-m/vim-test')
Plug('tpope/vim-dispatch')

-- debugging
Plug('sebdah/vim-delve')
Plug('mfussenegger/nvim-dap')
Plug('nvim-neotest/nvim-nio')
Plug('folke/neodev.nvim')
Plug('rcarriga/nvim-dap-ui')
Plug('nvim-telescope/telescope-dap.nvim')
Plug('mfussenegger/nvim-dap-python')

-- linting and code completion
Plug('neovim/nvim-lspconfig')

-- other
Plug('tpope/vim-unimpaired')
Plug('tpope/vim-commentary')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('jiangmiao/auto-pairs')
Plug('thinca/vim-visualstar')
Plug('vim-scripts/argtextobj.vim')
Plug('vimwiki/vimwiki')
Plug('chrisbra/csv.vim')
Plug('github/copilot.vim')
Plug('ojroques/nvim-osc52')

vim.call('plug#end')
