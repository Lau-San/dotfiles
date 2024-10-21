local function search_replace_in_current_file()
    require('grug-far').open({
        prefills = {
            paths = vim.fn.expand('%')
        }
    })
end

return {
    'MagicDuck/grug-far.nvim',
    keys = {
        { '<leader>sr', search_replace_in_current_file, 'Search and Replace' }
    }
}
