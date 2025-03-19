local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        { import = 'plugins' }
    },
    checker = { enabled = true },
    install = {
        colorscheme = { 'tokyonight' }
    }
})

-- LazyFile
local lazy_file_events = { 'BufReadPost', 'BufNewFile', 'BufWritePre' }
local Event = require('lazy.core.handler.event')
Event.mappings.LazyFile = { id = 'LazyFile', event = lazy_file_events }
Event.mappings['User LazyFile'] = Event.mappings.LazyFile
