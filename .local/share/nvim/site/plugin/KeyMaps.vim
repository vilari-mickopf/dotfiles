" KeyMaps.vim -- Custom mappings


" GENERAL MAPPINGS
    " Open this file
    execute 'nmap <silent> <leader>vk :split ' . expand('<sfile>:p') . '\|' .
                                     \'echo("Open keymaps")<CR>'
    execute 'nmap <silent> <leader>vK :vsplit ' . expand('<sfile>:p') . '\|' .
                                     \'echo("Open keymaps")<CR>'

    " Open vimrc
    nmap <silent> <leader>vc :split $MYVIMRC \| echo('Open config')<CR>

    " Reload vim highlights
    nmap <silent> <expr> <leader>vv dein#is_sourced('nvim-treesitter') ?
        \ ":w \| e \| TSBufEnable highlight \| echo('Reload')<CR>" :
        \ ":syn sync fromstart \| echo('Reload')<CR>"

    " Usual typo
    nnoremap q: :q

    " Go to normal mode with jj
    imap jj <Esc>

    " Jump back to last tag
    noremap <C-S> <C-T>

    " Clear search highlights
    nnoremap <silent> <CR> :nohls<CR>

    " Useful
    nnoremap j gj
    nnoremap k gk

    " Indentation
    nnoremap > >>
    nnoremap < <<
    xnoremap > >gv
    xnoremap < <gv

    " Opposite of J
    nnoremap K i<CR><ESC>

    " This is more vim-like than default, because of D and C commands
    nnoremap Y y$

    " Better x
    " nnoremap x "_x

    " Spell check
    nmap <silent> <leader>sc :setlocal spell! spelllang=en_us \|
                            \ echo('Spell check toggled')<CR>

    " Spell suggest
    nnoremap <leader>ss hea<C-X><C-S>

    "Visual search with * and #
        " Forward
        vnoremap <silent> * :<C-U>
            \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \ gvy/<C-R><C-R>=substitute(
            \   escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \ gV:call setreg('"', old_reg, old_regtype)<CR>

        " Backward
        vnoremap <silent> # :<C-U>
            \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \ gvy?<C-R><C-R>=substitute(
            \   escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \ gV:call setreg('"', old_reg, old_regtype)<CR>

    " Fold toggling
        nnoremap <space> za
        nnoremap <leader><space> zO
        " nnoremap <space> zR
        " nnoremap <space> zM

    " Easy window navigation
        nnoremap <C-j> <C-w><C-j>
        nnoremap <C-k> <C-w><C-k>
        nnoremap <C-l> <C-w><C-l>
        nnoremap <C-h> <C-w><C-h>

" TERMINAL MAPPING
    " Open terminals
        nmap <silent> <leader>t :split \| terminal<CR>a
        nmap <silent> <leader>T :vsplit \| terminal<CR>a

    " Close terminal
    function! TerminalMappings()
        nmap <silent><buffer> <CR> :q! \| echo('Terminal closed')<CR>
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

    " Unmap EX mode
        nnoremap Q <Nop>

" LOCAL PLUGINS
    " Window
        " Make all windows equally sized
        nmap <silent> <leader>= :wincmd = \| echo('Resize window')<CR>

        " Resize bottom window to look like small console, and fixed it
        nmap <silent> <expr> <leader>- (winheight('$') < 40)
            \ ? ':WindowReduce<CR><C-w><C-k>'
            \ : ':call EchoWarning("Unable to resize")<CR>'

        " Unset <leader>- command
        nmap <silent> <expr> <leader>+ (winheight('$') < 40)
            \ ? ':WindowExpand<CR>'
            \ : ':call EchoWarning("Unable to resize")<CR>'

        " Easy resize
            nmap <silent> <A-j> :resize +5 \| echo('Resize window')<CR>
            nmap <silent> <A-k> :resize -5 \| echo('Resize window')<CR>

            nmap <silent> <A-h> :vertical resize -5 \| echo('Resize window')<CR>
            nmap <silent> <A-l> :vertical resize +5 \| echo('Resize window')<CR>

    " Tab
        " Focus window
        nmap <silent> <C-t>t :TabToggle<CR>
        nmap <silent> <C-t><C-t> :TabToggle<CR>

        " Move window to tabs
        map <silent> <C-t>l :TabMoveToRight<CR>
        map <silent> <C-t><C-l> :TabMoveToRight<CR>
        map <silent> <C-t>h :TabMoveToLeft<CR>
        map <silent> <C-t><C-h> :TabMoveToLeft<CR>

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
                inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_function()<CR>
                function! s:deoplete_cr_function()
                    return pumvisible() ? "\<C-y>" : "\<CR>"
                endfunction

                " Scroll
                inoremap <expr> <C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
                inoremap <expr> <C-b> pumvisible() ? "\<PageUp>"   : "\<Left>"
                inoremap <expr> <C-d> pumvisible() ? "\<PageDown>" : "\<Right>"
                inoremap <expr> <C-u> pumvisible() ? "\<PageUp>"   : "\<Left>"

            " neosnippet -- Snippet support
                " Clear markers
                snoremap <silent><ESC> <ESC>:NeoSnippetClearMarkers<CR>
                xnoremap <silent><ESC> <ESC>:NeoSnippetClearMarkers<CR>

                " Cycle with tab
                imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                            \ "\<Plug>(neosnippet_jump_or_expand)" : "\<TAB>"
                smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                            \ "\<Plug>(neosnippet_jump_or_expand)" : "\<TAB>"

        " ale -- Asynchronous lint engine
            nmap <silent> <C-]> :ALEGoToDefinition<CR>
            nmap <silent> <C-t><C-]> :ALEGoToDefinition -tab<CR>
            nmap <silent> <C-w><C-]> :ALEGoToDefinition -split<CR>
            nmap <silent> <C-w>v<C-]> :ALEGoToDefinition -vsplit<CR>

        " vimspector -- Multi language graphical debugger
            nmap <leader>dd <Plug>VimspectorContinue
            nmap <leader>ds <Plug>VimspectorStop
            nmap <leader>dp <Plug>VimspectorPause
            nmap <leader>dr <Plug>VimspectorRestart
            nmap <silent> <leader>dq :VimspectorReset<CR>

            nmap <leader>dj <Plug>VimspectorStepOver
            nmap <leader>dl <Plug>VimspectorStepInto
            nmap <leader>dh <Plug>VimspectorStepOut

            nmap <leader>db <Plug>VimspectorToggleBreakpoint
            nmap <silent> <leader>dc :call VimspectorInputBreakpointCondition()<CR>
            nmap <silent> <leader>dB :call vimspector#ClearBreakpoints()<CR>

            nmap <leader>dw :call VimspectorInputWatchVaiable('input')<CR>
            nmap <leader>dW :call VimspectorInputWatchVaiable('cursor')<CR>

            function! VimspectorDisableFoldMappings()
                nmap <space> <Nop>
                nmap <leader><space> <Nop>
            endfunction

        " fswitch -- Switching between .c and .h files
            nmap <silent> <leader>swh :FSHere<CR>
            nmap <silent> <leader>sws :FSSplitRight<CR>
            nmap <silent> <leader>swi :FSSplitBelow<CR>

        " Python
            " jedi-vim
                " Get docs
                let g:jedi#documentation_command = '<leader>D'

                " Refactor
                let g:jedi#rename_command = '<leader>r'

            " jupyter -- Jupyter console supports
                function! JupyterMappings()
                    " Start jupyter
                    nmap <silent> <buffer> <leader>js :JupyterCustomOpen<CR>
                    nmap <silent> <buffer> <leader>jS :JupyterCustomQtOpen<CR>
                    " Close jupyter
                    nmap <silent> <buffer> <leader>jq :JupyterCustomTerminate<CR>
                    " Run file
                    nmap <silent> <buffer> <leader>jr :JupyterCustomRun<CR>
                    " Run line
                    nmap <silent> <buffer> <leader>jl :JupyterCustomSendRange<CR>
                    " Run cell
                    nmap <silent> <buffer> <leader>jj :JupyterCustomSendCell<CR>
                    " Run selected
                    vmap <silent> <buffer> <leader>jj <ESC>:JupyterCustomSendRangeVisual<CR>
                    " Run terminal
                    nmap <silent> <buffer> <leader>jt <ESC>:JupyterCustomOpenBuffer<CR>
                endfunction

        " Nvim-R -- R for vim
            function! NvimRMappings()
                " Close jupyter
                nmap <buffer> <leader>jq <Plug>RClose
                " Run file
                nmap <buffer> <leader>jr <Plug>RStart
                " Run line
                nmap <buffer> <leader>jl <Plug>RSendLine
                " Run cell
                nmap <buffer> <leader>jj <Plug>RSendMBlock
                " Run selected
                vmap <buffer> <leader>jj <ESC><Plug>RSendSelection
            endfunction

        " Git
            " gitgutter -- Show git diff in gutter
                map <leader>hh <Plug>(GitGutterNextHunk)
                map <leader>hH <Plug>(GitGutterPrevHunk)
                " Note: Use <C-w><C-w> to jump into preview win

            " fugitive -- Git from vim
                nmap <silent> <leader>gs :Gstatus<CR>
                nmap <silent> <leader>gl :silent! Glog \| bot copen<CR>

                nmap <silent> <leader>ga :Git add %:p<CR><CR>
                nmap <silent> <leader>gm :Gmerge<space>
                nmap <silent> <leader>gM :Gmove<space>
                nmap <silent> <leader>gw :Gwrite!<CR><CR>

                nmap <silent> <leader>gc :Gcommit -v -q<CR>
                nmap <silent> <leader>gC :Gcommit -v -q %:p<CR>

                nmap <silent> <leader>gd :Gvdiffsplit!<CR>
                nmap <silent> <leader>gD :Gdiffsplit!<CR>
                nmap <silent> <leader>gq :only<CR>

                nmap <silent> <leader>gb :Git branch<space>
                nmap <silent> <leader>go :Git checkout<space>

                nmap <silent> <leader>gps :Dispatch! git push<CR>
                nmap <silent> <leader>gpl :Dispatch! git pull<CR>

            " ConflictMotions -- Resolve conflict easier
                nmap <silent> <leader>gt :ConflictTake this<CR>
                nmap <silent> <leader>gT :ConflictTake<space>

            " conflict-marker -- Highlight conflict sections
                nmap <silent> <leader>gg :ConflictMarkerNextHunk<CR>
                nmap <silent> <leader>gG :ConflictMarkerPrevHunk<CR>

        " nerdcommenter - Toggling comments
            map <leader><leader> <Plug>NERDCommenterToggle<CR>

        " stackoverflow -- Ask stack overflow for help
            nmap <silent> <leader>so :AskStackOverflow<CR>

    " Utilities
        " Firenvim
            function! FirenvimMappings()
                inoremap <CR> <Esc>:w<CR>:call firenvim#press_keys("<LT>CR>")<CR>ggdGa
            endfunction

        " any-jump
            " Normal mode: Jump to definition under cursore
            nnoremap <leader>f :AnyJump<CR>

            " Normal mode: Jump to definition under cursore
            nnoremap <leader>F :call AnyJumpUserArg()<CR>

            " Visual mode: jump to selected text in visual mode
            xnoremap <leader>f :AnyJumpVisual<CR>

            " Normal mode: open previous opened file (after jump)
            " nnoremap <leader>ab :AnyJumpBack<CR>

            " Normal mode: open last closed search window again
            nnoremap <A-f> :AnyJumpLastResults<CR>

        " context
            nmap <leader>s :TSContextEnable<CR>
            nmap <leader>S :TSContextDisable<CR>

        " ctrlp -- Fuzzy search engine
            nmap <C-p> <Plug>(ctrlp)

        " nerdtree -- When ctrlp is not enough
            map <silent> <C-n> :NERDTreeToggle<CR>
            nmap <silent> <leader>n :NERDTreeFocus<CR>

            " Show hidden files on .
            function NerdtreeMappings()
                map <buffer> . I
            endfunction

            " Open with space
            let NERDTreeMapActivateNode='<Space>'

        " tagbar -- Class/function viewer
            nmap <silent> <A-t> :TagbarToggle<CR>

        " auto-pairs -- Auto pair parentheses and quotes
            " Togle autopairs
            let g:AutoPairsShortcutToggle = '<leader>a'

        " sandwich -- Surround like, but better
            " Add
                nmap <silent> sa <Plug>(operator-sandwich-add)
                xmap <silent> sa <Plug>(operator-sandwich-add)
                omap <silent> sa <Plug>(operator-sandwich-g@)

            " Delete
                nmap <silent> sd <Plug>(operator-sandwich-delete)
                                \<Plug>(operator-sandwich-release-count)
                                \<Plug>(textobj-sandwich-query-a)
                xmap <silent> sd <Plug>(operator-sandwich-delete)
                nmap <silent> sdb <Plug>(operator-sandwich-delete)
                                 \<Plug>(operator-sandwich-release-count)
                                 \<Plug>(textobj-sandwich-auto-a)

            " Replace
                nmap <silent> sr <Plug>(operator-sandwich-replace)
                                \<Plug>(operator-sandwich-release-count)
                                \<Plug>(textobj-sandwich-query-a)
                xmap <silent> sr <Plug>(operator-sandwich-replace)
                nmap <silent> srb <Plug>(operator-sandwich-replace)
                                 \<Plug>(operator-sandwich-release-count)
                                 \<Plug>(textobj-sandwich-auto-a)

            " Textobjs
                omap ib <Plug>(textobj-sandwich-auto-i)
                xmap ib <Plug>(textobj-sandwich-auto-i)
                omap ab <Plug>(textobj-sandwich-auto-a)
                xmap ab <Plug>(textobj-sandwich-auto-a)

            " Queries
                omap is <Plug>(textobj-sandwich-query-i)
                xmap is <Plug>(textobj-sandwich-query-i)
                omap as <Plug>(textobj-sandwich-query-a)
                xmap as <Plug>(textobj-sandwich-query-a)

        " schlepp -- Move a highlighted text around
            vmap <C-k> <Plug>SchleppUp
            vmap <C-j> <Plug>SchleppDown
            vmap <C-h> <Plug>SchleppLeft
            vmap <C-l> <Plug>SchleppRight

            vmap <Tab> <Plug>SchleppRight<Plug>SchleppRight
                      \<Plug>SchleppRight<Plug>SchleppRight
            vmap <S-Tab> <Plug>SchleppLeft<Plug>SchleppLeft
                        \<Plug>SchleppLeft<Plug>SchleppLeft

            vmap <S-d> <Plug>SchleppDup

        " exchange -- Easier word exchange
            nmap cx <Plug>(Exchange)
            vmap X <Plug>(Exchange)
            nmap cxc <Plug>(ExchangeClear)
            nmap cxx <Plug>(ExchangeLine)

        " multiple-cursors -- Multi cursor support
            let g:multi_cursor_start_word_key      = '<C-z>'
            let g:multi_cursor_select_all_word_key = '<C-q>q'
            let g:multi_cursor_start_key           = 'g<C-z>'
            let g:multi_cursor_select_all_key      = 'g<C-q>q'
            let g:multi_cursor_next_key            = '<C-z>'
            let g:multi_cursor_prev_key            = '<C-s>'
            let g:multi_cursor_skip_key            = '<C-x>'
            let g:multi_cursor_quit_key            = '<Esc>'

        " easy-align -- easy align mode
            " Start interactive EasyAlign in visual mode (e.g. vipga)
            xmap ga <Plug>(EasyAlign)

            " Start interactive EasyAlign for a motion/text object (e.g. gaip)
            nmap ga <Plug>(EasyAlign)

        " switch -- Substitute word under the cursor
            nmap <silent> <leader>_ :call switch#Switch({
                    \'definitions': g:camelcase_switch_definitions})<CR>

            nmap <silent> <Plug>SwitchForwardMap :call SwitchCustomForward()<CR>
                    \:silent! call repeat#set("\<Plug>SwitchForwardMap", v:count)<CR>

            nmap <silent> <Plug>SwitcBackwardMap :call SwitchCustomBackward()<CR>
                    \:silent! call repeat#set("\<Plug>SwitcBackwardMap", v:count)<CR>

            " . command support
            nmap <C-A> <Plug>SwitchForwardMap
            nmap <C-X> <Plug>SwitcBackwardMap

        " yankstack -- Cycle through yank stack
            nmap <A-p> <Plug>yankstack_substitute_older_paste
            nmap <A-i> <Plug>yankstack_substitute_newer_paste

        " repeat -- Dot (.) command for non-native commads
            " silent! call repeat#set("\<Plug>MyMap1", v:count)
            " silent! call repeat#set("\<Plug>\<C-X>", v:count)

        " easymotion -- Easier navigation
            " Move to char(s)
            nmap <leader>m <Plug>(easymotion-bd-f)
            nmap <leader>m <Plug>(easymotion-overwin-f2)

            " Move to line
            map <leader>L <Plug>(easymotion-bd-jk)

            " Move to word
            map  <leader>w <Plug>(easymotion-bd-w)

        " comfortable-motion -- Smooth scrolling
            nmap <silent> <C-u> :call ComforableMotionPage('up', 0.5)<CR>
            nmap <silent> <C-d> :call ComforableMotionPage('down', 0.5)<CR>
            nmap <silent> <PageUp> :call ComforableMotionPage('up', 0.5)<CR>
            nmap <silent> <PageDown> :call ComforableMotionPage('down', 0.5)<CR>

            nmap <silent> <C-f> :call ComforableMotionPage('up')<CR>
            nmap <silent> <C-b> :call ComforableMotionPage('down')<CR>
            nmap <silent> <S-Up> :call ComforableMotionPage('up')<CR>
            nmap <silent> <S-Down> :call ComforableMotionPage('down')<CR>

            nmap <silent> zz :call ComforableMotionCenter()<CR>
            nmap <silent> zt :call ComforableMotionTop()<CR>
            nmap <silent> zb :call ComforableMotionBottom()<CR>
            nmap <silent> {  {:call ComforableMotionCenter('up')<CR>
            nmap <silent> }  }:call ComforableMotionCenter('down')<CR>

