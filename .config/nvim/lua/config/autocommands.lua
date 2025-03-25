-- Some of these are taken from LazyVim

local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('ls_' .. name, { clear = true })
end

local l = vim.opt_local

autocmd({ 'FileType' }, {
    pattern = '*',
    callback = function()
        l.formatoptions = 'jcqlnt'
    end
})

-- Check if we need to reload the file when it changed
autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('checktime'),
    callback = function()
        if vim.o.buftype ~= 'nofile' then
            vim.cmd('checktime')
        end
    end
})

-- Highlight when yanking text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup 'highlight-yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Risize splits if window got resized
autocmd({ 'VimResized' }, {
    group = augroup('resize-splits'),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end
})

autocmd({ 'BufReadPost' }, {
    group = augroup('last-loc'),
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].ls_last_loc then
            return
        end
        vim.b[buf].ls_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

-- Close some filetypes with 'q'
autocmd('FileType', {
    group = augroup('close-with-q'),
    pattern = {
        'help',
        'qf',
        'checkhealth',
        'grug-far',
        'lspinfo',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set('n', 'q', function()
                vim.cmd('close')
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, { buffer = event.buf, silent = true, desc = 'Quit buffer' })
        end)
    end
})

-- LSP integrated renaming with Snacks
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

local buffers_with_emmet = {}

autocmd({ 'Filetype' }, {
    -- pattern = 'css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,typescriptreact',
    group = augroup('attach-emmet'),
    pattern = 'jinja.html',
    callback = function(e)
        if not vim.list_contains(buffers_with_emmet, e.buf) then
            buffers_with_emmet[#buffers_with_emmet+1] = e.buf
            vim.lsp.start({
                cmd = { "emmet-language-server", "--stdio" },
                root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
                -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
                -- **Note:** only the options listed in the table are supported.
                init_options = {
                    ---@type table<string, string>
                    includeLanguages = {},
                    --- @type string[]
                    excludeLanguages = {},
                    --- @type string[]
                    extensionsPath = {},
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
                    preferences = {},
                    --- @type boolean Defaults to `true`
                    showAbbreviationSuggestions = true,
                    --- @type "always" | "never" Defaults to `"always"`
                    showExpandedAbbreviation = "always",
                    --- @type boolean Defaults to `false`
                    showSuggestionsAsSnippets = false,
                    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
                    syntaxProfiles = {},
                    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
                    variables = {},
                },
            })
        end
    end,
})

autocmd('LspDetach', {
    pattern = 'jinja.html',
    callback = function(e)
        for key, buf in pairs(buffers_with_emmet) do
            if buf == e.buf then
                table.remove(buffers_with_emmet, key)
                break
            end
        end
    end
})
