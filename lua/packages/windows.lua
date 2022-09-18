local status_ok, windows = pcall(require, "windows")
if not status_ok then
	return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10

windows.setup({
	autowidth = {
		enable = false,
		winwidth = 5,
		filetype = {
			help = 2,
		},
	},
	ignore = {
		buftype = { "quickfix" },
		filetype = { "NvimTree", "neo-tree", "undotree", "NeogitStatus" },
	},
	animation = {
		enable = true,
		duration = 300,
		fps = 60,
		easing = "in_out_sine",
	},
})
