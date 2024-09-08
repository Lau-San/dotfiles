local markdown = {
    'MeanderingProgrammer/markdown.nvim',
    opts = {
        heading = {
            position = 'inline',
            icons = { '󰎤', '󰎧', '󰎪', '󰎭', '󰎱', '󰎳' },
            width = 'full',
            left_pad = 1,
            right_pad = 4,
            min_width = 80,
            border = true
        },
        code = {
            -- position = 'right'
            width = 'block',
            min_width = 80,
            left_pad = 2
        },
        bullet = {
            right_pad = 2
        },
        checkbox = {
            unchecked = { icon = ' ' },
            checked = { icon = ' ' },
            custom = {
                incomplete = { raw = '[/]', rendered = ' ', highlight = 'DiagnosticWarn' },
                migrated = { raw = '[>]', rendered = ' ', highlight = 'DiagnosticInfo' },
                cancelled = { raw = '[-]', rendered = ' ', highlight = 'DiagnosticUnnecessary' },
            }
        },
        callout = {
            note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
            tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
            important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
            warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
            attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
            caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
            abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
            todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
            success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
            question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
            failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
            danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
            bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
            example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
            quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
        }
    }
}

local markdown_preview = {
    -- Install markdown preview, use npx if available.
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && npm install',
    -- build = function(plugin)
    --     if vim.fn.executable 'npx' then
    --         vim.cmd("!cd " .. plugin.dir .. ' && cd app && npx --yes yarn install')
    --     else
    --         vim.cmd [[Lazy load markdown-preview.nvim]]
    --         vim.fn['mkdp#util#install']()
    --     end
    -- end,
    init = function()
        if vim.fn.executable 'npx' then vim.g.mkdp_filetypes = { 'markdown' } end
    end,
}

return {
    markdown,
    -- markdown_preview
}
