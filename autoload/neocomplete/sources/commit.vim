let s:source = {
      \ 'name': 'commit',
      \ 'kind': 'keyword',
      \ 'min_pattern_length' : 5,
      \ 'is_volatile' : 1,
      \ 'mark' : '[commit]',
      \ 'filetypes': { 'gitcommit': 1 }
      \ }

function! s:source.get_complete_position(context)
  return necocommit#get_complete_position(a:context.input)
endfunction

function! s:source.gather_candidates(context)
  return necocommit#gather_candidates(a:context.complete_str)
endfunction

function! neocomplete#sources#commit#define()
  return s:source
endfunction

