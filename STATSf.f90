program STATSf
	! size of my array
	integer, parameter :: size = 20
	! one dimensional array of size 9
	real, dimension(size) :: numbers
	! directly assigning values using array constructor
	numbers = (/7.80,8.90,2.20,5.50,6.70,9.70,1.50,1.80,8.80,8.20,10.10,0.50,11.14,4.50,5.60,6.70,2.30,3.40,9.00,1.20/)
	! presorted array
	call printarray(numbers, size, .false.)
	! sort arrray
	call sort(numbers, size)
	print *
	print *
	write(*, 10) "mean= ", smean(numbers, size)
	write(*, 10) "median= ", smedian(numbers, size)
	write(*, 10) "min=", smin(numbers, size)
	write(*, 10) "max=", smax(numbers, size)
	print *
	call printarray(numbers, size, .true.)
10  format(a, f10.2)
end	program STATSf

! function that returns the mean of the array
function smean(list, len) result(m)
implicit none
	integer :: len, i
	real :: m, total
	real, dimension(len) :: list
	do i = 1, len
		total = total + list(i)
	end do
	m = total/len
end function smean

! function that returns the median of the array
function smedian(list, len) result(j)
implicit none  
	integer :: len, midpoint
	real :: j
	real, dimension(len) :: list
	! plus 1 to account for array indexing starting at 1
	midpoint = len/2 + 1
	if (modulo(len, 2) .eq. 0) then
		j = (list(midpoint) + list(midpoint-1))/2.0
	else 
		j = list(midpoint)
	end if
end function smedian

! find maximum
function smax(list, len) result(m)
	integer :: len
	real, dimension(len) :: list
	real :: m 
	m = list(len)
end function smax

! find minimum
function smin(list, len) result(h)
implicit none
	integer :: len
	real :: h
	real, dimension(len) :: list
	h = list(1)
end function smin

! sorts the array, using bubble sort 
subroutine sort(list, len)
implicit none 
	integer :: len, i, j
	real :: temp
	logical :: swapped
	real, dimension(len) :: list
	! set i to the length of array
	do i = len-1, 1, -1 
		! bool to keep track of when a swap is made
		swapped = .false.
		! checks beginning of array to index of i 
		do j = 1, i
			if(list(j) .gt. list(j+1)) then
				! swap items at index with item in index i + 1
				temp = list(j)
				list(j) = list(j+1)
				list(j+1) = temp
				swapped = .true. 
			end if 
		end do 
		! if no swaps were made, array is sorted
		if(.not. swapped) EXIT
	end do 
end subroutine sort

subroutine printarray(list, len, table)
	integer :: len
	logical :: table
	real, dimension (len) :: list 
	! if true, then print in table format
	if(table) then
		write(*, 100) list
100 	format(10f10.2)
	! print every entry in its own line
	else 
		do i = 1, len
			write(*, 110) list(i)
110			format(f10.2)
		end do
	endif
end subroutine printarray

