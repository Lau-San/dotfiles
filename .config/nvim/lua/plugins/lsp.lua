return {
    'neovim/nvim-lspconfig',
    opts = {
        ---@type lspconfig.options
        servers = {
            gdscript = {
                name = 'godot',
                cmd = vim.lsp.rpc.connect('127.0.0.1', 6005)
            },
            emmet_language_server = {
                filetypes = {
                    'jinja.html'
                }
            }
        }
    }
}
