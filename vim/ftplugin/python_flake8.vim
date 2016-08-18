" Python filetype plugin for running flake8
" Language: Python (ft=python)
" Original Author: Vincent Driessen <vincent@datafox.nl>
" Maintainer: Walt Javins
" Version: Vim 7 (may work with lower Vim versions, but not tested)
" URL: http://github.com/javins/.dotfiles

" Only do this when not done yet for this buffer
if exists("b:loaded_flake8_ftplugin")
    finish
endif

let b:loaded_flake8_ftplugin = 1

if !exists("g:flake8_args")
    "let g:flake8_args = "--ignore E501"
    let g:flake8_args = ""
endif

let s:flake8_cmd="flake8"

if !exists("*Flake8()")
    function Flake8()
        if !executable(s:flake8_cmd)
            echoerr "File " . s:flake8_cmd . " not found. Please install it first."
            return
        endif

        set lazyredraw " delay redrawing
        cclose " close any existing cwindows

" store old grep settings (to restore later)
        let l:old_gfm=&grepformat
        let l:old_gp=&grepprg

" write any changes before continuing
        if &readonly == 0
            update
        endif

" perform the grep itself
        let &grepformat="%f:%l:%c: %m"
        let &grepprg=s:flake8_cmd . " " . g:flake8_args
        silent! grep! %

" restore grep settings
        let &grepformat=l:old_gfm
        let &grepprg=l:old_gp

" open cwindow
        let has_results=getqflist() != []
        if has_results
            execute 'belowright copen'
            setlocal wrap
            nnoremap <buffer> <silent> c :cclose<CR>
            nnoremap <buffer> <silent> q :cclose<CR>
        endif

        set nolazyredraw
        redraw!

        if has_results == 0
" Show OK status
            hi Green ctermfg=green
            echohl Green
            echon "Flake8 safe"
            echohl
        endif
    endfunction
endif

" Add mappings, unless the user didn't want this.
" The default mapping is registered under to <F6> by default, unless the user
" remapped it already (or a mapping exists already for <F6>)
if !exists("no_plugin_maps") && !exists("no_flake8_maps")
    if !hasmapto('Flake8(')
        noremap <buffer> <F7> :call Flake8()<CR>
        noremap! <buffer> <F7> <Esc>:call Flake8()<CR>
    endif
endif

" run flake8 before allowing us to write out to a file
autocmd BufWritePost * call Flake8()
