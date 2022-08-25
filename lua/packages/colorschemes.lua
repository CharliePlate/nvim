-- Comment out everything but the colorscheme you are selecting


local status_ok, ayu = pcall(require, "ayu")
if not status_ok then
  return
end
vim.cmd [[colorscheme ayu-dark]]
