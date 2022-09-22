-- vim.cmd([[colorscheme ayu-dark]])

-- vim.cmd([[colorscheme tokyodark]])

-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_background_color = "dark"

-- vim.cmd("colorscheme gruvbox-baby")

-- vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")

local colors = require("kanagawa.colors").setup()
local overrides = {
	Hlargs = vim.tbl_extend("force", { fg = "#A3D4D5" }, { italic = true }),
	-- create a new hl-group using default palette colors and/or new on_lines

	FloatBorder = { fg = "#7E9CD8", bg = colors.bg },
	Pmenu = { fg = "#223249", bg = colors.bg },
}

require("kanagawa").setup({ overrides = overrides })
vim.cmd("colorscheme kanagawa")

-- require("catppuccin").setup({
-- 	transparent_background = false,
-- 	term_colors = true,
-- 	compile = {
-- 		enabled = true,
-- 		path = vim.fn.stdpath("cache") .. "/catppuccin",
-- 	},
-- 	dim_inactive = {
-- 		enabled = true,
-- 		shade = "dark",
-- 		percentage = 0.25,
-- 	},
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = { "italic" },
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
-- 	integrations = {
-- 		cmp = true,
-- 		treesitter = true,
-- 		treesitter_context = true,
-- 		nvimtree = true,
-- 		ts_rainbow = true,
-- 		lsp_trouble = true,
-- 		which_key = true,
-- 		telescope = true,
-- 		lightspeed = true,
--
-- 		native_lsp = {
-- 			enabled = true,
-- 			virtual_text = {
-- 				errors = { "italic" },
-- 				hints = { "italic" },
-- 				warnings = { "italic" },
-- 				information = { "italic" },
-- 			},
-- 			underlines = {
-- 				errors = { "underline" },
-- 				hints = { "underline" },
-- 				warnings = { "underline" },
-- 				information = { "underline" },
-- 			},
-- 			navic = {
-- 				enabled = true,
-- 				custom_bg = "NONE",
-- 			},
-- 		},
-- 	},
-- 	color_overrides = {},
-- 	highlight_overrides = {},
-- })
--
-- vim.g.catppuccin_flavour = "macchiato"
-- vim.cmd("colorscheme catppuccin")
