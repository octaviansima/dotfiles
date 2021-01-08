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


" plugins start
call plug#begin('~/.config/nvim/plugged')
" file explorer
Plug 'scrooloose/nerdtree'
" colorscheme
" Plug 'icymind/NeoSolarized'
Plug 'gruvbox-community/gruvbox'
" commenting
Plug 'scrooloose/nerdcommenter'
" tmux integration
Plug 'christoomey/vim-tmux-navigator'
" insert brackets/quotes etc. in pairs
Plug 'jiangmiao/auto-pairs'
" Sublime's multiple selection
Plug 'terryma/vim-multiple-cursors'
" surroundings
Plug 'tpope/vim-surround'
" Completion 
Plug 'ycm-core/YouCompleteMe'
" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" Display changes in git:
Plug 'airblade/vim-gitgutter'
" Tagbar for ctags
Plug 'majutsushi/tagbar'
" lighweight powerline
Plug 'itchyny/lightline.vim'
" icons for stuff
Plug 'ryanoasis/vim-devicons'
" Show indents
Plug 'Yggdroot/indentLine'
" Make bufferline same style as lightline
Plug 'mengelbrecht/lightline-bufferline'
" For tmux/lightline integration
Plug 'edkolev/tmuxline.vim'
" plugins end
call plug#end()


" Auto install plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" enable syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif


set omnifunc=syntaxcomplete#Complete

" Tab based completion
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"

" colorscheme & settings
set termguicolors
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" use System Clipboard:
set clipboard^=unnamed,unnamedplus

" enable mouse support
set mouse=a

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q

" Open splits on the right and below
set splitbelow
set splitright

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
let g:lightline#bufferline#unnamed = '[No Name]'
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

let g:vimtex_view_method = 'skim'
let g:vimtex_complete_enabled = 1

" Use ripgrep for cltrp
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0

" Enable spell checking for text files
autocmd FileType text,markdown,html,tex set spell

" open tagbar and nerdtree together with ctrl-m
nnoremap <C-m> :NERDTreeToggle <CR> :TagbarToggle <CR>

" YouCompleteMe set up
let g:ycm_global_ycm_extra_conf = '/Users/octaviansima/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

