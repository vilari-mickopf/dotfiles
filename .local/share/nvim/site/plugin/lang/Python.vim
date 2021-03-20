" Python.vim -- Python specific functions


" Setting Python specific options
"
" Usage:    au Filetype python call PythonOptions()
"
function! PythonOptions()
    " Open terminal
        command! PythonOpenTerminal call PythonOpenTerminal()
        function! PythonOpenTerminal()
            split term://python
            WindowReduce
            call feedkeys("a\<C-l>")
            echo("")
        endfunction

    " Highlights
        " Highlight types
        exe 'hi TSType guifg=' . g:terminal_color_6

        " Args highlight -- before treesitter
        " syntax match PythonArg /\v[^\(\,]\s{-}\zs\w+(\s)@!\ze\s{-}\=(\=)@!(\s)@!/
        " highlight PythonArg guifg=#e5c07b
        " syntax match PythonArg /\v[(\,]\s{-}\zs\w+(\s)@!\ze\s{-}\=(\=)@!(\s)@!/
        " highlight PythonArg guifg=#e5c07b

        " Highlight Python functions
        " syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
        " highlight def link pythonFunction Function
endfunction
