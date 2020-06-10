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
Plug 'sk1418/QFGrep'
Plug 'rizzatti/dash.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'mitsuse/autocomplete-swift'
"Plug 'Shougo/deoplete-clangx'
call plug#end()

set mouse=a

"let g:deoplete#enable_at_startup = 1
"autocmd BufNewFile,BufRead *.swift set filetype=swift
" Jump to the first placeholder by typing `<C-j>`.
"autocmd FileType swift imap <buffer> <C-j> <Plug>(autocomplete_swift_jump_to_placeholder)

let mapleader=';'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:airline_theme='light'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!

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
nnoremap <silent> <Leader>c        :call fzf#vim#files(0, fzf#vim#with_preview({'options':'--query=' . g:c_style_languages_query}))<CR>
nnoremap <silent> <Leader>ag        :Ag<CR>
nmap <Leader>e         :copen<CR> <bar> :QFGrepPat error\:<CR>

"autocmd FileType swift let b:dispatch = 'make | xcpretty --no-utf ; exit $PIPESTATUS[1]'
"autocmd FileType objc let b:dispatch =  'make | xcpretty --no-utf ; exit $PIPESTATUS[1]'
"autocmd FileType cpp let b:dispatch = 'make | xcpretty --no-utf ; exit $PIPESTATUS[1]'
"autocmd FileType objcpp let b:dispatch = 'make | xcpretty --no-utf ; exit $PIPESTATUS[1]'

map ml :Make launch<CR>:Copen<CR>
map mm :Make<CR>
map <C-A-Up> :FSH<CR>
map <C-A-Down> :FSH<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

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
