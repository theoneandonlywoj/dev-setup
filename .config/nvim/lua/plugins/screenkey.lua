return {
  "NStefan002/screenkey.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("screenkey").setup({
      compress_after = 5,
      clear_after = 5,
      show_leader = true,
      group_mappings = true,
    })
  end,
}
