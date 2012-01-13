" Learn vim better - these can be reenabled once I'm efficient
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Misc general settings
syntax on
set background=dark
set showcmd				" Show (partial) command in status line.
set showmatch			" Show matching brackets.
"set autowrite			" Automatically save before commands like :next and :make
"set hidden				" Hide buffers when they are abandoned
set number        		" always show line numbers
set nowrap        		" don't wrap lines
"set backspace=indent,eol,start	" allow backspacing over everything in insert mode

" Spacing settings
set tabstop=2     		" a tab is four spaces
set autoindent    		" always set autoindenting on
set copyindent    		" copy the previous indentation on autoindenting
set shiftwidth=2  		" number of spaces to use for autoindenting
set shiftround    		" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     		" set show matching parenthesis
set smarttab      		" insert tabs on the start of a line according to shiftwidth, not tabstop

" Search tweaks
set ignorecase    		" ignore case when searching
set smartcase     		" pay attention to case when upper case is used 
set hlsearch      		" highlight search terms
set incsearch     		" show search matches as you type

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype plugin indent on
endif
