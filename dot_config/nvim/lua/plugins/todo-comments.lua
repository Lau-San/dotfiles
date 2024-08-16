return {
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
    }
}
