"""""""""""""""""""" PLUGINS
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ap/vim-css-color'

Plugin 'ervandew/supertab'

"Plugin 'lervag/vim-latex'

Plugin 'Valloric/YouCompleteMe'
" Also includes jedi

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Bundle 'tpope/vim-fugitive'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'matchit.zip'
"Bundle 'The-NERD-Commenter'
"Bundle 'The-NERD-tree'

"Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'

"Bundle 'Command-T'

Plugin 'rking/ag.vim'

Plugin 'scrooloose/syntastic'

Plugin 'severin-lemaignan/vim-minimap'

Plugin 'zah/nimrod.vim'

"" Xiki
"let $XIKI_DIR = "/home/lemaigna/applis/xiki"
"source /home/lemaigna/applis/xiki/etc/vim/xiki.vim

call vundle#end()

"""""""""""""""""""" GLOBAL
let mapleader=","
colorscheme molokai
set gfn=terminus
set go=

set updatetime=250

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

set guifont=Inconsolata\ for\ Powerline\ Medium\ 12

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

" capitalization (for instance, gcgc to capitalize a whole line)
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

"""""""""""""""""""" PLUGINS


"""  Syntastic adjustments
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "S"
let g:syntastic_style_warning_symbol = "s"
highlight SyntasticStyleWarning term=reverse cterm=bold ctermfg=244 ctermbg=232 gui=bold guifg=#808080 guibg=#080808
highlight SyntasticStyleError term=reverse ctermbg=235 guibg=#403D3D
highlight SyntasticWarningSign ctermfg=208 gui=italic guifg=#FD971F
highlight SyntasticStyleWarningSign ctermfg=11 guifg=Yellow ctermbg=236 guibg=#232526
highlight SyntasticStyleErrorSign term=bold ctermfg=11 gui=bold guifg=Yellow
"""

let g:airline_powerline_fonts = 1

"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'

"call vundle#rc()
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

" YouCompleteMe defaut C/C++ flags configuration
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Do not display the documentation 
set completeopt-=preview

"""""""""""""""""""" FILES SPECIFIC

" Color ROS launch files correctly
au BufRead,BufNewFile *.launch setfiletype xml

au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml set listchars-=tab:>.
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 

" Markdown is now more common than modula2...
augroup markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md  set filetype=markdown
augroup END

autocmd BufNewFile,BufRead *.sk  set filetype=sketch

" CoffeeScript
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

" Compile RST to PDF on save. Silently fails if no makefile
au BufWritePost *.rst silent! make >/dev/null 2>&1 & | redraw

" Compile TEX to PDF on save. Silently fails if no makefile
au BufWritePost *.tex silent! make >/dev/null 2>&1 & | redraw

" Enable folding in Latex files
"let g:tex_fold_enabled=1
" Disable spellchecking inside comments in latex files
let g:tex_comment_nospell= 1
" Enable syntax folding everywhere
" set fdm=syntax
"""""""""""""""""""" CUSTOM FUNCTIONS

" Run clang-format with ctrl+K
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>


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

nmap <F9> :MinimapToggle<CR>

" Close location list after selecting a file
:autocmd FileType qf nmap <buffer> <cr> <cr>:ccl<cr>

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


