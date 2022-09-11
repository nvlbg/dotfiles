if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

 " file management and navigation
 Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'

 " git
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'

 " languages
 Plug 'rust-lang/rust.vim'
 Plug 'elixir-lang/vim-elixir'
 Plug 'pangloss/vim-javascript'
 Plug 'jodosha/vim-godebug'
 Plug 'mxw/vim-jsx'
 Plug 'solarnz/thrift.vim'
 Plug 'uarun/vim-protobuf'
 Plug 'gurpreetatwal/vim-avro'
 Plug 'pallets/jinja'
 Plug 'jeetsukumaran/vim-pythonsense'
 Plug 'kernel-panic96/vim-go-extensions'
 Plug 'jparise/vim-graphql'

 " color schemes
 Plug 'altercation/vim-colors-solarized'
 Plug 'morhetz/gruvbox'

 " testing
 Plug 'janko-m/vim-test'
 Plug 'tpope/vim-dispatch'

 " debugging
 Plug 'sebdah/vim-delve'

 " linting and code completion
 " Plug 'w0rp/ale'
 Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
 Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

 " other
 Plug 'tpope/vim-unimpaired'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-surround'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'jiangmiao/auto-pairs'
 Plug 'thinca/vim-visualstar'
 Plug 'vim-scripts/argtextobj.vim'
 Plug 'vimwiki/vimwiki'
 Plug 'chrisbra/csv.vim'

call plug#end()

" disable vi compatibility
set nocompatible

" start filetype detection (with indentation and plugin support)
filetype plugin indent on

" enable matchit pligin
runtime macros/matchit.vim

syntax enable
let g:airline_theme='base16'
source ~/.config/nvim/colours.vim
source ~/.config/nvim/cyrillic.vim

set tabstop=4     " tabs appear as 4 chars
set softtabstop=4 " insert 4 spaces for tabs
set shiftwidth=4  " insert 4 spaces when shifting
set expandtab     " convert tabs to spaces

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

set number     " show line numbers
set autoindent " indent new lines based on previous ones
set ruler      " always display cursor position in low right corner
set showcmd    " display incomplete commands in low right corner
set cursorline " highlight current line

set hidden

set smartcase
set incsearch " display matches while typying
set hlsearch  " highlight matches
set showmatch " highlight matching parentheses

set scrolloff=6   " scroll before cursor hits bottom line
set showtabline=2 " always show tab line

set updatetime=250
set timeoutlen=250

set mouse=a " enable mouse support

cnoremap %% <C-R>=expand('%:h').'/'<cr>
" switch , and \
let mapleader=","
noremap \ ,
nnoremap <leader>, ,

" clear search highlights
nnoremap <leader><space> :nohlsearch<cr>

" easier fold toggling
nnoremap <Enter> za

" more intuitive semantics for Y
map Y y$

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

inoremap ;p import pdb; pdb.set_trace()
inoremap ;i import ipdb; ipdb.set_trace()

if has('nvim')
    " switch between splits
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " use esc to enter normal mode in terminal
    tnoremap <Esc> <C-\><C-n>
    " send esc to the terminal
    tnoremap <C-v><Esc> <Esc>

    " highlight terminal cursor
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=green ctermbg=1 ctermfg=15

    " disable cursorline in terminal buffers so the above highlight is always
    " visible
    autocmd TermOpen term://* setlocal nocursorline

    " use zsh for terminal
    set shell=/bin/zsh
endif

" go to alternate buffer
nnoremap <space><space> <C-^>

" filter commands when recalling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" show available completions
cnoremap <C-space> <C-d>

" useful toggles
map <C-p> :FZF<cr>
map <C-n> :NERDTreeToggle<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_tags_command = 'ctags -R'

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

set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m,%f:%l:%m
let g:gitgutter_grep_command = 'rg'

" makes cursor to appear as a | in insert mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" automatically reload this config on change
" autocmd BufWritePost init.vim source $MYVIMRC

" don't restrict jsx plugin to only .jsx files
let g:jsx_ext_required = 0

" custom test preferences
let test#strategy = "neovim"
function! BedrockTransform(cmd) abort
  let l:first_transform = substitute(a:cmd, '"test/\*\*/\*\.js"', 'dist-test/test/*/index.js', '')
  let l:second_transform = substitute(l:first_transform, 'src/', 'dist-test/', '')
  return 'NODE_ENV=test '.l:second_transform.' | ./node_modules/.bin/tap-spec'
