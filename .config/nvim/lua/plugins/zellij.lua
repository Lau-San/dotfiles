local zellij_nav = {
    'swaits/zellij-nav.nvim',
    cmd = {
        'ZellijNavigateLeft',
        'ZellijNavigateDown',
        'ZellijNavigateUp',
        'ZellijNavigateRight',
    },
    keys = {
        -- { "<c-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
        -- { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
        -- { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
        -- { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {}
}

local vim_zellij_navigator = {
    'hiasr/vim-zellij-navigator.nvim',
    config = function()
        require('vim-zellij-navigator').setup()
    end
}

return {
    -- zellij_nav,
    vim_zellij_navigator
}
