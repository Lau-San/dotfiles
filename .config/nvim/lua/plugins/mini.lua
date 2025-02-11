local icons = {
    'echasnovski/mini.icons',
    opts = {
        extension = {
            tmpl = { glyph = '', hl = 'MiniIconsGreen' }
        },
    }
}

local pairs = {
    'echasnovski/mini.pairs',
    opts = {
        mappings = {
            ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
            ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
        }
    }
}

local files = {
    'echasnovski/mini.files',
    opts = {
        options = {
            use_as_default_explorer = true,
            permanent_delete = false,
        },
        mappings = {
            go_in_plus = 'l',
            go_in = 'L'
        }
    },
    keys = {
        {
            '<leader>e',
            function()
                require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
            end,
            desc = 'Open mini.files'
        },
        {
            '<leader>E',
            function()
                require('mini.files').open(vim.uv.cwd(), true)
            end,
            desc = 'Open mini.files (cwd)'
        }
    },
}

return {
    icons,
    -- pairs,
    files
}
