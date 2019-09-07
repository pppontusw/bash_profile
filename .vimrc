call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'kaicataldo/material.vim'
Plug 'https://github.com/xypnox/OceanicMaterialVim.git'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ekalinin/Dockerfile.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'
Plug 'tell-k/vim-autopep8'
call plug#end()

" window split settings
set splitbelow
set splitright

set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

set nocompatible
set number
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set showcmd

set linespace=12
set tabstop=4
set smarttab
set showmode
set tags=tags
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase,

set wildignore+=*/vendor/**         " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/public/**         " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/node_modules/**   " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/bin/**   " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/share/**   " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/__pycache__/**   " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/site-packages/**   " I don't want to pull up these folders/files when calling CtrlP

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" use terminal colors
set termguicolors

" colorscheme
set background=dark
colorscheme vim-material

"airline
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" Ale
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'python': ['pylint']
 \ }

" Autopep8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'

" Mappings
nmap :sp :rightbelow sp<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>
"nmap :bp :BufSurfBack<cr>
"nmap :bn :BufSurfForward<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap <leader>gca :Gcommit -a -S<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gl :Gpull<cr>
nmap <leader>gst :Gstatus<cr>
