" KeyMaps.vim -- Custom mappings


" GENERAL MAPPINGS
    " Open this file
    exe 'nmap <silent> <leader>vk :split ' . expand('<sfile>:p') .
            \ ' \| setlocal nobuflisted \| echo("Open keymaps")<Cr>'

    " Open vimrc
    nmap <silent> <leader>vc :split $MYVIMRC \|
                            \ setlocal nobuflisted \| echo('Open config')<Cr>

    " Reload vim highlights
    nmap <silent> <expr> <leader>vv dein#is_sourced('nvim-treesitter') ?
        \ ":w \| e \| TSBufEnable highlight \| echo('Reload')<Cr>" :
        \ ":syn sync fromstart \| echo('Reload')<Cr>"

    " Usual typo
    nnoremap q: :q

    " Go to normal mode with jj
    imap jj <Esc>

    " Jump back to last tag
    noremap <C-s> <C-t>

    " Clear search highlights
    nnoremap <silent> <Cr> :nohls<Cr><C-w><Cr>

    " Useful
    nnoremap j gj
    nnoremap k gk

    " Indentation
    nnoremap > >>
    nnoremap < <<
    xnoremap > >gv
    xnoremap < <gv

    " Opposite of J
    nnoremap K i<Cr><Esc>

    " This is more vim-like than default, because of D and C commands
    nnoremap Y y$

    " Spell check
    nmap <silent> <leader>sc :setlocal spell! spelllang=en_us \|
                            \ echo('Spell check toggled')<Cr>

    " Spell suggest
    nnoremap <leader>ss hea<C-x><C-s>

    " Fold toggling
        nnoremap <Space> za
        nnoremap <leader><Space> zO

    " Easy window navigation
        nnoremap <C-j> <C-w><C-j>
        nnoremap <C-k> <C-w><C-k>
        nnoremap <C-l> <C-w><C-l>
        nnoremap <C-h> <C-w><C-h>

" TERMINAL MAPPING
    " Open terminals
        nmap <silent> <leader>t :split \| terminal<Cr>a
        nmap <silent> <leader>T :vsplit \| terminal<Cr>a

    " Close terminal
        function! TerminalMappings()
            nmap <silent><buffer> <Cr> :q! \| echo('Terminal closed')<Cr>
        endfunction

    " Go to normal mode
        tnoremap <Esc> <C-\><C-n>
        tnoremap jj <C-\><C-n>

