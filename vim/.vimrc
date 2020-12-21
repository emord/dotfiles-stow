" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/0.10.0/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mileszs/ack.vim'

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ActivityWatch/aw-watcher-vim'

Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-expand-region'

" UI

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}

" General UI {{{

filetype plugin indent on
syntax enable

set number
set cursorline

set hidden " can move away from a changed buffer without warning

set scrolloff=5 " keeps the cursor off the bottom

set autoindent

" Colors {{{
set t_Co=256
colorscheme zenburn
" }}}

set diffopt+=iwhite " ignore white space in diffs

set linebreak " break on white space or special character (breakat)

set listchars=tab:>\ ,eol:¬ " non-printable characters to display when :set list

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme='bubblegum'

" }}}

set spell spelllang=en_us

let mapleader = "\<Space>"

" better navigation when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"escape with jk
inoremap jk <Esc>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

" Search {{{
set incsearch " match while typing
set hlsearch " highlight all matches
set ignorecase
set smartcase
set showmatch " highlight matching [{()}]

" Remove highlights
nnoremap <leader><space> :nohlsearch<CR>

" Ack/Ag {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>
"nnoremap <Leader>s :Ack! -w <C-R><C-W><CR>
" }}}

" FZF {{{
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '30%' }

nnoremap <C-p>  :FZF<CR>
" }}}

" }}}

" File Browser {{{
nnoremap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
" }}}

" Warnings and Linting {{{
" highlight trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" }}}

" Helpers {{{
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
" }}}

" Completion/CoC {{{
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-python',
\ 'coc-metals',
\ 'coc-markdownlint'
\ ]
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=auto

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Give more space for displaying messages.
set cmdheight=2

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

" vim:foldmethod=marker:foldlevel=0
