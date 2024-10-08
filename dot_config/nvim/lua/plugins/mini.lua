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
        }
    }
}

return {
    icons,
    pairs,
    files
}
