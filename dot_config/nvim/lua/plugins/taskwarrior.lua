return {
    {
        'ribelo/taskwarrior.nvim',
        lazy = false,
        keys = {
            { '<leader>t', function() require'taskwarrior.nvim'.browser() end }
        }
    }
}
