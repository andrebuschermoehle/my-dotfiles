return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    open_mapping = [[<c-+>]],
    config = function()
        local term = require("toggleterm")
        term.setup({})

        vim.keymap.set({'n', 't'}, '<C-n>', function()
            term.toggle(1, 30, vim.loop.cwd(), "horizontal", "Terminal name")
        end)
    end
}


