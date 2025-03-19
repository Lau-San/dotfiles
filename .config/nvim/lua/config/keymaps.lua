local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('i', 'jj', '<Esc>')

-- Better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Down', expr = true, silent = true })

-- Move lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move up' })
map('i', '<A-j>', "<esc><cmd>m .+1<cr>==gi", { desc = 'Move down' })
map('i', '<A-k>', "<esc><cmd>m .-2<cr>==gi", { desc = 'Move up' })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Save file
map('n', '<leader>fs', '<cmd>w<cr>', { desc = 'Save file' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Quickfix list
-- map('n', '<leader>xq', function()
--     local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
--     if not success and err then
--         vim.notify(err, vin.log.levels.ERROR)
--     end
-- end, { desc = 'Quickfix List' })

-- Bufferse
map('n', '<leader>bX', '<cmd>bd<cr>', { desc = 'Close Buffer and Window' })

-- Quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit' })

-- Windows
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wx', '<C-W>c', { desc = 'Close window', remap = true })
