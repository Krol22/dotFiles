""""""""""""
" VIM_PLUG "
""""""""""""
call plug#begin ('~/.vim/plugged')

Plug 'neomake/neomake',
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'c0r73x/neotags.nvim', 
Plug 'airblade/vim-gitgutter',
" Plug 'arakashic/chromatica.nvim', NOT WORKING YET
" Other solutions working like shit or not working at all

Plug 'Raimondi/delimitMate',
Plug 'pangloss/vim-javascript',
Plug 'Xuyuanp/nerdtree-git-plugin',
Plug 'MarcWeber/vim-addon-mw-utils',
Plug 'tomtom/tlib_vim',
Plug 'garbas/vim-snipmate',
Plug 'honza/vim-snippets',
Plug 'terryma/vim-multiple-cursors',
Plug 'Yggdroot/indentLine',

Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'

call plug#end()

colorscheme monokai
"let g:gruvbox_italic = 1

set number
set relativenumber
set tabstop=2 expandtab shiftwidth=2 
set formatoptions-=cro

syntax enable

let mapleader = ","

autocmd vimenter * NERDTree
imap <F3> <c-[> :NERDTreeToggle<CR>
vmap <F3> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 0

"""""""""""""""""""
" BASIC SHORTCUTS "
"""""""""""""""""""

nmap <silent> <C-h> :winc h<CR>
nmap <silent> <C-j> :winc j<CR>
nmap <silent> <C-k> :winc k<CR>
nmap <silent> <C-l> :winc l<CR>

nmap <silent> <C-q> :q <CR>
nmap <silent> <C-s> :w <CR>

imap <C-J> <Plug>snipMateNextOrTrigger

"""""""""""
" NEOMAKE "
"""""""""""

" Config

autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

" Linters

let g:neomake_javascript_jshint_maker = {
  \ 'args': ['--verbose'],
  \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
  \ }

let g:neomake_javascript_enabled_makers = ['jshint']

""""""""""""""
" OTHER SHIT "
""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:tigris#enabled = 1
let g:indentLine_char = '|'
