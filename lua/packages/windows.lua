local status_ok, windows = pcall(require, "windows")
if not status_ok then
	return
end

vim.o.winwidth = 15
vim.o.winminwidth = 5
vim.o.equalalways = false

windows.setup({
	autowidth = {
		enable = true,
		winwidth = 5,
		filetype = {
			help = 2,
		},
	},
	ignore = {
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
	},
	animation = {
		enable = true,
		duration = 300,
		fps = 60,
		easing = "in_out_sine",
	},
})
