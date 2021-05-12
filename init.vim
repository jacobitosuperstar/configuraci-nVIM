"-------VIM PLUG--------
source $HOME/.config/nvim/vim-plug/plugins.vim

"----------------CONFIGURACION UNIVERSAL EN VIM-------------------"
"leader key ----> \
"es más fácil precionar "," que "\"
let mapleader = ","
"Tildez 
set encoding=utf-8
set fileencoding=utf-8

"Haciendo que Vim no busque ser compatible con Vi
set nocompatible             
filetype off

"Corte de linea
"La línea se corta y no continua en el documento
set wrap linebreak nolist 
"la línea no se corta en el documento
"set nowrap

" enable syntax highlighting
syntax enable
syntax on

"Show line numbers
"set number "Este saca el numero total
set relativenumber "Este saca el numero relativo

"Set tab and autoindent
set expandtab
set shiftwidth=4
set tabstop=4 softtabstop=4
set smarttab
set autoindent
set smartindent

"background siempre oscuro, sin importar el tema"
"set bg=dark

"Búsqueda inteligente"
set incsearch

"marcar las búsquedas"
set hlsearch

"---------------Búsqueda de Archivos------------------

"También da completador de archivos cuando undo la tecla de tabulador
set path+=**

"Mostrar todos los archivos que corresponden con la búsqueda cuando undo tabulador (completar)
set wildmenu

"------------------------------------------------------------------

"--------------Vim netrw (Nerd tree no plugin)----------------------"
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open files in the previous window

"we can use the followin commands to change behaviour
"=0 using the same window
"=1 horizontal split the window
"=2 Vertical split the window
"=3 Open in a new tab
"=4 Open in a previous window

let g:netrw_winsize=20      " set the width of the director explorer
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" NOW WE CAN:
" - :edit <nombre del folder>
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
"abre los archivos en un panel lateral con v"
"abre los archivos en una nueva pestaña con t

"-----------------------COMMENTING------------------------"

" Method 1
"vnoremap <silent> # :s/^/#<space>/<cr>:noh<cr>
"vnoremap <silent> -# :s/^#<space>//<cr>:noh<cr>

" Method 2
"how to commet in VIM"
"Step 1: Go to the the first column of the first line you want to comment."
"Step 2: Press: Ctrl+v and select the lines you want to comment:"
"Step 3: Shift-I#space (Enter Insert-at-left mode, type chars to insert. The selection will disappear, but all lines within it will be modified after Step 4.)"
"Step 4: Esc"

"--------------------------SWAPFILE-------------------------

"Haciendo que los historiales de comandos se encuentren en un sólo lugar
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
"No swap files
set noswapfile
"-----------------------------------------------------------

"------Configuraciones Propias para Ciertos Archivos------------
" No está funcionando, vamos a ver que se tiene que hacer para que todo de
"------Markdown----------

"Para que los diferentes formatos queden como markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn, *E.md setf markdown

"Solo para Markdown
autocmd Filetype markdown set syntax=markdown nonumber
"colorcolumn=0

"-------Python----------

"Enable all Python syntax highlighting features
let python_highlight_all = 1
let g:python_highlight_all = 1

"-------Spell Checking-----------
"set spell spelllang=es,en

"-------Functions----------
"making a directory
nnoremap <leader>mkdir :! mkdir 

"----------------Teclas Modificadas--------------------
"----backspace----
"set backspace=indent,eol,start
"--Cierre automático de símbolos--
"---paréntesis---
":inoremap ( ()<Esc>i
"---llaves---
":inoremap { {}<Esc>i
"---corchetes---
":inoremap [ []<Esc>i
"---citaciones---
":INoremap " ""<Esc>i
"---citaciones---
":inoremap ' ''<Esc>i

"----------------Vim Plug------------------------------"

call plug#begin('~/.vim/plugged')
 
" El mejor tema de colores de la historia"
Plug 'morhetz/gruvbox'
" multilenguaje, mejorador de subrayador
Plug 'sheerun/vim-polyglot'
" autocompletador de VIM"
Plug 'Valloric/YouCompleteMe'
" analizadores de código"
Plug 'dense-analysis/ale'
" powerline like bar"
Plug 'itchyny/lightline.vim'
" Git
Plug 'tpope/vim-fugitive'
" Git required
Plug 'vim-airline/vim-airline'

 
" Initialize plugin system
call plug#end()
filetype plugin indent on

" Brief help
" :PlugInstall    -Installs plugins
" :PlugUpdate     -Update Plugins
" :PlugUpgrade    -Update Plug itself
" :PlugClean      -Confirms removal of unused plugins
"
" Put your non-Plugin stuff after this line""""""""

"YCM virtual enviroment"
let current_python = substitute(system('which python'), '\n', '', '')
let g:ycm_python_binary_path = current_python

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CompleteDone * pclose

"Temas"
"color peachpuff
"color pablo
"highlight Comment ctermfg=yellow
set bg=dark
colorscheme gruvbox

"Lynter de python para ver que problemas hay en el código"
let g:ale_linters = {
      \   'python': ['flake8', 'pylint-django'],
      \}

"let g:ale_linters = {
"      \   'python': ['flake8', 'pylint'],
"      \   'ruby': ['standardrb', 'rubocop'],
"      \   'javascript': ['eslint'],
"      \}

"YAPF de Google para arreglar el cógido"
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

"Se arregla el código y se guarda"
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

"Dice el estatus del código al finalizar el programa"
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
