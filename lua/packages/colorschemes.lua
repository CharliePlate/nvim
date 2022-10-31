-- local colors = require("kanagawa.colors").setup()
--
-- local overrides = {
-- 	Hlargs = vim.tbl_extend("force", { fg = "#EA8181" }, { italic = true }),
-- 	FloatBorder = { fg = "#7E9CD8", bg = colors.bg },
-- 	Pmenu = { fg = "#223249", bg = colors.bg },
-- 	NavicIconsFile = { fg = "#FF9E3B", bg = colors.bg },
-- 	NavicIconsModule = { fg = "#7FB4CA", bg = colors.bg },
-- 	NavicIconsNamespace = { fg = "#A3D4D5", bg = colors.bg },
-- 	NavicIconsPackage = { fg = "#FF9E3B" },
-- 	NavicIconsClass = { fg = "#FF9E3B" },
-- 	NavicIconsMethod = { fg = "#76946A" },
-- 	NavicIconsProperty = { fg = "#A3D4D5" },
-- 	NavicIconsField = { fg = "#FFA066" },
-- 	NavicIconsConstructor = { fg = "#E46876" },
-- 	NavicIconsEnum = { fg = "#D27E99" },
-- 	NavicIconsInterface = { fg = "#E6C384" },
-- 	NavicIconsFunction = { fg = "#7E9CD8" },
-- 	NavicIconsString = { fg = "#98BB6C" },
-- 	NavicIconsBoolean = { fg = "#FFA066" },
-- 	NavicIconsArray = { fg = "#DCA561" },
-- 	NavicIconsObject = { fg = "#C34043" },
-- 	NavicIconsKey = { fg = "#43242B" },
-- 	NavicIconsNull = { fg = "#DCA561" },
-- 	NavicIconsEnumMember = { fg = "#54546D" },
-- 	NavicIconsStruct = { fg = "#7FB4CA" },
-- 	NavicIconsEvent = { fg = "#E46876" },
-- 	NavicIconsOperator = { fg = "#FFA066" },
-- 	NavicIconsTypeParameter = { fg = "#7AA89F" },
-- 	NavicText = { fg = "#C8C093" },
-- 	NavicSeparator = { fg = "#C8C093", bg = "#2A2A37" },
-- 	NavicIcons = { fg = "#C8C093", bg = "#2A2A37" },
-- 	DapBreakpoint = { fg = "#E82424" },
-- 	WinBar = { fg = "#1F1F28", bg = "#1F1F28" },
-- }
--
-- require("kanagawa").setup({ globalStatus = true, overrides = overrides, ... })
-- vim.cmd("colorscheme kanagawa")

-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme gruvbox-flat")

vim.cmd("colorscheme spaceduck")
vim.cmd("highlight FloatBorder guifg=#ACAEBF guibg=#0f111b")
vim.cmd("highlight WhichKeyBorder guifg=#ACAEBF guibg=#0f111b")
vim.cmd("highlight GitSignsChange guibg=#0f111b")

--navic colors
local colors = {
	"#00a3cc",
	"#ce6f8f",
	"#7a5ccc",
	"#b3a1e6",
	"#f2ce00",
	"#5ccc96",
	"#e39400",
}
vim.cmd("highlight NavicIconsFile guifg=" .. colors[1])
vim.cmd("highlight NavicIconsModule guifg=" .. colors[2])
vim.cmd("highlight NavicIconsNamespace guifg=" .. colors[3])
vim.cmd("highlight NavicIconsPackage guifg=" .. colors[4])
vim.cmd("highlight NavicIconsClass guifg=" .. colors[5])
vim.cmd("highlight NavicIconsMethod guifg=" .. colors[6])
vim.cmd("highlight NavicIconsProperty guifg=" .. colors[7])
vim.cmd("highlight NavicIconsField guifg=" .. colors[1])
vim.cmd("highlight NavicIconsConstructor guifg=" .. colors[1])
vim.cmd("highlight NavicIconsEnum guifg=" .. colors[2])
vim.cmd("highlight NavicIconsInterface guifg=" .. colors[3])
vim.cmd("highlight NavicIconsFunction guifg=" .. colors[4])
vim.cmd("highlight NavicIconsString guifg=" .. colors[5])
vim.cmd("highlight NavicIconsBoolean guifg=" .. colors[6])
vim.cmd("highlight NavicIconsArray guifg=" .. colors[7])
vim.cmd("highlight NavicIconsObject guifg=" .. colors[1])
vim.cmd("highlight NavicIconsKey guifg=" .. colors[1])
vim.cmd("highlight NavicIconsNull guifg=" .. colors[2])
vim.cmd("highlight NavicIconsEnumMember guifg=" .. colors[3])
vim.cmd("highlight NavicIconsStruct guifg=" .. colors[4])
vim.cmd("highlight NavicIconsEvent guifg=" .. colors[5])
vim.cmd("highlight NavicIconsOperator guifg=" .. colors[6])
vim.cmd("highlight NavicIconsTypeParameter guifg=" .. colors[7])
vim.cmd("highlight NavicText guifg=#ecf0c1")
vim.cmd("highlight NavicSeparator guifg=" .. colors[1])
vim.cmd("highlight NavicIcons guifg=" .. colors[1])
