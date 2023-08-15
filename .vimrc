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
set relativenumber

" always show column to left of numbers to prevent shifting
set signcolumn=yes

" this setting allows buffers to exist when backgrounded
set hidden

" detect changes outside of vim
set autoread

" don't wrap text to next line
" set nowrap

" allow mouse input in all modes
set mouse=a

" sets guifont to a supported fonttype
" https://www.nerdfonts.com/font-downloads
set guifont=JetBrainsMono\ Nerd\ Font:h14

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
Plug 'tpope/vim-fugitive'

Plug 'elixir-editors/vim-elixir'
Plug 'vim-crystal/vim-crystal'

" auto-close brackets/parens
Plug 'cohama/lexima.vim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'

" Load neovim specific plugin if neovim is available
if has('nvim')
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'nvimdev/dashboard-nvim'
	" Plug 'sunjon/shade.nvim'
	Plug 'folke/twilight.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'ruifm/gitlinker.nvim'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'

endif

call plug#end()

colorscheme everforest
let g:airline_theme = 'everforest'
let g:airline_powerline_fonts = 1

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

" copy_relative_path
function! s:CpRelPath()
	execute "!echo % | pbcopy"
endfunction

nnoremap <leader>crp :call <SID>CpRelPath()<CR>
" end copy_relative_path

" toggle_relative_numbers
function! s:ToggleRelNum()
	if &relativenumber == 1
		execute ":set norelativenumber"
	else
		execute ":set relativenumber"
	endif
endfunction

nnoremap <Leader>rn :call <SID>ToggleRelNum()<CR>
" end toggle_relative_numbers
