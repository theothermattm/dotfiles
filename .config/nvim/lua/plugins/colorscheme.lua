return {
  -- add gruvbox
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-day",
    },
  },
}
