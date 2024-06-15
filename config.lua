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
