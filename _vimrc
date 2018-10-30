" Universal Settings ------------------------------------------{{{
	source ~/vimfiles/config/unirc.vim							" Get settings from unirc			
"}}}

" Plug-Ins ----------------------------------------------------{{{
    call plug#begin('~/vimfiles/plugged')						" Install plugins to vimfiles/plugged
		Plug 'srcery-colors/srcery-vim'							" Sorcery colorscheme
		Plug 'szorfein/fantasy.vim'								" Fantasy colorscheme
		Plug 'koirand/tokyo-metro.vim'							" Tokyo Metro colorscheme
		Plug 'BrainDeath0/Hypsteria'							" Hypsteria colorscheme
		Plug 'kien/ctrlp.vim'									" File finder
		Plug 'vim-airline/vim-airline'							" Statusline replacement
		Plug 'vim-airline/vim-airline-themes'					" Airline colorschemes
		Plug 'terryma/vim-multiple-cursors'						" Sublime-style multi-cursors
		Plug 'airblade/vim-gitgutter'							" Shows git changes in file
		Plug 'tomtom/tcomment_vim'								" Adds visual studio style comment selection
		Plug 'junegunn/goyo.vim'								" Removes visual elements
		Plug 'easymotion/vim-easymotion'						" Helps move around files faster
    call plug#end()

	" Airline configuration
	let g:airline_theme='night_owl'
	set noshowmode												" Hides mode information below lightline

	" Vim-Plug shortcuts
	nnoremap <leader>ei :PlugInstall<CR>

	" CtrlP setup and mappings
	let g:ctrlp_map = '<c-p>'									" Set binding to run it 
	let g:ctrlp_working_path_mode = 'c'							" Set working directory off of current file
"}}}

" Colors ------------------------------------------------------{{{
	colorscheme  srcery											" Set colorscheme
    syntax enable                                               " Enable syntax highlighting
"}}}

" Spaces & Tabs -----------------------------------------------{{{
    filetype indent plugin on                                   " Load filetype-specific indent files
    set autoindent                                              " Enable auto indent
    set smartindent                                             " Enable smart indent
    set tabstop=4                                               " Number of visual spaces per tab
	set shiftwidth=4											" Use 4 spaces when shifting code
"}}}

" Visual Config -----------------------------------------------{{{
    set number                                                  " Enable line numbering
    set showcmd                                                 " Shows last command entered
    set cmdheight=2                                             " Set the command window height to 2 lines
    set wildmenu                                                " Enables command-line completion
    set lazyredraw                                              " Redraw only when necessary
    set showmatch                                               " Highlight matching [{()}]
    set noeb vb t_vb=                                           " Turn off visual bell
    set ruler                                                   " Display cursor position in status line
	set nowrap													" Turn off line wrapping
"}}}

" Folding -----------------------------------------------------{{{
    set foldenable                                              " Enable folding
    set foldlevelstart=10                                       " Open most folds by default
    set foldnestmax=10                                          " Max number of nested folds
    set foldmethod=indent                                       " Fold based on indent

	" Set foldmethod to marker
	nnoremap <leader>fm :set foldmethod=marker<CR>
	" Set foldmethod to syntax
	nnoremap <leader>fs :set foldmethod=syntax<CR>
"}}}

" Searching ---------------------------------------------------{{{
	" Use Esc to cancel search
    nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
"}}}

" Movement ----------------------------------------------------{{{
    set nostartofline                                           " Removes going to start of line as default
"}}}

" Split and Tab Control ---------------------------------------{{{
	set splitbelow												" Open new splits below current
	set splitright												" Open new splits to right
	" Go to prevous tab
	nnoremap gp :tabprevious<CR>
	" Go to next tab
	nnoremap gt :tabnext<CR>

	" Opens full vimrc setup in new tab
	nnoremap <leader>ow` :call VimrcWorkspace()<CR>
"}}}

" Leader Shortcuts --------------------------------------------{{{
    let mapleader=","                                           " Set leader
	" Reload vimrc
	nnoremap <leader>` :source ~/_vimrc<CR>
	" Open file
	nnoremap <leader>oa :e 
	" Open file horizontally split
	nnoremap <leader>oha :sp 
	" Open file vertically split
	nnoremap <leader>ova :vsp 
	
	" Hotkeyed Files ------------------------------------------{{{
		" Format is <leader>o, optional v or h for split, then file hotkey
		" _vimrc
		nnoremap <leader>o` :e ~/_vimrc<CR>
		nnoremap <leader>oh` :sp ~/_vimrc<CR>
		nnoremap <leader>ov` :vsp ~/_vimrc<CR>
		" _vsvimrc
		nnoremap <leader>oe :e ~/_vsvimrc<CR>
		nnoremap <leader>ohe :sp ~/_vsvimrc<CR>
		nnoremap <leader>ove :vsp ~/_vsvimrc<CR>
		" unirc.vim
		nnoremap <leader>ou :e ~/vimfiles/config/unirc.vim<CR>
		nnoremap <leader>ohu :sp ~/vimfiles/config/unirc.vim<CR>
		nnoremap <leader>ovu :vsp ~/vimfiles/config/unirc.vim<CR>
		" .gitconfig
		nnoremap <leader>og :e ~/.gitconfig<CR>
		nnoremap <leader>ohg :sp ~/.gitconfig<CR>
		nnoremap <leader>ovg :vsp ~/.gitconfig<CR>
		" ahk file
		nnoremap <leader>of :e ~/ahk/hotkeys.ahk<CR>
		nnoremap <leader>ohf :sp ~/ahk/hotkeys.ahk<CR>
		nnoremap <leader>ovf :vsp ~/ahk/hotkeys.ahk<CR>
	"}}}
	
"}}}

" Backups ------------------------------------------------------{{{
	if !isdirectory($HOME.'/vimfiles/vimtmp')							" Create temp directory on startup if it doesn't exist
		silent call mkdir($HOME.'/vimfiles/vimtmp', 'p')
	endif
	silent call delete($HOME.'/vimfiles/vimtmp/*')						" Delete all files in temp directory

	set backup													" Turn on backup files
	set backupdir=~/vimfiles/vimtmp//							" Set backup directory
	set directory=~/vimfiles/vimtmp//							" Set swap file directory
	set undodir=~/vimfiles/vimtmp//								" Set undo file directory
	set writebackup												" Create backup file before file is created
"}}}

" Custom Functions --------------------------------------------{{{
    set pastetoggle=<F11>                                       " Toggle between 'paste' and 'nopaste'
	" Open vimrc workspace in new tab
	function! VimrcWorkspace()
		execute "tabedit " . fnameescape("~/vimfiles/config/_vimrc")
		execute "vsp " . fnameescape("~/vimfiles/config/unirc.vim")
		execute "set foldmethod=marker"
		execute "set foldlevel=0"
		execute "sp" . fnameescape("~/vimfiles/config/_vsvimrc")
		execute "set foldlevel=0"
		execute "normal! ^wh"
	endfunction
"}}}

" GUI settings ------------------------------------------------{{{
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