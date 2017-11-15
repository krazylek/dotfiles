call plug#begin('~/.local/share/nvim/plugged')

" =======
" Plugins

" quotes
Plug 'tpope/vim-surround'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs' " { 'do': 'npm install ternjs -g' }  need ternjs installed

" language specific
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

"# omnisharp: .Net completion
"Plug 'nosami/Omnisharp.git nvim/autoload/omnisharp

" fuzzy finder
"Plug 'Shougo/denite.nvim' " no clear needs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " no need if fzf is installed
Plug 'junegunn/fzf.vim'

" Linter
Plug 'neomake/neomake'

" git management
Plug 'tpope/vim-fugitive'

" easy comments
Plug 'scrooloose/nerdcommenter'
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
" Resize windows automatically using the Golden Ratio
" Plug 'vim-scripts/golden-ratio.git nvim/autoload/golden-ratio

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
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
" line number at the bottom
set ruler
let mapleader = ","
set termguicolors
set background=dark



map <leader>t :colorscheme NeoSolarized<CR>:set background=dark<CR>
" :let g:solarized_termcolors=256
colorscheme railscasts

" Turn off auto-indent when pasting text
set pastetoggle=<F3>
" Open/Close NERDTree
map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>


"setup denite
"nnoremap <C-p> :Denite file_rec<CR>

" neomake linter
let g:neomake_javascript_enabled_makers = ['jshint']
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
autocmd! BufWritePost * Neomake

" Enable Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" use tab to forward cycle
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" deoplete-tern
let g:deoplete#sources#ternjs#tern_bin = '~/.local/share/nvim/plugged/tern_for_vim/node_modules/.bin/tern'
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1


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

" mode dependent vim // change cursor caracter in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"let &t_ti.="\e[?7727h"
"let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>


nmap <leader>p :Files<CR>

" using rg inside vim:
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf"vim"grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nmap <leader>f :Find 

" markdown
let g:markdown_fenced_languages = ['sh', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css']
