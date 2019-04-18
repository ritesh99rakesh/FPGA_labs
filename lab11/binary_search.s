.data
array:		.space 48
input_msg0:	.asciiz "Enter n: "
input_msg1:	.asciiz "\nInput numbers in ascending order"
input_msg2:	.asciiz "\nInput number: "
input_msg3:	.asciiz "\nEnter number to search: "
output_msg0:.asciiz "\nFound element at index: "
output_msg1:.asciiz "\nElement not found"

.text
.globl main
# start of main program
main:
# ask for n
li $v0, 4
la $a0, input_msg0
syscall
# get n
li $v0, 5
syscall
# $s0 <- n
add $s0, $v0, $0
# input numbers in ascending order
li $v0, 4
la $a0, input_msg1
syscall
# $t0 <- n
add $t0, $s0, $0
# $s1 <- array_addr
la $s1, array
# $t1 <- array_addr
add $t1, $s1, $0
# loop to get n elements
loop:
li $v0, 4
# ask for element
la $a0, input_msg2
syscall
# get element
li $v0, 5
syscall
# store element in array
sw $v0, 0($t1)
# $t1 <- next array_addr
addi $t1, $t1, 4
# $t0 <- $t0 - 1
addi $t0, $t0, -1
bne $t0, $0, loop
# ask for k
li $v0, 4
la $a0, input_msg3
syscall
# get k
li $v0, 5
syscall
# $s2 <- k
add $s2, $v0, $0
# $a0 <- array_addr
add $a0, $s1, $0
# $a1 <- 0
xor $a1, $a1, $a1
# $a2 <- n
add $a2, $s0, $0
# $a3 <- k
add $a3, $s2, $0
# store $ra in stack
addi $sp, $sp, -4
sw $ra, 0($sp)
# call binary_search function
jal bs
# load $ra from stack
lw $ra, 0($sp)
addi $sp, $sp, 4
# store return value `pos` from function in $a0
add $a0, $v0, $0
# display pos
addi $v0, $0, 1
syscall
# return from main
jr $ra

# binary_search function
# $a0 <- array_addr
# $a1 <- low
# $a2 <- high
# $a3 <- k
bs:
# check if high < low
sltu $t0, $a2, $a1
# if high < low return -1
beq $t0, $0, label0
addi $v0, $0, -1
jr $ra
# else
label0:
# $t0 <- (low + high)
add $t0, $a1, $a2
# $t0 <- (low + high)/2
# i.e. $t0 <- mid
srl $t0, $t0, 1
# $t1 <- array[mid]
sll $t1, $t0, 2
add $t1, $a0, $t1
lw $t1, 0($t1)
# if array[mid] == k return mid
bne $t1, $a3, label1
add $v0, $t0, $0
jr $ra
# else
label1:
sltu $t1, $a3, $t1
# if k < array[mid] do binary_search(array, low, mid-1, k)
beq $t1, $0, label2
# store return address
addi $sp, $sp, -4
sw $ra, 0($sp)
# high <- mid - 1
addi $a2, $t0, -1
# call binary_search
jal bs
# load return address
lw $ra, 0($sp)
addi $sp, $sp, 4
# return
add $v0, $v0, $0
jr $ra
# else do binary_search(array, mid+1, high, k)
label2:
# store return address
addi $sp, $sp, -4
sw $ra, 0($sp)
# low <- mid + 1
addi $a1, $t0, 1
# call binary_search
jal bs
# load return address
lw $ra, 0($sp)
addi $sp, $sp, 4
# return
add $v0, $v0, $0
jr $ra
