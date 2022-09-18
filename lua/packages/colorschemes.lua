-- vim.cmd([[colorscheme ayu-dark]])

-- vim.cmd([[colorscheme tokyodark]])

-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_background_color = "dark"

-- vim.cmd("colorscheme gruvbox-baby")

-- vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")

local colors = require("kanagawa.colors").setup()
local overrides = {
	-- create a new hl-group using default palette colors and/or new on_lines

	FloatBorder = { fg = "#7E9CD8", bg = colors.bg },
	Pmenu = { fg = "#223249", bg = colors.bg },
}

require("kanagawa").setup({ overrides = overrides })
vim.cmd("colorscheme kanagawa")
