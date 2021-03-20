" Bash.vim -- Bash specific functions


" Setting Bash specific options
"
" Usage:    au Filetype bash call BashOptions()
"
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

    exe 'hi TSPunctBracket guifg=' . g:terminal_color_5
    " exe 'hi TSConstant guifg=' . g:terminal_color_5
endfunction
