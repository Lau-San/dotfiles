local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        require('nvim-treesitter.query_predicates')
    end,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    opts_extend = { 'ensure_installed' },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        sync_install = false,
        ensure_installed = {
            'bash',
            'c',
            'diff',
            'html',
            'javascript',
            'jsdoc',
            'json',
            'jsonc',
            'lua',
            'luadoc',
            'luap',
            'markdown',
            'markdown_inline',
            'printf',
            'python',
            'query',
            'regex',
            'toml',
            'tsx',
            'typescript',
            'vim',
            'vimdoc',
            'xml',
            'yaml'
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
            },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}

local treesitter_textobjects = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = 'VeryLazy',
    enabled = true,
}

local autotag = {
    'windwp/nvim-ts-autotag'
}

return {
    treesitter,
    treesitter_textobjects,
    autotag
}
