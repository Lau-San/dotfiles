local latex = {
    'ryleelyman/latex.nvim',
    ft = 'markdown',
    config = function()
        require('latex').setup({
            conceals = {
                add = {
                    ['sqrt'] = '√',
                    ['inf'] = ' ',
                    ['pm'] = '󰦒',
                    ['dsc'] = 'Δ'
                }
            }
        })
    end
}

return {
    latex
}
