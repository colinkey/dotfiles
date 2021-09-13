" ignore case when searching
set ignorecase
" no annoying bells at end of line
set noerrorbells

" TABS
" spaces instead of tabs
set expandtab
" 2 space tabs
set shiftwidth=2
set tabstop=2
" smart indent
set si

" skip swap/backups
set noswapfile
set nobackup

" show line numbers
set number
" always show column to left of numbers to prevent shifting
set signcolumn=yes

" this setting allows buffers to exist when backgrounded
set hidden

" detect changes outside of vim
set autoread

" don't wrap text to next line
set nowrap

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-rails'
Plug 'vim-syntastic/syntastic'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
" auto-close brackets/parens
Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Syntastic settings from repo
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CoC Configuration
" extentions
" :CocInstall coc-css coc-html coc-json coc-eslint coc-tsserver coc-vetur
" coc-svelte coc-solargraph

" Configuration required for tab completion with autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" End of CoC configuration

" Ale Configuration
" Only enable eslint as linter
let g:ale_linter_aliases = { 'vue': ['vue', 'javascript'] }
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint', 'vls'],
      \}
" Ale enables code actions on save so let's add eslint to that
let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'vue': ['eslint'],
      \}
let g:ale_fix_on_save = 1

" FZF Config
" FZF by default does not ignore patterns in .gitignore but it'd be cool if it
" did so changing this env var will override the default behavior.
let $FZF_DEFAULT_COMMAND = 'rg --files'
" ctrl p to search :Files
nnoremap <C-p> :Files<CR>
" END FZF Config

" ctrl b to toggle NERDTree
map <C-b> :NERDTreeToggle<CR>

set gfn=JetBrainsMono-Medium:h14
