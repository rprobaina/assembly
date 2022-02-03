#PURPOSE: 	It's an example of function's usage
#		This program will compute the value of:
#		2^3 + 2^5	

#INPUT:	

#OUTPUT:

#VARIABLES:	

.section .data

.section .text

.globl _start

_start:
## MAIN ##
pushl $3	# pushing the second argument
pushl $2	# pushing the first argument
call power	# calling the function "power"
addl $8, %esp	# moving the stack pointer (%esp) back

pushl %eax	# save the first answer before calling
		# the function again

pushl $5	# pushing the second argument
pushl $2	# pushing the first argument
call power	# calling the function "power"
addl $8, %esp	# moving the stack pointer (%esp) back

popl %ebx	# retrieving the first computation.
		# the second answer is already in %eax. 
		# we saved the first answer onto the stack,
		# so now we can just pop it out into %ebx

addl %eax, %ebx # adding the preliminary results to get the 
		# final result in %ebx.

movl $1, %eax	# eixt (%ebx is returned)
int $0x80


## POWER ##
#PURPOSE: 	This function is used to compute
#		the value of a number raised to a power.

#INPUT:		First argument - the base number
#		Second argument - the exponent
#

#OUTPUT:	Will give the result as a return value


#NOTES:		The power must be 1 or greater

#VARIABLES:
#		%ebx - holds the base number
#		%ecx - holds the power
#		-4(%ebp) - holds the current result
#		%eax is used for temporary storage
.type power, @function
power:
pushl %ebp		# save old base pointer (%ebp)
movl %esp, %ebp		# make the stack pointer the base pointer
subl $4, %esp		# get room for our local storage

movl 8(%ebp), %ebx	# put the first argument in %ebx
movl 12(%ebp), %ecx	# put the second argument in %ecx

movl %ebx, -4(%ebp)	# store the current result

power_loop_start:
cmpl $1, %ecx		# if power is 1, we are done
je end_power
movl -4(%ebp), %eax	# move the current result into %eax
imull %ebx, %eax	# multiply the current result by
			# the base number
movl %eax, -4(%ebp)	# store the current result
decl %ecx		# decrement the power
jmp power_loop_start	# return to the power_loop_start

end_power:
movl -4(%ebp), %eax	# the return value is set in %eax
movl %ebp, %esp		# restore the stack pointer
popl %ebp		# respore the base pointer
ret			# return
