return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {
            ui = {
                border = "rounded",
                backdrop = 100,
                height = 0.8,
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                automatic_installation = true,
            },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            local servers = {
                "cssls",
                "lua_ls",
                "ruff",
                "rust_analyzer",
                "svelte",
                "tailwindcss",
                "ts_ls",
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

            local signs = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " ",
            }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { texthl = hl, text = icon, numhl = "" })
            end

            vim.keymap.set("n", "A", vim.lsp.buf.code_action)
            vim.keymap.set("n", "D", vim.lsp.buf.definition)
            vim.keymap.set("n", "R", vim.lsp.buf.references)
            vim.keymap.set("n", "H", vim.lsp.buf.hover)
        end,
    },
}
