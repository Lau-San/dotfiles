-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local util = require("lazyvim.util")

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

map("i", "jj", "<ESC>")

map("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save file" })

map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })

map('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>')
map('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>')
map('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>')
map('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>')

