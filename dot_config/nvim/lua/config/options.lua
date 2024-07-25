-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = ""
opt.wrap = true
opt.breakindent = true
opt.breakindentopt = { "shift:4" }
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.background = 'dark'

vim.filetype.add({
    pattern = {
        ['.*/hypr/.*%.conf'] = "hyprlang",
        ['.*/hypr/.*%.conf%.templ'] = 'hyprlang'
    },
})
