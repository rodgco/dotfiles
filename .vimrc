" Other {{{
  set exrc
  set secure
  set nocompatible

  " colorscheme tender 
  set nomodeline
  
  " leader is comma
  let mapleader=","

  " save session
  nnoremap <leader>s :mksession<CR>
"  nnoremap <space> <CR>

  " highlight last inserted text
  nnoremap gV `[v`]

"  map <C-j> <C-W>j
"  map <C-k> <C-W>k
"  map <C-h> <C-W>h
"  map <C-l> <C-W>l

  " nnoremap <C-h> gT
  " nnoremap <C-l> gt

	nnoremap <C-t><up> :tabr<cr>
	nnoremap <C-k> :tabr<cr>
	nnoremap <C-t><down> :tabl<cr>
	nnoremap <C-j> :tabl<cr>
	nnoremap <C-t><left> :tabp<cr>
	nnoremap <C-h> :tabp<cr>
	nnoremap <C-t><right> :tabn<cr>
	nnoremap <C-l> :tabn<cr>

	nnoremap <A-j> :m .+1<CR>==
	nnoremap <A-k> :m .-2<CR>==
	inoremap <A-j> <Esc>:m .+1<CR>==gi
	inoremap <A-k> <Esc>:m .-2<CR>==gi
	vnoremap <A-j> :m '>+1<CR>gv=gv
	vnoremap <A-k> :m '<-2<CR>gv=gv

  " enable syntax processing
  syntax enable 
  filetype plugin indent on
  set encoding=utf-8
  set clipboard=unnamedplus
" }}}

" Tabs & Spaces {{{
  set noexpandtab
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

  set path+=**

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
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-commentary'
    Plug 'evanleck/vim-svelte'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'codechips/coc-svelte', {'do': 'npm install'}
    Plug 'vim-airline/vim-airline'
		Plug 'dracula/vim', { 'as': 'dracula'  }
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    Plug 'Shougo/context_filetype.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'tomlion/vim-solidity'	
		Plug 'rajasegar/vim-astro', {'branch': 'main'}
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
		Plug 'mattn/emmet-vim'
		Plug 'rust-lang/rust.vim'
		Plug 'Chiel92/vim-autoformat'
		let g:formatdef_rustfmt = '"rustfmt"'
		let g:formatters_rust = ['rustfmt']
		Plug 'jpalardy/vim-slime'
		let g:slime_target="tmux"
		let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
		Plug 'stevearc/vim-arduino'
		let g:arduino_dir='/opt/arduino-1.8.19'
 call plug#end()

 colorscheme dracula

 " Prettier Settings {{{
  let g:prettier#quickfix_enabled = 0
  let g:prettier#autoformat_require_pragma = 0
  au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json,*.sol PrettierAsync
" }}}

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

" NERDCommenter settings {{{
  let g:NERDSpaceDelims = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

  " Align comment delimiters to the left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  fu! NERDCommenter_before()
    if (&ft == 'html') || (&ft == 'svelte')
      let g:ft = &ft
      let cfts = context_filetype#get_filetypes()
      if len(cfts) > 0
        if cfts[0] == 'svelte'
          let cft = 'html'
        elseif cfts[0] == 'scss'
          let cft = 'css'
        else
          let cft = cfts[0]
        endif
        exe 'setf ' . cft
      endif
    endif
  endfu

  fu! NERDCommenter_after()
    if (g:ft == 'html') || (g:ft == 'svelte')
      exec 'setf ' . g:ft
      let g:ft = ''
    endif
  endfu
" }}}

" Netrw Settings {{{
  " http://blog.trk.in.rs/2015/12/01/vim-tips/
  " http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
  " Toggle Vexplore with Ctrl-E
  function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
  endfunction
  map <silent> <C-E> :call ToggleVExplorer()<CR>

  " Hit enter in the file browser to open the selected
  " file with :vsplit to the right of the browser.
  let g:netrw_banner=0        " disable annoying banner
  let g:netrw_browse_split=3  " open in prior window
  let g:netrw_altv=1          " open splits to the right
  let g:netrw_liststyle=3     " tree view
  let g:netrw_list_hide=netrw_gitignore#Hide()
  let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

  autocmd FileType netrw nmap <buffer> l <CR>
  autocmd FileType fzf tnoremap <buffer> <CR> <C-t>

  " Change directory to the current buffer when opening files.
  " set autochdir
  " maybe is easier within netrw just press c  help :netrw-c
  " that's better than 'cd ../path' which change in all tabs
" }}}

" vim:foldmethod=marker:foldlevel=0
