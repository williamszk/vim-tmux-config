

set nu 
set rnu
colorscheme torte
colorscheme slate

" Better than doing Esc to enter insert mode
inoremap kj <Esc>

" Not sure if this is still relevant
set clipboard=unnamedplus


" Easier to change tabs inside VIM not TMUX
nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>

" This is good to use with tmux
" Ctrl+n will send selection or line to the terminal
" in another pane
map <C-n> :SlimuxREPLSendLine<CR>
vmap <C-n> :SlimuxREPLSendSelection<CR>


" show existing tab with 4 spaces width
set tabstop=4 

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Don't make noise when error
" Check if this is relevant in linux too
set visualbell

" Make space around cursor
set scrolloff=10


" Inside _ideavimrc
" My personal configuration

set nu

set tabstop=4

" Don't make noise when error
set visualbell

set rnu

colorscheme slate

" Better than doing Esc to enter insert mode
inoremap kj <Esc>

" Easier to change tabs
nnoremap <C-j> :tabprev<CR>
nnoremap <C-k> :tabnext<CR>

" Make space around cursor
set scrolloff=10

" _ideavimrc easymotion
Plug 'easymotion/vim-easymotion'
let mapleader=","
set easymotion












