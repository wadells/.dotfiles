" learn vim the hard way
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Colors
syntax enable
set background=dark
colorscheme solarized

" Misc settings
set showcmd			" Show (partial) command in status line.
set showmatch			" Show matching brackets.
"set hidden			" Hide buffers when they are abandoned
set number        		" always show line numbers
set nowrap        		" don't wrap lines
"set backspace=indent,eol,start	" allow backspacing over everything
set pastetoggle=<F2>		" hit <F2> to toggle paste mode
set backupdir=/tmp		" store backups in /tmp
set directory=/tmp		" store swap files in /tmp too

" hilight when we go over 80 chars
highlight OverLength term=reverse ctermbg=red
match OverLength /\%>80v/

" hilight trailing whitespace
highlight TrailingSpace term=reverse ctermbg=red
match TrailingSpace /\s\+$/

" Spacing settings
set tabstop=8 shiftwidth=4    	" isilon style
set autoindent    		" always set autoindenting on
set copyindent    		" mainain previous indentation
set shiftround    		" use shiftwidth with '<' and '>'
set showmatch     		" set show matching parenthesis
set smarttab

" Search tweaks
set ignorecase    		" ignore case when searching
set smartcase     		" use upper case hints though
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
