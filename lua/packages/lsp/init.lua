local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("packages.lsp.lsp-installer")
require("packages.lsp.handlers").setup()
require("packages.lsp.null-ls")