endfunction

let g:test#custom_transformations = {'bedrock': function('BedrockTransform')}
autocmd BufEnter * unlet! g:test#transformation
autocmd BufEnter *.js let g:test#transformation = 'bedrock'
let g:test#python#pytest#executable = 'vim_test_runner_helper'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nmap <silent> <leader>c :GoCoverage<CR>

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>

" enable code folding for javascript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set foldnestmax=3
set foldlevel=20

" use .. to go to parent directory,
" but only for buffers containing git blob or tree
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=menu

" LanguageClient-neovim
let g:LanguageClient_preferredMarkupKind = ['plaintext', 'markdown']
let g:LanguageClient_rootMarkers = {
    \ 'go': ['main.go']
    \ }
let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'python': ['pyls']
    \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <C-]> :call MyGoToDefinition()<CR>
    nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <silent> gm :call LanguageClient_contextMenu()<CR>
    nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

function! MyGoToDefinition(...) abort
  " ref: https://github.com/davidhalter/jedi-vim/blob/master/pythonx/jedi_vim.py#L329-L345

  " Get the current position
  let pos = {
          \ 'fname': expand('%:p'),
          \ 'line': line("."),
          \ 'col': col("."),
          \ 'word': expand("<cword>")
          \ }

  call LanguageClient#textDocument_definition({'handle': v:true}, function('MyGoToDefinitionCallback', [pos]))
endfunction

function! MyGoToDefinitionCallback(pos, ...) abort
  " Get the original position
  let l:fname = a:pos['fname']
  let l:line = a:pos['line']
  let l:col = a:pos['col']
  let l:word = a:pos['word']

  " Get the position of definition
  let l:jump_fname = expand('%:p')
  let l:jump_line = line(".")
  let l:jump_col = col(".")

  " If the position is the same as previous, ignore the jump action
  if l:fname == l:jump_fname && l:line == l:jump_line
    return
  endif

  " Workaround: Jump to origial file. If the function is in rust, there is a
  " way to ignore the behaviour
  if &modified
    exec 'hide edit'  l:fname
  else
    exec 'edit' l:fname
  endif
  call cursor(l:line, l:col)

  " Write a temp tags file
  let l:temp_tags_fname = tempname()
  let l:temp_tags_content = printf("%s\t%s\t%s", l:word, l:jump_fname,
      \ printf("call cursor(%d, %d)", l:jump_line, l:jump_col))
  call writefile([l:temp_tags_content], l:temp_tags_fname)

  " Store the original setting
  let l:ori_wildignore = &wildignore
  let l:ori_tags = &tags

  " Set temporary new setting
  set wildignore=
  let &tags = l:temp_tags_fname

  " Add to new stack
  execute ":tjump " . l:word

  " Restore original setting
  let &tags = l:ori_tags
  let &wildignore = l:ori_wildignore

  " Remove temporary file
  if filereadable(l:temp_tags_fname)
    call delete(l:temp_tags_fname, "rf")
  endif
endfunction

autocmd FileType * call LC_maps()

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" clipboard synchronization
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction

augroup Yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
augroup END

function! GetSourcegraphURL(config) abort
    if a:config['remote'] =~ "^gitolite@code.uber.internal"
        let repository = substitute(matchstr(a:config['remote'], 'code.uber.internal.*'), ':', '/', '')
        let commit = a:config['commit']
        let path = a:config['path']

        let url = printf("https://sourcegraph.uberinternal.com/%s@%s/-/blob/%s",
            \ repository,
            \ commit,
            \ path)

        let fromLine = a:config['line1']
        let toLine = a:config['line2']
        if fromLine > 0 && fromLine == toLine
            let url .= '#L' . fromLine
        elseif toLine > 0
            let url .= '#L' . fromLine . '-' . toLine
        endif

        " copy url to clipboard as well
        let buffer=system('base64 -w0', url)
        let buffer=substitute(buffer, "\n$", "", "")
        let buffer='\e]52;c;'.buffer.'\x07'
        silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)

        return url
    endif
    return ''
endfunction

if !exists('g:fugitive_browse_handlers')
    let g:fugitive_browse_handlers = []
endif

if index(g:fugitive_browse_handlers, function('GetSourcegraphURL')) < 0
    call insert(g:fugitive_browse_handlers, function('GetSourcegraphURL'))
endif
