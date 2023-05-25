local lsp_functions = require("packages.lsp.lsp_functions")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

require("lsp-inlayhints").setup()

local f = require("packages.lsp.lsp_functions")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	f.format_on_save_attach(client, bufnr)
	f.lsp_highlight_document(client)
	require("lsp-inlayhints").on_attach(client, bufnr)
end

local lsp_flags = {
	debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local buildConfig = function(serverName, options)
	local server_config = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		flags = lsp_flags,
		handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				silent = true,
				border = "rounded",
			}),
		},
		capabilities = capabilities,
	}, options or {})

	require("lspconfig")[serverName].setup(server_config)
end

-- set up servers
buildConfig("jsonls", require("packages.lsp.settings.jsonls"))
buildConfig("lua_ls", require("packages.lsp.settings.lua_ls"))
buildConfig("svelte")
buildConfig("gopls")
buildConfig("cssls", require("packages.lsp.settings.cssls"))
buildConfig("html")

buildConfig("tailwindcss", require("packages.lsp.settings.tailwindcss"))
-- buildConfig("tsserver", require("packages.lsp.settings.tsserver"))
buildConfig("pylsp")

require("lspconfig.configs").vtsls = require("vtsls").lspconfig
buildConfig("vtsls", require("packages.lsp.settings.vtsls"))
buildConfig("vuels")
buildConfig("prismals")

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

cmp_nvim_lsp.default_capabilities()
