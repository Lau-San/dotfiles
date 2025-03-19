local fzf = {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            'borderless',
            prompt = '   ',
            file_icon_padding = ' ',
            fzf_colors = true,
            fzf_opts = {
                ['--no-scrollbar'] = true
            },
            winopts = {
                -- row = 0.40,
                fullscreen = true
            },
            files = {
                cwd_prompt = false,
                prompt = '   '
            },
            buffers = {
                prompt = '   ',
                sort_lastused = true
            },
            grep = { prompt = '   ' },
            helptags = { prompt = '   ' },
            autocmds = { prompt = '   ' },
            highlights = { prompt = '   ' },
            keymaps = { prompt = '   ' },
            defaults = {
                formatter = 'path.dirname_first'
            }
        },
        keys = {
            -- Files
            { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files (Root Dir)' },
            { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Find git files' },

            -- Buffers
            { '<leader>bb', '<cmd>FzfLua buffers sort_mru=true<cr>', desc = 'Switch buffers' },

            -- Search
            { '<leader>sg', '<cmd>FzfLua live_grep<cr>', desc = 'Live Grep' },
            { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Search Auto Commands' },
            { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Search Help' },
            { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
            { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Search Keymaps' },
            { '<leader>so', '<cmd>FzfLua nvim_options<cr>', desc = 'Search Neovim Options' },
            { '<leader>st', '<cmd>FzfLua filetypes<cr>', desc = 'Search Filetypes' },

            --Code
            { '<leader>ca', '<cmd>FzfLua lsp_code_actions jump1=true ignore_current_line=true<cr>', desc = 'Code Actions' },
            -- { '<leader>cls', '<cmd>FzfLua lsp_document_symbols jump1=true ignore_current_line=true<cr>', desc = 'Symbols' },
            { '<leader>cgd', '<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>', desc = 'Definition' },
            { '<leader>cgD', '<cmd>FzfLua lsp_declarations jump1=true ignore_current_line=true<cr>', desc = 'Declarations' },
            { '<leader>cgr', '<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>', desc = 'References' },
            { 'gd', '<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>', desc = 'Definition' },
            { 'gr', '<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>', desc = 'References' },
        },
    },
}

return {
    fzf
}
