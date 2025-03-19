local venv_selector = {
    "linux-cultist/venv-selector.nvim",
    branch = 'regexp',
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim'
        -- 'nvim-telescope/telescope.nvim',
    },
    cmd = "VenvSelect",
    -- event = 'VeryLazy',
    ft = "python",
    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true,
            },
        },
    },
    config = function()
        require('venv-selector').setup()
    end,
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
}

local jinja = {
    'Glench/Vim-Jinja2-Syntax',
    ft = 'jinja.html'
}

return {
    venv_selector,
    jinja
}
