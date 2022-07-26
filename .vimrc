" Universal Settings ------------------------------------------{{{
  
	" Spaces & Tabs -------------------------------------------{{{
		set backspace=indent,eol,start							" Allow backspacing over whitespace elements
	"}}}

	" Visual Config ------------------------------------------{{{
		set cursorline											" Highlight current line
		set laststatus=2										" Always dispaly the status line
	"}}}

	" Remaps -------------------------------------------------{{{
		" Remap Esc in Insert Mode
		inoremap kj <Esc>

		" Stops vim from opening in Replace mode
		nnoremap <esc>^[ <esc>^[
	"}}}

	" Searching -----------------------------------------------{{{
		set hlsearch 											" Highlight search results
		nnoremap <leader><space> :nohlsearch<CR>				" Turn off highlights
		set incsearch											" Search as characters are entered
		set ignorecase											" Use case insensitive searching
		set smartcase											" Case sensitive searching when using capital letters
	"}}}

	" Leader Settings -----------------------------------------{{{
		let mapleader=","										" Set leader
		set timeoutlen=3000										" Wait for 3 sec on mapped key sequences before timeout
	"}}}

	" Copy / Paste --------------------------------------------{{{
		nnoremap <leader>y "+y									" Copy to clipboard in normal mode
		vnoremap <leader>y "+y									" Copy to clipboard in visual mode
		nnoremap <leader>p "+p									" Paste from clipboard in normal mode
		vnoremap <leader>p "+p									" Paste from clipboard in visual mode
	"}}}
"}}}

" Plug-Ins ----------------------------------------------------{{{
	" Install vim-plug if not found
	let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
	if empty(glob(data_dir . '/autoload/plug.vim'))
		silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	call plug#begin('~/vimfiles/plugged')						" Install plugins to vimfiles/plugged
		Plug 'srcery-colors/srcery-vim'							" Sorcery colorscheme
		Plug 'kien/ctrlp.vim'									" File finder
		Plug 'vim-airline/vim-airline'							" Statusline replacement
		Plug 'vim-airline/vim-airline-themes'					" Airline colorschemes
		Plug 'terryma/vim-multiple-cursors'						" Sublime-style multi-cursors
		Plug 'tomtom/tcomment_vim'								" Adds visual studio style comment selection
		Plug 'junegunn/goyo.vim'								" Removes visual elements
		Plug 'junegunn/limelight.vim'							" Highlights current text, used only with Goyo
		Plug 'easymotion/vim-easymotion'						" Helps move around files faster
		Plug 'airblade/vim-gitgutter'							" Shows Git changes in file
		Plug 'tpope/vim-fugitive'								" Git wrapper
		Plug 'tpope/vim-surround'								" Modify surrounding qutoes, braces, etc.
		Plug 'tpope/vim-eunuch'									" Add common UNIX commands
	call plug#end()

	" Airline configuration
		let g:airline_theme='night_owl'							" Status line theme
		let g:airline#extensions#branch#enabled = 1				" Show git branch in status line
		set noshowmode											" Hides mode information below lightline

	" Vim-Plug shortcuts
		nnoremap <leader>Ei :PlugInstall<CR>
		nnoremap <leader>Eu :PlugClean<CR>
		nnoremap <leader>En :PlugUpdate<CR>

	" CtrlP setup and mappings
		let g:ctrlp_map = '<c-p>'
		let g:ctrlp_working_path_mode = 'c'						" Set working directory off of current file
		let g:ctrlp_cmd = 'CtrlP'
		" Allow for searching in a given directory
		nnoremap <leader>mp :CtrlP

	" Easymotion mappings
		nmap <leader>ew <Plug>(easymotion-w)
		nmap <leader>eW <Plug>(easymotion-W)
		nmap <leader>ee <Plug>(easymotion-e)
		nmap <leader>eE <Plug>(easymotion-E)
		nmap <leader>es <Plug>(easymotion-s2)
		nmap <leader>eb <Plug>(easymotion-b)
		nmap <leader>eB <Plug>(easymotion-B)

	" Goyo and Limelight config/mappings
		nnoremap <leader>mg :Goyo<CR>
		let g:goyo_width=120									" Default Goyo width
		let g:goyo_height='85%'									" Default Goyo height
		autocmd! User GoyoEnter call GoyoSetup()				" Calls the GoyoSetup function upon turning on Goyo
		autocmd! User GoyoLeave call GoyoTeardown()				" Calls the GoyoTeardown function upon turning on Goyo
"}}}

" Colors ------------------------------------------------------{{{
	colorscheme srcery 											" Set colorscheme
	syntax enable												" Enable syntax highlighting
"}}}

" Spaces & Tabs -----------------------------------------------{{{
	filetype indent plugin on									" Load filetype-specific indent files
	set autoindent												" Enable auto indent
	set smartindent												" Enable smart indent
	set tabstop=4												" Number of visual spaces per tab
	set shiftwidth=4											" Use 4 spaces when shifting code
	set expandtab												" Turn tabs to spaces

	" Remove all trailing whitespace
	nnoremap <leader><tab>x :call TrimWhitespace()<CR>
	" Remove trailing whitespace & retab file
	nnoremap <leader><tab><tab> :%retab!<bar>:call TrimWhitespace()<CR>
	" Turn all indentation to spaces
	nnoremap <leader><tab><space> :%retab!<bar>:call TrimWhitespace()<CR>
"}}}

" Visual Config -----------------------------------------------{{{
	set number relativenumber								    " Enable relative line numbering
	set showcmd													" Shows last command entered
	set cmdheight=2												" Set the command window height to 2 lines
	set wildmenu												" Enables command-line completion
	set lazyredraw												" Redraw only when necessary
	set showmatch												" Highlight matching [{()}]
	set noeb vb t_vb=											" Turn off visual bell
	set ruler													" Display cursor position in status line
	set nowrap													" Turn off line wrapping
	set sidescroll=1											" Make side-scrolling load in 1 character at a time
	set splitright												" Opens vertical splits right of current split
	set splitbelow												" Opens horizontal splits below current split
"}}}

" Folding -----------------------------------------------------{{{
	set foldenable												" Enable folding
	set foldlevelstart=10										" Open most folds by default
	set foldnestmax=10											" Max number of nested folds
	set foldmethod=indent										" Fold based on indent

	" Set foldmethod to marker
	nnoremap <leader>fm :set foldmethod=marker<bar>:set foldlevel=0<CR>
	" Set foldmethod to syntax
	nnoremap <leader>fs :set foldmethod=syntax<CR>
"}}}

" Searching ---------------------------------------------------{{{
	" Use Esc to cancel search
	nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
"}}}

" Movement ----------------------------------------------------{{{
	set nostartofline											" Removes going to start of line as default
"}}}

" Mappings --------------------------------------------{{{
	" Reload vimrc
	nnoremap <leader>` :source ~/.vimrc<CR>

	" Normal Mode Mappings
		" Hotkeyed Files
			" Format is <leader>o, optional v or h for split, then file hotkey
			" .vimrc
			nnoremap <leader>o` :e ~/.dotfiles/.vimrc<CR>
			nnoremap <leader>oh` :sp ~/.dotfiles/.vimrc<CR>
			nnoremap <leader>ov` :vsp ~/.dotfiles/.vimrc<CR>
			" .gitconfig
			nnoremap <leader>og :e ~/dotfiles/.gitconfig<CR>
			nnoremap <leader>ohg :sp ~/dotfiles/.gitconfig<CR>
			nnoremap <leader>ovg :vsp ~/dotfiles/.gitconfig<CR>
			" ahk file
			nnoremap <leader>of :e ~/dotfiles/ahk/hotkeys.ahk<CR>
			nnoremap <leader>ohf :sp ~/dotfiles/ahk/hotkeys.ahk<CR>
			nnoremap <leader>ovf :vsp ~/dotfiles/ahk/hotkeys.ahk<CR>

		" Messages Mappings
			nnoremap <leader>cc :messages clear<CR>
			nnoremap <leader>cr :messages<CR>

		" Buffer Mappings
			" Take argument to open buffer vertically split
			nnoremap <leader>bv :vert sb
			" List all buffers
			nnoremap <leader>bl :ls<CR>
			" List all buffers, then take new buffer argument
			nnoremap <leader>bb :ls<CR>:b
			" Go to next buffer
			nnoremap <leader>bn :bn<CR>
			" Go to previous buffer
			nnoremap <leader>bp :bp<CR>
			" Switch to swap buffer
			nnoremap <leader>bs <C-^>
			" Open swap buffer in vertical split
			nnoremap <leader>bav :vert sb #<CR>
			" Open swap buffer in horizontal split
			nnoremap <leader>bah :sb #<CR>

		" Tab Mappings
			" Go to previous tab
			nnoremap gp :tabp<CR>
			" Close current tab
			nnoremap gC :tabclose<CR>

	" Insert Mode Mappings
"}}}

" Backups -----------------------------------------------------{{{
	if !isdirectory($HOME.'/vimfiles/vimtmp')					" Create temp directory on startup if it doesn't exist
		silent call mkdir($HOME.'/vimfiles/vimtmp', 'p')
	endif
	silent call delete($HOME.'/vimfiles/vimtmp/*')				" Delete all files in temp directory

	set backup													" Turn on backup files
	set backupdir=~/vimfiles/vimtmp//							" Set backup directory
	set directory=~/vimfiles/vimtmp//							" Set swap file directory
	set undodir=~/vimfiles/vimtmp//								" Set undo file directory
	set writebackup												" Create backup file before file is created
"}}}

" Custom Functions --------------------------------------------{{{
	set pastetoggle=<F11>										" Toggle between 'paste' and 'nopaste'

	" Open vimrc workspace in new tab
	function! VimrcWorkspace()
		execute "tabedit " . fnameescape("~/.vimrc")
		execute "set foldmethod=marker"
		execute "set foldlevel=0"
		execute "sp" . fnameescape("~/.vsvimrc")
		execute "set foldlevel=0"
		execute "normal! ^wh"
	endfunction

	function! TrimWhitespace()
		let l:save = winsaveview()
		keeppatterns %s/\s\+$//e
		call winrestview(l:save)
	endfunction

	function! GoyoSetup()
		set wrap
		noremap j gj
		noremap k gk
		execute 'Limelight'
	endfunction

	function! GoyoTeardown()
		set nowrap
		noremap j j
		noremap k k
		execute 'Limelight!'
	endfunction
"}}}

" GUI setting ------------------------------------------------{{{
	if has('gui_running')
		set guifont=Consolas:h9									" Change gvim font
		set lines=100 columns=1000								" Maximize gvim window size
		set guioptions-=m										" Remove gvim menu bar
		set guioptions-=T										" Remove gvim toolbar
		set guioptions-=r										" Remove right scrollbar
		set guioptions-=L										" Remove left scrollbar
	endif
"}}}

" Terminal Settings -------------------------------------------{{{
	if !has('gui_running')
		set t_Co=256
		set term=xterm
	endif
"}}}

set modeline
set modelines=1
" vim:foldmethod=marker:foldlevel=0
