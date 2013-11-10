"ePathogen plugin management (should be first)
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
" line number at the bottom
set ruler
let mapleader = ","
colorscheme solarized 
colorscheme desert256

"set runtimepath+=$HOME/.vim/plugins
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" lightline (minihack)
set laststatus=2

"omnicompletion
set ofu=syntaxcomplete#Complete

" Turn off auto-indent when pasting text
set pastetoggle=<F3>
" Open/Close NERDTree
map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

"cygwin backspace tweak
set backspace=indent,eol,start

"subline in edit mode
:autocmd InsertEnter,InsertLeave * set cul!

" markdown unfolded
let g:vim_markdown_folding_disabled=1

" tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" tern shortcuts
nmap <leader>d :TernDef<CR>
nmap <F12> :TernDef<CR>
nmap <leader>i :TernDoc<CR>
nmap <leader>v :TernType<CR>
nmap <leader>r :TernRename<CR>
