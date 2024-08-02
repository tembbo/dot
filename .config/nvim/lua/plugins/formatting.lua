return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>p",
            function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
        },
    },
    opts = {
        formatters_by_ft = {
            css = { "prettier" },
            go = { "gofumpt" },
            html = { "prettier" },
            javascript = { "biome" },
            json = { "biome" },
            lua = { "stylua" },
            python = { "ruff" },
            svelte = { "prettier" },
            toml = { "taplo" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
