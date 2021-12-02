"""""""""""""""""""""""""""""""""""
"VIM RC JACOBO BEDOYA, MINIMALISTA"
"""""""""""""""""""""""""""""""""""

"------------------- teclas modificadas ----------------------
"----backspace---- set backspace=indent,eol,start
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
filetype plugin indent on

" Corte de linea
" La línea se corta y no continua en el documento
"set wrap linebreak nolist
" la línea no se corta en el documento
set nowrap

" enable syntax highlighting
syntax enable

" Búsqueda inteligente"
set incsearch

" marcar las búsquedas"
set hlsearch

"No dejar activas las búsquedas
"set nohlsearch

" Copiar al clipboard del sistema
set clipboard=unnamed

" la pantalla se baja 20 líneas antes de que el marcador llegue al final
" así es más fácil mantener el cursor en la mitad de la pantalla
set scrolloff=20

" El color de los comentarios en todos los editores
" highlight Comment ctermfg=green

" Que VIM soporte los 256 colores
" set term=screen-256color

" Temas"
" set bg=dark
set termguicolors
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
set signcolumn=yes
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
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"------MarkDown y txt------
au BufNewFile,BufRead *.md,*.mkd,*.txt
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set smartindent |
    \ set smarttab |
    \ set tw=79

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

" Git
Plug 'tpope/vim-fugitive'
" Git required
Plug 'vim-airline/vim-airline'
" Vim simple complete
" Plug 'maxboisvert/vim-simple-complete'
" Mejora la visualización de Python
Plug 'sheerun/vim-polyglot'
" Linter
Plug 'dense-analysis/ale'

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

" Colorscheme

" Enable all Python syntax highlighting features
" let python_highlight_all = 1
" let g:python_highlight_all = 1

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

" LINTERS
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \}

"----------------VIM_COLORSCHEME------------------------------"
"" vi:syntax=vim

" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Default Dark scheme by Chris Kempson (http://chriskempson.com)

" This enables the coresponding base16-shell script to run so that
" :colorscheme works in terminals supported by base16-shell scripts
" User must set this variable in .vimrc
"   let g:base16_shell_path=base16-builder/output/shell/
if !has("gui_running")
  if exists("g:base16_shell_path")
    execute "silent !/bin/sh ".g:base16_shell_path."/base16-default-dark.sh"
  endif
endif

" GUI color definitions
let s:gui00        = "181818"
let g:base16_gui00 = "181818"
let s:gui01        = "282828"
let g:base16_gui01 = "282828"
let s:gui02        = "383838"
let g:base16_gui02 = "383838"
let s:gui03        = "585858"
let g:base16_gui03 = "585858"
let s:gui04        = "b8b8b8"
let g:base16_gui04 = "b8b8b8"
let s:gui05        = "d8d8d8"
let g:base16_gui05 = "d8d8d8"
let s:gui06        = "e8e8e8"
let g:base16_gui06 = "e8e8e8"
let s:gui07        = "f8f8f8"
let g:base16_gui07 = "f8f8f8"
let s:gui08        = "ab4642"
let g:base16_gui08 = "ab4642"
let s:gui09        = "dc9656"
let g:base16_gui09 = "dc9656"
let s:gui0A        = "f7ca88"
let g:base16_gui0A = "f7ca88"
let s:gui0B        = "a1b56c"
let g:base16_gui0B = "a1b56c"
let s:gui0C        = "86c1b9"
let g:base16_gui0C = "86c1b9"
let s:gui0D        = "7cafc2"
let g:base16_gui0D = "7cafc2"
let s:gui0E        = "ba8baf"
let g:base16_gui0E = "ba8baf"
let s:gui0F        = "a16946"
let g:base16_gui0F = "a16946"

