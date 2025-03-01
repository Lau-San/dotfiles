return {
    'dynamotn/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end,
    keys = {
        { '<C-h>', '<CMD>NavigatorLeft<CR>' },
        { '<C-j>', '<CMD>NavigatorDown<CR>' },
        { '<C-k>', '<CMD>NavigatorUp<CR>' },
        { '<C-l>', '<CMD>NavigatorRight<CR>' },
    }
}
