vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
		autocmd BufWinEnter *  :lua vim.wo.fillchars='eob: '
  augroup end

  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]])

local filetypes = {
	["tsconfig.json"] = "jsonc",
	["package.json"] = "jsonc",
}

for ft, cmd in pairs(filetypes) do
	vim.cmd("autocmd BufNewFile,BufRead " .. ft .. " set filetype=" .. cmd)
end
