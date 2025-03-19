local outline = {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    opts = {
        outline_items = {
            show_symbol_details = false
        },
        symbols = {
            filter = {
                'Class',
                'Constructor',
                'Enum',
                'Function',
                'Interface',
                'Method',
                'StaticMethod',
                'Module',
                'Namespace',
                'Package',
                'Property',
                'Struct',
                'Trait',
                'Variable',
                'Constant',
                'Event',
                'Field',
            }
        }
    },
    keys = {
        { '<leader>co', '<cmd>Outline<cr>', desc = 'Outline' }
    }
}

return {
    outline
}
