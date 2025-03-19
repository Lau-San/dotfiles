local lualine = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'tokyonight',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
            globalstatus = true,
            disabled_filetypes = {
                statusline = {
                    'snacks_dashboard'
                }
            }
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    color = { gui = 'bold' },
                    fmt = function(str)
                        local first = str:sub(1, 1)
                        return first
                    end
                }
            },
            lualine_b = { 'filetype' },
            lualine_c = {
                {
                    'filename',
                    symbols = {
                        modified = ' ',
                        readonly = ' '
                    }
                },
                'diagnostics'
            },
            lualine_x = {
                {
                    'diff',
                    symbols = {
                        added = ' ',
                        modified = ' ',
                        removed = ' '
                    }
                }
            },
            lualine_y = { { 'branch', icon = ' ' } },
            lualine_z = { { 'location', color = { gui='bold' }, padding = { left = 0, right = 1 } } },
        }
    }
}

return {
    lualine
}
