local flit = {
    'ggandor/flit.nvim',
    keys = function()
        local ret = {}
        for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
            ret[#ret+1] = { key, mode = { 'n', 'x', 'o' } }
        end
        return ret
    end,
    opts = { labeled_modes = 'nx' }
}

local leap = {
    'ggandor/leap.nvim',
    keys = {
        { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
        { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
    },
    opts = {

    },
    config = function (_, opts)
        local leap = require('leap')
        for k, v in pairs(opts) do
            leap.opts[k] = v
        end
        leap.add_default_mappings(true)
        vim.keymap.del({ 'x', 'o' }, 'x')
        vim.keymap.del({ 'x', 'o' }, 'X')
    end
}

local function search_replace_in_current_file()
    require('grug-far').open({
        prefills = {
            paths = vim.fn.expand('%')
        }
    })
end

local grug_far = {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    opts = {
        headerMaxWidth = 80
    },
    keys = {
        { '<leader>sr', search_replace_in_current_file, desc = 'Search and Replace', mode = 'n' }
    }
}

return {
    flit,
    leap,
    grug_far
}
