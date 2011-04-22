
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autowrite

 
""""""""""""""""""""""""""""""""""""""""""
"Activation de la coloration syntaxique
"et de l'indetation
""""""""""""""""""""""""""""""""""""""""""
 
set nocompatible   "Supprime le comportement de Vi 
syntax on          " Activation de la coloration syntaxique 
colorscheme desert "Thème pour la coloration syntaxique
set ai             "Pour l'autoindetation
"set expandtab      
set tabstop=4
set shiftwidth=4 
set softtabstop=4
set autoindent
set smartindent
 
 
""""""""""""""""""""""""""""""""""""""""""
"Activation de la barre de status
""""""""""""""""""""""""""""""""""""""""""
 
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [FENC=%{&fileencoding}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]\
 
 
"""""""""""""""""""""""""""""""""""""""""""
"Afficher les délimeteurs de bloc
"correspondant
"""""""""""""""""""""""""""""""""""""""""""
 
set showmatch
 
"""""""""""""""""""""""""""""""""""""""""""
"Différentes options pour la recherche
"""""""""""""""""""""""""""""""""""""""""""
 
set incsearch
set hlsearch
set smartcase
 
"""""""""""""""""""""""""""""""""""""""""""
"Menu completion
"""""""""""""""""""""""""""""""""""""""""""
 
set wildmenu
 
"""""""""""""""""""""""""""""""""""""""""""
"Activer une confirmation lorsque l'on
"quitte sans avoir enregistrer le fichier
"""""""""""""""""""""""""""""""""""""""""""
set confirm
 
"""""""""""""""""""""""""""""""""""""""""""
"Activation de la souris en mode shell
"""""""""""""""""""""""""""""""""""""""""""
set mouse=a
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
			    
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
			  
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
				  
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
augroup END
else
set autoindent        " always set autoindenting on
endif " has("autocmd")

" When quickfix need to open a buffer, use newtab by default instead of the
" current buffer. Use an existing tab if already exists.
set switchbuf=newtab,usetab

" OmniCppComplete
 let OmniCpp_NamespaceSearch = 1
 let OmniCpp_GlobalScopeSearch = 1
 let OmniCpp_ShowAccess = 1
 let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
 let OmniCpp_MayCompleteDot = 1 " autocomplete after .
 let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
 let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
 let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "boost"]
" " automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" F12 to rebuilt tags
map <F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

set tags+=~/.vim/tags/stl.tag
set tags+=~/.vim/tags/boost.tag
set tags+=./tags

" Grammar correction stuff (use :LanguageToolCheck and :LanguageToolClear)
let g:languagetool_jar=$HOME . '/JLanguageTool/LanguageTool.jar'

