"----------------CONFIGURACION UNIVERSAL EN VIM-------------------"

"Tildez set encoding=utf-8
set fileencoding=utf-8

"Haciendo que Vim no busque ser compatible con Vi
set nocompatible             
filetype plugin on

"Corte de linea
set wrap linebreak nolist 



"---------cambios en las teclas de navegación-----------------------

"Hacer que la tecla de borrado funcione como en los otros programas
set backspace=indent,eol,start

" Press i to enter insert mode, and ii to exit.
imap ii <Esc>

"-------------------------------------------------------------------


"--------------Cambios en la presentación de VIM--------------

" enable syntax highlighting
syntax enable
syntax on

"Show line numbers
set number "Este saca el numero total
set relativenumber "Este saca el numero relativo

"Set tab and autoindent
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartindent

"-----------------------------------------------------

"----------------Cierre automático de símbolos--------------------

"---paréntesis---------
:inoremap ( ()<Esc>i
"---llaves-----------
:inoremap { {}<Esc>i
"---corchetes--------
:inoremap [ []<Esc>i
"---citaciones-------
:inoremap " ""<Esc>i

"---------------Búsqueda de Archivos------------------

"También da completador de archivos cuando undo la tecla de tabulador
set path+=**

"Mostrar todos los archivos que corresponden con la búsqueda cuando undo tabulador (completar)
set wildmenu

"------------------------------------------------------------------

"--------------búsqueda de archivos-------------------------------"
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit <nombre del folder>
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
"abre los archivos en un panel lateral con v"
"abre los archivos en una nueva pestaña con t
"--------------------------SWAPFILES-------------------------

"Haciendo que los swapfiles se encuentren en un sálo lugar
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
"No swap files
"set noswapfile
"-----------------------------------------------------------


"------Configuraciones Propias para Ciertos Archivos------------

"------Markdown----------

"Para que los diferentes formatos queden como markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown

"Solo para Markdown
autocmd Filetype markdown set syntax=markdown colorcolumn=0

"-------Python----------

"Enable all Python syntax highlighting features
let python_highlight_all = 1

"-----------------------------------------------------
