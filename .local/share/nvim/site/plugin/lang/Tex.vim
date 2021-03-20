" Tex.vim -- latex specific functions


" Setting latex specific options
"
" Usage:    au Filetype tex call TexOptions()
"
function! TexOptions()
    set concealcursor=

    command! OpenPdf call s:OpenPdf()
    function! s:OpenPdf()
        let l:name = expand('%:t:r')
        let l:command = 'zathura ' . l:name . '.pdf'
        exe '!' . l:command
    endfunction
endfunction
