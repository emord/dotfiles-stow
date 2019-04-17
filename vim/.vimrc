set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'w0rp/ale'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript', { 'for': 'javascript' }
Plugin 'mileszs/ack.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'elzr/vim-json', { 'for': 'json' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plugin 'terryma/vim-expand-region'

Plugin 'elmcast/elm-vim', { 'for': 'elm' }
Plugin 'chrisbra/csv.vim', { 'for': 'csv' }

Plugin 'ryanoasis/vim-devicons'

Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call vundle#end()
" }}}

" Colors {{{
set t_Co=256
colorscheme zenburn
" }}}

" Enable file type detection
filetype plugin indent on
syntax enable

set lazyredraw " redraw only when necessary

" NERDTree fix directory opening
let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$']

set modelines=1

"spell checking
set spell spelllang=en_us

" Keybindings {{{
let mapleader = "\<Space>"

" better navigation when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"escape with jk
inoremap jk <Esc>
" }}}

" Search {{{
"search looks for matches while typing and highlights the matches
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch " highlight matching [{()}]

" turn off highlight
nnoremap <leader><space> :nohlsearch<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>s :Ack! -w <C-R><C-W><CR>

nnoremap <C-p>  :FZF<CR>
" }}}

" Tabs {{{
"tabs = 4 spaces and auto indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

if has("autocmd")
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType tsv,xml setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
endif
" }}}

"line numbers
set number

set cursorline

"latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"NERDTree toggling
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TlistToggle<CR>

set foldmethod=indent
set foldlevel=99

" keeps the cursor off the bottom
set scrolloff=5

" Files {{{
"persistent undo and auto backup
set backup
set writebackup
set backupdir=~/.vim/backups,~/.tmp,/var/tmp,/tmp

set swapfile
set dir=~/.vim/swap

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
" }}}

"breaks on whitespace
set wrap linebreak nolist

"fix backspace
set backspace=indent,eol,start

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" can move away from a changed buffer without warning
set hidden

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

if has("autocmd")
  autocmd FileType python setlocal foldmethod=indent
  " autocmd! BufWritePost,BufReadPost *.py,*.js,*.json Neomake
endif

" let g:neomake_python_pylint_exe = '/home/jemord/.virtualenvs/commcare-hq/bin/pylint'
" let g:neomake_python_enabled_makers = ['python', 'pep8', 'pylint']
" let g:neomake_python_pylint_maker = {
"     \ 'args': ['--load-plugins', 'pylint_django'],
"     \ }

" let g:neomake_open_list = 1

let g:ale_lint_delay = 500
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_python_flake8_args = '--max-line-length=115 --ignore E401'
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
\}

set diffopt+=iwhite

function! s:RemoveMultipleNewlines()
    :%s/\s\+$//e
    :%s/\n\{3,}/\r\r/e
endfunction

command! FixEndings call s:RemoveMultipleNewlines()

function! s:FormatJSON()
    :%!python -m json.tool
endfunction

command! FormatJSON call s:FormatJSON()

function! s:FormatXML()
    :%!xmllint --format - 
endfunction

command! FormatXML call s:FormatXML()

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme='bubblegum'

let g:csv_highlight_column = 'y'

nnoremap <Leader>t :tselect

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize

" vim:foldmethod=marker:foldlevel=0
