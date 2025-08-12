return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    ft = { "markdown" }, -- Apply this configuration only for markdown filetypes
    opts = function(_, opts)
      opts.sources = {} -- Disable all completion sources for markdown
    end,
  },
}
