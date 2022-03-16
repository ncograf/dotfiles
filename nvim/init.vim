"Nicos Personal vimrc file created at 2021-03-08

" Install vim plug when starting vim if necessary
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" needed for merlin ( needed for ocaml what else ? )
filetype plugin on

" syntax highlighing in general
syntax on

" change the leader to space
nnoremap <space> <nop>
let mapleader = "\<space>"

" set options for changing the buffer or tab
nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>tn gt ; new tab

"############
"# provider #
"############

let g:python3_host_prog = '/sbin/python3'
let g:python_host_prog = '/sbin/python2'


"###########
"# plugins #
"###########

call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

" add windowresizer
Plug 'simeji/winresizer'

" undo tree visualizer
Plug 'simnalamburt/vim-mundo'

" make nvim and tmux compatible (in terms of pane switching)
Plug 'christoomey/vim-tmux-navigator'

" make csv more readable
Plug 'chrisbra/csv.vim'

" rasi colorsceme (for rofi config)
Plug 'Fymyte/rasi.vim'

" get colorscheme
Plug 'dylanaraps/wal.vim'

" get coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"###################
"# Plugin Settings #
"###################

" lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_indent_brace=0
let g:latex_indent_enabled=0
let g:vimtex_compiler_progname='latexmk -pdf'
let g:vimtex_view_forward_search_on_start=0
set conceallevel=1
"let g:tex_conceal='abdmg'

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<leader><tab>'
let g:UltiSnipsJumpForwardTrigger = '<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger = '<leader><s-tab>'
let g:UltiSnipsEditSplit="vertical"


" fix highlighting for latex
hi! clear Conceal

" iamcco/markdown-preview.nvim
let g:mkdp_auto_start=1
let g:mkdp_auto_close=1
let g:mkdp_refresh_slow=0

" simeji/winresizer
let g:winresizer_start_key = "<leader>w"

" simnalamburt/vim-mundo
nnoremap <leader>u :MundoToggle<cr>

" dylanaraps/wal.vim
colorscheme wal

" neoclide/coc.nvim 
source $XDG_CONFIG_HOME/nvim/coc.vim
let coc_extensions_path=$XDG_CONFIG_HOME . "/nvim/coc-extensions.txt"
let g:coc_global_extensions = readfile(coc_extensions_path)

"####################
"# General settings #
"####################

" Security
set modelines=0

" Show line numbers and relative linenumbers
set nu rnu

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set linebreak
set nolist
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noshiftround

" set status bar
source $XDG_CONFIG_HOME/nvim/status.vim


"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"  autocmd BufEnter * match OverLength /\%79v.*/
"augroup END

" Cursor motion
set scrolloff=8 " makes sure there is always a gap between the cursor and the buttom or the top of the window

" allows backspacin over the indention, end of line (i.e. join with the top line) and enable deleting before insert
set backspace=indent,eol,start 

" use % to jump between pairs
set matchpairs+=<:> 

" set the timeout lenght for keys (this is used for the jj which must be
" pressed pretty fast now (consider better-escape plugin)
:autocmd InsertEnter * set timeoutlen=200
:autocmd InsertLeave * set timeoutlen=1000

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" show the mode when it is changed (Insert, Normal, Visual)
set showmode  

" show the parial commands in the lasr row e.g. y+" when yanking to the
" clipboard (appearantly this could make the editor slower)
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap escape key (Note that capslock is mapped to Esc as well)
inoremap jj <Esc>
vnoremap jj <Esc> 

" Prevent form autoindent & in latex
let g:tex_indent_brace=0

" Mappings for Inscape Drawings
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Mapping for Image insertion
inoremap <C-a> <Esc>: exec '.!python_screenshot.py create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>

" used for the compiler design course
execute "set rtp+=/home/nico/.opam/4.06.0/share/merlin/vim"

" no swap file
set noswapfile

" save undo-trees in files 
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

"########
"# Tmux #
"########

" change the binding for horizontal split to be consistent with tmux 
nnoremap <c-w>h <c-w>s

"################
"# Clang format #
"################
function Formatonsave()
  let l:formatdiff=1
  let l:lines="all"
  pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.c call Formatonsave()

