local snacks = {
    'folke/snacks.nvim',
    opts = {
        -- Disable smooth scrolling because it breaks gg nad G
        scroll = { enabled = false }
    }
}

return {
    snacks
}
