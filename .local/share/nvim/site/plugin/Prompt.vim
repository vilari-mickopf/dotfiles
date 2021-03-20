" Prompt.vim -- Get input


function PromptGetUserInput(prompt, ...)
    let l:curline = getline('.')
    call inputsave()
    if a:0 < 1
        let l:msg = input(a:prompt)
    else
        let l:msg = input(a:prompt, '', a:1)
    endif
    call inputrestore()
    return l:msg
endfunction
