require("dap-vscode-js").setup({
	debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
})

local ports = {
	["Answers"] = 9230,
	["Public API"] = 9201,
	["Web API"] = 9229,
}

local typescript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		runtimeExecutable = "/Users/charlieplate/.yarn/bin/ts-node",
	},
}

local GRAPHITE_DIR = "/Users/charlieplate/Documents/work/graphite" .. ".*"

if string.match(vim.fn.getcwd(), GRAPHITE_DIR) then
	for name, port in pairs(ports) do
		table.insert(typescript, {
			type = "pwa-node",
			request = "attach",
			port = port,
			name = "Attach to " .. name,
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
			outFiles = { "${workspaceFolder}/dist/**/*.js" },
			webRoot = "${workspaceFolder}/src",
			remoteRoot = "${workspaceFolder}/src",
		})
	end
end

require("dap").configurations.typescript = typescript
