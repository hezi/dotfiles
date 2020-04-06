call plug#begin()
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'endel/vim-github-colorscheme'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'derekwyatt/vim-fswitch'
Plug '~/swift/utils/vim'
call plug#end()

set mouse=a

let mapleader=';'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:airline_theme='dark'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" airling symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let c_style_languages_query = '"m$ | c$ | cpp$ | h$ | swift$ "'

nnoremap <silent> <Leader>l         :Lines<CR>
nnoremap <silent> <Leader>f         :Files<CR>
nnoremap <silent> <Leader>fc        :call fzf#vim#files(0, fzf#vim#with_preview({'options':'--query=' . g:c_style_languages_query}))<CR>
nnoremap <silent> <Leader>ag        :Ag<CR>

map ml :Make launch<CR>
map mm :Make<CR>
map <C-A-Up> :FSH<CR>
map <C-A-Down> :FSH<CR>

highlight VertSplit cterm=NONE

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Clipboard {{{
set clipboard+=unnamedplus
" }}} Clipboard

" UI Config {{{
set hidden
set number                   " show line number
set showcmd                  " show command in bottom bar
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
set nobackup
set noswapfile
" }}} UI Config

" NERDTree mappings {{{
map <C-n> :NERDTreeToggle<CR>
" }}}
