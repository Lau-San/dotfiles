return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = true,
        ft = 'markdown',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            workspaces = {
                {
                    name = 'personal',
                    path = '~/Documents/personal'
                }
            },
            new_notes_location = 'current_dir'
        }
    }
}
