local function new_note()
    vim.cmd('ObsidianNew')
    vim.cmd('ObsidianTemplate note')
    vim.cmd('normal! 1G')
    vim.cmd('normal! dd')
end

-- local function new_task()
--     local task = vim.fn.input { prompt = 'New task: ' }
--     local date = os.date('%Y-%m-%d')
--     vim.cmd('!echo "- [ ] ' .. task .. '" >> ~/Documents/personal/journal/' .. date .. '.md')
-- end

local function open_in_vsplit()
    vim.cmd('exe "normal \\<C-W>v"')
    vim.cmd('ObsidianQuickSwitch')
end

--- Change the status of the todo
---@param status string
local function set_todo(status)
    vim.cmd('s/- \\[.\\]/- \\[' .. status .. '\\]/')
    vim.cmd('noh')
end

return {
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        cmd = {
            'ObsidianOpen',
            'ObsidianNew',
            'ObsidianNewFromTemplate',
            'ObsidianQuickSwitch',
            'ObsidianTags',
            'ObsidianToday',
            'ObsidianTomorrow',
            'ObsidianDailies',
            'ObsidianSearch',
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            disable_frontmatter = true,
            -- open_notes_in = 'vsplit',
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
            },
            attachments = {
                -- A function that determines the text to insert in the note when pasting an image.
                -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
                -- This is the default implementation.
                ---@param client obsidian.Client
                ---@param path obsidian.Path the absolute path to the image file
                ---@return string
                img_text_func = function(client, path)
                    path = client:vault_root() / ('assets/imgs/' .. path.name)
                    return string.format('![%s](%s)', path.name, path)
                end
            }
        },
        keys = {
            { '<leader>oo', ':ObsidianQuickSwitch<cr>', desc = 'open a note' },
            { '<leader>oO', open_in_vsplit, desc = 'open a note in a split' },
            { '<leader>on', new_note, desc = 'create new note' },
            { '<leader>oT', ':ObsidianTemplate note<cr>', desc = 'apply default template', ft = 'markdown' },
            { '<leader>oss', ':ObsidianSearch<cr>', desc = 'grep vault' },
            { '<leader>ost', ':ObsidianTags<cr>', desc = 'search tags' },
            { '<leader>or', ':ObsidianRename<cr>', desc = 'rename note', ft = 'markdown' },
            -- { '<leader>of', ':s/-/ /g<cr>', desc = 'format title', ft = 'markdown' },
            { '<leader>ok', ':!mv "%:p" ~/Documents/personal/zettelkasten<cr>:bd<cr>', desc = 'add note to zettelkasten', ft = 'markdown' },
            { '<leader>odd', ":!rm -rf '%:p'<cr>:bd<cr>", desc = 'delete current note', ft = 'markdown' },
            { '<leader>op', ':ObsidianPasteImg<cr>', desc = 'paste image', ft = 'markdown' },

            -- { '<leader>otn', new_task, desc = 'add task to inbox' },
            { '<leader>ott', function() set_todo(' ') end, desc = 'set status to do', ft = 'markdown' },
            { '<leader>oti', function() set_todo('\\/') end, desc = 'set status incomplete', ft = 'markdown' },
            { '<leader>otd', function() set_todo('x') end, desc = 'set status done', ft = 'markdown' },
            { '<leader>otc', function() set_todo('-') end, desc = 'set status cancelled', ft = 'markdown' },
            { '<leader>otm', function() set_todo('>') end, desc = 'set status moved', ft = 'markdown' },
            { '<leader>otp', function() set_todo('*') end, desc = 'set pinned', ft = 'markdown' },
            { '<leader>otM', function() set_todo('M') end, desc = 'set priority MUST', ft = 'markdown' },
            { '<leader>otS', function() set_todo('S') end, desc = 'set priority SHOULD', ft = 'markdown' },
            { '<leader>otC', function() set_todo('C') end, desc = 'set priority COULD', ft = 'markdown' },

            -- Manipulate checkboxes
            -- { '<leader>ott', function() require'obsidian'.util.toggle_checkbox({' '}) end }
        },
    }
}
