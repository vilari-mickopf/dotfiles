" Octave.vim -- Octave specific functions


" Setitng Octave/Matlab specific options
"
" Usage:    au Filetype matlab call OctaveOptions()
"
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
