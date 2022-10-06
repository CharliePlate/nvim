local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local function get_filetype()
	local ft = vim.bo.filetype
	return ft + " IDE"
end

local function lsp_client_names()
	local clients = {}

	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end

	return table.concat(clients, " "), " "
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "kanagawa",
		component_separators = { left = "", right = "" },
		section_separators = { right = "", left = "" },
		disabled_filetypes = {
			statusline = { "NvimTree", "vista", "dbui", "packer" },
			winbar = { "NvimTree", "vista", "dbui", "packer" },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,

		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "" },
		lualine_x = { "branch", "diff", "diagnostics" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = { require("nvim-navic").get_location },
		lualine_y = { lsp_client_names },
	},
	inactive_winbar = {},
	extensions = {},
})
