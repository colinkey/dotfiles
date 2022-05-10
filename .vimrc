" ignore case when searching
set ignorecase
" no annoying bells at end of line
set noerrorbells

" TABS
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
" set nowrap

if has('termguicolors')
  set termguicolors
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'

" :CocInstall coc-solargraph coc-tsserver coc-eslint

" auto-close brackets/parens
" Plug 'cohama/lexima.vim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'

" Load neovim specific plugin if neovim is available
if has('nvim')
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'glepnir/dashboard-nvim'
	Plug 'sunjon/shade.nvim'
	Plug 'folke/twilight.nvim'
endif

call plug#end()

colorscheme everforest
let g:airline_theme = 'everforest'
let g:airline_powerline_fonts = 1

if has('nvim')
  nnoremap <C-p> :Telescope find_files<CR>
  nnoremap <leader>ff :Telescope find_files<CR>
  nnoremap <leader>fg :Telescope live_grep<CR>
  nnoremap <leader>fb :Telescope buffers<CR>
else
  " FZF Config
  " FZF by default does not ignore patterns in .gitignore but it'd be cool if it
  " did so changing this env var will override the default behavior.
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  " \ff to search :Files
  nnoremap <leader>ff :Files<CR>
  " END FZF Config
endif

" ctrl b to toggle NERDTree
" map <C-b> :NERDTreeToggle<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>

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

let g:coc_global_extensions = ['coc-eslint', 'coc-solargraph', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-json']
" End of CoC configuration

" Dashboard config
let g:dashboard_default_executive = 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_shortcut={
\ 'last_session'       : '\ s l',
\ 'find_history'       : '\ f h',
\ 'find_file'          : '\ f f',
\ 'new_file'           : '\ c n',
\ 'change_colorscheme' : '\ t c',
\ 'find_word'          : '\ f a',
\ 'book_marks'          : 'dont use this lolo'
\ }

command! -range=1 BreakAfter :s/\./\.\r/g
command! -range=1 BreakBefore :s/\./\r\./g

function! s:BreakIt() 
	" Sets a mark `Z`
	execute "mark Z" 
	" Calls the BreakAfter command that will break the current line into
	" multiple lines after the .
	execute "BreakAfter"
	" Goes to the end of the current line, enters visual mode, go to the
	" previous set mark, and formats the selection
	execute "normal! $v`Z="
	" Removes the mark Z
	execute "delm Z"
	" Removes the search highlighting
	execute "noh"
endfunction

nnoremap <leader>gb :call <SID>BreakIt()<CR>

" Command for twilight
nnoremap <silent> <Leader>tl :Twilight<CR>
lua << EOF
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>ts',
  }
})
EOF

