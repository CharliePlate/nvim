local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

local ok, dap = pcall(require, "dap")
if not ok then
	return
end

dapui.setup({
	expand_lines = true,
	icons = { expanded = "", collapsed = "", circular = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.60 },
				{ id = "repl", size = 0.40 },
			},
			size = 0.30,
			position = "bottom",
		},
	},
	floating = {
		max_height = 0.9,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be 'single', 'double' or 'rounded'
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 1, -- Can be integer or nil.
	},
})

local icons = require("packages.icons")

local M = {
	breakpoint = {
		text = icons.ui.Bug,
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	breakpoint_rejected = {
		text = icons.ui.Bug,
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = icons.ui.BoldArrowRight,
		texthl = "DiagnosticSignWarn",
		linehl = "Visual",
		numhl = "DiagnosticSignWarn",
	},
}

vim.fn.sign_define("DapBreakpoint", M.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", M.breakpoint_rejected)
vim.fn.sign_define("DapStopped", M.stopped)

require("dap-vscode-js").setup({
	debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

local ports = {
	answers = 9230,
	["web-api"] = 9229,
	["public-api"] = 9201,
}

require("dap").configurations.typescript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${workspaceFolder}/${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		runtimeExecutable = "/Users/charlieplate/.yarn/bin/ts-node",
	},
	{
		type = "pwa-node",
		request = "attach",
		port = ports.answers,
		name = "Attach to Answers",
		skipFiles = { "<node_internals>/**" },
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		webRoot = "${workspaceFolder}/src",
		remoteRoot = "${workspaceFolder}/src",
	},
	{
		type = "pwa-node",
		request = "attach",
		port = ports["public-api"],
		name = "Attach to Public API",
		skipFiles = { "<node_internals>/**" },
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		webRoot = "${workspaceFolder}/src",
		remoteRoot = "${workspaceFolder}/src",
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
