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

	-- UI
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- nvim tree
	use("feline-nvim/feline.nvim")
	use("RRethy/vim-illuminate")
	use("karb94/neoscroll.nvim")
	use("petertriho/nvim-scrollbar")

	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
	})
	use("m-demare/hlargs.nvim")

	-- Buffers
	use("matbme/JABS.nvim")
	use("j-hui/fidget.nvim")

	-- Util
	use("lewis6991/impatient.nvim")
	use("ggandor/lightspeed.nvim")
	use("windwp/nvim-autopairs") -- Auto Pairs
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Colorscheme
	use("Shatur/neovim-ayu")
	use("luisiacc/gruvbox-baby")
	use("rebelot/kanagawa.nvim")
	use("catppuccin/nvim")
	use("Everblush/everblush.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")

	-- git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Surround
	use("kylechui/nvim-surround")

	-- Sessions
	use("rmagatti/auto-session")
	use("rmagatti/session-lens")

	-- LSP
	use({ "VonHeikemen/lsp-zero.nvim" })

	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- LSP Support
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	-- Autocompletion
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Lsp Util
	use("folke/trouble.nvim")
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use("Maan2003/lsp_lines.nvim")
	use("b0o/SchemaStore.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Which Key
	use("folke/which-key.nvim")
	use("moll/vim-bbye")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	--md
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
end)
