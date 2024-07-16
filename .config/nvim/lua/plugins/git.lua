return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
        require("gitsigns").setup()

        vim.keymap.set("n", "<leader>h", ":Gitsigns preview_hunk<CR>", {})
    end,
}
