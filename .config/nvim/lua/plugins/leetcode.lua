local leet = {
    'kawre/leetcode.nvim',
    -- build = ':TSUpdate html',
    cmd = 'Leet',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
        'MuniTanjim/nui.nvim',
    },
    opts = {
        arg = 'leetcode.nvim',
        lang = 'python3'
    }
}

return {
    leet
}
