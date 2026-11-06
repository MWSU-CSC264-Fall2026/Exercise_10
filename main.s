
.data
result1: .word -1
result2: .word -1
result3: .word -1

array1: .word 3, 8, 5, 2, 7, 4
len1:   .word 6

array2: .word 1, 3, 5, 7
len2:   .word 4

array3: .word 2, 4, 6, 8
len3:   .word 4

done:   .asciiz "Even Sum Exercise Complete!\n"

.text
.globl main
main:

    # Call sum_even for array1
    la a0, array1
    lw a1, len1
    jal ra, sum_even
    la t0, result1
    sw a0, 0(t0)

    # Call sum_even for array2
    la a0, array2
    lw a1, len2
    jal ra, sum_even
    la t0, result2
    sw a0, 0(t0)

    # Call sum_even for array3
    la a0, array3
    lw a1, len3
    jal ra, sum_even
    la t0, result3
    sw a0, 0(t0)

    # Print completion message
    la a1, done
    li a0, 4
    ecall

    # Exit
    li a0, 10
    ecall

# sum_even subroutine
sum_even:
    li t0, 0       # index
    li t1, 0       # sum

loop:
    bge t0, a1, finished

    slli t2, t0, 2
    add t2, a0, t2
    lw t3, 0(t2)

    andi t4, t3, 1
    bnez t4, skip

    add t1, t1, t3

skip:
    addi t0, t0, 1
    j loop

finished:
    mv a0, t1
    ret
