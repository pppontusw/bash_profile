" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  let s:first_run = 1
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

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
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'w0rp/ale'
"Plug 'tell-k/vim-autopep8'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ntpeters/vim-better-whitespace'
Plug 'alvan/vim-closetag'
Plug 'hashivim/vim-terraform'
Plug 'maralla/completor.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/emmet-vim'
Plug 'pgdouyon/vim-evanesco'
Plug 'adelarsq/vim-matchit'
Plug 'sickill/vim-pasta'
call plug#end()

" from mscoutermarsh/dotfiles
set wildmenu                          " Tab autocomplete in command mode
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set hlsearch                          " Highlight search results
set incsearch                         " Show search results as you type
set autoread                          " Auto reload changed files

set scrolloff=5       " Leave 5 lines of buffer when scrolling
"set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode


" window split settings
set splitbelow
set splitright

" esc timeout
set ttimeout
set ttimeoutlen=0
set timeoutlen=1000

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

" ignore for CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/**
set wildignore+=*/node_modules/**
set wildignore+=*/bin/**
set wildignore+=*/share/**
set wildignore+=*/__pycache__/**
set wildignore+=*/site-packages/**

silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/swap
silent !mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//
set undolevels=1000
set undoreload=10000

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
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"let g:prettier#config#bracket_spacing = 'true'
"let g:prettier#config#trailing_comma = 'none'

" Ale
let g:ale_fixers = {
 \ 'javascript': ['prettier'],
 \ 'typescript': ['prettier'],
 \ 'python': ['black']
 \ }

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote'

" Autopep8
"let g:autopep8_on_save = 1
"let g:autopep8_disable_show_diff=1

" Mappings

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'

" Get off my lawn - helpful when learning Vim :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" text bubbling taken from vimcasts
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" remap for fi keyboard (stolen from unimpaired readme)
"nmap < [
"nmap > ]
"omap < [
"omap > ]
"xmap < [
"xmap > ]
nmap ><Space> ]<Space>
nmap <<Space> [<Space>

" splits
nmap :sp :rightbelow sp<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>

nmap <C-b> :NERDTreeToggle<cr>

" vim completor
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" fugitive
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

