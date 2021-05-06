" Lang.vim -- Lang specific functions


function! BashOptions()
    " Run
    command! BashRun call BashRun()
    function! BashRun()
        let l:filename = expand('%:p')

        let l:cmd = 'chmod +x ' . l:filename . '; ' . l:filename

        call TerminalCall(l:cmd)
        echo('Run')
    endfunction

    " Run With args
    command! BashRunWithArgs call BashRunWithArgs()
    function! BashRunWithArgs()
        let l:msg = PromptGetUserInput('args: ')
        if(empty(l:msg)) | return | endif

        let l:filename = expand('%:p')

        let l:cmd = 'chmod +x ' . l:filename . '; ' .  l:filename .  ' ' . l:msg
        call TerminalCall(l:cmd)

        echo('Run with args: ' . l:msg)
    endfunction
endfunction


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


function! JsonOptions()
    set concealcursor=

    command! -nargs=* JsonFormat :%!python -m json.tool
endfunction


function MarkdownOptions()
    set concealcursor=

    function MarkdownCompile()
        let l:filename = expand('%:p')
        let l:outname = expand('%:r') . '.pdf'
        let l:cmd = 'pandoc ' . l:filename . ' -o ' . l:outname
        call TerminalCall(l:cmd)
    endfunction
endfunction


function! OctaveOptions()
    " Run
    command! OctaveRun call OctaveRun()
    function! OctaveRun()
        let l:filename = expand('%:p')

        let l:cmd = 'octave ' . l:filename
        call TerminalCall(l:cmd)

        echo('Run')
    endfunction

    " Open terminal
    command! OctaveOpenTerminal call OctaveOpenTerminal()
    function! OctaveOpenTerminal()
        split term://octave
        WindowReduce
        call feedkeys("aPS1('>> ')\<CR>\<C-l>")
        echo
    endfunction
endfunction


function! RMarkdownOptions()
    set concealcursor=

    function! RMarkdownCompile()
        let l:filename = expand('%:p')
        let l:cmd = "echo \"require(rmarkdown); render(\'" .
                        \ l:filename . "\')\" | R --vanilla"
        call TerminalCall(l:cmd)
    endfunction
endfunction


function! TexOptions()
    set concealcursor=

    command! OpenPdf call s:OpenPdf()
    function! s:OpenPdf()
        let l:name = expand('%:t:r')
        let l:command = 'zathura ' . l:name . '.pdf'
        exe '!' . l:command
    endfunction
endfunction
