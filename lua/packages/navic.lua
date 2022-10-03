local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
	return
end

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, fg = "#FF9E3B" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, fg = "#7FB4CA" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, fg = "#A3D4D5" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, fg = "#FF9E3B" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, fg = "#FF9E3B" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, fg = "#76946A" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, fg = "#A3D4D5" })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, fg = "#FFA066" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, fg = "#E46876" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, fg = "#D27E99" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, fg = "#E6C384" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, fg = "#7E9CD8" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, fg = "#D27E99" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, fg = "#7AA89F" })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, fg = "#98BB6C" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, fg = "#D27E99" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, fg = "#FFA066" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, fg = "#DCA561" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, fg = "#C34043" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, fg = "#43242B" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, fg = "#DCA561" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, fg = "#54546D" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, fg = "#7FB4CA" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, fg = "#E46876" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, fg = "#FFA066" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, fg = "#7AA89F" })
vim.api.nvim_set_hl(0, "NavicText", { default = true, fg = "#C8C093" })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#C8C093" })

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = "◩ ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = "ﳠ ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	highlight = true,
	separator = " " .. require("packages.icons").ui.ChevronRight .. " ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})

-- vim.o.winbar = "   %{%v:lua.require'nvim-navic'.get_location()%}"
