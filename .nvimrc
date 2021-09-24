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

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
Plug 'lervag/vimtex'

" Initialize plugin system
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_indent_brace=0
let g:latex_indent_enabled=0
let g:vimtex_compiler_progname='latexmk -pdf'
let g:vimtex_view_forward_search_on_start=0
set conceallevel=1
"let g:tex_conceal='abdmg'

" This is for the auto completition
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()


" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1


" Settings for  vim-tex plugin

" Security
set modelines=0

" Show line numbers
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround


"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"  autocmd BufEnter * match OverLength /\%79v.*/
"augroup END

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Status bar
set laststatus=2

" Last line
set showmode
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

" Remap escape key
inoremap jj <Esc>
vnoremap jj <Esc> 

" Prevent form autoindent & in latex
let g:tex_indent_brace=0

" Mappings for Inscape Drawings
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Mapping for Image insertion
inoremap <C-a> <Esc>: exec '.!python_screenshot.py create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>

" Set color
"colorscheme molokai

" packadd! dracula
" syntax enable
" colorscheme dracula

" fix highlighting for latex
hi! clear Conceal