" Terminal color definitions
let s:cterm00        = "00"
let g:base16_cterm00 = "00"
let s:cterm03        = "08"
let g:base16_cterm03 = "08"
let s:cterm05        = "07"
let g:base16_cterm05 = "07"
let s:cterm07        = "15"
let g:base16_cterm07 = "15"
let s:cterm08        = "01"
let g:base16_cterm08 = "01"
let s:cterm0A        = "03"
let g:base16_cterm0A = "03"
let s:cterm0B        = "02"
let g:base16_cterm0B = "02"
let s:cterm0C        = "06"
let g:base16_cterm0C = "06"
let s:cterm0D        = "04"
let g:base16_cterm0D = "04"
let s:cterm0E        = "05"
let g:base16_cterm0E = "05"
if exists("base16colorspace") && base16colorspace == "256"
  let s:cterm01        = "18"
  let g:base16_cterm01 = "18"
  let s:cterm02        = "19"
  let g:base16_cterm02 = "19"
  let s:cterm04        = "20"
  let g:base16_cterm04 = "20"
  let s:cterm06        = "21"
  let g:base16_cterm06 = "21"
  let s:cterm09        = "16"
  let g:base16_cterm09 = "16"
  let s:cterm0F        = "17"
  let g:base16_cterm0F = "17"
else
  let s:cterm01        = "10"
  let g:base16_cterm01 = "10"
  let s:cterm02        = "11"
  let g:base16_cterm02 = "11"
  let s:cterm04        = "12"
  let g:base16_cterm04 = "12"
  let s:cterm06        = "13"
  let g:base16_cterm06 = "13"
  let s:cterm09        = "09"
  let g:base16_cterm09 = "09"
  let s:cterm0F        = "14"
  let g:base16_cterm0F = "14"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#181818"
  let g:terminal_color_1 =  "#ab4642"
  let g:terminal_color_2 =  "#a1b56c"
  let g:terminal_color_3 =  "#f7ca88"
  let g:terminal_color_4 =  "#7cafc2"
  let g:terminal_color_5 =  "#ba8baf"
  let g:terminal_color_6 =  "#86c1b9"
  let g:terminal_color_7 =  "#d8d8d8"
  let g:terminal_color_8 =  "#585858"
  let g:terminal_color_9 =  "#ab4642"
  let g:terminal_color_10 = "#a1b56c"
  let g:terminal_color_11 = "#f7ca88"
  let g:terminal_color_12 = "#7cafc2"
  let g:terminal_color_13 = "#ba8baf"
  let g:terminal_color_14 = "#86c1b9"
  let g:terminal_color_15 = "#f8f8f8"
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_5
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
elseif has("terminal")
  let g:terminal_ansi_colors = [
        \ "#181818",
        \ "#ab4642",
        \ "#a1b56c",
        \ "#f7ca88",
        \ "#7cafc2",
        \ "#ba8baf",
        \ "#86c1b9",
        \ "#d8d8d8",
        \ "#585858",
        \ "#ab4642",
        \ "#a1b56c",
        \ "#f7ca88",
        \ "#7cafc2",
        \ "#ba8baf",
        \ "#86c1b9",
        \ "#f8f8f8",
        \ ]
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "base16-default-dark"

" Highlighting function
" Optional variables are attributes and guisp
function! g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  let l:attr = get(a:, 1, "")
  let l:guisp = get(a:, 2, "")

  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if l:attr != ""
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
  if l:guisp != ""
    exec "hi " . a:group . " guisp=#" . l:guisp
  endif
endfunction


fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  call g:Base16hi(a:group, a:guifg, a:guibg, a:ctermfg, a:ctermbg, a:attr, a:guisp)
endfun

" Vim editor colors
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:gui00, s:gui08, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    "", s:gui03, "", s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:gui01, s:gui0A, s:cterm01, s:cterm0A,  "", "")
call <sid>hi("Substitute",    s:gui01, s:gui0A, s:cterm01, s:cterm0A, "none", "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WildMenu",      s:gui08, s:gui0A, s:cterm08, "", "", "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:gui04, s:gui01, s:cterm04, s:cterm01, "", "")
call <sid>hi("QuickFixLine",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("PMenu",         s:gui05, s:gui01, s:cterm05, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:gui01, s:gui05, s:cterm01, s:cterm05, "", "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "", "")

" Remove functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