" UNMAPPING STUFF
    " Disable arrow keys
        map <Down> <Nop>
        map <Up> <Nop>
        map <Right> <Nop>
        map <Left> <Nop>

        imap <Down> <Nop>
        imap <Up> <Nop>
        imap <Right> <Nop>
        imap <Left> <Nop>

    " Note: set mouse=a for this to work
    " Disable scroll
        map <ScrollWheelUp> <Nop>
        map <3-ScrollWheelUp> <Nop>
        map <2-ScrollWheelUp> <Nop>
        map <4-ScrollWheelUp> <Nop>

        map <ScrollWheelDown> <Nop>
        map <2-ScrollWheelDown> <Nop>
        map <3-ScrollWheelDown> <Nop>
        map <4-ScrollWheelDown> <Nop>

        map <ScrollWheelLeft> <Nop>
        map <2-ScrollWheelLeft> <nop>
        map <3-ScrollWheelLeft> <nop>
        map <4-ScrollWheelLeft> <nop>

        map <ScrollWheelRight> <Nop>
        map <2-ScrollWheelRight> <nop>
        map <3-ScrollWheelRight> <nop>
        map <4-ScrollWheelRight> <nop>

    " Disable shift-scroll
        map <S-ScrollWheelUp> <Nop>
        map <S-2-ScrollWheelUp> <Nop>
        map <S-3-ScrollWheelUp> <Nop>
        map <S-4-ScrollWheelUp> <Nop>

        map <S-ScrollWheelDown> <Nop>
        map <S-2-ScrollWheelDown> <Nop>
        map <S-3-ScrollWheelDown> <Nop>
        map <S-4-ScrollWheelDown> <Nop>

        map <S-ScrollWheelLeft> <Nop>
        map <S-2-ScrollWheelLeft> <nop>
        map <S-3-ScrollWheelLeft> <nop>
        map <S-4-ScrollWheelLeft> <nop>

        map <S-ScrollWheelRight> <Nop>
        map <S-2-ScrollWheelRight> <nop>
        map <S-3-ScrollWheelRight> <nop>
        map <S-4-ScrollWheelRight> <nop>

    " Disable ctrl-scroll
        map <C-ScrollWheelUp> <Nop>
        map <C-2-ScrollWheelUp> <Nop>
        map <C-3-ScrollWheelUp> <Nop>
        map <C-4-ScrollWheelUp> <Nop>

        map <C-ScrollWheelDown> <Nop>
        map <C-2-ScrollWheelDown> <Nop>
        map <C-3-ScrollWheelDown> <Nop>
        map <C-4-ScrollWheelDown> <Nop>

        map <C-ScrollWheelLeft> <Nop>
        map <C-2-ScrollWheelLeft> <nop>
        map <C-3-ScrollWheelLeft> <nop>
        map <C-4-ScrollWheelLeft> <nop>

        map <C-ScrollWheelRight> <Nop>
        map <C-2-ScrollWheelRight> <nop>
        map <C-3-ScrollWheelRight> <nop>
        map <C-4-ScrollWheelRight> <nop>

    " Disable clicks
        map <LeftMouse> <Nop>
        map <2-LeftMouse> <Nop>
        map <3-LeftMouse> <Nop>
        map <4-LeftMouse> <Nop>

        imap <LeftMouse> <Nop>
        imap <2-LeftMouse> <Nop>
        imap <3-LeftMouse> <Nop>
        imap <4-LeftMouse> <Nop>

        map <RightMouse> <Nop>
        map <2-RightMouse> <Nop>
        map <3-RightMouse> <Nop>
        map <4-RightMouse> <Nop>

        imap <RightMouse> <Nop>
        imap <2-RightMouse> <Nop>
        imap <3-RightMouse> <Nop>
        imap <4-RightMouse> <Nop>

    " Disable shift-clicks
        " map <S-LeftMouse> <Nop>
        " map <S-2-LeftMouse> <Nop>
        " map <S-3-LeftMouse> <Nop>
        " map <S-4-LeftMouse> <Nop>

        " map <S-RightMouse> <Nop>
        " map <S-2-RightMouse> <Nop>
        " map <S-3-RightMouse> <Nop>
        " map <S-4-RightMouse> <Nop>

    " Disable ctrl-clicks
        map <C-LeftMouse> <Nop>
        map <C-2-LeftMouse> <Nop>
        map <C-3-LeftMouse> <Nop>
        map <C-4-LeftMouse> <Nop>

        map <C-RightMouse> <Nop>
        map <C-2-RightMouse> <Nop>
        map <C-3-RightMouse> <Nop>
        map <C-4-RightMouse> <Nop>

    " Unmap suspend
        nnoremap ZZ <Nop>

    " Unmap help
        nnoremap <F1> <Nop>
        inoremap <F1> <Nop>

    " Unmap EX mode
        nnoremap Q <Nop>

" LOCAL PLUGINS
    " Window
        " Make all windows equally sized
        nmap <silent> <leader>= :wincmd = \| echo('Resize window')<Cr>

        " Resize bottom window to look like small console, and fixed it
        nmap <silent> <expr> <leader>- (winheight('$') < 40)
            \ ? ':WindowReduce<Cr><C-w><C-k>'
            \ : ':call EchoWarning("Unable to resize")<Cr>'

        " Unset <leader>- command
        nmap <silent> <expr> <leader>+ (winheight('$') < 40)
            \ ? ':WindowExpand<Cr>'
            \ : ':call EchoWarning("Unable to resize")<Cr>'

        " Easy resize
            nmap <silent> <A-j> :resize +5 \| echo('Resize window')<Cr>
            nmap <silent> <A-k> :resize -5 \| echo('Resize window')<Cr>

            nmap <silent> <A-h> :vertical resize -5 \| echo('Resize window')<Cr>
            nmap <silent> <A-l> :vertical resize +5 \| echo('Resize window')<Cr>

    " Tab
        " Focus window
        nmap <silent> <C-t>t :TabToggle<Cr>
        nmap <silent> <C-t><C-t> :TabToggle<Cr>

        " Move window to tabs
        map <silent> <C-t>l :TabMoveToRight<Cr>
        map <silent> <C-t><C-l> :TabMoveToRight<Cr>
        map <silent> <C-t>h :TabMoveToLeft<Cr>
        map <silent> <C-t><C-h> :TabMoveToLeft<Cr>

