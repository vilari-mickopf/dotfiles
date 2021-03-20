" Haskell.vim -- Haskell specific functions


" Setitng Haskell specific options
"
" Usage:    au Filetype haskell call HaskellOptions()
"
function! HaskellOptions()
    " Compile
    command! HaskellMake call s:HaskellMake()
    function! s:HaskellMake()
        let l:filename = expand('%:p')

        let l:cmd = 'ghc --make ' . l:filename

        call TerminalCall(l:cmd)
        echo('Make')
    endfunction

    " Open ghci
    command! HaskellOpenGhci call s:HaskellOpenGhci()
    function! s:HaskellOpenGhci()
        split term://ghci
        WindowReduce
        call feedkeys("a:set prompt \">> \"\<CR>\<C-l>\<Esc>")
        echo("")
    endfunction
endfunction
