" Warning.vim -- Echo warning


" EchoWarning -- echo warning message
"
" Usage:
"
" call EchoWarning('Warning!')
"
function! EchoWarning(msg)
    redraw!
    echohl WarningMsg
    echo(a:msg)
    echohl None
endfunction
