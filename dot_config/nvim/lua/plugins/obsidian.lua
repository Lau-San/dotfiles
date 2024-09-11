local function new_note()
    vim.cmd('ObsidianNew')
    vim.cmd('ObsidianTemplate note')
    vim.cmd('normal! 1G')
    vim.cmd('normal! dd')
end

local function new_task()
    local task = vim.fn.input { prompt = 'New task: ' }
    local date = os.date('%Y-%m-%d')
    vim.cmd('!echo "- [ ] ' .. task .. '" >> ~/Documents/personal/journal/' .. date .. '.md')
end

return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            disable_frontmatter = true,
            new_notes_location = 'notes_subdir',

            --- @param spec { id: string, dir: obsidian.Path, title: string|? }
            note_path_func = function(spec)
                local title = string.gsub(spec.title, ' ', '-')
                local path = spec.dir / ('inbox/' .. tostring(title or spec.id))
                return path:with_suffix('.md')
            end,

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
                    -- [" "] = { char = " ", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = " ", hl_group = "ObsidianDone" },
                    -- ["/"] = { char = " ", hl_group = "ObsidianTilde" },
                    -- ["-"] = { char = " ", hl_group = "ObsidianTilde" },
                    -- [">"] = { char = " ", hl_group = "ObsidianRightArrow" },
                    -- ["*"] = { char = "", hl_group = "ObsidianRightArrow" },
                    -- ["!"] = { char = "", hl_group = "ObsidianImportant" },
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
                template = 'journal'
            }
        },
        keys = {
            { '<leader>os', ':ObsidianQuickSwitch<cr>', desc = 'open a note' },
            { '<leader>on', new_note, desc = 'create new note' },
            { '<leader>oT', ':ObsidianTemplate note<cr>', desc = 'apply default template' },
            { '<leader>oot', ':ObsidianToday<cr>', desc = "open today's note" },
            { '<leader>ooT', ':ObsidianTomorrow<cr>', desc = "open tomorrow's note" },
            { '<leader>or', ':ObsidianRename<cr>', desc = 'rename note' },
            { '<leader>of', ':s/-/ /g<cr>', desc = 'format title' },
            { '<leader>ok', ':!mv "%:p" ~/Documents/personal/zettelkasten<cr>:bd<cr>', desc = 'add note to zettelkasten' },
            { '<leader>odd', ":!rm -rf '%:p'<cr>:bd<cr>", desc = 'delete current note' },

            { '<leader>otn', new_task, desc = 'add task to inbox' },
            { '<leader>ott', ':s/- \\[.\\]/- \\[ \\]/<cr>', desc = 'set status to do' },
            { '<leader>oti', ':s/- \\[.\\]/- \\[\\/\\]/<cr>', desc = 'set status incomplete' },
            { '<leader>otd', ':s/- \\[.\\]/- \\[x\\]/<cr>', desc = 'set status done' },
            { '<leader>otc', ':s/- \\[.\\]/- \\[-\\]/<cr>', desc = 'set status cancelled' },
            { '<leader>otm', ':s/- \\[.\\]/- \\[>\\]/<cr>', desc = 'set status moved' },
            { '<leader>otP', ':s/- \\[.\\]/- \\[*\\]/<cr>', desc = 'set pinned' },
            { '<leader>otM', ':s/- \\[.\\]/- \\[M\\]/<cr>', desc = 'set priority MUST' },
            { '<leader>otS', ':s/- \\[.\\]/- \\[S\\]/<cr>', desc = 'set priority SHOULD' },
            { '<leader>otC', ':s/- \\[.\\]/- \\[C\\]/<cr>', desc = 'set priority COULD' },

            -- Manipulate checkboxes
            -- { '<leader>ott', function() require'obsidian'.util.toggle_checkbox({' '}) end }
        },
    }
}
