require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "l", action = "edit" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

