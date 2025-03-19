local navigator = {
    'dynamotn/Navigator.nvim',
    config = function(_, opts)
        require('Navigator').setup(opts)
    end,
    keys = {
        { '<C-h>', '<CMD>NavigatorLeft<CR>', mode = 'n' },
        { '<C-j>', '<CMD>NavigatorDown<CR>', mode = 'n' },
        { '<C-k>', '<CMD>NavigatorUp<CR>', mode = 'n' },
        { '<C-l>', '<CMD>NavigatorRight<CR>', mode = 'n' },
    }
}

local vim_zellij_navigator = {
    'hiasr/vim-zellij-navigator.nvim',
    config = function()
        require('vim-zellij-navigator').setup()
    end
}

return {
    navigator,
    vim_zellij_navigator
}
