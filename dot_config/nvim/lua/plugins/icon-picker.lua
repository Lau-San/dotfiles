return {
    'ziontee113/icon-picker.nvim',
    cmd = { 'IconPickerNormal', 'IconPickerYank', 'IconPickerInsert' },
    opts = {
        disable_legacy_commands = true
    },
    keys = {
        { '<leader>si', ':IconPickerYank nerd_font<cr>', desc = 'Search Nerdfont icons' }
    }
}
