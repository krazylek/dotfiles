call plug#begin('~/.local/share/nvim/plugged')

" =======
" Plugins

" quotes
Plug 'tpope/vim-surround'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " no need if fzf is installed
Plug 'junegunn/fzf.vim'

" git management
Plug 'tpope/vim-fugitive'

" easy comments
Plug 'scrooloose/nerdcommenter'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" power line
Plug 'itchyny/lightline.vim'

" WRITING
" Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Colors

Plug 'brafales/vim-desert256'
Plug 'vim-scripts/moria'
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'
Plug 'icymind/NeoSolarized'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

syntax on
filetype plugin indent on

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set visualbell
" Maintain more context around the cursor
set scrolloff=3
" Store temporary files in a central spot
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
" line number at the bottom
set ruler
let mapleader = ","
set background=dark
colorscheme desert256

" lightline (minihack)
set laststatus=2

" Turn off auto-indent when pasting text
set pastetoggle=<F3>

" Open/Close NERDTree
map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

"cygwin backspace tweak
set backspace=indent,eol,start

"iterm cursor change insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" remove esc delay
set timeoutlen=1000 ttimeoutlen=0

" mode dependent vim // change cursor caracter in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"let &t_ti.="\e[?7727h"
"let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>
