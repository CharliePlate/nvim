local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
	return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

lsp.preset("lsp-compe")

lsp.set_preferences({
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "",
		info = "",
	},
})

local servers = { "sumneko_lua", "jsonls" }

for _, v in ipairs(servers) do
	lsp.configure(v, require("packages.lsp.settings." .. v))
end

local f = require("packages.lsp.lsp_functions")

lsp.on_attach(function(client, bufnr)
	f.format_on_save_attach(client, bufnr)
	f.navic(client, bufnr)
	f.lsp_highlight_document(client)
end)

local cmp_config = lsp.defaults.cmp_config(require("packages.lsp.cmp"))
cmp.setup(cmp_config)

-- require("lspconfig").handlers["textDocument/hover"] = vim.lsp.with(lsp.defaults.hover, {
--     border = "rounded",
-- })
lsp.setup()
