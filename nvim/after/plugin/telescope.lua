local builtin = require('telescope.builtin')

require('telescope').setup{
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
}

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tt', builtin.treesitter, {})
