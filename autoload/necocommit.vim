function! necocommit#get_complete_position(input)
  return match(a:input, 'fixup')
endfunction

function! necocommit#gather_candidates(complete_str)
  let cmd = "git --no-pager log --pretty=format:'%s' -n 20"
  let output = system(cmd)
  let candidates = []
  " TODO
  if output == "fatal: Not a git repository (or any of the parent directories): .git"
    return []
  endif
  let commits = split(output, '\n')
  for msg in commits
    call add(candidates, { 'word': 'fixup <' . msg . '>' })
  endfor
  return candidates
endfunction

