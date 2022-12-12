vim.api.nvim_set_keymap("n", "gd", "<cmd>TypescriptGoToSourceDefinition<cr>", { noremap = true, silent = true })

--set up an auto command
vim.cmd([[
augroup typescript
  autocmd!
  autocmd BufWritePre *.ts :TypescriptAddMissingImports
  autocmd BufWritePre *.tsx :TypescriptAddMissingImports
augroup end
]])
