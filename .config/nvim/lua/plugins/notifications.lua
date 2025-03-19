local fidget = {
    'j-hui/fidget.nvim',
    opts = {
        progress = {
            display = {
                done_icon = ''
            }
        },
        notification = {
            view = {
                group_separator = '━━━━'
            },
        }
    }
}

local noice = {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify'
    },
    opts = {
        lsp = {
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylized_markdown'] = true
            }
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true
        },
        routes = {
            {
                filter = {
                    event = 'msg_show',
                    any = {
                        { find = '%d+L, %d+B' },
                        { find = '; after #%d+' },
                        { find = '; before #%d+' },
                    }
                }
            }
        }
    },
    keys = {
        -- { '<leader>n', function() require('noice').cmd('history') end, desc = 'Notifications' }
    }
}

return {
    -- fidget,
    noice
}
