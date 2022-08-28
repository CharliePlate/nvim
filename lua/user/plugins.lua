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
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim") -- lualine
	use("ellisonleao/glow.nvim")
	use("RRethy/vim-illuminate")
	-- Util
	use("ggandor/lightspeed.nvim")
	use("windwp/nvim-autopairs") -- Auto Pairs
	use("lewis6991/impatient.nvim")
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")

	-- Colorscheme
	use("Shatur/neovim-ayu")
	use("ray-x/aurora")
	use("tiagovla/tokyodark.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- git
	use("kdheepak/lazygit.nvim")
	use("lewis6991/gitsigns.nvim")

	-- Snippits
	use("L3MON4D3/LuaSnip")

	-- Surround
	use("kylechui/nvim-surround")

	-- Completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("lukas-reineke/lsp-format.nvim")
	use("folke/trouble.nvim")
	use("ray-x/lsp_signature.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Which Key
	use("folke/which-key.nvim")
	use("moll/vim-bbye")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
end)
