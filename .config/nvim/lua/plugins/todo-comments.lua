return {
    'folke/todo-comments.nvim',
    event = require('util').lazy_file_events,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
        { '<leader>t', '<cmd>TodoQuickFix keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' }
    }
}
