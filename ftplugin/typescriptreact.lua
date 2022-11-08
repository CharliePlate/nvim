local status_ok, ts = pcall(require, "typescript")
if not status_ok then
	return
end

ts.setup({})

local ts_mappings = {
	L = {
		name = "Typescript",
		i = { "<cmd>TypescriptAddMissingImports<Cr>", "Import All" },
		o = { "<cmd>TypescriptOrganizeImports<Cr>", "Organize Imports" },
		u = { "<cmd>TypescriptRemoveUnused<Cr>", "Remove Unused" },
	},
}

local ok, whichkey = pcall(require, "which-key")
if not ok then
	return
end
whichkey.register(
	ts_mappings,
	{ mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, nowait = true }
)

vim.api.nvim_set_keymap("n", "gd", ":TypescriptGoToSourceDefinition<cr>", { noremap = true, silent = true })
