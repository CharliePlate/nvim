local M = {
	normal = {
		["<C-s>"] = ":w<CR>",
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		["<C-Down>"] = ":resize -2<CR>",
		["<C-Up>"] = ":resize +2<CR>",
		["<C-Right>"] = ":vertical resize -2<CR>",
		["<C-Left>"] = ":vertical resize +2<CR>",
		["<M-k>"] = "<Esc>:m .-2<CR>==",
		["<M-j>"] = "<Esc>:m .+1<CR>==",
		["<S-l>"] = ":bnext<CR>",
		["<S-h>"] = ":bprevious<CR>",
	},
	insert = {
		["jk"] = "<C-o>a",
		["<C-j>"] = "<Nop>",
		["<C-k>"] = "<Nop>",
	},
	visual = {
		["<"] = "<gv",
		[">"] = ">gv",
		["<A-j>"] = ":m .+1<CR>==",
		["<A-k>"] = ":m .-2<CR>==",
		["p"] = '"_dP',
	},
	visual_block = {
		["<A-j>"] = ":move '>+1<CR>gv-gv",
		["<A-k>"] = ":move '<-2<CR>gv-gv",
	},
}

-- inverse of modeMap without a function
local modeMap = {
	normal = "n",
	insert = "i",
	visual = "v",
	visual_block = "x",
}

local function setKeymap(mode, key, value)
	local options = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(modeMap[mode], key, value, options)
end

for mode, keymap in pairs(M) do
	for key, value in pairs(keymap) do
		setKeymap(mode, key, value)
	end
end

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
