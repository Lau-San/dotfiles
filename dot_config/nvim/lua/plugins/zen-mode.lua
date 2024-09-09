local zen_mode = {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            options = {
                relativenumber = false,
                number = false,
                list = false
            }
        },
        plugins = {
            options = {
                laststatus = 0
            }
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
