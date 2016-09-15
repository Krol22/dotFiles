set nocompatible
filetype off

autocmd VimEnter * :OpenSession

syntax on

if has('gui_running')
    set guicursor+=a:blinkon0       " Cursor doesn't blink - it's annoying
    set guioptions-=m               " No Menubar
    set guioptions-=T               " No Toolbar
    set guioptions-=l               " No Scrollbar left
    set guioptions-=L               " No Scrollbar left when split
    set guioptions-=r               " No Scrollbar right
    set guioptions-=e

    set encoding=utf8

    set guifont=Liberation\ Mono\ 10

    set laststatus=2                " always show statusline
   
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <C-r><C-o>+

    colorscheme cyberpunk
endif

set number
set relativenumber

set tabstop=2 expandtab shiftwidth=2   

set rtp+=~/.vim/bundle/Vundle.vim

let mapleader = ","
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'Raimondi/delimitMate'
  Plugin 'Yggdroot/indentLine'
  Plugin 'scrooloose/syntastic'
  Plugin 'pangloss/vim-javascript'
  Plugin 'elzr/vim-json'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'honza/vim-snippets'
  Plugin 'digitaltoad/vim-pug'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tpope/vim-surround'
  Plugin 'Shougo/neocomplcache.vim'
  Plugin 'Shougo/neosnippet'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'

call vundle#end()

filetype plugin indent on
set noswapfile

autocmd vimenter * NERDTree
imap <F3> <c-[> :NERDTreeToggle<CR>
vmap <F3> :NERDTreeToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
imap <C-space> <C-x><C-o>

set hlsearch
set laststatus=2
set incsearch

set autoindent

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap <leader>b :Buffers<CR>

command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
nnoremap <silent> <C-t> :call NumberToggle()<CR>
let g:mta_filetypes = {
   \ 'html' : 1,
   \ 'xhtml' : 1,
   \ 'xml' : 1,
   \ 'jinja' : 1,
   \ 'jsp' : 1,
   \}

nmap <silent> <C-h> :winc h<CR>
nmap <silent> <C-j> :winc j<CR>
nmap <silent> <C-k> :winc k<CR>
nmap <silent> <C-l> :winc l<CR>

function! NumberToggle()
    if(&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunc

let g:indentLine_char = '|'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_jshint = 1

" imap <C-J> <Plug>snipMateNextOrTrigger
nnoremap <C-q> :q<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:neocomplcache_enable_at_startup = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

 let g:neosnippet#disable_runtime_snippets = {
         \   '_' : 1,
         \ }

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

let g:session_autosave = 'yes'

let g:vim_json_syntax_conceal = 0
