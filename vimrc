"""""""""""""""""""" PLUGINS
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'matchit.zip'
"Bundle 'The-NERD-Commenter'
"Bundle 'The-NERD-tree'
Bundle 'Lokaltog/powerline'
"Bundle 'Command-T'
Bundle 'molokai'
"Do not import jedi-vim: it interferes with YouCompleteMe
"Bundle 'davidhalter/jedi-vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'

"""""""""""""""""""" GLOBAL
let mapleader=","
colorscheme molokai
set gfn=terminus
set go=

syntax on
filetype plugin indent on
set encoding=utf-8
set hidden
set showcmd
"set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
"set visualbell
set noerrorbells
set list
set listchars=tab:→·,trail:·,extends:→,precedes:→,nbsp:␣
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=4 tabstop=4 shiftwidth=4
set ruler
set wildignore=*.swp,*.bak
set wildmode=longest,list
set t_Co=256 "Force 256 colors

"""""""""""""""""""" KEYBINDINGS

map cc <leader>c<space>
map  # {v}! par 72<CR>
map  & {v}! par 72j<CR>
map  <F6> :setlocal spell! spelllang=en<CR>
map  <F7> <Esc>iimport pdb;pdb.set_trace()<CR><Esc>
map  <F12> :set invhls<CR>
map  <S-Enter> O<Esc>
cmap <C-g> <C-u><ESC>
command! -bang W w<bang>

"""""""""""""""""""" PLUGINS

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vundle#rc()
"let g:Powerline_symbols = 'fancy'
let g:CommandTMaxFiles=5000
let g:CommandTMaxHeight=12
map <C-o> :CommandT<CR>
map t :CommandT<CR>
let g:CommandTAcceptSelectionMap = '<CR>'
let g:CommandTCancelMap = '<C-g>'

let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
nmap <c-b> :NERDTreeToggle<cr>
nmap <C-n> <c-w><left><down><c-w><c-w>
nmap <C-p> <c-w><left><up><c-w><c-w>
nmap <C-o> <c-w><left><CR>

"""""""""""""""""""" FILES SPECIFIC
au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml set listchars-=tab:>.
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 

" CoffeeScript
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" Compile RST to PDF on save. Silently fails if no makefile
au BufWritePost *.rst silent! make >/dev/null 2>&1 & | redraw

" Compile TEX to PDF on save. Silently fails if no makefile
au BufWritePost *.tex silent! make >/dev/null 2>&1 & | redraw
"""""""""""""""""""" CUSTOM FUNCTIONS

:command -nargs=+ Find vimgrep <args>|cw

""" Toggle relative/absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F10> :call NumberToggle()<cr>

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>


""" Vala
" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120


