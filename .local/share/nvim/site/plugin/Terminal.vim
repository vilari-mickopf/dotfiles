" Terminal.vim -- Terminal utility functions


" Execute command in terminal
"
" Usage:
"
" call TerminalCall('git status')
"
function! TerminalCall(cmd)
    exe 'split' | exe 'terminal ' . a:cmd
    execute 'normal G'
endfunction
