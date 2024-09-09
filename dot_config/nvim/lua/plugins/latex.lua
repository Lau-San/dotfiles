local latex = {
    'ryleelyman/latex.nvim',
    config = function()
        require('latex').setup({
            conceals = {
                add = {
                    ['sqrt'] = '√'
                }
            }
        })
    end
}

return {
    latex
}
