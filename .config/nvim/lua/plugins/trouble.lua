local trouble = {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
        focus = true,
        modes = {
            diagnostics = {
                mode = "diagnostics",
                preview = {
                    type = 'split',
                    relative = 'win',
                    position = 'right',
                    size = 0.4
                },
            },
            loclist = { mode = 'diagnostics' },
            qflist = { mode = 'diagnostics' },
            todo = { mode = 'diagnostics' },
            symbols = {
                win = {
                    position = 'right',
                    size = 0.3
                }
            },
        },

    },
    keys = {
        { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics' },
        { '<leader>xb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Diagnostics (Buffer)' },
        { '<leader>xl', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List' },
        { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List' },
        { '<leader>xt', '<cmd>Trouble todo toggle filter = {tag = {TODO,TIX,FIXME}}<cr>', desc = 'Todo' },
    }
}

return {
    trouble
}
