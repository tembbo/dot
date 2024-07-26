return {
    "stevearc/oil.nvim",
    keys = {
        { "-", "<cmd>Oil --float<cr>" },
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
