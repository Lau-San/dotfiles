return {
    {
        'NvChad/nvim-colorizer.lua',
        opts = function()
            require 'colorizer'.setup({
                '!norg'
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'jackieaskins/cmp-emmet' },
        opts = function(_, opts)
            table.insert(opts.sources, { name = 'emmet' })
        end
    },
    { 'elkowar/yuck.vim' },
    { 'eraserhd/parinfer-rust', build = 'cargo build --release' },
    { 'editorconfig/editorconfig-vim' },
    { 'wakatime/vim-wakatime', lazy = false },
    { 'jasonccox/vim-wayland-clipboard' },
    {
        'folke/todo-comments.nvim',
        opts = {
            search = {
                commands = 'rg',
                args = {
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--glob=!node_modules'
                }
            },
            hightlight = {
                exclude = {
                    [[.*node_modules\/.*\.js]]
                }
            }
        }
    },
    {
        'nvim-neorg/neorg',
        lazy = false,
        version = "*",
        build = ':Neorg sync-parsers',
        dependencies = {
            {'nvim-lua/plenary.nvim'}
        },
        opts = {
            load = {
                ['core.defaults'] = {},
                ['core.concealer'] = {
                    config = {
                        icon_preset = 'diamond',
                        icons = {
                            todo = {
                                uncertain = {
                                    icon = ''
                                },
                                pending = {
                                    icon = '󰔟'
                                },
                                urgent = {
                                    icon = '󱈸'
                                }
                            }
                        }
                    }
                },
                ['core.dirman'] = {
                    config = {
                        workspaces = {
                            studies = '~/Documents/studies'
                        }
                    }
                }
            }
        }
    }
}
