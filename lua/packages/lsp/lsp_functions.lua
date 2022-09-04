local lsp_highlight_document = function(client)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

local navic = function(client, bufnr)
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	navic.attach(client, bufnr)
end

local format = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			local M = {
				tsserver = 'prettier',
				sumneko_lua = 'stylua',
				pylsp = 'black'
			}
			print('here')
			print(M[client['name']])
			return (M[client['name']])
		end,
		bufnr = bufnr,
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
	navic = navic,
	lsp_highlight_document = lsp_highlight_document,
	format = format,
	format_on_save_attach = format_on_save_attach,
}

return M
