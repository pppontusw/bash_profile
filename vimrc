" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  let s:first_run = 1
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter' " ,c comment shortcuts
Plug 'tpope/vim-fugitive' " git integration

" Colorschemes and themes
Plug 'kaicataldo/material.vim'
Plug 'https://github.com/xypnox/OceanicMaterialVim.git'
Plug 'pppontusw/vim-one'

" airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

Plug 'xolox/vim-session'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'rizzatti/dash.vim'
Plug 'jmcantrell/vim-diffchanges'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'

" lint & fix
Plug 'w0rp/ale'

" syntax
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

Plug 'tpope/vim-unimpaired'
Plug 'pgdouyon/vim-evanesco'
Plug 'adelarsq/vim-matchit'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" ctags
Plug 'ludovicchabant/vim-gutentags'

Plug 'ntpeters/vim-better-whitespace'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'xolox/vim-misc'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" for vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" asyncomplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'


call plug#end()

" from mscoutermarsh/dotfiles
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set hlsearch                          " Highlight search results
set incsearch                         " Show search results as you type
set autoread                          " Auto reload changed files

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode

" window split settings
set splitbelow
set splitright

" esc timeout
set ttimeout
set ttimeoutlen=0
set timeoutlen=1000

set relativenumber
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

silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/swap
silent !mkdir -p ~/.vim/backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//
set undolevels=1000
set undoreload=10000

" use truecolor
set termguicolors

" workaround for color issues in iterm2
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" background refresh issue in kitty
"let &t_ut=''

" colorscheme
set background=dark
colorscheme one
"colorscheme vim-material

"airline
"let g:airline_theme='solarized'
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" vim-session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {
 \ 'javascript': ['prettier'],
 \ 'typescript': ['prettier'],
 \ 'python': ['black']
 \ }

let g:ale_python_black_options = '-l 79'

" LSP config
let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif

" Autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 50000000,
    \  },
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))


" Mappings

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'

" gets alt keys working at least on mac
" https://stackoverflow.com/questions/9520676/macvim-iterm2-tmux-bind-alt-meta
"execute "set <A-j>=\ej"
"execute "set <A-k>=\ek"

" text bubbling taken from vimcasts
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

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
nnoremap :sp :rightbelow sp<cr>


nnoremap Y y$
nnoremap + :w<CR>
nnoremap s /
nnoremap <Del> :%s/
vnoremap <Del> :s/

nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-w>h
tnoremap <C-k> <C-w>k
tnoremap <C-j> <C-w>j
tnoremap <C-l> <C-w>l

if has('nvim')
  tnoremap <Esc><Esc> <C-\><C-N>
  tnoremap <C-e> <Esc>
else
  tnoremap <Esc><Esc> <C-w>N
  tnoremap <C-e> <Esc>
endif

nnoremap <leader>qq :q<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>q! :qa!<CR>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>vt :vert term<cr>
nnoremap <leader>sp :split<cr>
nnoremap <leader>st :term<cr>
nnoremap <leader>tr :NERDTreeToggle<cr>
nnoremap <leader>dd :DiffChangesDiffToggle<CR>

nnoremap <leader>jr :LspReferences<CR>
nnoremap <leader>jd :LspDefinition<CR>
nnoremap <leader>pd :LspPeekDefinition<CR>

" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Rg ' . input('Rg/')<CR>

nnoremap <silent> S :call SearchWordWithRg()<CR>
vnoremap <silent> s :call SearchVisualSelectionWithRg()<CR>

function! SearchWordWithRg()
  execute 'Rg' expand('<cword>')
endfunction

function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

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
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

