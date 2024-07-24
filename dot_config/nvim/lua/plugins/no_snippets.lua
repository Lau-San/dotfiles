return {
    -- {'L3MON4D3/LuaSnip', enabled = false},
    -- {'rafamadriz/friendly-snippets', enabled = false},
    {'saadparwaiz1/cmp_luasnip', enabled = false},
    {
        'hrsh7th/nvim-cmp',
        ---@param opts cmp.ConfigSchema
        opts = function (_, opts)
            local cmp = require 'cmp'

            opts.sources = cmp.config.sources({
                {
                    name = 'nvim_lsp',
                    ---@param entry cmp.Entry
                    entry_filter = function(entry, ctx)
                        local types = require 'cmp.types'

                        local is_text = types.lsp.CompletionItemKind[entry:get_kind()] == 'Text'
                        local is_snippet = types.lsp.CompletionItemKind[entry:get_kind()] == 'Snippet'
                        return not is_text and not is_snippet
                    end
                },
                { name = 'path' }
            })
        end
    },
}
