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
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
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

silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/swap
silent !mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//

" use terminal colors
set termguicolors
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

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

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'none'

" Ale
let g:ale_fixers = {
 \ 'javascript': ['prettier'],
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
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

