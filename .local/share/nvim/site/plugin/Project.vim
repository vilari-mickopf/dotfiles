" Project.vim -- Setting and running the project


" ProjectOpenConfig -- Open project file
"
" Usage:
"
" call ProjectOpenConfig('c')
" call ProjectOpenConfig('py')
"
function! ProjectOpenConfig(lang)
    let l:filename = expand('%:p')
    let l:project_file = system('python ' . g:script_dir .
                               \'run.py --file ' . l:filename .
                                     \' --lang ' . a:lang .
                                     \' --open')
    exe 'split ' . l:project_file
endfunction


" ProjectRun -- Run/build program
"
" Usage:
"
" call ProjectRun('c')
" call ProjectRun('py')
"
function! ProjectRun(lang)
    let l:filename = expand('%:p')
    let l:cmd = system('python ' . g:script_dir .
                      \'run.py --file ' . l:filename .
                            \' --lang ' . a:lang)

    call TerminalCall(l:cmd)

    redraw!
    echo('Run')
endfunction


" ProjectRunWithArgs -- Run/build program with arguments
"
" Usage:
"
" call ProjectRunWithArgs('c')
" call ProjectRunWithArgs('py')
"
function! ProjectRunWithArgs(lang)
    let l:args = PromptGetUserInput('args: ')
    if(empty(l:args)) | return | endif

    let l:filename = expand('%:p')
    let l:cmd = system('python ' . g:script_dir .
                      \'run.py --file ' . l:filename .
                            \' --lang ' . a:lang .
                            \' --args ' . l:args)

    call TerminalCall(l:cmd)

    redraw!
    echo('Run with args: ' . l:args)
endfunction


" ProjectOpenDebugConfig -- Open debug file
"
" Args:
"   lang        language -- only 'py' and 'c' are supported
"   reset_file  reset '.vimspector' file
"
" Usage:
"
" call ProjectOpenDebugConfig('c', 0)
" call ProjectOpenDebugConfig('py', 1)
"
function! ProjectOpenDebugConfig(lang, reset_file)
    let l:filename = expand('%:p')

    let l:cmd = 'python ' . g:script_dir .  'debug.py --file ' . l:filename .
                                                   \' --lang ' . a:lang .
                                                   \' --open'

    if a:lang == 'c'
        let l:cmd = l:cmd . ' --target'
    endif

    if a:reset_file
        let l:cmd = l:cmd . ' --reset'
    endif

    let l:project_file = system(l:cmd)

    exe 'split ' . l:project_file
endfunction
