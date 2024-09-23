local zen_mode = {
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    opts = {
        window = {
            width = 120,
            options = {
                relativenumber = false,
                number = false,
                list = false
            }
        },
        plugins = {
            options = {
                laststatus = 0
            },
            twilight = { enabled = false }
        }
    },
    keys = {
        { '<leader>tz', ':ZenMode<cr>', desc = 'Toggle Zen Mode' }
    }
}

local twilight = {
    'folke/twilight.nvim',
}

return {
    zen_mode,
    twilight
}
