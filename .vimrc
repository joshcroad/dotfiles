set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'chunqian/vim-vue'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic' "for EsLint
Plugin 'millermedeiros/vim-esformatter' "for EsFormatter
call vundle#end()

" [buffer number] followed by filename:
set statusline=[%n]\ %f
" for Syntastic messages:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c

"Syntastic configuration
let g:syntastic_always_populate_loc_list = 0 "show log
let g:syntastic_auto_loc_list = 0 "show log
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0 "check when write file if mode active
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
map <C-k> :SyntasticCheck<cr>

"EsFormatter configuration
map <c-f> :Esformatter<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :Esformatter<cr>

set t_Co=256
syntax on
filetype plugin indent on
set background=dark
colorscheme monokai
let g:monokai_italic=1

set encoding=utf8
set number ruler colorcolumn=100 cursorline wrap
set ignorecase smartcase
set hlsearch incsearch showmatch
set backspace=indent,eol,start
set smartindent softtabstop=2 shiftwidth=2 tabstop=2 expandtab autoindent
set list listchars=eol:¬,tab:»·,extends:»,precedes:«

set path=$PWD/**

"Remember last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Remove trailing white spaces
command RemoveWhitespace :%s/\s\+$//g
map <C-n> :NERDTree<CR>

"Remap movement hjkl to jkl;
noremap j h
noremap k j
noremap l k
noremap ; l

"Prevent arrow key movement
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
no <Up> <Nop>
