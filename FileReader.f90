program FileReader
	! variables
	integer var1, var2, var3, var4, linecount
	! open power.out file to be read
	open(4, file='powers.out', status='old')
	linecount = 0
	! skip first two lines
	read(4,*)
	read(4, *)
	print *, 'Contents of file powers.out: '
	! save values to variables; end of file, jump to label 20
10	read(4,*, END=20) var1, var2, var3, var4
	print *, var1, var2, var3, var4
	linecount = linecount + 1
	goto 10
20	print *, 'There are ', linecount, ' records.'
	close(4) 
	end