call plug#begin('~/.local/share/nvim/plugged')

" =======
" Plugins

" power line
Plug 'itchyny/lightline.vim'

" quotes
Plug 'tpope/vim-surround'

" autocomplete
Plug 'prabirshrestha/asyncomplete.vim' "no python
" Plug 'Shougo/deoplete' " other good choice
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp' " LanguageServer client
Plug 'prabirshrestha/asyncomplete-lsp.vim'


" fuzzy finder
"Plug 'Shougo/denite.nvim' " no clear needs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " no need if fzf is installed
Plug 'junegunn/fzf.vim'

" Linter
"Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'

" git management
Plug 'tpope/vim-fugitive'

" easy comments
Plug 'scrooloose/nerdcommenter'
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
" Resize windows automatically using the Golden Ratio
" Plug 'vim-scripts/golden-ratio.git nvim/autoload/golden-ratio

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
colorscheme railscasts

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
set hidden " hide buffer instead of closing


" dirty shortcut to switch to solarized
map <leader>t :colorscheme NeoSolarized<CR>:set background=dark<CR>
" :let g:solarized_termcolors=256


" Turn off auto-indent when pasting text
set pastetoggle=<F3>


" Open/Close NERDTree (e like 'explorer')
"map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeToggle<CR>:NERDTreeMirror<CR>


" ale linter
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \ }

" ale lightline
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }


" iterm cursor change insert mode
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


" fzf:
" similar to ctrl-p
nmap <leader>p :Files<CR>


" find in files:
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


" asyncomplete
" auto popup
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ "\<C-n>"
  "\ asyncomplete#force_refresh()
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


" Language Servers Client (vim-lsp)
nnoremap <leader>i      :LspDocumentDiagnostics()<CR>
nnoremap <silent> gd    :LspDefinition<CR>
nnoremap <leader>d      :LspDefinition<CR>
nnoremap <silent> <F12> :LspDefinition<CR>
nnoremap <leader>r      :LspRename<CR>
nnoremap <silent> <F2>  :LspRename<CR>
nnoremap <leader>s      :LspDocumentSymbol<CR>

" LSP: language specific `:help vim-lsp-register_server`
" js
if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'typescript-language-server',
		\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
		\ 'whitelist': ['typescript'],
		\ })
endif
" rust
if executable('rls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rls',
		\ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
		\ 'whitelist': ['rust'],
		\ })
endif
