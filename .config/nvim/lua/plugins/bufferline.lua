local colors = require('tokyonight.colors').setup()
return {
    'akinsho/bufferline.nvim',
    enabled = false,
    opts = {
        options = {
            always_show_bufferline = true,
            separator_style = 'slant',
            indicator = {
                icon = '▋',
                -- icon = '>',
                -- style = 'underline'
            },
            tab_size = 20,
            show_close_icon = false,
            show_tab_indicators = false,
            show_buffer_close_icons = false,
            groups = {
                items = {
                    require('bufferline.groups').builtin.pinned:with({ icon = '󰐃 ', highlight = { fg = colors.blue0 } })
                }
            }
        }
    }
}
