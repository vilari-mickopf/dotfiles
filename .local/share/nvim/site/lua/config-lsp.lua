#! /usr/bin/env lua

local lsp = require('lspconfig')


-- diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
            -- spacing = 4,
            prefix = ''
        },
        signs = true,
        update_in_insert = false,
    }
)

-- general config
local on_attach = function(client, bufnr)
    -- Mappings.
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '[l', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']l', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end


-- bash
lsp.bashls.setup{
    on_attach = on_attach;
}

-- c/c++
lsp.ccls.setup {
    init_options = {
        compilationDatabaseDirectory = 'build';
        index = { threads = 0 };
        clang = { excludeArgs = {'-frounding-math'} };
    };
    on_attach = on_attach;
}

-- cmake
lsp.cmake.setup{
    on_attach = on_attach;
}

-- python
lsp.pyright.setup{
    on_attach = on_attach;
    settings = {python = {analysis = {typeCheckingMode = "off"}}};
}

-- latex
lsp.texlab.setup{
    on_attach = on_attach;
}

-- vim
lsp.vimls.setup{
    on_attach = on_attach;
}

-- docker
lsp.dockerls.setup{
    on_attach = on_attach;
}

-- lua
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = '/bin/lua-language-server'
lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
            telemetry = {
                enable = false,
            }
        }
    };
    on_attach = on_attach;
}
