set exrc
set secure
set nocompatible

set showcmd
set nomodeline

syntax enable
filetype plugin indent on
set encoding=utf-8
set clipboard+=unnamedplus

set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set number
set relativenumber
set wildmenu
set cursorline
set lazyredraw
set showmatch

set incsearch
set hlsearch

imap <c-space> <c-y>

" No arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

call plug#begin()
	" Chore
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  let g:prettier#quickfix_enabled = 0
  let g:prettier#autoformat_require_pragma = 0
  au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json,*.sol PrettierAsync
	" Plug 'mattn/emmet-vim'
	Plug 'christoomey/vim-tmux-navigator'

	" Dev Helpers
	Plug 'chun-yang/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-ragtag'
	Plug 'tpope/vim-vinegar'
	Plug 'tpope/vim-commentary'

	" Languages
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'Shougo/context_filetype.vim'
	Plug 'evanleck/vim-svelte'
	Plug 'pangloss/vim-javascript'
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'tovarishfin/vim-solidity'

	" Visual
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	Plug 'dracula/vim', { 'as': 'dracula'  }
	Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
call plug#end()

colorscheme gruvbox
set bg=dark

" Context Settings {{{
  if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
  endif

  let g:context_filetype#filetypes.svelte =
  \ [
  \   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
  \   {
  \     'filetype': 'typescript',
  \     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
  \     'end': '',
  \   },
  \   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
  \ ]

  let g:ft = ''
" }}}

