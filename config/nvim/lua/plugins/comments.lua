return {
  {
    'numToStr/Comment.nvim',
    -- 🧠 💪 // Smart and powerful comment plugin for neovim.
    -- Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    opts = {},
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
