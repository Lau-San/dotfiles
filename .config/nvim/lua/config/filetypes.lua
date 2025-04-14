vim.filetype.add({
    pattern = {
        ['.*/hypr/.*%.conf'] = "hyprlang",
        -- ['.*%.njk'] = 'jinja.html'
        -- ['.*/hypr/.*%.conf%.tmpl'] = 'hyprlang'
    },
})
