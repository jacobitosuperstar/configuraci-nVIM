"-------VIM PLUG--------
" source $HOME/.config/nvim/vim-plug/plugins.vim

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
"    \ set textwidth=79

"---------FullStack--------------
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

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

"--------------------TESTING VIM THEME--------------------

" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-distinguished

" Initialization {{{
	set background=dark

	hi clear
	if exists('syntax_on')
		syntax reset
	endif

	let g:colors_name = 'distinguished'

	if ! has('gui_running')
		if &t_Co != 256
			echoe 'The ' . g:colors_name . ' color scheme requires gvim or a 256-color terminal'

			finish
		endif
	endif
" }}}
" Color dictionary parser {{{
	function! s:ColorDictParser(color_dict)
		for [group, group_colors] in items(a:color_dict)
			exec 'hi ' . group
				\ . ' ctermfg=' . (group_colors[0] == '' ? 'NONE' :       group_colors[0])
				\ . ' ctermbg=' . (group_colors[1] == '' ? 'NONE' :       group_colors[1])
				\ . '   cterm=' . (group_colors[2] == '' ? 'NONE' :       group_colors[2])
				\
				\ . '   guifg=' . (group_colors[3] == '' ? 'NONE' : '#' . group_colors[3])
				\ . '   guibg=' . (group_colors[4] == '' ? 'NONE' : '#' . group_colors[4])
				\ . '     gui=' . (group_colors[5] == '' ? 'NONE' :       group_colors[5])
		endfor
	endfunction
" }}}

