local colors = require("kanagawa.colors").setup()
local overrides = {
	Hlargs = vim.tbl_extend("force", { fg = "#EA8181" }, { italic = true }),
	DapUIBreakpointsCurrentLine = vim.tbl_extend("force", { fg = "#E82424" }, { bold = true }),
	FloatBorder = { fg = "#7E9CD8", bg = colors.bg },
	Pmenu = { fg = "#223249", bg = colors.bg },
}

require("kanagawa").setup({ overrides = overrides })
vim.cmd("colorscheme kanagawa")

-- vim.g.nightflyCursorColor = true
-- vim.g.nightflyNormalFloat = true
--
-- vim.cmd("colorscheme nightfly")
