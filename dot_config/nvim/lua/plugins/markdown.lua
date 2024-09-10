local markdown = {
    'MeanderingProgrammer/markdown.nvim',
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

local markdown_preview = {
    'iamcco/markdown-preview.nvim',
    keys = {
        { '<leader>mp', ':MarkdownPreview<cr>', desc = 'markdown preview' }
    }
}

local outline = {
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
        { '<leader>mo', ':Outline<cr>', desc = 'toggle outline' }
    },
    config = function()
        require('outline').setup()
    end
}

local image = {
    {
        'vhyrro/luarocks.nvim',
        priority = 1001,
        opts = {
            rocks = { 'magick' }
        }
    },
    {
        '3rd/image.nvim',
        dependencies = { 'luarocks.nvim' },
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
}

local bullets = {
    'bullets-vim/bullets.vim'
}

local toc = {
    'hedyhli/markdown-toc.nvim',
    ft = 'markdown',
    opts = {
        top_list = {
            markers = '-',
            cycle_markers = false
        }
    },
    keys = {
        { '<leader>mt', ':Mtoc<cr>', desc = 'add/update toc' }
    }
}

return {
    markdown,
    markdown_preview,
    outline,
    unpack(image),
    bullets,
    toc,
}
