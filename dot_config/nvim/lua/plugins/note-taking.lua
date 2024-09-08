local neorg = {
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
            ['core.export'] = {},
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

return {
}
