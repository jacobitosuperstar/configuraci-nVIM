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
highlight Comment ctermfg=green

" Temas"
set bg=dark
color peachpuff

" Quiero morir, no usar las flechas del teclado para editar
" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

"------- Python ----------

" Enable all Python syntax highlighting features
let python_highlight_all = 1
let g:python_highlight_all = 1
" Show line numbers
" set number "Este saca el numero total
set nu
set relativenumber " Este saca el numero relativo
" Set tab and autoindent
set expandtab
set shiftwidth=4
set tabstop=4 softtabstop=4
set smarttab
set autoindent
set smartindent
" agrega una columna adicional para la indentación o colocar errores,
" adicionalmente hago una línea en la línea de caracteres 80, para estár más
" en nivel con PEP8
set colorcolumn=80
"set signcolumn=yes

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

"---------------------SIMPLE AUTO COMPLETE-------------------"

if exists("g:loaded_vim_simple_complete")
  finish
endif
let g:loaded_vim_simple_complete = 1

let g:vsc_completion_command = get(g:, 'vsc_completion_command', "\<C-N>")
let g:vsc_reverse_completion_command = get(g:, 'vsc_reverse_completion_command', "\<C-P>")
let g:vsc_tab_complete = get(g:, 'vsc_tab_complete', 1)
let g:vsc_type_complete = get(g:, 'vsc_type_complete', 1)
let g:vsc_type_complete_length = get(g:, 'vsc_type_complete_length', 3)
let g:vsc_pattern = get(g:, 'vsc_pattern', '\k')

fun! s:TabCompletePlugin()
    inoremap <expr> <Tab> <SID>TabComplete(0)
    inoremap <expr> <S-Tab> <SID>TabComplete(1)

    fun! s:TabComplete(reverse)
        if s:CurrentChar() =~ g:vsc_pattern || pumvisible()
            return a:reverse ? g:vsc_reverse_completion_command : g:vsc_completion_command
        else
            return "\<Tab>"
        endif
    endfun
endfun

fun! s:CurrentChar()
    return matchstr(getline('.'), '.\%' . col('.') . 'c')
endfun

fun! s:TypeCompletePlugin()
    set completeopt+=menu
    set completeopt+=menuone
    set completeopt+=noselect
    set pumheight=10
    let s:vsc_typed_length = 0
    imap <silent> <expr> <plug>(TypeCompleteCommand) <sid>TypeCompleteCommand()

    augroup TypeCompletePlugin
        autocmd!
        autocmd InsertCharPre * noautocmd call s:TypeComplete()
        autocmd InsertEnter * let s:vsc_typed_length = 0
    augroup END

    fun! s:TypeCompleteCommand()
        return g:vsc_completion_command
    endfun

    fun! s:TypeComplete()
        if v:char !~ g:vsc_pattern
            let s:vsc_typed_length = 0
            return
        endif

        let s:vsc_typed_length += 1

        if !g:vsc_type_complete || pumvisible()
            return
        endif

        if s:vsc_typed_length == g:vsc_type_complete_length
            call feedkeys("\<plug>(TypeCompleteCommand)", 'i')
        endif
    endfun
endfun

if g:vsc_type_complete | call s:TypeCompletePlugin() | endif
if g:vsc_tab_complete  | call s:TabCompletePlugin()  | endif


"----------------Vim Plug------------------------------"

call plug#begin('~/.vim/plugged')

" multilenguaje, mejorador de subrayador
Plug 'sheerun/vim-polyglot'
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

