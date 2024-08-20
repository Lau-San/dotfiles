return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            disable_frontmatter = true,
            workspaces = {
                {
                    name = 'personal',
                    path = '~/Documents/personal',
                    notes_subdir = 'inbox'
                }
            },
            ui = {
                enable = false,
                checkboxes = {
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["*"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["-"] = { char = "", hl_group = "ObsidianTilde" },
                    ["!"] = { char = "", hl_group = "ObsidianImportant" },
                }
            },
            templates = {
                folder = 'templates',
                date_format = '%Y-%m-%d',
                time_format = '%H:%M',
                substitutions = {
                    date_pretty = function()
                        return os.date('%A %B %-d, %Y')
                    end
                }
            },
            daily_notes = {
                folder = 'journal',
                date_format = '%Y-%m-%d',
                alias_format = '%B %-d, %Y',
                default_tags = {'journal'},
                template = 'entry'
            }
        },
        keys = {
            { '<leader>os', ':ObsidianQuickSwitch<cr>', desc = 'open a note' },
            { '<leader>on', ':ObsidianNew<cr>', desc = 'create new note' },
            { '<leader>oo', ':ObsidianTemplate note<cr>', desc = 'apply default template' },
            { '<leader>or', ':ObsidianRename<cr>', desc = 'rename note' },
            { '<leader>of', ':s/-/ /g<cr>', desc = 'format title' },
            { '<leader>ok', ':!mv "%:p" ~/Documents/personal/zettelkasten<cr>:bd<cr>', desc = 'add note to zettelkasten' },
            { '<leader>od', ":!rm -rf '%:p'<cr>:bd<cr>", desc = 'delete current note' },

            -- Manipulate checkboxes
            { '<leader>ott', function() require'obsidian'.util.toggle_checkbox({' '}) end }
        },
    }
}
