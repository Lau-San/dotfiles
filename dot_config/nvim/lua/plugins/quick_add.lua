return {
    { 'NvChad/nvim-colorizer.lua' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'jackieaskins/cmp-emmet' },
        opts = function(_, opts)
            table.insert(opts.sources, { name = 'emmet' })
        end
    },
    { 'elkowar/yuck.vim' },
    { 'imsnif/kdl.vim' },
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
        'vimwiki/vimwiki',
        lazy = false
    }
}
