return {
    {
        'folke/which-key.nvim',
        opts = {
            spec = {
                {
                    mode = {'n'},
                    { '<leader>o', group = 'obsidian', icon = { icon = '', color = 'purple' } },
                    { '<leader>ot', group = 'todos', icon = { icon = '', color = 'purple' } }
                }
            }
        }
    }
}
