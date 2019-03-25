set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf8
set number
set numberwidth=4
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
set listchars=eol:¬,tab:»·,trail:·
set path=$PWD/**

" Remap movement hjkl to jkl;

noremap j h
noremap k j
noremap l k
noremap ; l

" Prevent arrow key movement

no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
no <Up> <Nop>

" Vim Bundle plugins

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'hashivim/vim-terraform'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'crusoexia/vim-monokai'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Theme

set t_Co=256
syntax on
filetype plugin indent on
set background=dark
colorscheme monokai
let g:monokai_italic=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='minimalist'

" Commands

command JumpToLastCursor if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

command RemoveWhitespace try | :%s/\s\+$//g | catch | echo 'No whitespace' | endtry

" Autocommands

if has("autocmd")
  au BufReadPost * JumpToLastCursor
  au BufWritePre * RemoveWhitespace
endif
