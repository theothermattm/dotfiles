-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("snacks.picker").explorer()
  end,
})
