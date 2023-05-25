local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"css",
				"vue",
				"svelte",
				"json",
				"jsonc",
			},
			extra_args = {
				"--trailing-comma",
				"all",
				"--print-width",
				"120",
				"--bracket-spacing",
				"false",
				"--html-whitespace-sensitivity",
				"ignore",
			},
			command = "/Users/charlieplate/.yarn/bin/prettier",
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.gofmt,
		formatting.xmlformat,
	},
})
