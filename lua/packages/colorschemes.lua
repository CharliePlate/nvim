-- vim.cmd([[colorscheme ayu-dark]])

-- vim.cmd([[colorscheme tokyodark]])

-- vim.g.material_style = "darker"
-- vim.cmd("colorscheme material")

-- vim.g.gruvbox_baby_telescope_theme = 1
-- vim.g.gruvbox_baby_background_color = "dark"
--
--
-- vim.cmd("colorscheme gruvbox-baby")
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = false,
	term_colors = true,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		treesitter_context = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		coc_nvim = false,
		lsp_trouble = false,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		leap = false,
		telescope = true,
		nvimtree = true,
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
		dap = {
			enabled = false,
			enable_ui = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = false,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		markdown = false,
		lightspeed = true,
		ts_rainbow = true,
		hop = false,
		notify = false,
		telekasten = false,
		symbols_outline = false,
		mini = false,
		aerial = false,
		vimwiki = false,
		beacon = false,
		overseer = false,
	},
	color_overrides = {},
	highlight_overrides = {},
})

vim.cmd("colorscheme catppuccin")
