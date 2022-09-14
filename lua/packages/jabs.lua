local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
	return
end

jabs.setup {
	border = "rounded",
	highlight = {
		current = "PmenuSel",
		split = "Pmenu"
	}
}
