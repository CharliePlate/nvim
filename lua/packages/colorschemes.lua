local colors = require("kanagawa.colors").setup()

local overrides = {
	Hlargs = vim.tbl_extend("force", { fg = "#EA8181" }, { italic = true }),
	FloatBorder = { fg = "#7E9CD8", bg = colors.bg },
	Pmenu = { fg = "#223249", bg = colors.bg },
	NavicIconsFile = { fg = "#FF9E3B", bg = "#2A2A37" },
	NavicIconsModule = { fg = "#7FB4CA", bg = "#2A2A37" },
	NavicIconsNamespace = { fg = "#A3D4D5", bg = "#2A2A37" },
	NavicIconsPackage = { fg = "#FF9E3B", bg = "#2A2A37" },
	NavicIconsClass = { fg = "#FF9E3B", bg = "#2A2A37" },
	NavicIconsMethod = { fg = "#76946A", bg = "#2A2A37" },
	NavicIconsProperty = { fg = "#A3D4D5", bg = "#2A2A37" },
	NavicIconsField = { fg = "#FFA066", bg = "#2A2A37" },
	NavicIconsConstructor = { fg = "#E46876", bg = "#2A2A37" },
	NavicIconsEnum = { fg = "#D27E99", bg = "#2A2A37" },
	NavicIconsInterface = { fg = "#E6C384", bg = "#2A2A37" },
	NavicIconsFunction = { fg = "#7E9CD8", bg = "#2A2A37" },
	NavicIconsVariable = { fg = "#D27E99", bg = "#2A2A37" },
	NavicIconsConstant = { fg = "#7AA89F", bg = "#2A2A37" },
	NavicIconsString = { fg = "#98BB6C", bg = "#2A2A37" },
	NavicIconsNumber = { fg = "#D27E99", bg = "#2A2A37" },
	NavicIconsBoolean = { fg = "#FFA066", bg = "#2A2A37" },
	NavicIconsArray = { fg = "#DCA561", bg = "#2A2A37" },
	NavicIconsObject = { fg = "#C34043", bg = "#2A2A37" },
	NavicIconsKey = { fg = "#43242B", bg = "#2A2A37" },
	NavicIconsNull = { fg = "#DCA561", bg = "#2A2A37" },
	NavicIconsEnumMember = { fg = "#54546D", bg = "#2A2A37" },
	NavicIconsStruct = { fg = "#7FB4CA", bg = "#2A2A37" },
	NavicIconsEvent = { fg = "#E46876", bg = "#2A2A37" },
	NavicIconsOperator = { fg = "#FFA066", bg = "#2A2A37" },
	NavicIconsTypeParameter = { fg = "#7AA89F", bg = "#2A2A37" },
	NavicText = { fg = "#C8C093", bg = "#2A2A37" },
	NavicSeparator = { fg = "#C8C093", bg = "#2A2A37" },
	NavicIcons = { fg = "#C8C093", bg = "#2A2A37" },
	DapBreakpoint = { fg = "#E82424" },
}

-- require("kanagawa").setup({ overrides = overrides })
-- vim.cmd("colorscheme kanagawa")

vim.cmd("colorscheme tokyonight-night")
