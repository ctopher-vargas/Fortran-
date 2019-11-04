program Powers
	integer x
	open(4, file='powers.out', status='new')
	write (4, 19) 
19	format ('          x         x**2      x**3      x**4')
	write (4, 21) 
21	format ('         ===================================')
  	do 11 x = 1, 15
		write (4, 20) x, x**2, x**3, x**4
20		format (1x, 2i10, i10, i10)
11	continue
	close(4)
	end
