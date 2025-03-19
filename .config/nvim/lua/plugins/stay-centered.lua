local centered = {
    'arnamak/stay-centered.nvim',
    event = require('util').lazy_file_events,
    opts = {
        skip_filetypes = {
            'minifiles',
            'snacks_dashboard',
            'lazy',
            'mason',
        }
    }
}

return {
    centered
}
