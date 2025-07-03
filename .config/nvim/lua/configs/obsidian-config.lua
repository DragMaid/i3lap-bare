require('obsidian').setup({
    workspaces = {
        {
        name = "personal",
        path = "~/Docs/obsidian/JCU-vault",
        },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",

    disable_frontmatter = true,
    templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
    },
    note_id_func = function(title)
        return tostring(os.date("%Y-%m-%d")) .. "_" .. title
    end,
    mappings = {
        ["gf"] = {
            action = function()
            return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
    },
    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
})
