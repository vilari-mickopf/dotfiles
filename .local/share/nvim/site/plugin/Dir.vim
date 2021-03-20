" Dir.vim -- Creating dirs from vim


" MkNonExDir -- Auto-create all necessary dirs when saving newly created files
"
" Usage:
"
" au BufWritePre * :call MkNonExDir(expand('<afile>'), +expand('<abuf>'))
"
function! MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        " Get name
        let l:dir=fnamemodify(a:file, ':h')
        " Create dir
        if !isdirectory(l:dir)
            call mkdir(l:dir, 'p')
        endif
    endif
endfunction
