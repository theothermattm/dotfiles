return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- explorer things here
    },
    picker = {
      sort = {
        fields = { "modified" },
      },
      cwd = true,
      hidden = false,
      ignored = true,
      exclude = { ".DS_Store" },
      sources = {
        files = {
          hidden = true,
          files = { matcher = { frecency = true } },
          buffers = { matcher = { frecency = true } },
        },
      },
    },
  },
}
