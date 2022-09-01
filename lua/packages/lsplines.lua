local status_ok, lsplines = pcall(require, "lsp_lines")
if not status_ok then
	return
end

lsplines.setup()
vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
