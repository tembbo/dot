return {
    "stevearc/oil.nvim",
    keys = {
        { "-", function() require("oil").toggle_float() end },
    },
    opts = {
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
        },
        float = {
            padding = 4,
        },
    },
}
