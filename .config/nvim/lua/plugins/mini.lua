local modules = {
    { 'ai' },
    { 'pairs' },
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
    },
    },
    { 'indentscope', {
        opts = {
            symbol = '▏'
        }
    }}
}

local mini = vim.tbl_map(function(v)
    local name = v[1]
    local specs = v[2]
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
