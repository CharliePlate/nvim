vim.cmd([[

  " function s:AddTerminalNavigation()
  "   echo "Hello"
  "   noremap <buffer> <Esc> q
  " endfunction
  "
  " augroup TerminalNavigation
  "   autocmd!
  "   autocmd FileType lazygit call s:AddTerminalNavigation()
  " augroup END

  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
]])
