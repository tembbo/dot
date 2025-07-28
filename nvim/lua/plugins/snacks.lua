return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        dashboard = { enabled = true },
        explorer = { enabled = true },
    },
    keys = {
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
        },
    },
}
