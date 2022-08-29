-- Comment out everything but the colorscheme you are selecting
local status_ok, ayu = pcall(require, "ayu")
if not status_ok then
	return
end
vim.cmd([[colorscheme ayu-dark]])

-- local status_ok, _ = pcall(require, "aurora")
-- if not status_ok then
-- 	return
-- end
-- vim.cmd([[colorscheme aurora]])

-- local status_ok, _ = pcall(require, "tokyodark")
-- if not status_ok then
-- 	return
-- end
-- vim.cmd([[colorscheme tokyodark]])
