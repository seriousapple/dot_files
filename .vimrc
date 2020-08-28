syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set backspace=indent,eol,start
" line nums
set nu
set rnu
set colorcolumn=79
" backup
set noswapfile
set nobackup
set incsearch
" status bar
set showcmd
set ruler
set laststatus=2
" use system clipboard
set clipboard=unnamed
" autocomplition
set wildmenu

colorscheme gruvbox
set background=dark

" ---- Keymaps ----

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
