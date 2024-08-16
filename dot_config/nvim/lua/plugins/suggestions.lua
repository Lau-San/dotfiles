local cmp = {
    'hrsh7th/nvim-cmp',
    dependencies = { 'jackieaskins/cmp-emmet' },
    opts = function(_, opts)
        table.insert(opts.sources, { name = 'emmet' })
    end
}

return { cmp }
