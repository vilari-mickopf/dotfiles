" CleanUp -- Clean up stuff on exit


" CleanUp -- Clean up on exit
"
" Usage:
"
" au VimLeave * call CleanUp()
"
" List here all functions that should be executed on exit
"
function! CleanUp()
    JupyterCustomTerminate
endfunction
