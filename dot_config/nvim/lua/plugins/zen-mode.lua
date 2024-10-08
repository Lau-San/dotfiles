local zen_mode = {
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    opts = {
        window = {
            width = 80,
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

return {
    zen_mode
}
