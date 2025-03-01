return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/neotest-python'
    },
    opts = {
        adapters = {
            ['neotest-python'] = {
                runner = 'pytest',
                python = 'env/bin/python'
            }
        }
    }
}
