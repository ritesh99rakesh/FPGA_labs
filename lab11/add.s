.data
input_msg0:	.asciiz "Enter n: "
input_msg1:	.asciiz "\nInput float number: "
output_msg0:.asciiz "\nAnswer: "
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
# $t0 <- n
add $t0, $s0, $0
# $f1 <- 0
# sum = $f1
sub.s $f1, $f1, $f1
# $t1 <- 0
xor $t1, $t1, $t1
# $t1 <- counter
add $t1, $0, $0
# loop to get n elements
loop:
li $v0, 4
# ask for element
la $a0, input_msg1
syscall
# get element
li $v0, 6
syscall
andi $t2, $t1, 1
beq $t2, $0, add_it
sub.s $f1, $f1, $f0
j loop1
add_it:
add.s $f1, $f1, $f0
loop1:
addi $t1, $t1, 1
bne $t0, $t1, loop
li $v0, 4
la $a0, output_msg0
syscall
li $v0, 2
mov.s $f12, $f1
syscall
jr $ra