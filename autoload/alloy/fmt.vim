function! alloy#fmt#Format() abort
  let l:cur_view = winsaveview()

  " Make a fake change so that the undo point is correct.
  normal! ix
  normal! "_x

  if executable('alloy') < 1
    echohl ErrorMsg
    echom 'alloy fmt: alloy not found in $PATH'
    echohl None
    return
  endif

  " Execute `alloy fmt`, redirecting stderror to a temporary file.
  let tmpfile = tempname()
  let shellredir_save = &shellredir
  let &shellredir = '>%s 2>' . tmpfile
  silent execute '%!alloy fmt'
  let &shellredir = shellredir_save

  " If there was an error, undo any changes and show stderr.
  if v:shell_error != 0
    silent undo
    let output = readfile(tmpfile)

    echohl ErrorMsg
    for line in output
      echom 'alloy fmt: ' . line
    endfor
    echohl None
  endif

  " Delete the temporary file and restore the view.
  call delete(tmpfile)
  call winrestview(cur_view)
endfunction