" LANGUAGE SPECIFIC MAPPINGS
    " Bash
        function! BashMappings()
            " Run bash
            nmap <silent> <buffer> <leader>c :wa<CR>:BashRun<CR>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<CR>:BashRunWithArgs<CR>
        endfunction

    " C/Cpp
        function! CMappings()
            " Open project file
            nmap <silent> <buffer> <leader>p :call ProjectOpenConfig('c')<CR>
            " Run python
            nmap <silent> <buffer> <leader>c :wa<CR>:call ProjectRun('c')<CR>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<CR>:call ProjectRunWithArgs('c')<CR>

            " Open debugger project file
            nmap <silent> <buffer> <leader>dp :call ProjectOpenDebugConfig('c', 0)<CR>
            nmap <silent> <buffer> <leader>dP :call ProjectOpenDebugConfig('c', 1)<CR>
        endfunction

    " Haskell
        function! HaskellMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<CR>:HaskellMake<CR>
            " Open terminal
            " nmap <silent> <buffer> <C-c> <Esc>:HaskellOpenGhci<CR>
        endfunction

    "  Markdown
        function! MarkdownMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<CR>:call MarkdownCompile()<CR>
            " Open pdf
            nmap <silent> <buffer> <leader>o :OpenPdf<CR>
        endfunction

    " Octave
        function! OctaveMappings()
            " Key bindings
            nmap <silent> <buffer> <leader>c :w<CR>:split term://octave %<CR>
            " Open Ternimal
            " nmap <silent> <buffer> <C-c> :OctaveOpenTerminal<CR>
        endfunction

    " Python
        function! PythonMappings()
            " Open project file
            nmap <silent> <buffer> <leader>p :call ProjectOpenConfig('py')<CR>
            " Run python
            nmap <silent> <buffer> <leader>c :wa<CR>:call ProjectRun('py')<CR>
            " Run with args
            nmap <silent> <buffer> <leader>C :wa<CR>:call ProjectRunWithArgs('py')<CR>

            " Open debugger project file
            nmap <silent> <buffer> <leader>dp :call ProjectOpenDebugConfig('py', 0)<CR>
            nmap <silent> <buffer> <leader>dP :call ProjectOpenDebugConfig('py', 1)<CR>

            " Open Ternimal
            " nmap <silent> <buffer> <C-c> <Esc>:PythonOpenTerminal<CR>
        endfunction

    " R
        function! RMappings()
            nmap <silent> <buffer> <leader>sr <Plug>RStart

            " nmap <silent> <buffer> <leader>c :w<CR>:split term://R<CR>asource("<Tab>")<CR>
            nmap <silent> <buffer> <leader>c :w<CR>:call RCompile()<CR>
            " nmap <silent> <buffer> <C-c> :split<CR>:terminal<CR>aR<CR><C-L><ESC>10<C-w>_:set wfh<CR>a
        endfunction

    "  RMarkdown
        function! RMarkdownMappings()
            " Compile
            nmap <silent> <buffer> <leader>c :wa<CR>:call RMarkdownCompile()<CR>
            " Open pdf
            nmap <silent> <buffer> <leader>o :OpenPdf<CR>
        endfunction
