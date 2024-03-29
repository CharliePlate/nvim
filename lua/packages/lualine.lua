local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local function getRelativePath()
	local path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local relativePath = vim.fn.fnamemodify(path, ":~:.:h")
	local relativeCwd = vim.fn.fnamemodify(cwd, ":~:.:h")
	local getPath = string.gsub(relativePath, relativeCwd, "")
	return getPath
end

local function lsp_client_names()
	local clients = {}
	for _, client in pairs(vim.lsp.get_active_clients()) do
		if client.name ~= "null-ls" and client.name ~= "copilot" then
			table.insert(clients, client.name)
		end
	end
	return table.concat(clients, " ")
end

local function icons()
	local icons_table = {
		["copilot"] = " ",
		["null-ls"] = "",
	}

	local icons_order = { "copilot", "null-ls" }

	local icon = {}
	for _, client in pairs(vim.lsp.get_active_clients()) do
		if icons_table[client.name] then
			table.insert(icon, icons_table[client.name])
		end
	end

	local str = ""
	for _, icon_name in ipairs(icons_order) do
		if icons_table[icon_name] then
			str = str .. icons_table[icon_name]
		end
	end

	return str
end

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

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
		if timer == nil then
			return
		end
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
		lualine_y = { icons },
		lualine_z = { lsp_client_names },
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
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
