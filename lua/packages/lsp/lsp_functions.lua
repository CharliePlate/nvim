local lsp_highlight_document = function(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local NON_NULL_LS_FORMAT = { "svelte" }

local format = function(bufnr, client)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		timeout_ms = 5000,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local format_on_save_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				format(bufnr)
			end,
		})
	end
end

local M = {
	lsp_highlight_document = lsp_highlight_document,
	format = format,
	format_on_save_attach = format_on_save_attach,
}

return M
