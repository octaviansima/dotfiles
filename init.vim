set nocompatible
filetype plugin indent on
syntax on

" use case-smart searching
set ignorecase 
set smartcase

" set line numbers (and relative)
set number
set relativenumber

" eliminate delay from pressing ESC
set ttimeoutlen=0
set timeoutlen=0

" all items matching search are highlighted
set incsearch
set hlsearch
" clear highlighted items with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" cmdline history
set history=1000

" allow backspace in insert mode
set backspace=indent,eol,start

" buffers can exist in the background
set hidden

" set window title
set title

" highline the line the cursor is on
set cursorline

" intelligent indentation
set autoindent
set smartindent
" show existing tab with 2 spaces width
set tabstop=4
" when indenting with '>'
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab


call plug#begin('~/.config/nvim/plugged')
" file explorer
Plug 'scrooloose/nerdtree'
" colorscheme
Plug 'gruvbox-community/gruvbox'
" commenting
Plug 'scrooloose/nerdcommenter'
" tmux integration
Plug 'christoomey/vim-tmux-navigator'
" insert brackets/quotes etc. in pairs
Plug 'jiangmiao/auto-pairs'
" surroundings
Plug 'tpope/vim-surround'
" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" display changes in git:
Plug 'airblade/vim-gitgutter'
" tagbar for ctags
Plug 'majutsushi/tagbar'
" lighweight powerline
Plug 'itchyny/lightline.vim'
" icons
Plug 'ryanoasis/vim-devicons'
" show indents
Plug 'Yggdroot/indentLine'
" make bufferline same style as lightline
Plug 'mengelbrecht/lightline-bufferline'
" generate tmux statusline consistent with lightline
Plug 'edkolev/tmuxline.vim'
call plug#end()


" auto install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" enable syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif

set omnifunc=syntaxcomplete#Complete

" tab based completion
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"

" colorscheme & settings
set termguicolors
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" use system clipboard
set clipboard^=unnamed,unnamedplus

" enable mouse support
set mouse=a

" Automatically resize splits when resizing window
autocmd VimResized * wincmd = 

" Keep 10 lines below and above the cursor
set scrolloff=10

" Navigate in insert mode to start/end of line
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Set low update time for gitgutter
set updatetime=250

" always show bufferline
set showtabline=2

" bufferline settings
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#modified = ' [m]'
let g:lightline#bufferline#read_only = ' ⭤'
let g:lightline#bufferline#show_number = 3
let g:lightline#bufferline#unnamed = '{No Name}'
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

" lightline settings
let g:lightline = {
		\ 'colorscheme': 'gruvbox',
		\ 'active': {
		\   'left': [ [ 'mode', 'paste' ], ['relativepath'] ]
		\ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['bufnum'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
		\ 'component_function': {
		\   'fugitive': 'LightlineFugitive',
		\   'filename': 'LightlineFilename',
		\ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
		\ }

" Cycle through buffers with tab
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Close buffer without closing split using Bd
command Bd bp|bd #

" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

" open tagbar and nerdtree together with ctrl-m
nnoremap <C-m> :NERDTreeToggle <CR> :TagbarToggle <CR>

" Open fzf with ctrl-p, and ripgrep with ctrl-r
nnoremap <C-p> :Files<Cr>
nnoremap <C-r> :Rg<Cr>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Don't conceal quotes in JSON files
autocmd Filetype json
  \ let g:indentLine_setConceal = 0 |
  \ let g:vim_json_syntax_conceal = 0

" YouCompleteMe set up
let g:ycm_global_ycm_extra_conf = '/Users/octaviansima/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

