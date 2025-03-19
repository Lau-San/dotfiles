local whichkey = {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    opts = {
        spec = {
            mode = { 'n', 'v' },
            { '<leader>b', group = 'Buffer' },
            { '<leader>f', group = 'File' },
            { '<leader>c', group = 'Code' },
            { '<leader>cg', group = 'Goto' },
            { '<leader>q', group = 'Quit' },
            { '<leader>w', group = 'Window' },
            { '<leader>x', group = 'Diagnostics' },
            { '<leader>s', group = 'Search' },
            { '<leader>g', group = 'Git' },
            { '<leader>m', group = 'Markdown', icon = { icon = '', color = 'white' } },
            { '<leader>o', group = 'Obsidian', icon = { icon = '', color = 'purple' } },
            { '<leader>od', group = 'Delete', icon = { icon = '', color = 'red' } },
            { '<leader>ot', group = 'ToDo', icon = { icon = '', color = 'purple' } },
            { '<leader>os', group = 'Search' },

            { 'gs', group = 'Surround' },
        }
    },
    keys = {
        { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer local keymaps' }
    }
}

return {
    whichkey
}
