" AutoCommands.vim -- Autocommands


" GENERAL SETTINGS
    " Autoresize vim split on window resize
        " augroup AutoResize
            " au!
            " au VimResized * wincmd =
        " augroup END

    " Enable/Disable relative numbering on focused/unfocused windows
        augroup WindowNumbering
            au!
            au BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
            au BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
        augroup END

    " Highlight yank
        augroup highlight_yank
            autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank{higroup="HighlightOnYank", timeout=700}
        augroup END

    " Disable numbering in terminal
        augroup TerminalNumbering
            au!
            au TermOpen * setlocal nonumber norelativenumber
        augroup END

    " Auto-create all necessary dirs when saving newly created files
        augroup NonExDir
            au!
            au BufWritePre * :call MkNonExDir(expand('<afile>'), +expand('<abuf>'))
        augroup END

    " Strip all trailing spaces
        augroup TrailingWhitespaces
            au!
            au BufWritePre * :call StripTrailingWhitespaces()
        augroup END

    " Terminal
        augroup TerminalMaps
            au!
            au TermOpen * call TerminalMappings()
        augroup end

    " Clean your shit
        augroup CleanUp
            au!
            au VimLeave * call CleanUp()
        augroup END

" BUNDLES
    " deoplete
        augroup DeopleteClose
            au!
            au InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
        augroup END

    " NERDTree
        augroup NERDTreeSettings
            au!
            au FileType nerdtree setlocal nonu
            au FileType taglist setlocal nonu
            au FileType nerdtree call NerdtreeMappings()
        augroup END

    " Templates
        augroup VimTemplates
            au!
            au BufEnter * silent! call TemplateEmptyFile()
        augroup END

    " firenvim
        augroup Firenvim
            au!
            autocmd UIEnter * call FirenvimOptions(deepcopy(v:event))

            autocmd BufEnter github.com_*.txt set filetype=markdown
            autocmd BufEnter www.kaggle.com_*.txt set filetype=markdown
            autocmd BufEnter kkb-production.jupyter-proxy.kaggle.net_*.txt set filetype=python

            autocmd BufEnter teams.microsoft.com_*.txt call FirenvimMappings()
        augroup END

    " Vimspector
        augroup Vimspector
            au!
            au User VimspectorUICreated call VimspectorOptions()
        augroup END

" LANGUAGE SPECIFIC SETTINGS
    " Assembly
        augroup Assembly
            au!
            au BufRead,BufNewFile *.asm set filetype=nasm
        augroup END

    " Bash
        augroup Bash
            au!
            au Filetype sh,bash,zsh call BashOptions()
            au Filetype sh,bash,zsh call BashMappings()
        augroup END

    " C/Cpp
        augroup C
            au!
            au Filetype c,cpp,h,hpp call COptions()
            au Filetype c,cpp,h,hpp call CMappings()
            au Filetype cmake call CMappings()
        augroup END

    " Conf
        augroup Conf
            au!
            au BufRead,BufNewFile *.conf setf dosini
        augroup END

    " Haskell
        augroup Haskell
            au!
            au Filetype haskell call HaskellOptions()
            au Filetype haskell call HaskellMappings()
        augroup END

	" Json
        augroup Json
            au!
            au BufNewFile,BufRead .*project set syntax=json filetype=json
            au Filetype json call JsonOptions()
        augroup END

    " LateX
        augroup Latex
            au!
            au Filetype tex call TexOptions()
            " au Filetype tex call LatexMappings()
        augroup END

    " Markdown
        augroup Markdown
            au!
            au Filetype markdown call TexOptions()
            au Filetype markdown call MarkdownOptions()
            au Filetype markdown call MarkdownMappings()
        augroup END

    " Octave
        augroup Octave
            au!
            au Filetype octave call OctaveOptions()
            au Filetype octave call OctaveMappings()
        augroup END

    " Python
        augroup Python
            au!
            au Filetype python call PythonOptions()
            au Filetype python call PythonMappings()
            au Filetype python call JupyterMappings()
        augroup END

    " R Specific Settings
        augroup R
            au!
            au Filetype r call ROptions()
            au Filetype r call RMappings()
            au Filetype r call NvimRMappings()
        augroup END

    " RMarkdown
        augroup RMarkdown
            au!
            au Filetype rmd call TexOptions()
            au Filetype rmd call RMarkdownOptions()
            au Filetype rmd call RMarkdownMappings()

            autocmd BufRead,BufNewFile *.rmd set filetype=rmarkdown
        augroup END
