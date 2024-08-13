return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            ui = {
                border = "rounded",
                height = 0.8,
                icons = {
                    package_installed = "󰄬",
                    package_pending = "󰁔",
                    package_uninstalled = "󰅖",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    automatic_installation = true,
                })
            end,
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            local servers = {
                "gopls",
                "lua_ls",
                "ruff_lsp",
                "rust_analyzer",
                "svelte",
                "tailwindcss",
                "tsserver",
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

            vim.keymap.set("n", "A", vim.lsp.buf.code_action)
            vim.keymap.set("n", "D", vim.lsp.buf.definition)
            vim.keymap.set("n", "R", vim.lsp.buf.references)
            vim.keymap.set("n", "H", vim.lsp.buf.hover)
        end,
    },
}
