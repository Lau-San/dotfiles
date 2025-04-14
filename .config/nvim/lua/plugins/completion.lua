local blink = {
    'saghen/blink.cmp',
    -- build = 'cargo +nightly build --release',
    version = '1.*',
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
                auto_show = true,
                auto_show_delay_ms = 200
            },
        },
        appearance = {
            kind_icons = require('util.icons').kinds
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lsp', 'path' },
            per_filetype = {
                css = { 'lsp', 'path', 'snippets' },
                scss = { 'lsp', 'path', 'snippets' },
                sass = { 'lsp', 'path', 'snippets' },
            }
        },
        cmdline = {
            enabled = true
        },
        keymap = {
            preset = 'none',
            ['<Tab>'] = { 'select_and_accept', 'fallback' },

            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },

            ['<S-Tab>'] = {},
            ['<C-p>'] = {},
            ['<C-n>'] = {},
            ['<C-f>'] = {},
            ['<C-b>'] = {},
            ['<C-y>'] = {},
        }
    }
}

local nvim_cmp = {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    opts = function()
        vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
        local cmp = require('cmp')
        local defaults = require('cmp.config.default')()
        return {
            auto_brackets = {},
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect',
                preselect = cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-j>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-k>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'lazydev' },
                    { name = 'nvim_lsp' },
                    { name = 'path' }
                }),
                formatting = {
                    format = function(entry, item)
                        local icons = require('util.icons').kinds
                        item.kind = icons[item.kind] .. item.kind

                        local widths = {
                            abbr = 40,
                            menu = 30
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
                            end
                        end

                        return item
                    end,
                    sorting = defaults.sorting,
                    snippet = {
                        expand = function(args) end
                    }
                }
            }
        }
    end,
}

return {
    blink
    -- nvim_cmp
}
