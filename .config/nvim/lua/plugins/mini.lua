local modules = {
    { 'ai' },
    { 'pairs' },
    { 'surround', {
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
    },
    -- { 'icons' },
    { 'indentscope', {
        symbol = '▏'
    }}
}

local mini = vim.tbl_map(function(v)
    return {
        'echasnovski/mini.' .. v[1],
        version = '*',
        event = vim.tbl_extend('force', require('util').lazy_file_events, v['events'] or {}),
        opts = v[2] or {},
        config = function(_, opts)
            require('mini.' .. v[1]).setup(opts)
        end,
        keys = v.keys or {}
    }
end, modules)

return {
    mini
}
