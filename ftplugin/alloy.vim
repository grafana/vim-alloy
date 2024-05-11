setlocal noexpandtab

command! -nargs=0 -buffer AlloyFmt :call alloy#fmt#Format()

if get(g:, 'alloy_fmt_on_save', 1)
  augroup vim.alloy.fmt
    autocmd!
    autocmd BufWritePre *.alloy call alloy#fmt#Format()
  augroup END
endif

