require("neodev").setup({})
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "jsonls", "gopls", "tailwindcss", "svelte", "lua_ls" },
})
require("packages.lsp.lspconfig")
require("packages.lsp.null-ls")
require("packages.lsp.cmp")
