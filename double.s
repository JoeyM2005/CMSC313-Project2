.section .data
    input_buff:  .string "%d" # for reading an integer
    output_buff:  .string "The double is: %d\n" # for printing the result
.section .bss
    .lcomm num, 4 # Reserve 4 bytes for the input integer
.section .text
    .global _start
_start:

    # Read number from stdin
    lea input_buff(%rip), %rdi      # loads address of input_buff into rdi
    lea num(%rip), %rsi             # address of num( num(%rip) ) into rsi
    xor %eax, %eax                  # clears eax register
    call scanf

    # Double the number
    movl num(%rip), %eax            # loads decimal value into eax register
    add %eax, %eax                  # eax = eax + eax

    # Print output_buff string
    lea output_buff(%rip), %rdi     # loads address of output_buff into rdi
    mov %eax, %esi                  # the doubled value into esi
    xor %eax, %eax                  # clears eax register
    call printf

    #exit
    mov $60, %rax # exit
    mov $0, %rdi # status
    syscall
