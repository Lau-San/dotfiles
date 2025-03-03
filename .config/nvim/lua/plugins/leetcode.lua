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
        lang = 'python3',
        injector = {
            ['python3'] = {
                before = true,
                after = true
            }
        }
    }
}

return {
    leet
}
