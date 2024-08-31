-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  ---@diagnostic disable-next-line: undefined-field
  local keys = require("lazy.core.handler").handlers.keys

  ---@diagnostic disable-next-line: undefined-field
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local del = vim.keymap.del

------------
-- Insert --
------------

map("i", "jj", "<ESC>")

----------
-- Lazy --
----------

del('n', '<leader>l')
del('n', '<leader>L')

map("n", "<leader>ll", ":Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>le", ":LazyExtras<cr>", { desc = "LazyExtras" })
map("n", "<leader>lc", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-----------
-- Files --
-----------

del('n', '<leader>fF')

map("n", "<leader>fs", ":w<cr>", { desc = "Save file" })

-------------
-- Buffers --
-------------

del('n', '<leader>,')
del('n', '<leader>bb')
del('n', '<leader>bd')
del('n', '<leader>bD')

map('n', '<leader>bb', ':Telescope buffers<cr>', { desc = 'Find buffer' })
map("n", "<leader>bx", LazyVim.ui.bufremove, { desc = "Close Buffer" })
map("n", "<leader>bX", "<cmd>:bd<cr>", { desc = "Close Buffer and window" })

-------------
-- Windows --
-------------

map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map('n', '<leader>wx', '<C-W>c', { desc = 'Close window' })

--------------------
-- Toggle options --
--------------------

LazyVim.toggle.map("<leader>tf", LazyVim.toggle.format())
LazyVim.toggle.map("<leader>tF", LazyVim.toggle.format(true))
LazyVim.toggle.map("<leader>ts", LazyVim.toggle("spell", { name = "Spellcheck" }))
LazyVim.toggle.map("<leader>tw", LazyVim.toggle("wrap", { name = "Wrap" }))
LazyVim.toggle.map("<leader>tl", LazyVim.toggle.number)
LazyVim.toggle.map("<leader>tL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
LazyVim.toggle.map("<leader>td", LazyVim.toggle.diagnostics)

--------------
-- Terminal --
--------------

del('n', '<leader>ft')
del('n', '<leader>fT')

local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end

map("n", "<leader>Tt", lazyterm, { desc = "Terminal (Root Dir" })
map("n", "<leader>TT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })

----------
-- Tmux --
----------

map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
