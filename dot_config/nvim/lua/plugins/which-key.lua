return {
    {
        'folke/which-key.nvim',
        opts = {
            spec = {
                {
                    mode = {'n'},
                    { '<leader>o', group = 'obsidian', icon = { icon = '', color = 'purple' } },
                    -- { '<leader>t', group = 'todos', icon = { icon = '', color = 'purple' } },
                    { '<leader>t', group = 'toggles', icon= { icon = '', color = 'orange' } },
                    { '<leader>l', group = 'Lazy', icon= { icon = '󰒲', color = 'blue' } },
                    { '<leader>T', group = 'terminal', icon = { icon = '', color = 'red' } },
                    { '<leader>f', group = 'file', icon = { icon = '' } }
                }
            }
        }
    }
}
