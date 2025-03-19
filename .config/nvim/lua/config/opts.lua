-- NOTE: A lot of these are taken from LazyVim, since I liked a lot of 

local g = vim.g
local o = vim.opt

g.mapleader = ' '
g.maplocalleader = '\\'

g.autoformat = true

o.autowrite = true
o.completeopt = 'menu,menuone,noselect'
o.conceallevel = 2
o.confirm = true
o.cursorline = true
o.expandtab = true
o.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
o.formatexpr = 'v:vim.lsp.formatexpr({ timeout = 3000 })'
o.formatoptions = 'jcrqlnt'

o.grepformat = '%f:%l:%c:%m'
o.grepprg = 'rg --vimgrep'
o.ignorecase = true
o.inccommand = 'nosplit'
o.jumpoptions = 'view'
o.laststatus = 3
o.linebreak = true
o.list = true
o.number = true
o.relativenumber = true
o.pumblend = 10
o.pumheight = 10
o.ruler = false
o.scrolloff = 16
o.sidescrolloff = 4
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
o.shiftround = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.showmode = false
o.shortmess:append({ W = true, I = true, c = true, C = true })
o.signcolumn = 'yes'
o.smartcase = true
o.smartindent = true
o.spelllang = { 'eng' }
o.splitbelow = true
o.splitright = true
o.splitkeep = 'screen'
o.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
o.termguicolors = true
o.timeoutlen = 600
o.undofile = true
o.undolevels = 10000
o.updatetime = 200
o.virtualedit = 'block'
o.wildmode = 'longest:full,full'
o.winminwidth = 5
o.wrap = true
o.smoothscroll = true
