.data
vetor: .word 6, 4, 2, 7, 8
tamanho: .word 5
maior: .word 0

.text
.globl main
main:
    la $t0, vetor         # Carrega o endereço base do vetor em $t0 V
    lw $t1, tamanho       # Carrega o tamanho do vetor em $t1 V
    lw $t2, 0($t0)        # Carrega o primeiro valor do vetor em $t2 V

loop:
    addi $t1, $t1, -1     # Decrementa o tamanho do vetor V
    ble $t1, $zero, end   # Verifica se o tamanho do vetor é zero V

    addi $t0, $t0, 4      # Avança para o próximo elemento do vetor V
    lw $t3, 0($t0)        # Carrega o próximo valor do vetor em $t3 ?

    ble $t3, $t2, loop  # Verifica se o próximo valor é menor ou igual ao maior atual V

    add $t2, $t3, $zero   # Atualiza o maior valor encontrado ?

end:
    move $a0, $t2         # Move o maior valor para $a0
    li $v0, 1             # Código da syscall para imprimir inteiro
    syscall               # Chama a syscall para imprimir o maior valor

    li $v0, 10            # Código da syscall para encerrar o programa
    syscall               # Chama a syscall para encerrar o programa
