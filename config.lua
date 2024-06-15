-- Fixing "vim.tbl_add_reverse_lookup is deprecated". (https://github.com/pmizio/typescript-tools.nvim/issues/266)
vim.tbl_add_reverse_lookup = function(tbl)
  for k, v in pairs(tbl) do
    tbl[v] = k
  end
end

-- General
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "retrobox"

-- Keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "json",
  "lua",
  "css",
  "elixir",
  "yaml",
}

-- Neo Tree
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.auto_reload_on_write = true
lvim.builtin.nvimtree.setup.view.adaptive_size = true
