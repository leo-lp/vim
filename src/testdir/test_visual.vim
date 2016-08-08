" Tests for Visual mode.  Uses double-wide character.
if !has('multi_byte')
  finish
endif

if !has('visual')
  finish
endif

func Test_block_shift_multibyte()
  split
  call setline(1, ['xヹxxx', 'ヹxxx'])
  exe "normal 1G0l\<C-V>jl>"
  call assert_equal('x	 ヹxxx', getline(1))
  call assert_equal('	ヹxxx', getline(2))
  q!
endfunc
