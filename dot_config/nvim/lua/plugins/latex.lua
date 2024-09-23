local latex = {
    'ryleelyman/latex.nvim',
    config = function()
        require('latex').setup({
            conceals = {
                add = {
                    ['sqrt'] = '√',
                    ['inf'] = ' ',
                    ['pm'] = '󰦒'
                }
            }
        })
    end
}

return {
    latex
}
