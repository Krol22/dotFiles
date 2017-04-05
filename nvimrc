""""""""""""
" VIM_PLUG "
""""""""""""
call plug#begin ('~/.vim/plugged')

" apperance
Plug 'morhetz/gruvbox',
Plug 'vim-airline/vim-airline',
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-startify'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',{ 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

" frontend development
Plug 'c0r73x/neotags.nvim',
Plug 'pangloss/vim-javascript',
Plug 'tomtom/tlib_vim',
Plug 'terryma/vim-multiple-cursors',
Plug 'othree/javascript-libraries-syntax.vim',
Plug 'leafgarland/typescript-vim',
Plug 'burnettk/vim-angular',
Plug 'Chiel92/vim-autoformat',
Plug 'digitaltoad/vim-pug',

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" utils
Plug 'Raimondi/delimitMate',
Plug 'neomake/neomake',
Plug 'Yggdroot/indentLine',
Plug 'MarcWeber/vim-addon-mw-utils',
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' },
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Basic Configuration

let mapleader = ","

set number
set relativenumber
set tabstop=2 expandtab shiftwidth=2
set formatoptions-=cro
set encoding=utf8

set t_Co=256

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

syntax on

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Launch NerdTree on startup && bind key 

" autocmd vimenter * NERDTree
imap <F3> <c-[> :NERDTreeToggle<CR>
vmap <F3> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 0

"""""""""""""""""""
" KEYS MAPPING    "
"""""""""""""""""""

nmap <silent> <C-h> :winc h<CR>
nmap <silent> <C-j> :winc j<CR>
nmap <silent> <C-k> :winc k<CR>
nmap <silent> <C-l> :winc l<CR>

nmap <silent> tn :tabnew<Space>
nmap <silent> tk :tabnext<CR>
nmap <silent> tj :tabprev<CR>

nmap <silent> <C-q> :q <CR>
nmap <silent> <C-s> :w <CR>

nnoremap <leader>t :vsplit +terminal<CR>
tnoremap <esc> <c-\><c-n>

" imap <C-J> <Plug>snipMateNextOrTrigger

" change background color

map <Leader>bg :let &background = ( &background == "dark" ? "light" : "dark") <CR>

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

let g:neomake_javascript_enabled_makers = ['eslint']

""""""""""""""
" OTHER SHIT "
""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:tigris#enabled = 1
let g:indentLine_char = '|'
let g:used_javascript_libs = 'angularjs, jasmine, angularui, angularuirouter, jquery'

""""""""""""""""""""""
" NERDTREE HIGHLIGTHS "
"""""""""""""""""""""""

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

function! NERDTreeAddColors()
  call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('ts', 'Brown', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('java', 'Magenta', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('txt', 'Gray', 'none', '#686868', '#151515')
  call NERDTreeHighlightFile('pdf', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('vim', 'green', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('sh', 'green', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('png', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('jpg', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('bmp', 'blue', 'none', '#3366FF', '#151515')

  if $background=='dark' 
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('xml', 'yellow', 'none', 'yellow', '#151515')
  endif
endfunction

call NERDTreeAddColors()
