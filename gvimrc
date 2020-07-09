" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  let s:first_run = 1
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" NOTE! that any plugins added in gvimrc also needs to be added to vimrc
Plug 'scrooloose/nerdcommenter' " ,c comment shortcuts

" git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'pppontusw/vim-one' " colorscheme

" airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree' " file tree browser
Plug 'jmcantrell/vim-diffchanges' " diff unsaved changes
Plug 'mbbill/undotree' " undotree browser
Plug 'junegunn/vim-peekaboo' " peek registers when pasting

" syntax plugins
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'PProvost/vim-ps1'
Plug 'derekwyatt/vim-scala'
Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'tpope/vim-unimpaired' " adds some extra motions like [<Space> (also bubbling depends on this)
Plug 'pgdouyon/vim-evanesco' " hides search highlight when cursor moves
Plug 'adelarsq/vim-matchit' " improved % jumping
Plug 'sickill/vim-pasta' " indentation aware pasting
Plug 'tpope/vim-sleuth' " sets shiftwidth and expandtab based on the current file
Plug 'tpope/vim-surround' " surround functionality
Plug 'jiangmiao/auto-pairs' " brackets quotes and parenthesis are added in pairs
Plug 'alvan/vim-closetag' " automatically close html brackets
Plug 'ntpeters/vim-better-whitespace' " adds stripwhitespace and whitespace highlighting

Plug 'kana/vim-textobj-user' " custom text objects
Plug 'lucapette/vim-textobj-underscore' " adds _ as a text object
Plug 'xolox/vim-misc' " misc vim scripts

" fuzzyfinding powered by fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lsp with coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pearofducks/ansible-vim'

Plug 'tyru/open-browser.vim'

" NOTE! that any plugins added in gvimrc also needs to be added to vimrc

call plug#end()

" search
set hlsearch                          " Highlight search results
set incsearch                         " Show search results as you type
set autoread                          " Auto reload changed files
set ignorecase                  " ignore case
set smartcase                  " ignore case if search pattern is all lowercase,

" saving and loading
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode
set autowrite  "Save on buffer switch

" window split settings
set splitbelow
set splitright

" esc timeout
set ttimeout
set ttimeoutlen=0
set timeoutlen=1000

" numbers
set relativenumber
set number

" tabs and indents
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set smarttab
set autoindent                " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

" misc
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set showmode
set tags=tags
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set wildmenu                " show tab completion menu

" backup/undo/swap
silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/swap
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

" background refresh issue in kitty and tmux
let &t_ut=''

" colorscheme
if strftime('%H') > "08" && strftime('%H') < "18"
  set background=light
else
  set background=dark
endif

colorscheme one

" airline
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'


" vim-session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'


" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''


" filetypes
au BufRead,BufNewFile *.sbt set filetype=scala

" Mappings
let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'


" text bubbling taken from vimcasts
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" remap for fi keyboard (stolen from unimpaired readme)
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
  au TerminalOpen * tnoremap <buffer> <Esc><Esc> <C-w>N
  au FileType fzf tunmap <buffer> <Esc><Esc>
  tnoremap <C-e> <Esc>
endif

" leader mappings
nnoremap <leader>qq :q<CR>
nnoremap <leader>bd :bd<CR>
"nnoremap <leader>qa :qa<CR>
"nnoremap <leader>q! :qa!<CR>
"nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>vt :vert term<cr>
"nnoremap <leader>sp :split<cr>
"nnoremap <leader>st :term<cr>
nnoremap <leader>tr :NERDTreeToggle<cr>
nnoremap <leader>dd :DiffChangesDiffToggle<CR>


" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>s :execute 'Rg ' . input('Rg/')<CR>

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

" all this is for COC
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-python', 'coc-prettier', 'coc-eslint', 'coc-snippets', 'coc-json', 'coc-tsserver', 'coc-emmet']

" " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <leader>dp <Plug>(coc-diagnostic-prev)
nmap <leader>dn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
autocmd FileType python,java,scala,*.js,*.jsx,*.mjs,*.ts,*.tsx,typescript nmap gd <Plug>(coc-definition)
nmap <leader>gd <Plug>(coc-definition)
nmap gY <Plug>(coc-type-definition)
nmap gI <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" gvim specific
set macligatures
set guifont=Fira\ Code:h16
set guioptions=

let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

