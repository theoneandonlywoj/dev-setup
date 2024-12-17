-- Show hidden files (source: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/353#discussioncomment-8094119)
return {
    "neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_gitignored = true,
          hide_dotfiles = false,
          never_show = { ".git" },
        },
      },
    },
  }