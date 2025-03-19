local mini_files = {
    'echasnovski/mini.files',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {
        options = {
            use_as_default_explorer = true,
            permanent_delete = false
        },
        windows = {
            preview = true,
            width_focus = 30,
            width_preview = 30
        },
        mappings = {
            go_in_plus = 'l',
            go_in = 'L'
        }
    },
    keys = {
        { '<leader>e', function() require('mini.files').open(vim.api.nvim_buf_get_name(0), true) end, desc = 'File explorer' },
    }
}

return {
    mini_files
}
