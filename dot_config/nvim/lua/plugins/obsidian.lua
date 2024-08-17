return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = true,
        ft = 'markdown',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            workspaces = {
                {
                    name = 'personal',
                    path = '~/Documents/personal',
                    notes_subdir = 'notes'
                }
            },
            ui = {
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["*"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["-"] = { char = "", hl_group = "ObsidianTilde" },
                    ["!"] = { char = "", hl_group = "ObsidianImportant" },
                }
            }
        }
    }
}
