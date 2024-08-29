return {
    {
        'folke/which-key.nvim',
        opts = {
            spec = {
                {
                    mode = {'n'},
                    { '<leader>o', group = 'obsidian', icon = { icon = '', color = 'purple' } },
                    -- { '<leader>t', group = 'todos', icon = { icon = '', color = 'purple' } },
                    -- TODO: Set nerd font icons
                    { '<leader>t', group = 'toggles', icon= { icon = 'T', color = 'orange' } },
                    { '<leader>l', group = 'Lazy', icon= { icon = 'L', color = 'blue' } },
                    { '<leader>T', group = 'terminal', icon = { icon = 'T', color = 'red' } }
                }
            }
        }
    }
}
