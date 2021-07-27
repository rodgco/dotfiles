" Other {{{
  colorscheme codedark
  set nomodeline
  
  " leader is comma
  let mapleader=","

  " save session
  nnoremap <leader>s :mksession<CR>

  " highlight last inserted text
  nnoremap gV `[v`]

  " enable syntax processing
  syntax enable 
  filetype plugin indent on
  set encoding=utf-8
  set clipboard=unnamedplus
" }}}
" Tabs & Spaces {{{
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
"}}}
" Other {{{
  "UI CONFIG
  set number
  set relativenumber
  set showcmd
  set cursorline
  set wildmenu
  set lazyredraw
  set showmatch

  "SEARCH
  set incsearch
  set hlsearch
  " turn off search highlight
  nnoremap <leader><space> :nohlsearch<CR>

  "FOLDING
"  set foldenable
"  set foldmethod=indent
"  set foldlevelstart=10
"  set foldnestmax=10

  inoremap jk <ESC>
  vnoremap jk <ESC>

  call plug#begin('~/.vim/plugged')
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'chun-yang/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-commentary'
    Plug 'evanleck/vim-svelte'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    " Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'codechips/coc-svelte', {'do': 'npm install'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
 
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
 call plug#end()

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync
 
" }}}

" vim:foldmethod=marker:foldlevel=0