" PLUGINS
    " Coding stuff
        " Auto-completion
            " deoplete -- Dark powered asynchronous completion
                " Use Crtl j/k to navigate
                inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
                inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
                inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

                " Close deoplete
                inoremap <expr> <C-c> deoplete#cancel_popup()

                " Choose with enter
                inoremap <silent> <Cr> <C-r>=<SID>deoplete_cr_function()<Cr>
                function! s:deoplete_cr_function()
                    return pumvisible() ? "\<C-y>" : "\<Cr>"
                endfunction

                " Scroll
                inoremap <expr> <C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
                inoremap <expr> <C-b> pumvisible() ? "\<PageUp>"   : "\<Left>"
                inoremap <expr> <C-d> pumvisible() ? "\<PageDown>" : "\<Right>"
                inoremap <expr> <C-u> pumvisible() ? "\<PageUp>"   : "\<Left>"

            " neosnippet -- Snippet support
                " Clear markers
                snoremap <silent><esc> <esc>:NeoSnippetClearMarkers<Cr>
                xnoremap <silent><esc> <esc>:NeoSnippetClearMarkers<Cr>

                " Cycle with tab
                imap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                               \ "\<plug>(neosnippet_jump_or_expand)" : "\<Tab>"
                smap <expr> <Tab> neosnippet#expandable_or_jumpable() ?
                               \ "\<plug>(neosnippet_jump_or_expand)" : "\<Tab>"

        " vimspector -- Multi language graphical debugger
            nmap <leader>dd <plug>VimspectorContinue
            nmap <leader>ds <plug>VimspectorStop
            nmap <leader>dp <plug>VimspectorPause
            nmap <leader>dr <plug>VimspectorRestart
            nmap <silent> <leader>dq :VimspectorReset<Cr>

            nmap <leader>dj <plug>VimspectorStepOver
            nmap <leader>dl <plug>VimspectorStepInto
            nmap <leader>dh <plug>VimspectorStepOut

            nmap <leader>db <plug>VimspectorToggleBreakpoint
            nmap <silent> <leader>dc :call VimspectorInputBreakpointCondition()<Cr>
            nmap <silent> <leader>dB :call vimspector#ClearBreakpoints()<Cr>

            nmap <leader>dw :call VimspectorInputWatchVaiable('input')<Cr>
            nmap <leader>dW :call VimspectorInputWatchVaiable('cursor')<Cr>

            function! VimspectorDisableFoldMappings()
                nmap <Space> <Nop>
                nmap <leader><Space> <Nop>
            endfunction

        " fswitch -- Switching between .c and .h files
            nmap <silent> <leader>swh :FSHere<Cr>
            nmap <silent> <leader>sws :FSSplitRight<Cr>
            nmap <silent> <leader>swi :FSSplitBelow<Cr>

        " Python
            " jedi-vim
                " Get docs
                let g:jedi#documentation_command = '<leader>D'

                " Refactor
                let g:jedi#rename_command = '<leader>r'

            " jupyter -- Jupyter console supports
                function! JupyterMappings()
                    " Start jupyter
                    nmap <silent> <buffer> <leader>js :JupyterCustomOpen<Cr>
                    nmap <silent> <buffer> <leader>jS :JupyterCustomQtOpen<Cr>
                    " Close jupyter
                    nmap <silent> <buffer> <leader>jq :JupyterCustomTerminate<Cr>
                    " Run file
                    nmap <silent> <buffer> <leader>jr :JupyterCustomRun<Cr>
                    " Run line
                    nmap <silent> <buffer> <leader>jl :JupyterCustomSendRange<Cr>
                    " Run cell
                    nmap <silent> <buffer> <leader>jj :JupyterCustomSendCell<Cr>
                    " Run selected
                    vmap <silent> <buffer> <leader>jj <Esc>:JupyterCustomSendRangeVisual<Cr>
                    " Run terminal
                    nmap <silent> <buffer> <leader>jt <Esc>:JupyterCustomOpenBuffer<Cr>
                endfunction

        " Nvim-R -- R for vim
            function! NvimRMappings()
                " Close jupyter
                nmap <buffer> <leader>jq <plug>RClose
                " Run file
                nmap <buffer> <leader>jr <plug>RStart
                " Run line
                nmap <buffer> <leader>jl <plug>RSendLine
                " Run cell
                nmap <buffer> <leader>jj <plug>RSendMBlock
                " Run selected
                vmap <buffer> <leader>jj <Esc><plug>RSendSelection
            endfunction

        " Git
            " gitgutter -- Show git diff in gutter
                map <leader>hh <plug>(GitGutterNextHunk)
                map <leader>hH <plug>(GitGutterPrevHunk)
                " Note: Use <C-w><C-w> to jump into preview win

            " fugitive -- Git from vim
                nmap <silent> <leader>gs :Gstatus<Cr>
                nmap <silent> <leader>gl :silent! Glog \| bot copen<Cr>

                nmap <silent> <leader>ga :Git add %:p<Cr><Cr>
                nmap <silent> <leader>gm :Gmerge<Space>
                nmap <silent> <leader>gM :Gmove<Space>
                nmap <silent> <leader>gw :Gwrite!<Cr><Cr>

                nmap <silent> <leader>gc :Gcommit -v -q<Cr>
                nmap <silent> <leader>gC :Gcommit -v -q %:p<Cr>

                nmap <silent> <leader>gd :Gvdiffsplit!<Cr>
                nmap <silent> <leader>gD :Gdiffsplit!<Cr>
                nmap <silent> <leader>gq :only<Cr>

                nmap <silent> <leader>gb :Git branch<Space>
                nmap <silent> <leader>go :Git checkout<Space>

                nmap <silent> <leader>gps :Dispatch! git push<Cr>
                nmap <silent> <leader>gpl :Dispatch! git pull<Cr>

            " ConflictMotions -- Resolve conflict easier
                nmap <silent> <leader>gt :ConflictTake this<Cr>
                nmap <silent> <leader>gT :ConflictTake both<Cr>
                nmap <silent> <leader>gx :ConflictTake none<Cr>

            " conflict-marker -- Highlight conflict sections
                nmap <silent> <leader>gg :ConflictMarkerNextHunk<Cr>
                nmap <silent> <leader>gG :ConflictMarkerPrevHunk<Cr>

            " Gitsigns
                nnoremap <leader>hh <cmd>lua require('gitsigns').refresh()<Cr>
                nnoremap <leader>hs <cmd>lua require('gitsigns').stage_hunk()<Cr>
                nnoremap <leader>hu <cmd>lua require('gitsigns').undo_stage_hunk()<Cr>
                nnoremap <leader>hr <cmd>lua require('gitsigns').reset_hunk()<Cr>
                nnoremap <leader>hR <cmd>lua require('gitsigns').reset_buffer()<Cr>
                nnoremap <leader>hp <cmd>lua require('gitsigns').preview_hunk()<Cr>
                nnoremap <leader>hb <cmd>lua require('gitsigns').blame_line()<Cr>
                nnoremap ]h <cmd>lua require('gitsigns').next_hunk()<Cr>
                nnoremap [h <cmd>lua require('gitsigns').prev_hunk()<Cr>

        " nerdcommenter - Toggling comments
            map <leader><leader> <plug>NERDCommenterToggle<Cr>

        " stackoverflow -- Ask stack overflow for help
            nmap <silent> <leader>so :AskStackOverflow<Cr>

    " Utilities
        " Firenvim
            function! FirenvimMappings()
                inoremap <Cr> <esc>:w<Cr>:call firenvim#press_keys('<Lt><Cr>')<Cr>ggdGa
            endfunction

        " any-jump
            " Normal mode: Jump to definition under cursore
            nnoremap <leader>f :AnyJump<Cr>

            " Normal mode: Jump to definition under cursore
            nnoremap <leader>F :call AnyJumpUserArg()<Cr>

            " Visual mode: jump to selected text in visual mode
            xnoremap <leader>f :AnyJumpVisual<Cr>

            " Normal mode: open previous opened file (after jump)
            " nnoremap <leader>ab :AnyJumpBack<Cr>

            " Normal mode: open last closed search window again
            nnoremap <A-f> :AnyJumpLastResults<Cr>

        " context
            nmap <leader>s :TSContextEnable<Cr>
            nmap <leader>S :TSContextDisable<Cr>

        " ctrlp -- Fuzzy search engine
            nmap <C-p>p :Files<Cr>
            nmap <C-p><C-p> :Files<Cr>
            nmap <C-p>b :Buffers<Cr>
            nmap <C-p>g :GFiles<Cr>
            nmap <C-p>c :Commits<Cr>

        " nvim-tree -- When ctrlp is not enough
            nnoremap <silent> <C-n> :NvimTreeToggle<Cr>
            let g:nvim_tree_bindings = {
                \ '<space>': luaeval("require('nvim-tree.config').nvim_tree_callback('edit')"),
                \ 's': luaeval("require('nvim-tree.config').nvim_tree_callback('vsplit')"),
                \ 'i': luaeval("require('nvim-tree.config').nvim_tree_callback('split')"),
                \ 't': luaeval("require('nvim-tree.config').nvim_tree_callback('tabnew')"),
                \ ']g': luaeval("require('nvim-tree.config').nvim_tree_callback('next_git_item')"),
                \ '[g': luaeval("require('nvim-tree.config').nvim_tree_callback('prev_git_item')"),
            \ }

        " auto-pairs -- Auto pair parentheses and quotes
            " Togle autopairs
            let g:AutoPairsShortcutToggle = '<leader>a'

        " sandwich -- Surround like, but better
            " Add
                nmap <silent> sa <plug>(operator-sandwich-add)
                xmap <silent> sa <plug>(operator-sandwich-add)
                omap <silent> sa <plug>(operator-sandwich-g@)

            " Delete
                nmap <silent> sd <plug>(operator-sandwich-delete)
                               \ <plug>(operator-sandwich-release-count)
                               \ <plug>(textobj-sandwich-query-a)
                xmap <silent> sd <plug>(operator-sandwich-delete)
                nmap <silent> sdb <plug>(operator-sandwich-delete)
                                \ <plug>(operator-sandwich-release-count)
                                \ <plug>(textobj-sandwich-auto-a)

            " Replace
                nmap <silent> sr <plug>(operator-sandwich-replace)
                               \ <plug>(operator-sandwich-release-count)
                               \ <plug>(textobj-sandwich-query-a)
                xmap <silent> sr <plug>(operator-sandwich-replace)
                nmap <silent> srb <plug>(operator-sandwich-replace)
                                \ <plug>(operator-sandwich-release-count)
                                \ <plug>(textobj-sandwich-auto-a)

            " Textobjs
                omap ib <plug>(textobj-sandwich-auto-i)
                xmap ib <plug>(textobj-sandwich-auto-i)
                omap ab <plug>(textobj-sandwich-auto-a)
                xmap ab <plug>(textobj-sandwich-auto-a)

            " Queries
                omap is <plug>(textobj-sandwich-query-i)
                xmap is <plug>(textobj-sandwich-query-i)
                omap as <plug>(textobj-sandwich-query-a)
                xmap as <plug>(textobj-sandwich-query-a)

        " schlepp -- Move a highlighted text around
            vmap <C-k> <plug>SchleppUp
            vmap <C-j> <plug>SchleppDown
            vmap <C-h> <plug>SchleppLeft
            vmap <C-l> <plug>SchleppRight

            vmap <Tab> <plug>SchleppRight<plug>SchleppRight
                      \ <plug>SchleppRight<plug>SchleppRight
            vmap <S-Tab> <plug>SchleppLeft<plug>SchleppLeft
                       \ <plug>SchleppLeft<plug>SchleppLeft

            vmap <S-d> <plug>SchleppDup

        " exchange -- Easier word exchange
            nmap cx <plug>(Exchange)
            vmap X <plug>(Exchange)
            nmap cxc <plug>(ExchangeClear)
            nmap cxx <plug>(ExchangeLine)

        " visual-multi -- Multi cursor support
            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<C-z>'
            let g:VM_maps['Find Subword Under'] = '<C-z>'
            let g:VM_maps['Select Cursor Down'] = '<M-C-j>'
            let g:VM_maps['Select Cursor Up']   = '<M-C-k>'

        " easy-align -- easy align mode
            " Start interactive EasyAlign in visual mode (e.g. vipga)
            xmap ga <plug>(EasyAlign)

            " Start interactive EasyAlign for a motion/text object (e.g. gaip)
            nmap ga <plug>(EasyAlign)

        " switch -- Substitute word under the cursor
            nmap <silent> <leader>_ :call switch#Switch({
                    \ 'definitions': g:camelcase_switch_definitions})<Cr>

            nmap <silent> <plug>SwitchForwardMap :call SwitchCustomForward()<Cr>
                    \ :silent! call repeat#set('\<plug>SwitchForwardMap', v:count)<Cr>

            nmap <silent> <plug>SwitcBackwardMap :call SwitchCustomBackward()<Cr>
                    \ :silent! call repeat#set('\<plug>SwitcBackwardMap', v:count)<Cr>

            " . command support
            nmap <C-a> <plug>SwitchForwardMap
            nmap <C-x> <plug>SwitcBackwardMap

        " yankstack -- Cycle through yank stack
            nmap <A-p> <plug>yankstack_substitute_older_paste
            nmap <A-i> <plug>yankstack_substitute_newer_paste

        " easymotion -- Easier navigation
            " Move to char(s)
            nmap <leader>m <plug>(easymotion-bd-f)
            nmap <leader>m <plug>(easymotion-overwin-f2)

            " Move to line
            map <leader>L <plug>(easymotion-bd-jk)

            " Move to word
            map  <leader>w <plug>(easymotion-bd-w)

        " comfortable-motion -- Smooth scrolling
            nmap <silent> <C-u> :call ComforableMotionPage('up', 0.5)<Cr>
            nmap <silent> <C-d> :call ComforableMotionPage('down', 0.5)<Cr>
            nmap <silent> <PageUp> :call ComforableMotionPage('up', 0.5)<Cr>
            nmap <silent> <PageDown> :call ComforableMotionPage('down', 0.5)<Cr>

            nmap <silent> <C-f> :call ComforableMotionPage('up')<Cr>
            nmap <silent> <C-b> :call ComforableMotionPage('down')<Cr>
            nmap <silent> <S-Up> :call ComforableMotionPage('up')<Cr>
            nmap <silent> <S-Down> :call ComforableMotionPage('down')<Cr>

            nmap <silent> zz :call ComforableMotionCenter()<Cr>
            nmap <silent> zt :call ComforableMotionTop()<Cr>
            nmap <silent> zb :call ComforableMotionBottom()<Cr>
            nmap <silent> { {:call ComforableMotionCenter('up')<Cr>
            nmap <silent> } }:call ComforableMotionCenter('down')<Cr>

        " asterisk
            map * <plug>(asterisk-*)
            map # <plug>(asterisk-#)
            map g* <plug>(asterisk-g*)
            map g# <plug>(asterisk-g#)
            map z* <plug>(asterisk-z*)
            map gz* <plug>(asterisk-gz*)
            map z# <plug>(asterisk-z#)
            map gz# <plug>(asterisk-gz#)

        " Bufferline
            nnoremap <silent> gb :BufferLineCycleNext<Cr>
            nnoremap <silent> gB :BufferLineCyclePrev<Cr>

            nnoremap <silent> <leader>bb :BufferLinePick<Cr>
            nnoremap <silent> <leader>bl :BufferLineMoveNext<Cr>
            nnoremap <silent> <leader>bh :BufferLineMovePrev<Cr>
            nnoremap <silent> <leader>bd :bd<Cr>

        " Undotree
            map U :UndotreeToggle<Cr>

    " Highlights
        " hlslens
            noremap <silent> n <cmd>execute('normal! ' . v:count1 . 'n')<Cr>
                              \ <cmd>lua require('hlslens').start()<Cr>
            noremap <silent> N <cmd>execute('normal! ' . v:count1 . 'N')<Cr>
                              \ <cmd>lua require('hlslens').start()<Cr>

            map <silent> * *<cmd>lua require('hlslens').start()<Cr>
            map <silent> # #<cmd>lua require('hlslens').start()<Cr>
            map <silent> g* g*<cmd>lua require('hlslens').start()<Cr>
            map <silent> g# g#<cmd>lua require('hlslens').start()<Cr>
            map <silent> z* z*<cmd>lua require('hlslens').start()<Cr>
            map <silent> gz* gz*<cmd>lua require('hlslens').start()<Cr>
            map <silent> z# z#<cmd>lua require('hlslens').start()<Cr>
            map <silent> gz# gz#<cmd>lua require('hlslens').start()<Cr>

        " pulse
            map n n<plug>Pulse
            map N N<plug>Pulse

            " Pulses cursor line on first match
            " when doing search with / or ?
            cmap <silent> <expr> <enter> search_pulse#PulseFirst()

