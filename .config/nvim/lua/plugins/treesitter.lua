-- return {
--     {
--         "nvim-treesitter/nvim-treesitter",
--         -- Source: https://vineeth.io/posts/neovim-setup
--         build = ":TSUpdate",
--         opts = {
--           ensure_installed = {
--             "bash",
--             "elixir",
--             "html",
--             "javascript",
--             "json",
--             "lua",
--             "markdown",
--             "markdown_inline",
--             "query",
--             "regex",
--             "vim",
--             "yaml",
--           },
--         },
--       },
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(
      opts.ensure_installed,
      { "elixir", "heex", "eex", "html", "json", "lua", "markdown", "query", "yaml" }
    )
    vim.treesitter.language.register("markdown", "livebook")
  end,
}

