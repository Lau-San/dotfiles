local nvim_cmp = {
    'hrsh7th/nvim-cmp',
    opts = {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'emmet' }
        }
    }
}
local blink = {
    'saghen/blink.cmp',
    -- enabled = false,
    -- version = '*',
    build = 'cargo +nightly build --release',
    opts = {
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['C-K'] = { 'scroll_documentation_up', 'fallback' },
            ['C-J'] = { 'scroll_documentation_down', 'fallback' },

            ['<S-Tab>'] = {},
            ['<C-p>'] = {},
            ['<C-n>'] = {},
            ['<C-f>'] = {},
            ['<C-b>'] = {},
            ['<C-y>'] = {},
        }
    }
}

return {
    -- nvim_cmp
    blink,
}
