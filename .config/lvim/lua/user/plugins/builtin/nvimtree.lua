lvim.builtin.nvimtree.setup = vim.tbl_deep_extend("force", lvim.builtin.nvimtree.setup, {
  view = {
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        git = false,
      },
    }
  }
})
