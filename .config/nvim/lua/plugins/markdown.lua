local markdown = {
    'MeanderingProgrammer/markdown.nvim',
    ft = 'markdown',
    opts = {
        latex = { enabled = false },
        win_options = {
            conceallevel = { rendered = 2 }
        },
        heading = {
            position = 'overlay',
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            width = 'full',
            left_pad = 1,
            right_pad = 2,
            -- min_width = 80,
            border = false,
            backgrounds = {
                'RenderMarkdownH2BG',
                'RenderMarkdownH2BG',
                'RenderMarkdownH2BG',
                'RenderMarkdownH2BG',
                'RenderMarkdownH2BG',
                'RenderMarkdownH2BG'
            }
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
            unchecked = { icon = ' ', highlight = 'DiagnosticUnnecessary' },
            checked = { icon = ' ' },
            custom = {
                todo = { raw = '[-]', rendered = ' ', highlight = 'DiagnosticUnnecessary' },
                incomplete = { raw = '[/]', rendered = ' ', highlight = '@markup.list.markdown' },
                migrated = { raw = '[>]', rendered = ' ', highlight = 'DiagnosticInfo' },
                pinned = { raw = '[*]', rendered = ' ', highlight = 'DiagnosticOk' },
                must = { raw = '[M]', rendered = ' ', highlight = 'DiagnosticError' },
                should = { raw = '[S]', rendered = ' ', highlight = 'DiagnosticWarn' },
                could = { raw = '[C]', rendered = ' ', highlight = 'DiagnosticInfo' },
            }
        },
        callout = {
            note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
            definition = { raw = '[!DEF]', rendered = '󰧑 Definition', highlight = 'RenderMarkdownInfo' },
            tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownHint' },
            important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
            warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownError' },
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

-- local markdown_preview = {
--     'iamcco/markdown-preview.nvim',
--     keys = {
--         { '<leader>mp', ':MarkdownPreviewToggle<cr>', desc = 'markdown preview' }
--     }
-- }

local image = {
    '3rd/image.nvim',
    dependencies = { 'kiyoon/magick.nvim' },
    ft = 'markdown',
    opts = {
        backend = 'kitty',
        kitty_method = 'normal',
        integrations = {
            markdown = {
                enabled = true,
                filetypes = { 'markdown', 'vimwiki' },
                only_render_image_at_cursor = true,
                download_remote_images = true,
                clear_in_insert_mode = true
            }
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
        editor_only_render_when_focused = false,
        hijack_file_patterns = {
            '*.png',
            '*.jpg',
            '*.jpeg',
        }
    }
}

local bullets = {
    'bullets-vim/bullets.vim',
    ft = 'markdown',
}

local toc = {
    'hedyhli/markdown-toc.nvim',
    ft = 'markdown',
    opts = {
        toc_list = {
            markers = '-',
            cycle_markers = false,
            indent_size = 4
        }
    },
    keys = {
        { '<leader>mt', ':Mtoc<cr>', desc = 'add/update toc', ft = 'markdown' }
    }
}

return {
    markdown,
    -- markdown_preview,
    image,
    bullets,
    toc,
}
