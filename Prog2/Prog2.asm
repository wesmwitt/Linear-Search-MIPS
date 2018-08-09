#Wesley Wittekiend
#Program 2

.data
Array:		.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 50, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
UserPrompt:	.asciiz "Enter the value you want to search for: "
Answer:		.asciiz "That value is located at index: "
NoAnswer:	.asciiz "Integer not found in array "
	
.text
.globl main

	
main:
la $s0, Array		#load array address
	
li $v0, 4		#prompt user for input
la $a0, UserPrompt
syscall

li $v0, 5		#get user input
syscall

move $t0, $v0		#$t0 = user input

li $t3, 0		#i=0
li $t6, 19		#array length

	
Loop:
	
lw $s1, 0($s0)			#load Array[i]	
sub $t2, $t0, $s1		# $t2 = user input - array[i]

beq $t2, $zero, IsAnswer	#if $t2 = 0, value is found, jump to answer
beq $t3, $t6, AnswerNotFound	#jump to Answer not found
addi $t3, 1			#i++
addi $s0, 4			#array address +4

j Loop				#loop
	
AnswerNotFound:	

li $v0, 4               #print that there's no answer
la $a0, NoAnswer

syscall
j Exit			#jump to exit

	
IsAnswer:

li $v0, 4               #print answer text
la $a0, Answer
syscall
	
li $v0, 1
move $a0, $t3		#print answer value
syscall					


Exit:	
li $v0, 10		#END
syscall
