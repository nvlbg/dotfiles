call plug#begin('~/.local/share/nvim/plugged')

 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-unimpaired'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'airblade/vim-gitgutter'
 Plug 'rust-lang/rust.vim'
 Plug 'elixir-lang/vim-elixir'
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'solarnz/thrift.vim'
 Plug 'altercation/vim-colors-solarized'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'janko-m/vim-test'
 Plug 'tpope/vim-dispatch'
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-surround'
 Plug 'w0rp/ale'
 Plug 'thinca/vim-visualstar'

call plug#end()

" disable vi compatibility
set nocompatible

" start filetype detection (with indentation and plugin support)
filetype plugin indent on

" enable matchit pligin
runtime macros/matchit.vim

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

" switch , and \
let mapleader=","
noremap \ ,
nnoremap <leader>, ,

nnoremap <leader><space> :nohlsearch<cr>

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
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>x :tabclose<cr>

" easier switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" go to alternate buffer
nnoremap <space><space> <C-^>

" filter commands when recalling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" show available completions
cnoremap <C-space> <C-d>

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

let NERDTreeHijackNetrw=1

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

" if has("autocmd")
"     autocmd BufWritePost init.vim source $MYVIMRC
" endif

" don't restrict jsx plugin to only .jsx files
let g:jsx_ext_required = 0

" custom test preferences
let test#strategy = "neovim"
function! BedrockTransform(cmd) abort
  let l:first_transform = substitute(a:cmd, "\\\"test/\\\*\\\*/\\\*\\\.js\\\"", "dist-test/test/*/index.js", "")
  let l:second_transform = substitute(l:first_transform, "src/", "dist-test/", "")
  return 'NODE_ENV=test '.l:second_transform.' | ./node_modules/.bin/tap-spec'
endfunction

let g:test#custom_transformations = {'bedrock': function('BedrockTransform')}
let g:test#transformation = 'bedrock'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

