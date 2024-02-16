require("nvim-tree").setup {
    git = {
        enable = false,
    },
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
