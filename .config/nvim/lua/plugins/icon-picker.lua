local icon_picker = {
    'ziontee113/icon-picker.nvim',
    cmd = { 'IconPickerNormal', 'IconPickerYank', 'IconPickerInsert' },
    opts = {
        disable_legacy_commands = true
    },
    keys = {
        { '<leader>si', ':IconPickerNormal nerd_font<cr>', desc = 'Search Nerdfont icons' }
    }
}
return {
    -- icon_picker
}
