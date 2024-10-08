return {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
        { '<leader>e', false },
    },
    opts = {
        {
            event = 'file_open_requested',
            handler = function()
                require('neo-tree.command').execute({ action = 'close' })
            end
        }
    }
}
