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
return packer.startup(function(use)
	--My plugins here
	use("wbthomason/packer.nvim") -- Packer manages itself
	use("nvim-lua/popup.nvim")

	-- UI
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- nvim tree
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim") -- lualine
	use("ellisonleao/glow.nvim")
	use("RRethy/vim-illuminate")
	use("fgheng/winbar.nvim")
	use("matbme/JABS.nvim")

	-- Util
	use("ggandor/lightspeed.nvim")
	use("windwp/nvim-autopairs") -- Auto Pairs
	use("lewis6991/impatient.nvim")
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Colorscheme
	use("Shatur/neovim-ayu")
	use("tiagovla/tokyodark.nvim")
	use("marko-cerovac/material.nvim")
	use("luisiacc/gruvbox-baby")
	use("rebelot/kanagawa.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	-- git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Snippits

	-- Surround
	use("kylechui/nvim-surround")

	-- Sessions
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{"hrsh7th/cmp-cmdline"},
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("lukas-reineke/lsp-format.nvim")
	use("folke/trouble.nvim")
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use("Maan2003/lsp_lines.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Which Key
	use("folke/which-key.nvim")
	use("moll/vim-bbye")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

end)
