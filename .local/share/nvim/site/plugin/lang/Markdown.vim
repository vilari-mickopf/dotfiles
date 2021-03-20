" Markdown.vim -- markdown specific functions


" Setting markdown specific options
"
" Usage:    au Filetype markdown call MarkdownOptions()
"
function MarkdownOptions()
    set concealcursor=

    function MarkdownCompile()
        let l:filename = expand('%:p')
        let l:outname = expand('%:r') . '.pdf'
        let l:cmd = 'pandoc ' . l:filename . ' -o ' . l:outname
        call TerminalCall(l:cmd)
    endfunction
endfunction
