syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

" line nums
set nu
set rnu
set colorcolumn=79

" backup
set noswapfile
set nobackup

" search
set incsearch
set ic
set hls is

" status bar
set showcmd
set ruler
set laststatus=2

" use system clipboard
" set clipboard=unnamed "for mac
 set clipboard=unnamedplus "for linux

" autocomplition
set wildmenu

" highlight curren line
"set cursorcolumn
"set cursorline

set scrolloff=8 "stop at 8 lines before end when scrolling

set undodir=~/.vim/undodir"
set undofile

colorscheme gruvbox
set background=dark
set t_Co=256
set t_ut=

" ---- Keymaps ----
let mapleader = " " 

map <Leader>n :Lex<CR>
map <Leader>b :vertical resize 20<CR>

nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>

"nnoremap <Up> :resize +2<CR>
"nnoremap <Down> :resize -2<CR>
"nnoremap <Left> :vertical resize +2<CR>
"nnoremap <Right> :vertical resize -2<CR>

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
