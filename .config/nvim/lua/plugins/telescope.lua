return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        keys = {
            { "<leader>f", "<cmd>Telescope find_files<cr>" },
            { "<leader>g", "<cmd>Telescope live_grep<cr>" },
        },
    },
}
