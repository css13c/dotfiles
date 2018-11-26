" Spaces & Tabs -----------------------------------------------{{{
	set backspace=indent,eol,start								" Allow backspacing over whitespace elements
"}}}

" Visual Config -----------------------------------------------{{{
	set cursorline												" Highlight current line
	set laststatus=2											" Always dispaly the status line
"}}}

" Remaps ------------------------------------------------------{{{
	" Remap Esc in Insert Mode
	inoremap kj <Esc>
"}}}

" Searching ---------------------------------------------------{{{
	set hlsearch												" Highlight search results
	" Turn off highlights
	nnoremap <leader><space> :nohlsearch<CR>
	set incsearch												" Search as characters are entered
	set ignorecase												" Use case insensitive searching
	set smartcase												" Case sensitive searching when using capital letters
"}}}

" Leader Settings ---------------------------------------------{{{
	let mapleader=","											" Set leader
	set timeoutlen=3000											" Wait for 3 sec on mapped key sequences before timeout
"}}}

" Copy / Paste ------------------------------------------------{{{
	" Copy to clipboard
	nnoremap <leader>y "+y
	vnoremap <leader>y "+y
	" Paste from clipboard
	nnoremap <leader>p "+p
	vnoremap <leader>p "+p
"}}}
