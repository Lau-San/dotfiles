local modules = {
    { 'ai' },
    { 'pairs', {
        opts = {},
        config = function(_, opts)
            local pairs = require('mini.pairs')
            pairs.steup(opts)

            local open = pairs.open
            pairs.open = function(pair, neigh_pattern)
                if vim.fn.getcmdline() ~= '' then
                    return open(pair, neigh_pattern)
                end
                local o, c = pair:sub(1, 1), pair:sub(2, 2)
                local line = vim.api.nvim_get_current_line()
                local cursor = vim.api.nvim_win_get_cursor(0)
                local next = line:sub(cursor[2] + 1, cursor[2] + 1)
                local before = line:sub(1, cursor[2])
                if o == '`' and vim.bo.filetype == 'markdown' and before:match('^%s*``') then
                    return '\n```' .. vim.api.nvim_replace_termcodes('<up>', true, true, true)
                end
                return open(pair, neigh_pattern)
            end
        end
    }},
    { 'surround', {
        opts = {
            mappings = {
                add = 'gsa',
                delete = 'gsd',
                replace = 'gsr',
                find = '',
                find_left = '',
                highlight = '',
                update_n_lines = '',
            }
        },
        keys = function(_, keys)
            -- Set keys from mappings option
            local plugin = require('lazy.core.config').spec.plugins['mini.surround']
            local opts = require('lazy.core.plugin').values(plugin, 'opts', false)
            local mappings = {
                { opts.mappings.add, desc = 'Add Surrounding', mode = { 'n', 'v' } },
                { opts.mappings.delete, desc = 'Delete Surrounding' },
                { opts.mappings.replace, desc = 'Replace Surrounding' },
            }
            mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
            return vim.list_extend(mappings, keys)
        end
    }},
    { 'indentscope', {
        opts = {
            symbol = '▏'
        }
    }}
}

local mini = vim.tbl_map(function(v)
    local name = v[1]
    local specs = v[2] or {}
    return {
        'echasnovski/mini.' .. name,
        version = '*',
        event = vim.tbl_extend('force', require('util').lazy_file_events, specs.events or {}),
        opts = specs.opts or {},
        config = specs.config or function(_, opts) require('mini.' .. name).setup(opts) end,
        keys = specs.keys or {}
    }
end, modules)

return {
    mini
}
