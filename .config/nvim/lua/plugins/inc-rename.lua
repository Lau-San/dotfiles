local inc_rename = {
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        opts = {},
        keys = {
            { '<leader>cr', ':IncRename ', desc = 'Rename' }
        }
    },
    {
        'folke/noice.nvim',
        opts = {
            presets = { inc_rename = true }
        }
    }
}

return inc_rename
