" Disable vi compatible mode
set nocompatible

" =============================================
" Plugins
" =============================================

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" nerdtree
nnoremap <C-n> :NERDTree<CR>

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

" Open new split panes to right
set splitright

" Open new split panes to bottom
set splitbelow

" Show command in bottom bar
set showcmd

" Highlight current line
" set cursorline

" Enable filetype detection
filetype plugin indent on

set autoindent

" Colorscheme
colorscheme gruvbox
set background=dark

" Jump to start and end of line using the home row keys
map H ^
map L $

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Try to prevent bad habits like using the arrow keys for movement.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
