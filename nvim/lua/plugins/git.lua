return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>h", "<cmd>Gitsigns preview_hunk<cr>" },
    },
    opts = {},
}
