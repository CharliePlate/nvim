-- set up dap config for python

local dap = require("dap")

dap.adapters.python = {
	type = "executable",
	command = "debugpy",
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
	},
}
