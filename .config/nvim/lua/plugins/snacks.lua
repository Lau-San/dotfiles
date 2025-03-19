local snacks = {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        input = { enabled = true },
        statuscolumn = { enabled = false },
        dashboard = {
            width = 80,
            sections = {
                { section = "header" },
                { icon = ' ', title = 'Recent Files (cwd)', section = 'recent_files', cwd = true, indent = 2, padding = 1 },
                { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
                {
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git --no-pager diff --stat -B -M -C",
                    height = 10,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 2,
                },
                { section = "startup" },
            }
        },
        notifier = {
            style = 'compact'
        },
        lazygit = {
            configure = true,
        }
    },
    keys = {
        { '<leader>bx', function() Snacks.bufdelete() end, desc = 'Close Buffer' },
        { '<leader>gg', function() Snacks.lazygit.open() end, desc = 'Lazygit' },
        { '<leader>n', function() Snacks.notifier.show_history() end, desc = 'Notifications' },
        { '<leader>si', function() Snacks.picker.icons({ icon_sources = { 'nerd_fonts' } }) end, desc = 'Search icons' },
    }
}

return {
    snacks
}
