-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local l = vim.opt_local
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
  pattern = "*",
  callback = function()
    l.formatoptions = "jq"
  end,
})

-- Disable autoformat for lua files
autocmd({ "FileType" }, {
  pattern = { "lua", "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

 autocmd({ 'Filetype' }, {
     pattern = { 'markdown' },
     callback = function()
        vim.opt_local.breakindentopt = {'shift:0'}
        -- vim.opt_local.textwidth = 80
        vim.opt_local.spell = false
        vim.g.autoformat = false
        vim.opt_local.wrap = false
     end
 })
