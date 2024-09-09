local latex = {
    'ryleelyman/latex.nvim',
    config = function()
        require('latex').setup({
            conceals = {
                add = {
                    ['sqrt'] = '√',
                    ['inf'] = ' '
                }
            }
        })
    end
}

return {
    latex
}
