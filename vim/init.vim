call plug#begin('~/.local/share/nvim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-unimpaired'
" Plug 'bling/vim-airline'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'airblade/vim-gitgutter'
" Plug 'valloric/youcompleteme'
 Plug 'rust-lang/rust.vim'
 Plug 'elixir-lang/vim-elixir'
 Plug 'altercation/vim-colors-solarized'
 Plug 'vim-scripts/matchit.zip'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'janko-m/vim-test'
 Plug 'tpope/vim-dispatch'
 Plug 'pangloss/vim-javascript'
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-commentary'
 Plug 'w0rp/ale'

call plug#end()

" disable vi compatibility
set nocompatible

" start filetype detection (with indentation and plugin support)
filetype plugin indent on

syntax enable
colorscheme solarized
set background=dark
let g:airline_theme='dark'
" number lines
set number

" tabs appear as 4 chars
set tabstop=4
" insert 4 spaces for tabs
set softtabstop=4
" insert 4 spaces when shifting
set shiftwidth=4
" convert tabs to spaces
set expandtab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" indent new lines based on previous ones
set autoindent
" always display cursor position in low right corner
set ruler
" display incomplete commands in low right corner
set showcmd

set hidden

set smartcase
" display matches while typying
set incsearch
" highlight matches
set hlsearch
set showmatch
set gdefault

" scroll before cursor hits bottom line
set so=6

" always show tab line
set showtabline=2

let mapleader=","

nnoremap <F5> :so $MYVIMRC<cr>
nnoremap <leader><space> :noh<cr>

" switch moving on real and display lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$

vnoremap j gj
vnoremap k gk
vnoremap 0 g0
vnoremap ^ g^
vnoremap $ g$

nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap g^ ^
nnoremap g$ $

vnoremap gj j
vnoremap gk k
vnoremap g0 0
vnoremap g^ ^
vnoremap g$ $

" easier window management
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>x :tabclose<cr>

" easier switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" go to alternate buffer
nnoremap <C-space> <C-^>

" disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" use esc to enter normal mode in terminal
tnoremap <Esc> <C-\><C-n>

map <C-p> :FZF<cr>

map <C-n> :NERDTreeToggle<cr>

" auto refresh nerdtree for new files
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set grepprg=rg\ --vimgrep

" makes cursor to appear as a | in insert mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

