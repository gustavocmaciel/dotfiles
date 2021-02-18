" Disable vi compatible mode
set nocompatible

" =============================================
" Plugins
" =============================================

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden=1

" nerdtree
nnoremap <C-n> :NERDTree<CR>
let NERDTreeShowHidden=1
let NERDTreeMapUpdir='..'
let NERDTreeMapOpenSplit='h'
let NERDTreeMapOpenVSplit='v'

" lightline
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitstatus', 'gitbranch' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitstatus': 'GitStatus'
      \ },
      \ }

" gitgutter
set updatetime=100
set signcolumn=yes

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" coc

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :  "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
         execute 'h '.expand('<cword>')
    else
         call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

" Highlight current line
" set cursorline

" Enable filetype detection
filetype plugin indent on

set autoindent

" Colorscheme
colorscheme gruvbox
set background=dark

" git gutter highlight
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=10
highlight GitGutterChange guifg=#bbbb00 ctermfg=11
highlight GitGutterDelete guifg=#ff2222 ctermfg=9
highlight GitGutterChangeDelete ctermfg=107
highlight diffAdded ctermfg=107
highlight diffRemoved ctermfg=9

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
