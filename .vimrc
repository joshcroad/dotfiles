""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin management
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'

  " Window setup
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'dikiaap/minimalist'
  Plugin 'editorconfig/editorconfig-vim'

  " Colour scheme
  Plugin 'crusoexia/vim-monokai'

  " Language support
  Plugin 'sheerun/vim-polyglot'
  Plugin 'dense-analysis/ale'
  Plugin 'mitermayer/vim-prettier'

  " Helpers
  Plugin 'godlygeek/tabular'
  Plugin 'raimondi/delimitmate'
  Plugin 'tpope/vim-surround'
  Plugin 'airblade/vim-gitgutter'
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic look and feel configuration
set encoding=utf8
set number
set numberwidth=5
set ruler
set colorcolumn=100
set cursorline
set wrap
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set backspace=indent,eol,start
set smartindent
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set list
set listchars=eol:¬,tab:\ \ ,trail:·
set path=$PWD/**

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement remapping
noremap j h
noremap k j
noremap l k
noremap ; l
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
no <Up> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme configuration
set t_Co=256
syntax on
set background=dark
colorscheme monokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
let g:monokai_italic=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_theme='minimalist'
let g:rustfmt_autosave=1
let g:tabular_loaded=1
let g:terraform_align=1
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
command -nargs=0 Terminal vert term
command JumpToLastCursor if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
command RemoveWhitespace try | :%s/\s\+$//g | catch | echo 'No whitespace' | endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
if has("autocmd")
  au BufReadPost * JumpToLastCursor
  au BufWritePre * RemoveWhitespace
endif
