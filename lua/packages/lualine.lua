local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local function getRelativePath()
	local path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relativePath = path:gsub(cwd, "")
	return relativePath
end

local function lsp_client_names()
	local clients = {}
	for _, client in pairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end

	return table.concat(clients, " ")
end

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { right = "", left = "" },
		disabled_filetypes = {
			statusline = { "NvimTree", "vista", "dbui", "packer" },
			winbar = {
				"NvimTree",
				"vista",
				"dbui",
				"packer",
				"dap-repl",
				"DAP Scopes",
				"DAP Breakpoints",
				"DAP Stacks",
				"DAP Watches",
			},
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
		lualine_b = { show_macro_recording },
		lualine_c = { getRelativePath },
		lualine_x = { "branch", "diff", "diagnostics" },
		lualine_y = { "progress" },
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = { require("nvim-navic").get_location, condition = require("nvim-navic").is_active },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { lsp_client_names },
		lualine_z = {},
	},
	inactive_winbar = {},
	extensions = {},
})

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		lualine.refresh({
			place = { "statusline" },
		})
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		local timer = vim.loop.new_timer()
		timer:start(
			50,
			0,
			vim.schedule_wrap(function()
				lualine.refresh({
					place = { "statusline" },
				})
			end)
		)
	end,
})
