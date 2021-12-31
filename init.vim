"""Vim-Plug"""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
" Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'

call plug#end()

"""Setting"""""""""""""""""""""""""""""""""""""""
" set timeoutlen=1000 ttimeoutlen=0 "VIM ONLY --No delay switching modes--
"--Sessions--
" autocmd! VimLeave * mksession
" autocmd! VimEnter * source ~/Session.vim
"--Folding--
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview"
" set foldmethod=syntax "syntax highlighting items specify folds *SLOW
" set foldcolumn=1 "defines 1 col at window left, to indicate folding
" let javaScript_fold=1 "activate folding by JS syntax
" set foldlevelstart=99 "start file with all folds opened

"--Others--
" set nu rnu
" set nu

"--Experimentals-- gitgutter
set updatetime=250

colorscheme one

set termguicolors
set signcolumn=yes
set noshowmode
set laststatus=2
set noswapfile
filetype plugin indent on
set number relativenumber
autocmd InsertEnter,InsertLeave * set cul! "Insert Cursor Highlingting"
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search (highlight during search)
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)
set nohlsearch
set splitright
set splitbelow

"--Cursors--
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"--Indentation--
set shiftwidth=2
set expandtab
" set tabstop=4
" set list  "Indent Guide
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

"""MAPPINGS""""""""""""""""""""""""""""""""""""""""
"map space to leader
nnoremap <Space> <Nop>
let mapleader = "\<Space>" 
noremap <leader><leader> :set hlsearch! hlsearch?<CR>
inoremap jk <esc>

"session
map <F10> :mks! ~/.config/nvim/session.vim<CR>
map <F12> :source ~/.config/nvim/session.vim<CR>

"select all
nmap <C-a> gg<S-v><S-g>

"scrolling
nnoremap <C-j> }
nnoremap <C-k> {

"line navigation
nnoremap B ^
nnoremap E $

"---windows management----------
map <C-w> :q!<CR>
map <C-s> :w<CR>
map <C-\> :vnew<CR>
map <C-n> :new<CR>

"switch between windows
nnoremap <A-w> <C-w>w
inoremap <A-w> <C-\><C-N><C-w>w
tnoremap <A-w> <C-\><C-N><C-w>w

"move windows
nnoremap <C-A-h> <C-w>H
nnoremap <C-A-j> <C-w>J
nnoremap <C-A-k> <C-w>K
nnoremap <C-A-l> <C-w>L
tnoremap <C-A-h> <C-\><C-N><C-w>H
tnoremap <C-A-j> <C-\><C-N><C-w>J
tnoremap <C-A-k> <C-\><C-N><C-w>K
tnoremap <C-A-l> <C-\><C-N><C-w>L
inoremap <C-A-h> <C-\><C-N><C-w>H
inoremap <C-A-j> <C-\><C-N><C-w>J
inoremap <C-A-k> <C-\><C-N><C-w>K
inoremap <C-A-l> <C-\><C-N><C-w>L

"moving cursor insert mode
inoremap <A-h> <C-\><C-N>ha
inoremap <A-j> <C-\><C-N>ja
inoremap <A-k> <C-\><C-N>ka
inoremap <A-l> <C-\><C-N>la

"resize windows
nnoremap <A-h> :vertical resize -5<CR>
nnoremap <A-j> :res -2<CR>
nnoremap <A-k> :res +2<CR>
nnoremap <A-l> :vertical resize +5<CR>
tnoremap <A-h> :vertical resize -5<CR>
tnoremap <A-j> :res -2<CR>
tnoremap <A-k> :res +2<CR>
tnoremap <A-l> :vertical resize +5<CR>

"---plugins mapping----------
"gitgutter
map <F9> :GitGutterToggle<CR>
"nerdtree
nnoremap <silent> <F1> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :NERDTreeFind<CR>

"fzf
map <C-f> :Files<CR>
map <C-b> :Buffers<CR>
map <C-h> :History<CR>
map <C-l> :Lines<CR>
map <C-m> :Marks<CR>
map <C-e> :Tags<CR>

"--SuperTab--
let g:SuperTabDefaultCompletionType = "<c-n>"

"--ALE--
nmap <leader>f :ALEFix<CR>
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>j <Plug>(ale_next_wrap)

""""PLUGINS SETTING""""""""""""""""""""""""""""""""""""""""
"gitgutter
let g:gitgutter_enabled = 0
"ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

"lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
"fzf
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""NVIM""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
"--Mapping--
tnoremap jk <C-\><C-n>
"--Terminal
" map <leader>t :vsplit term://fish<CR>
" map <leader>y :split term://fish<CR>
map <C-c> :terminal<CR>
