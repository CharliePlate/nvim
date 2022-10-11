local function requireGo()
	require("packages/languages/go")
end

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.go",
	command = "lua requireGo()",
})
