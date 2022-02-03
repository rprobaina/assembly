#PURPOSE:	This program computes the factorial of a given number
#		3! = 3 * 2 * 1, 6
#
#		This program shows how to call a function recursively	

#INPUT:	

#OUTPUT:

#VARIABLES:	

.section .data

.section .text

.globl _start
.globl factorial	# not needed for internal usage

_start:
## MAIN ##
pushl $3		# pushing the first function's argument
call factorial
addl $4, %esp		# disregard the parameter pushed to the stack

movl %eax, %ebx		# put the result in the return value

movl $1, %eax		# exit and return %ebx
int $0x80


## FACTORIAL ##
.type factorial, @function
factorial:
pushl %ebp		# standard function code
			# we need restore %ebp to its prior state
			# before returning

movl %esp, %ebp		# we don't want to modify the stack pointer
			# so, we use %ebp

movl 8(%ebp), %eax	# this moves the first argument to %eax
			# 4(%ebp) holds the return address, and
			# 8(%ebp) holds the first parameter

cmpl $1, %eax		# testing the base case
je end_factorial

decl %eax		# decrement the value, set the parameter
push %eax		# and call factorial recursively
call factorial
mov 8(%ebp), %ebx	# %eax has the return value, so we
			# reload our parameter into %ebx

imull %ebx, %eax	# multiply that by the result of the
			# last call to factorial (in %eax)
			# the answer is stored in %eax, which
			# is good since that’s where return values go.

end_factorial:
mov %ebp, %esp 		# standard function return stuff - we
popl %ebp		# have to restore %ebp and %esp to where
			# they were before the function started
ret			# return to the caller funtion
