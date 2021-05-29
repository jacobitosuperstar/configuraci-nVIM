"-------VIM PLUG--------
source $HOME/.config/nvim/vim-plug/plugins.vim

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
" inoremap jk <Esc>

"----------------CONFIGURACION UNIVERSAL EN VIM-------------------

" Tildez
set encoding=utf-8
set fileencoding=utf-8

" Haciendo que Vim no busque ser compatible con Vi
set nocompatible
filetype on

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

"--------------- búsqueda de archivos ------------------

" También da completador de archivos cuando undo la tecla de tabulador
set path+=**

" Mostrar todos los archivos que corresponden con la búsqueda cuando undo
" tabulador (completar)
set wildmenu

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

"----------------------- commenting ------------------------"

" Method 1
" how to commet in VIM"
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

"------ Configuraciones Propias para Ciertos Archivos ------------

"------ Markdown ----------

" Para que los diferentes formatos queden como markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn, *.md
    \ set nonumber
    \ set spelllang=es
    \ colorcolumn=0
    "-------Spell Checking-----------
    \ set spell spelllang=es,en

"------- Python ----------

au BufNewFile,BufRead *.py
    " Enable all Python syntax highlighting features
    \ let python_highlight_all = 1
    \ let g:python_highlight_all = 1
    " Show line numbers
    " set number "Este saca el numero total
    \ set nu
    \ set relativenumber " Este saca el numero relativo
    " Set tab and autoindent
    \ set expandtab
    \ set shiftwidth=4
    \ set tabstop=4 softtabstop=4
    \ set smarttab
    \ set autoindent
    \ set smartindent
    " agrega una columna adicional para la indentación o colocar errores,
    " adicionalmente hago una línea en la línea de caracteres 80, para estár más
    " en nivel con PEP8
    \ set colorcolumn=80
    \ set signcolumn=yes

"----------------Vim Plug------------------------------"

call plug#begin('~/.vim/plugged')

" El mejor tema de colores de la historia"
Plug 'morhetz/gruvbox'
" multilenguaje, mejorador de subrayador
Plug 'sheerun/vim-polyglot'
" autocompletador de VIM"
" Plug 'Valloric/YouCompleteMe'
" autocompletador COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" jedi vim para el completador COC
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
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

" Temas"
" color peachpuff
" color pablo
" highlight Comment ctermfg=yellow
set bg=dark
colorscheme gruvbox

" COC tabautocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

