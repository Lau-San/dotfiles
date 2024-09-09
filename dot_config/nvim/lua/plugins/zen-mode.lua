return {
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
