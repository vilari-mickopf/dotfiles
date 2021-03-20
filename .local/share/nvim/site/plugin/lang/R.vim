" R.vim -- R specific functions


" Setting R specific options
"
" Usage:    au Filetype r call ROptions()
"
function! ROptions()
    function! RCompile()
        let l:filename = expand('%:p')
        let l:cmd = "R<CR>asource(" . l:filename . ")"
        call TerminalCall(l:cmd)
    endfunction
endfunction
