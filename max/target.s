# author	:  Rajan Khullar
# created	:  04/02/16
# updated	:  04/02/16

# purpose	:  find the maximum item over a set of data
# input		:  None
# output	:  Staus code viewed by typing echo $?

# variables
#	edi		:  index of current data item
#	ebx		:  largest data item found
#	eax		:  current data item

# memory
#	list	:  sequence of numbers terminated by 0

.section .data
list:
	.long	53,71,95,62,84,62,94,72,95,78,0

.section .text
.globl	_start
_start:
	movl	$0, %edi				# assign index to 0
	movl	list(,%edi,4), %eax		# fetch current item
	movl	%eax, %ebx				# set larget item to first item

loop:
	cmpl	$0, %eax				# exit if current item is 0
	je		exit
	incl	%edi					# increment index
	movl	list(,%edi,4), %eax		# fetch current item
	cmpl	%ebx, %eax				# loop if current item is not new max
	jle		loop
	movl	%eax, %ebx				# update maximum
	jmp		loop					# continue loop

exit:
	movl	$1, %eax				# system call to exit
	int		$0x80					# kernel interrupt
