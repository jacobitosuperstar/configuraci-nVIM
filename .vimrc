"""""""""""""""""""""""""""""""""""
"VIM RC JACOBO BEDOYA, MINIMALISTA"
"""""""""""""""""""""""""""""""""""

"------------------- teclas modificadas ----------------------
"----backspace----
"set backspace=indent,eol,start
"leader key ----> \
"es más fácil precionar "," que "\"
let mapleader = ","
"--Cierre automático de símbolos--
"---paréntesis---
":inoremap ( ()<Esc>i
"---llaves---
":inoremap { {}<Esc>i
"---corchetes---
":inoremap [ []<Esc>i
"---citaciones---
":inoremap " ""<Esc>i
"---citaciones---
":inoremap ' ''<Esc>i
" Remaping escape key
":inoremap jj <Esc>

"----------------CONFIGURACION UNIVERSAL EN VIM-------------------

" Tildez
set encoding=utf-8
set fileencoding=utf-8

" Haciendo que Vim no busque ser compatible con Vi
set nocompatible
filetype off

" Corte de linea
" La línea se corta y no continua en el documento
"set wrap linebreak nolist
" la línea no se corta en el documento
set nowrap

" enable syntax highlighting
syntax enable
syntax on

" Búsqueda inteligente"
set incsearch

" marcar las búsquedas"
set hlsearch

"No dejar activas las búsquedas
"set nohlsearch

" la pantalla se baja 20 líneas antes de que el marcador llegue al final
" así es más fácil mantener el cursor en la mitad de la pantalla
set scrolloff=20

" El color de los comentarios en todos los editores
" highlight Comment ctermfg=green

" Temas"
" set bg=dark
" color blue
" color darkblue
" color default
" color delek
" color desert
" color elflord
" color evening
" color koehler
" color morning
" color murphy
" color pablo
" color peachpuff
" color ron
" color shine
" color slate
" color torte
" color zellner

"--------DEVELOPER--------
" agrega una columna adicional para la indentación o colocar errores,
" adicionalmente hago una línea en la línea de caracteres 80, para estár más
" en nivel con PEP8
set colorcolumn=80
"set signcolumn=yes
set nu
set relativenumber " Este saca el numero relativo

"------- Python ----------
" Show line numbers
" set number "Este saca el numero total

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set smartindent |
    \ set smarttab

"---------FullStack--------------
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"----------------------- commenting ------------------------
" Method 1 how to commet in VIM"
" Step 1: Go to the the first column of the first line you want to comment."
" Step 2: Press: Ctrl+v and select the lines you want to comment:"
" Step 3: Shift-I#space (Enter Insert-at-left mode, type chars to insert.
"         The selection will disappear, but all lines within it will be
"         modified after Step 4.)"
" Step 4: Esc"

"-------------------------- swapfile -------------------------

" Haciendo que los historiales de comandos se encuentren en un sólo lugar
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
" set undodir=~/.vim/undo//
" No swap files
set noswapfile

"-----------------------------------------------------------

"--------------- búsqueda de archivos ------------------

" También da completador de archivos cuando undo la tecla de tabulador
set path+=**
set path=$PWD/**

" Mostrar todos los archivos que corresponden con la búsqueda cuando undo
" tabulador (completar)
set wildmenu
set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp

"------------------------------------------------------------------

"-------------- Vim netrw (Nerd tree no plugin) ----------------------"
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open files in the previous window

" we can use the followin commands to change behaviour
" =0 using the same window
" =1 horizontal split the window
" =2 Vertical split the window
" =3 Open in a new tab
" =4 Open in a previous window

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
" abre los archivos en un panel lateral con v"
" abre los archivos en una nueva pestaña con t

"------------------------ functions --------------------------
"--- snippeds -----
nnoremap <leader>htmlbase :-1read $HOME/dot_files/snippets/base.html<CR>
nnoremap <leader>htmlblock :-1read $HOME/dot_files/snippets/content_block.html<CR>

"--- delete all whitescape------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup JACOBO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"--- Make Tags ---
" Create tags file (install ctags first)
command! MakeTags !ctags -R .

" Now we can
" - Use control+] to jump to the tag under the cursor
" - Use g+control+] for ambigous tags
" - User control+t to jump back up the tag stack

"----------------Vim Plug------------------------------"

call plug#begin('~/.vim/plugged')

" multilenguaje, mejorador de subrayador
Plug 'sheerun/vim-polyglot'
" Git
Plug 'tpope/vim-fugitive'
" Git required
Plug 'vim-airline/vim-airline'
" Vim simple complete
Plug 'maxboisvert/vim-simple-complete'
" Best theme of all time
Plug 'morhetz/gruvbox'

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

" Enable all Python syntax highlighting features
let python_highlight_all = 1
let g:python_highlight_all = 1
" Gruvbox
" set bg=light
" let g:gruvbox_contrast_light = 'hard'
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" TPOPE shortcuts
" git status
nmap <leader>gs :G<CR>
"git commit
nmap <leader>gc :Git commit<CR>
"git push
nmap <leader>gp :Git push<CR>
"lado derecho
nmap <leader>gj :diffget //3<CR>
"lado izquierdo
nmap <leader>gf :diffget //2<CR>
"git diff
nmap <leader>gdiff :Git diff<CR>

"Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

"Vim simple complete
" add tags and opened files in the simplecomplete
" set complete-=t
" set complete-=i
