require("nvchad.configs.lspconfig").defaults()

-- jdtls is handled by nvim-jdtls in ftplugin/java.lua; do not enable it here
local servers = { "yamlls", "jsonls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 