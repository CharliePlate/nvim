local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
	return
end

code_runner.setup({
	filetype = {
		python = "python3 -u",
		typescript = "ts-node-dev",
	},
})
