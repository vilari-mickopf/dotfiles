" Rmd.vim -- rmarkdown specific functions


" Setting rmarkdown specific options
"
" Usage:    au Filetype rmd call RMarkdownOptions()
"
function! RMarkdownOptions()
    set concealcursor=

    function! RMarkdownCompile()
        let l:filename = expand('%:p')
        let l:cmd = "echo \"require(rmarkdown); render(\'" .
                        \ l:filename . "\')\" | R --vanilla"
        call TerminalCall(l:cmd)
    endfunction
endfunction
