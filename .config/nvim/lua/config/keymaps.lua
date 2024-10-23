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
del('n', '<leader>fc')

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
del('n', '<leader>`')
del('n', '<leader>fb')

map('n', '<leader>bb', ':Telescope buffers<cr>', { desc = 'Find buffer' })
map("n", "<leader>bx", LazyVim.ui.bufremove, { desc = "Close Buffer" })
map("n", "<leader>bX", "<cmd>:bd<cr>", { desc = "Close Buffer and window" })

-------------
-- Windows --
-------------

del('n', '<leader>wd')

map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map('n', '<leader>wx', '<C-W>c', { desc = 'Close window' })

--------------------
-- Toggle options --
--------------------
-- LazyVim.toggle.map("<leader>tf", LazyVim.toggle.format())
-- LazyVim.toggle.map("<leader>tF", LazyVim.toggle.format(true))
-- LazyVim.toggle.map("<leader>ts", LazyVim.toggle("spell", { name = "Spellcheck" }))
-- LazyVim.toggle.map("<leader>tw", LazyVim.toggle("wrap", { name = "Wrap" }))
-- LazyVim.toggle.map("<leader>tl", LazyVim.toggle.number)
-- LazyVim.toggle.map("<leader>tL", LazyVim.toggle("relativenumber", { name = "Relative Number" }))
-- LazyVim.toggle.map("<leader>td", LazyVim.toggle.diagnostics)
-- LazyVim.toggle.map('<leader>tr', LazyVim.toggle.option('colorcolumn', {
--     name = 'Ruler',
--     values = {'', '80'}
-- }))

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

-- map("n", "<C-j>", "<cmd>ZellijNavigateDown<CR>")
-- map("n", "<C-k>", "<cmd>ZellijNavigateUp<CR>")
-- map("n", "<C-h>", "<cmd>ZellijNavigateLeft<CR>")
-- map("n", "<C-l>", "<cmd>ZellijNavigateRight<CR>")

-------------
-- Folding --
-------------
-- https://github.com/linkarzu/dotfiles-latest/blob/eb947433374a62378fdb6b1285971d27bf885322/neovim/neobean/lua/config/keymaps.lua

local function set_foldmethod_expr()
    if vim.fn.has('nvim-0.10') == 1 then
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
        vim.opt.foldtext = ''
    else
        vim.opt.foldmethod = 'indent'
        vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
    end
    vim.opt.foldlevel = 99
end

local function fold_headings_of_level(level)
    -- Move to the top of the file
    vim.cmd("normal! gg")
    -- Get the total number of lines
    local total_lines = vim.fn.line("$")
    for line = 1, total_lines do
        -- Get the content of the current line
        local line_content = vim.fn.getline(line)
        -- "^" -> Ensures the match is at the start of the line
        -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
        -- "%s" -> Matches any whitespace character after the "#" characters
        -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
        if line_content:match("^" .. string.rep("#", level) .. "%s") then
            -- Move the cursor to the current line
            vim.fn.cursor(line, 1)
            -- Fold the heading if it matches the level
            if vim.fn.foldclosed(line) == -1 then
                vim.cmd("normal! za")
            end
        end
    end
end

local function fold_markdown_headings(levels)
  set_foldmethod_expr()
  -- I save the view to know where to jump back after folding
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd("nohlsearch")
  -- Restore the view to jump to where I was
  vim.fn.winrestview(saved_view)
end

local function unfold_everything()
    vim.cmd('edit!')
    vim.cmd('normal! zR')
end

map('n', '<leader>mfu', unfold_everything, { desc = 'unfold all headings' })

map('n', '<leader>mf1', function()
    unfold_everything()
    fold_markdown_headings({ 6, 5, 4, 3, 2, 1 })
end, { desc = 'fold headings level 1 or above' })

map('n', '<leader>mf2', function()
    unfold_everything()
    fold_markdown_headings({ 6, 5, 4, 3, 2 })
end, { desc = 'fold headings level 2 or above' })

map('n', '<leader>mf3', function()
    unfold_everything()
    fold_markdown_headings({ 6, 5, 4, 3 })
end, { desc = 'fold headings level 3 or above' })

map('n', '<leader>mf4', function()
    unfold_everything()
    fold_markdown_headings({ 6, 5, 4 })
end, { desc = 'fold headings level 4 or above' })

------------
-- Others --
------------

del('n', '<leader>K')
