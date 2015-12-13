" kill crappy vi-isms
set nocompatible

" learn vim the hard way
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" easier indenting/dedenting of code blocks
vnoremap < <gv
vnoremap > >gv

" Colors
syntax enable
set background=dark
let g:solarized_termtrans = 1
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

" hilight trailing whitespace
highlight TrailingSpace term=reverse ctermbg=red
match TrailingSpace /\s\+$/

" Spacing settings
set shiftround    		" use shiftwidth with '<' and '>'
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Search tweaks
set ignorecase    		" ignore case when searching
set smartcase     		" use upper case hints though
set hlsearch      		" highlight search terms
set incsearch     		" show search matches as you type

" Fold with spacebar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" but don't fold a ton by default
setlocal foldlevel=6

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype
if has("autocmd")
	filetype plugin indent on
endif
