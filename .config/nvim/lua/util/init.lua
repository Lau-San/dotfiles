local M = {}

M.lazy_file_events = { 'BufReadPost', 'BufNewFile' }

function M.get_plugin(name)
    return require('lazy.core.config').spec.plugins[name]
end

---@param name string
function M.get_plugin_opts(name)
    -- TODO: Add get_plugin() function
    local plugin = M.get_plugin(name)
    if not plugin then
        return {}
    end
    return require('lazy.core.plugin').values(plugin, 'opts', false)
end

return M
