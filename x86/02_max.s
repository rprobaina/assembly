#PURPOSE:	Find the maximum number of set of items

#INPUT:		data_items:

#OUTPUT:	Returns the maximum number, check with "echo $?"

#VARIABLES:	
#		%edi - data_items' index
#		%ebx - current max
#		%eax - current data item (data_items[index])
#
#		data_items - contains the set of numbers. A 0 is used
#			     to terminate de data.

.section .data

data_items:
	.long 3, 67, 34, 222, 45, 75, 54, 34, 1, 1, 44, 22, 11, 66, 0

.section .text

.globl _start

_start:
movl $0, %edi			# initializaing the index
movl data_items(,%edi,4), %eax	# getting the current item
movl %eax, %ebx			# at this point, the first item is the max

start_loop:
cmpl $0, %eax			# checking the end of data
je loop_exit

incl %edi			# getting the next value
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax
jle start_loop			# max is bigger than current item

movl %eax, %ebx			# updating the max
jmp start_loop	

loop_exit:
movl $1, %eax
int $0x80
