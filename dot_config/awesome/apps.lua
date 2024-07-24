local awful = require('awful')

local apps = {}

apps.terminal       = 'alacritty'
awful.util.shell    = 'dash'

local term_app_prefix = apps.terminal .. ' -e '

local function default(args)
    local cmd   = args.cmd
    local term  = args.term
    local class = args.class or cmd

    if term then
        if class then
            cmd = apps.terminal .. ' --class ' .. class .. ' -e ' .. cmd
        else
            cmd = apps.terminal .. ' -e ' .. cmd
        end
    end

    return cmd
end

-- PLACE YOUR DEFAULT APPS HERE --

apps.browser = default({
    cmd     = 'brave-browser'
})

apps.editor = default({
    cmd     = 'nvim',
    term    =  true
})

apps.file_manager = default({
    cmd     = 'nemo',
})

apps.system_monitor = default({
    cmd     = 'btop',
    term    = true,
    class   = 'Btop'
})

awful.util.terminal = apps.terminal
return apps
