require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        use_languagetree = true, -- Use this to enable language injection
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            disable = {'markdown'}
        },
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',

                -- Or you can define your own textobjects like this
                ['iF'] = {
                    python = '(function_definition) @function',
                    cpp = '(function_definition) @function',
                    c = '(function_definition) @function',
                    java = '(method_declaration) @function',
                },
            },
        },
    },
}
