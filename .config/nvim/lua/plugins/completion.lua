local blink = {
    'saghen/blink.cmp',
    build = 'cargo +nightly build --release',
    event = 'InsertEnter',
    opts = {
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true
                }
            },
            menu = {
                draw = {
                    treesitter = { 'lsp' },
                }
            },
            documentation = {
                auto_show = true
            },
        },
        appearance = {
            kind_icons = {
                Array         = " ",
                Boolean       = "󰨙 ",
                Class         = " ",
                Codeium       = "󰘦 ",
                Color         = " ",
                Control       = " ",
                Collapsed     = " ",
                Constant      = "󰏿 ",
                Constructor   = " ",
                Copilot       = " ",
                Enum          = " ",
                EnumMember    = " ",
                Event         = " ",
                Field         = " ",
                File          = " ",
                Folder        = " ",
                Function      = "󰊕 ",
                Interface     = " ",
                Key           = " ",
                Keyword       = " ",
                Method        = "󰊕 ",
                Module        = " ",
                Namespace     = "󰦮 ",
                Null          = " ",
                Number        = "󰎠 ",
                Object        = " ",
                Operator      = " ",
                Package       = " ",
                Property      = " ",
                Reference     = " ",
                Snippet       = "󱄽 ",
                String        = " ",
                Struct        = "󰆼 ",
                Supermaven    = " ",
                TabNine       = "󰏚 ",
                Text          = " ",
                TypeParameter = " ",
                Unit          = " ",
                Value         = " ",
                Variable      = "󰀫 ",
            }
        },
        sources = {
            default = { 'lsp', 'path' }
        },
        cmdline = {
            enabled = true
        },
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'select_and_accept', 'fallback' },

            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-K>'] = {},
            ['<C-J>'] = {},

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
    blink
}
