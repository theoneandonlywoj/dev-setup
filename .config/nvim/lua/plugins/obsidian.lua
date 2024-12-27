return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim"
    },
    keys = {
        {"<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n"},
        {"<leader>oft", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New Obsidian note from template", mode = "n"},
        {"<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n"},
        {"<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n"},
        {"<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n"},
        {"<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n"},
        {"<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste imate from clipboard under cursor", mode = "n"}
    },
    opts = {
        workspaces = {
            {
                name = "Second Brain",
                path = "$HOME/Second-Brain"
            }
        },
        -- Optional, if you keep notes in a specific subdirectory of your vault.
        notes_subdir = "1.Notes",
        -- Optional, customize how note file names are generated given the ID, target directory, and title.
        ---@param spec { id: string, dir: obsidian.Path, title: string|? }
        ---@return string|obsidian.Path The full path to the new note.
        note_path_func = function(spec)
            -- This is equivalent to the default behavior.
            local path = spec.dir / tostring(spec.title)
            return path:with_suffix(".md")
        end,
        -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
        -- levels defined by "vim.log.levels.*".
        log_level = vim.log.levels.INFO,
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "3.DailyNotes",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y-%m-%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            -- Optional, default tags to add to each new daily note created.
            default_tags = {"daily-notes"},
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil
        },
        -- Optional, for templates (see below).
        templates = {
            folder = "2.Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {}
        },
        -- https://github.com/nvim-tree/nvim-tree.lua/issues/925#issuecomment-1475085321
        update_focused_file = { enable = true, update_cwd = true, --[[ ignore_list = { "/node_modules" }, ]] },
    }
}