" Disable vi compatible mode
set nocompatible

" =============================================
" Editor Settings
" =============================================

" Turn on syntax highlighting
syntax on

" Disable the default Vim startup message
set shortmess+=I

" Show line numbers
set number

" Show relative number
set relativenumber

" Always show the status line at the bottom
set laststatus=2

" Avoid ESC delay
set timeoutlen=1000 ttimeoutlen=0

" Make backspace behave more reasonably
set backspace=indent,eol,start

" Allow hidden buffers
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter
set incsearch

" Unbind some useless/annoying default key bindings
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying
set noerrorbells visualbell t_vb=

" Enable mouse support,it can sometimes be convenient
set mouse+=a

" Use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Open new split panes to right
set splitright

" Open new split panes to bottom
set splitbelow

" Remap esc to kj and jk
imap kj <Esc>
imap jk <Esc>

" Leader is space
let mapleader="\<Space>"

" Quick-save
nmap <leader>w :w<CR>

" Quick-exit
nmap <leader>q :q<CR>

" Resize windows
noremap <C-w>K :resize +10<CR>
noremap <C-w>J :resize -10<CR>
noremap <C-w>L :vertical:resize -10<CR>
noremap <C-w>H :vertical:resize +10<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show command in bottom bar
set showcmd

set scrolloff=8

" Enable colorcolumn
set colorcolumn=80

" Rust colorcolumn
au FileType rust set colorcolumn=100

" Switch ; to add ; at end of line
nnoremap ; A;<esc>

" Switch a with A
nnoremap a A

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Use F2 to toggle paste mode
set pastetoggle=<F2>

" Enable filetype detection
filetype plugin indent on

set autoindent

set background=dark

" Jump to start and end of line using the home row keys
map H ^
map L $

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move lines
nmap J :m +1<CR>==
nmap K :m -2<CR>==
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Move by line
nnoremap j gj
nnoremap k gk

" Try to prevent bad habits like using the arrow keys for movement.
" Do this in normal mode...
"nnoremap <Left>  :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
