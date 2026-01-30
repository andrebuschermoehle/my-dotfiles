return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local config = require('nvim-treesitter.configs')
        config.setup({
            ensure_installed = { 'lua', 'vim', 'javascript', 'typescript', 'vue', 'cpp', 'cmake', 'scss', 'css', 'sql', 'json', 'html' },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
