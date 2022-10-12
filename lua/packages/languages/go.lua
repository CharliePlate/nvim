local status_ok, go = pcall(require, "gopher")
if not status_ok then
	return
end

local ok, dapgo = pcall(require, "dap-go")
if not ok then
	return
end

dapgo.setup()

go.setup({
	commands = {
		go = "go",
		gomodifytags = "gomodifytags",
		gotests = "~/go/bin/gotests", -- also you can set custom command path
		impl = "impl",
		iferr = "iferr",
	},
})

vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.go", command = "lua goDebugBindings()" })

_G.goDebugBindings = function()
	local ok, whichkey = pcall(require, "which-key")
	if not ok then
		return
	end

	local go_opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local go_mappings = {
		L = {
			name = "Go",
			i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
			t = { "<cmd>GoMod tidy<cr>", "Tidy" },
			a = { "<cmd>GoTestAdd<Cr>", "Add Test" },
			A = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
			E = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
			g = { "<cmd>GoGenerate<Cr>", "Go Generate" },
			f = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
			e = { "<cmd>GoIfErr<cr>", "Go If Err" },
			c = { "<cmd>GoCmt<Cr>", "Generate Comment" },
		},
	}
	whichkey.register(go_mappings, go_opts)
end