" LANGUAGE SPECIFIC MAPPINGS
    " Bash
        function! BashMappings()
            " Run bash
        nmap <silent> <buffer> <leader>c :wa<Cr>:BashRun<Cr>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<Cr>:BashRunWithArgs<Cr>
        endfunction

    " C/Cpp
        function! CMappings()
            " Open project file
            nmap <silent> <buffer> <leader>p :call ProjectOpenConfig('c')<Cr>
            " Run python
            nmap <silent> <buffer> <leader>c :wa<Cr>:call ProjectRun('c')<Cr>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<Cr>:call ProjectRunWithArgs('c')<Cr>

            " Open debugger project file
            nmap <silent> <buffer> <leader>dp :call ProjectOpenDebugConfig('c', 0)<Cr>
            nmap <silent> <buffer> <leader>dP :call ProjectOpenDebugConfig('c', 1)<Cr>
        endfunction

    " Haskell
        function! HaskellMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<Cr>:HaskellMake<Cr>
            " Open terminal
            " nmap <silent> <buffer> <C-c> <esc>:HaskellOpenGhci<Cr>
        endfunction

    "  Markdown
        function! MarkdownMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<Cr>:call MarkdownCompile()<Cr>
            " Open pdf
            nmap <silent> <buffer> <leader>o :OpenPdf<Cr>
        endfunction

    " Octave
        function! OctaveMappings()
            " Key bindings
            nmap <silent> <buffer> <leader>c :w<Cr>:split term://octave %<Cr>
            " Open Ternimal
            " nmap <silent> <buffer> <C-c> :OctaveOpenTerminal<Cr>
        endfunction

    " Python
        function! PythonMappings()
            " Open project file
            nmap <silent> <buffer> <leader>p :call ProjectOpenConfig('py')<Cr>
            " Run python
            nmap <silent> <buffer> <leader>c :wa<Cr>:call ProjectRun('py')<Cr>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<Cr>:call ProjectRunWithArgs('py')<Cr>

            " Open debugger project file
            nmap <silent> <buffer> <leader>dp :call ProjectOpenDebugConfig('py', 0)<Cr>
            nmap <silent> <buffer> <leader>dP :call ProjectOpenDebugConfig('py', 1)<Cr>

            " Open Ternimal
            " nmap <silent> <buffer> <C-c> <esc>:PythonOpenTerminal<Cr>
        endfunction

    " R
        function! RMappings()
            nmap <silent> <buffer> <leader>sr <plug>RStart

            " nmap <silent> <buffer> <leader>c :w<Cr>:split term://R<Cr>asource("<Tab>")<Cr>
            nmap <silent> <buffer> <leader>c :w<Cr>:call RCompile()<Cr>
            " nmap <silent> <buffer> <C-c> :split<Cr>:terminal<Cr>aR<Cr><C-L><esc>10<C-w>_:set wfh<Cr>a
        endfunction

    "  RMarkdown
        function! RMarkdownMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<Cr>:call RMarkdownCompile()<Cr>
            " Open pdf
            nmap <silent> <buffer> <leader>o :OpenPdf<Cr>
        endfunction
