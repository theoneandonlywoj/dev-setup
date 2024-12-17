return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- Source: https://vineeth.io/posts/neovim-setup
        build = ":TSUpdate",
        opts = {
          ensure_installed = {
            "bash",
            "elixir",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "query",
            "regex",
            "vim",
            "yaml",
          },
        },
      },
}