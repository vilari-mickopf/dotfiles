" Window.vim -- Window resize


" Reduce to bottom console like window and keep it fixed
"
command! WindowReduce call s:WindowReduce()

function! s:WindowReduce()
    execute "normal \<C-w>\<C-j>10\<C-w>_:set\<space>wfh\<CR>"
    echo('Window resized')
endfunction


" Restore reduced window
"
command! WindowExpand call s:WindowExpand()

function! s:WindowExpand()
    execute "normal \<C-w>\<C-j>:set wfh&\<CR>\<C-w>\<C-k>:wincmd =\<CR>"
    call feedkeys("\<CR>")
    echo('Window resized')
endfunction
