local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reload neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packeruser_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
    ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end


-- Have packer use a popp window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {boarder = rounded}
    end,
  }, 
    compile_path = vim.fn.stdpath 'data' .. '/site/pack/loader/start/packer.nvim/plugin/packer.lua',
}

--Install your plugins here
return packer.startup(function(use)
  --My plugins here
  use "wbthomason/packer.nvim"
  use "jiangmiao/auto-pairs"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  }}
end)
