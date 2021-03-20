" Git.vim -- Useful git function


" GitFix -- Open all conflicted files in separate tabs
"
" Usage:
"
" :GitFix
"
command! GitFix call s:GitFix()
function! s:GitFix()
    let l:ret = system('git rev-parse --show-toplevel | ' .
                      \'git diff --name-only ' .
                               \'--relative ' .
                               \'--diff-filter=U | ' .
                      \'uniq')

    for file in split(l:ret, '\n')
        if WhichTab(file) == 0
            exe 'tabedit ' . file
        endif
    endfor
endfunction