"	   | Highlight group                |  CTFG |  CTBG |    CTAttributes | || |   GUIFG |    GUIBG |   GUIAttributes |
"	   |--------------------------------|-------|-------|-----------------| || |---------|----------|-----------------|
call s:ColorDictParser({
	\   'Normal'                      : [    231,     16,               '',      'ffffff',  '000000',               '']
	\ , 'Visual'                      : [    240,    253,               '',      '585858',  'dadada',               '']
	\
	\ , 'Cursor'                      : [     '',     '',               '',      'ffffff',  'dd4010',               '']
	\ , 'lCursor'                     : [     '',     '',               '',      'ffffff',  '89b6e2',               '']
	\
	\ , 'CursorLine'                  : [     '',    236,               '',            '',  '3a3a3a',               '']
	\ , 'CursorLineNr'                : [    231,    240,               '',      'ffffff',  '585858',               '']
	\ , 'CursorColumn'                : [    231,    237,               '',      'ffffff',  '3a3a3a',               '']
	\
	\ , 'Folded'                      : [    249,    234,               '',      'b2b2b2',  '1c1c1c',               '']
	\ , 'FoldColumn'                  : [    243,    234,               '',      '767676',  '1c1c1c',               '']
	\ , 'SignColumn'                  : [    231,    233,           'bold',      'ffffff',  '121212',           'bold']
	\ , 'ColorColumn'                 : [      '',   233,               '',            '',  '262626',               '']
	\
	\ , 'StatusLine'                  : [    231,    236,           'bold',      'ffffff',  '303030',           'bold']
	\ , 'StatusLineNC'                : [    244,    232,               '',      '808080',  '080808',               '']
	\
	\ , 'LineNr'                      : [    243,    235,               '',      '767676',  '262626',               '']
	\ , 'VertSplit'                   : [    240,     '',               '',      '585858',  '1c1c1c',               '']
	\
	\ , 'WildMenu'                    : [    234,    231,               '',      '1c1c1c',  'ffffff',               '']
	\ , 'Directory'                   : [    143,     '',           'bold',      'afaf5f',        '',           'bold']
	\ , 'Underlined'                  : [    130,     '',               '',      'af5f00',        '',               '']
	\
	\ , 'Question'                    : [     74,     '',           'bold',      '5fafd7',        '',           'bold']
	\ , 'MoreMsg'                     : [    214,     '',           'bold',      'ffaf00',        '',           'bold']
	\ , 'WarningMsg'                  : [    202,     '',           'bold',      'ff5f00',        '',           'bold']
	\ , 'ErrorMsg'                    : [    196,     '',           'bold',      'ff0000',        '',           'bold']
	\
	\ , 'Comment'                     : [    243,    233,               '',      '767676',  '121212',               '']
	\ , 'vimCommentTitleLeader'       : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentTitle'             : [    250,    233,               '',      'bcbcbc',  '121212',               '']
	\ , 'vimCommentString'            : [    245,    233,               '',      '8a8a8a',  '121212',               '']
	\
	\ , 'TabLine'                     : [    231,    238,               '',      'ffffff',  '444444',               '']
	\ , 'TabLineSel'                  : [    255,     '',           'bold',      'eeeeee',        '',           'bold']
	\ , 'TabLineFill'                 : [    240,    238,               '',      '585858',  '444444',               '']
	\ , 'TabLineNumber'               : [    160,    238,           'bold',      'd70000',  '444444',           'bold']
	\ , 'TabLineClose'                : [    245,    238,           'bold',      '8a8a8a',  '444444',           'bold']
	\
	\ , 'SpellCap'                    : [    231,     31,           'bold',      'ffffff',  '0087af',           'bold']
	\
	\ , 'SpecialKey'                  : [    239,     '',               '',      '4e4e4e',        '',               '']
	\ , 'NonText'                     : [     88,     '',               '',      '870000',        '',               '']
	\ , 'MatchParen'                  : [    231,     25,           'bold',      'ffffff',  '005faf',           'bold']
	\
	\ , 'Constant'                    : [    137,     '',           'bold',      'af875f',        '',           'bold']
	\ , 'Special'                     : [    150,     '',               '',      'afd787',        '',               '']
	\ , 'Identifier'                  : [     66,     '',           'bold',      '5f8787',        '',           'bold']
	\ , 'Statement'                   : [    186,     '',           'bold',      'd7d787',        '',           'bold']
	\ , 'PreProc'                     : [    247,     '',               '',      '9e9e9e',        '',               '']
	\ , 'Type'                        : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'String'                      : [    143,     '',               '',      'afaf5f',        '',               '']
	\ , 'Number'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Define'                      : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Error'                       : [    208,    124,               '',      'ff8700',  'af0000',               '']
	\ , 'Function'                    : [    179,     '',               '',      'd7af5f',        '',               '']
	\ , 'Include'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'PreCondit'                   : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Keyword'                     : [    173,     '',               '',      'd7875f',        '',               '']
	\ , 'Search'                      : [    231,    131,               '',      '000000',  'ffff5f', 'underline,bold']
	\ , 'Title'                       : [    231,     '',               '',      'ffffff',        '',               '']
	\ , 'Delimiter'                   : [    246,     '',               '',      '949494',        '',               '']
	\ , 'StorageClass'                : [    187,     '',               '',      'd7d7af',        '',               '']
	\ , 'Operator'                    : [    180,     '',               '',      'd7af87',        '',               '']
	\
	\ , 'TODO'                        : [    228,     94,           'bold',      'ffff87',  '875f00',           'bold']
	\
	\ , 'SyntasticWarning'            : [    220,     94,               '',      'ffff87',  '875f00',           'bold']
	\ , 'SyntasticError'              : [    202,     52,               '',      'ffff87',  '875f00',           'bold']
	\
	\ , 'Pmenu'                       : [    248,    240,               '',      'a8a8a8',  '585858',               '']
	\ , 'PmenuSel'                    : [    253,    245,               '',      'dadada',  '8a8a8a',               '']
	\ , 'PmenuSbar'                   : [    253,    248,               '',      'dadada',  'a8a8a8',               '']
	\
	\ , 'phpEOL'                      : [    245,     '',               '',      'dadada',        '',               '']
	\ , 'phpStringDelim'              : [     94,     '',               '',      '875f00',        '',               '']
	\ , 'phpDelimiter'                : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'phpFunctions'                : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'phpBoolean'                  : [    172,     '',           'bold',      'd78700',        '',           'bold']
	\ , 'phpOperator'                 : [    215,     '',               '',      'ffaf5f',        '',               '']
	\ , 'phpMemberSelector'           : [    138,     '',           'bold',      'af8787',        '',           'bold']
	\ , 'phpParent'                   : [    227,     '',               '',      'ffff5f',        '',               '']
	\
	\ , 'PHPClassTag'                 : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPInterfaceTag'             : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PHPFunctionTag'              : [    222,     '',           'bold',      'ffd787',        '',           'bold']
	\
	\ , 'pythonDocString'             : [    240,    233,               '',      '585858',  '121212',               '']
	\ , 'pythonDocStringTitle'        : [    245,    233,               '',      'dadada',  '121212',               '']
	\ , 'pythonRun'                   : [     65,     '',               '',      '5f875f',        '',               '']
	\ , 'pythonBuiltinObj'            : [     67,     '',           'bold',      '5f87af',        '',           'bold']
	\ , 'pythonSelf'                  : [    250,     '',           'bold',      'bcbcbc',        '',           'bold']
	\ , 'pythonFunction'              : [    179,     '',           'bold',      'd7af5f',        '',           'bold']
	\ , 'pythonClass'                 : [    221,     '',           'bold',      'ffd75f',        '',           'bold']
	\ , 'pythonExClass'               : [    130,     '',               '',      'af5f00',        '',               '']
	\ , 'pythonException'             : [    130,     '',           'bold',      'af5f00',        '',           'bold']
	\ , 'pythonOperator'              : [    186,     '',               '',      'd7d787',        '',               '']
	\ , 'pythonPreCondit'             : [    152,     '',           'bold',      'afd7d7',        '',           'bold']
	\ , 'pythonDottedName'            : [    166,     '',               '',      'd75f00',        '',               '']
	\ , 'pythonDecorator'             : [    124,     '',           'bold',      'af0000',        '',           'bold']
	\
	\ , 'PythonInterfaceTag'          : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonClassTag'              : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'PythonFunctionTag'           : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'PythonVariableTag'           : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'PythonMemberTag'             : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'CTagsImport'                 : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsClass'                  : [    221,     '',               '',      'ffd75f',        '',               '']
	\ , 'CTagsFunction'               : [    109,     '',               '',      '87afaf',        '',               '']
	\ , 'CTagsGlobalVariable'         : [    253,     '',               '',      'dadada',        '',               '']
	\ , 'CTagsMember'                 : [    145,     '',               '',      'afafaf',        '',               '']
	\
	\ , 'xmlTag'                      : [    149,     '',           'bold',      'afd75f',        '',           'bold']
	\ , 'xmlTagName'                  : [    250,     '',               '',      'bcbcbc',        '',               '']
	\ , 'xmlEndTag'                   : [    209,     '',           'bold',      'ff875f',        '',           'bold']
	\
	\ , 'cssImportant'                : [    166,     '',           'bold',      'd75f00',        '',           'bold']
	\
	\ , 'DiffAdd'                     : [    112,     22,               '',      '87d700',  '005f00',               '']
	\ , 'DiffChange'                  : [    220,     94,               '',      'ffd700',  '875f00',               '']
	\ , 'DiffDelete'                  : [    160,     '',               '',      'd70000',        '',               '']
	\ , 'DiffText'                    : [    220,     94,   'reverse,bold',      'ffd700',  '875f00',   'reverse,bold']
	\
	\ , 'diffLine'                    : [     68,     '',           'bold',      '5f87d7',        '',           'bold']
	\ , 'diffFile'                    : [    242,     '',               '',      '6c6c6c',        '',               '']
	\ , 'diffNewFile'                 : [    242,     '',               '',      '6c6c6c',        '',               '']
\ })

hi link htmlTag            xmlTag
hi link htmlTagName        xmlTagName
hi link htmlEndTag         xmlEndTag

hi link phpCommentTitle    vimCommentTitle
hi link phpDocTags         vimCommentString
hi link phpDocParam        vimCommentTitle

hi link diffAdded          DiffAdd
hi link diffChanged        DiffChange
hi link diffRemoved        DiffDelete

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

" Enable all Python syntax highlighting features
let python_highlight_all = 1
let g:python_highlight_all = 1

