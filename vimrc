"ePathogen plugin management (should be first)
let g:pathogen_disabled = ['YouCompleteMe']
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()

syntax on

" NERDComment alt syntax for fsharp
"let g:NERDAltDelims_fsharp = 1
let g:NERDCustomDelimiters = { 'fsharp': { 'left': '//' } }

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
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
" line number at the bottom
set ruler
let mapleader = ","
set background=dark
map <leader>t :colorscheme solarized<CR>:set background=dark<CR>
" :let g:solarized_termcolors=256
colorscheme desert256

" ignore files in .gitignore with ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

"subline in edit mode (Not very usefull, especially with powerline)
":autocmd InsertEnter,InsertLeave * set cul!

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

"iterm cursor change insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" remove esc delay
set timeoutlen=1000 ttimeoutlen=0

" rust racer conf
set hidden
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="$HOME/tools/rust/src/"

" mode dependent vim // change cursor caracter in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"let &t_ti.="\e[?7727h"
"let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>
