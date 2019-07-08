" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Paquete para manejo de funciones en python
" Plugin 'tweekmonster/braceless.vim'

" Colores
Plugin 'kiddos/malokai.vim'

" Buscador de archivos
Plugin 'scrooloose/nerdtree'

" Powerline
Plugin 'Lokaltog/vim-powerline'
" Símbolos PowerLine
" let g:Powerline_symbols = 'fancy'

"Auto complete
Plugin 'Valloric/YouCompleteMe'

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline

" set encoding=utf-8 " Necessary to show Unicode glyphs
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"


"Configuración universal VIM

" tildez
set encoding=utf-8 " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file.

"hacer que la tecla de borrado funcione como en los otros programas
set backspace=indent,eol,start

" enable syntax highlighting
syntax enable
syntax on

"colors 
colorscheme malokai

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
"set cursorline

" show the matching part of the pair for [] {} and ()
"set noshowmatch
"let g:loaded_matchparen = 1 

" enable all Python syntax highlighting features
let python_highlight_all = 1

" haciendo que los swapfiles se encuentren en un sálo lugar
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" No swap files
" set noswapfile

set nocompatible              " be iMproved, required
" filetype off                  " required

" Para que el NerdTree se abra automáticamente
" autocmd vimenter * NERDTree

"corte de linea
set wrap linebreak nolist 
"para que los diferentes formatos queden como markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown

"solo para python
"autocmd Filetype python set number
set number

"solo para Markdown
autocmd Filetype markdown set syntax=markdown colorcolumn=0

"Completador 

" Point YCM to the Pipenv created virtualenv, if possible
" At first, get the output of 'pipenv --venv' command.
let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever
" a proper virtual environment has not been found.
" So, second, we only point YCM to the virtual environment when
" the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory
" of the virtual environment, so we have to append a full path to
" the python executable.
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path = 'python'
endif
