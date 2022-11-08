local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reload neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packeruser_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
    ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a pop window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

--Install your plugins here

local M = {
	["wbthomason/packer.nvim"] = {},
	["kyazdani42/nvim-tree.lua"] = { requires = { "kyazdani42/nvim-web-devicons" } },
	["RRethy/vim-illuminate"] = {},
	["karb94/neoscroll.nvim"] = {},
	["m-demare/hlargs.nvim"] = {},
	["nvim-lualine/lualine.nvim"] = {},
	["folke/noice.nvim"] = { requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
	["lewis6991/impatient.nvim"] = {},
	["ggandor/leap.nvim"] = {},
	["windwp/nvim-autopairs"] = {},
	["ahmedkhalf/project.nvim"] = {},
	["lukas-reineke/indent-blankline.nvim"] = {},
	["nvim-lua/plenary.nvim"] = {},
	["simrat39/symbols-outline.nvim"] = {},
	["rebelot/kanagawa.nvim"] = {},
	["folke/tokyonight.nvim"] = {},
	["nvim-treesitter/nvim-treesitter"] = { run = "TSUpdate" },
	["p00f/nvim-ts-rainbow"] = {},
	["nvim-treesitter/nvim-treesitter-textobjects"] = {},
	["nvim-treesitter/nvim-treesitter-context"] = {},
	["kdheepak/lazygit.nvim"] = {},
	["lewis6991/gitsigns.nvim"] = {},
	["kylechui/nvim-surround"] = {},
	["VonHeikemen/lsp-zero.nvim"] = {},
	["jose-elias-alvarez/null-ls.nvim"] = {},
	["neovim/nvim-lspconfig"] = {},
	["williamboman/mason.nvim"] = {},
	["williamboman/mason-lspconfig.nvim"] = {},
	["hrsh7th/cmp-cmdline"] = {},
	["hrsh7th/nvim-cmp"] = {},
	["hrsh7th/cmp-buffer"] = {},
	["hrsh7th/cmp-path"] = {},
	["saadparwaiz1/cmp_luasnip"] = {},
	["hrsh7th/cmp-nvim-lsp"] = {},
	["hrsh7th/cmp-nvim-lua"] = {},
	["L3MON4D3/LuaSnip"] = {},
	["rafamadriz/friendly-snippets"] = {},
	["SmiteshP/nvim-navic"] = {},
	["b0o/SchemaStore.nvim"] = {},
	["akinsho/toggleterm.nvim"] = {},
	["folke/which-key.nvim"] = {},
	["moll/vim-bbye"] = {},
	["numToStr/Comment.nvim"] = {},
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["olexsmir/gopher.nvim"] = {},
	["leoluz/nvim-dap-go"] = {},
	["mfussenegger/nvim-dap"] = {},
	["rcarriga/nvim-dap-ui"] = {},
	["theHamsta/nvim-dap-virtual-text"] = {},
	["anuvyklack/windows.nvim"] = { requires = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" } },
	["nvim-telescope/telescope.nvim"] = { requires = { "nvim-lua/plenary.nvim" } },
	["LukasPietzschmann/telescope-tabs"] = {},
	["nagy135/typebreak.nvim"] = {},
	["zbirenbaum/copilot.lua"] = {
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup(require("packages.copilot"))
			end, 100)
		end,
	},
	["windwp/nvim-ts-autotag"] = {},
	["kevinhwang91/nvim-ufo"] = { requires = "kevinhwang91/promise-async" },
	["anuvyklack/pretty-fold.nvim"] = {},
	["pineapplegiant/spaceduck"] = {},
	["sindrets/diffview.nvim"] = { requires = "nvim-lua/plenary.nvim" },
	["smjonas/inc-rename.nvim"] = {},
	["buidler-hub/react-nextjs-snippets"] = {},
	["bluz71/vim-nightfly-guicolors"] = {},
	["yioneko/nvim-yati"] = {},
	["jose-elias-alvarez/typescript.nvim"] = {},
}

packer.startup(function(use)
	for plugin, config in pairs(M) do
		-- move plugin into the first position of a new map and loop through config and add them to the key and value
		local new_config = { plugin }
		for key, value in pairs(config) do
			new_config[key] = value
		end
		use(new_config)
	end
end)
