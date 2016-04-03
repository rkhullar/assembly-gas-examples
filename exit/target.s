# author	:  Rajan Khullar
# created	:  04/02/16
# updated	:  04/02/16

# purpose	:  Simple program that exits and returns a status code to the linux kernel
# input		:  None
# output	:  Staus code viewed by typing echo $?

# variables
#	eax		:  system call number
#	ebx		:  return staus

	.section .data

	.section .text
	.globl	_start
_start:
	movl	$1, %eax	# system call number to exit
	movl	$4, %ebx	# return status assignment
	int		$0x80		# interrupt kernel
