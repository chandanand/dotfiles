return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    ---@class CatppuccinOptions
    opts = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      return {
        flavour = 'mocha',
        transparent_background = true,
        color_overrides = { all = colors },
        custom_highlights = function(colors)
          return {
            CurSearch = { bg = colors.yellow },
            Diffchanged = { fg = colors.yellow },
            DiffChanged = { fg = colors.yellow },
          }
        end,
        integrations = {
          cmp = true,
          fidget = true,
          gitsigns = true,
          mason = true,
          noice = true,
          notify = true,
          telescope = {
            enabled = true,
          },
          treesitter = true,
          treesitter_context = false,
          symbols_outline = true,
          which_key = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
          },
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
