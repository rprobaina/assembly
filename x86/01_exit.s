#PURPOSE:	A simple program that exits and returns a
#		status code back to the Linux Kernel

#INPUT:		None

#OUTPUT:	Returns a status code that can be checked
#		by running "echo $?", after running the program

#VARIABLES:	
#		%eax - system call number
#		%ebx - return status

.section .data

.section .text

.globl _start

_start:
movl $1, %eax	# 1 is the number of exit system call
movl $0, %ebx	# Setting the status code to 0
int $0x80	# Starting the interrupt #0x80 to wake up the kernel
