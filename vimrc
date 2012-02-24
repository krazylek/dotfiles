"Pathogen plugin management (should be first)
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set background=dark
set visualbell
" Maintain more context around the cursor
set scrolloff=3
" Store temporary files in a central spot
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
let mapleader = ","
colorscheme solarized 

"set runtimepath+=$HOME/.vim/plugins
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

"omnicompletion
set ofu=syntaxcomplete#Complete

