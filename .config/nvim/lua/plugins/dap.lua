local dap = {
    'mfussenegger/nvim-dap',
    opts = {
        adapters = {
            godot = {
                type = 'server',
                host = '127.0.0.1',
                port = 6006
            }
        },
        configurations = {
            gdscript = {
                type = 'godot',
                request = 'launch',
                name = 'Launch scene',
                project = '${workspaceFolder}',
                launch_scene = true
            }
        }

    }
}

return {
    dap
}
