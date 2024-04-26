.data
array: .word 34, 7, 23, 32, 15, 88, 26, 12, 29, 5   # vetor com 10 posições
MIN: .asciiz "min="
MAX: .asciiz "max="
quebradelinha: .asciiz "\n"

.text
.globl main
main:
    la $a0, array          # Carrega o endereço base do vetor em $a0
    li $t0, 0              # Inicializa o índice i = 0
    lw $t1, 0($a0)         # Inicializa $t1 com o primeiro elemento do vetor (min = array[0])

    lw $t2, 0($a0)         # Inicializa $t2 com o primeiro elemento do vetor (max = array[0])
    li $t3, 10             # Tamanho do vetor

loop:
    lw $t4, 0($a0)         # Carrega o próximo elemento do vetor em $t4
    ble $t4, $t1, min  	   # Verifica se $t4 < $t1 (novo mínimo)
    move $t1, $t4          # Atualiza o mínimo
min:
    bge $t4, $t2, max      # Verifica se $t4 > $t2 (novo máximo)
    move $t2, $t4          # Atualiza o máximo
max:
    addi $a0, $a0, 4       # Incrementa o endereço do vetor
    addi $t0, $t0, 1       # Incrementa o índice
    bne $t0, $t3, loop     # Verifica se ainda não chegou ao final do vetor

    # Imprime o máximo
    li $v0, 4              # Código do syscall para imprimir string
    la $a0, MIN            # Carrega o endereço da mensagem de máximo
    syscall

    li $v0, 1              # Código do syscall para imprimir inteiro
    move $a0, $t2          # Carrega o valor máximo em $a0
    syscall
    
    # Imprime nova linha
    li $v0, 4              # Código do syscall para imprimir string
    la $a0, quebradelinha  # Carrega o endereço da mensagem de nova linha
    syscall
    
    # Imprime o mínimo
    li $v0, 4              # Código do syscall para imprimir string
    la $a0, MAX            # Carrega o endereço da mensagem de mínimo
    syscall

    li $v0, 1              # Código do syscall para imprimir inteiro
    move $a0, $t1          # Carrega o valor mínimo em $a0
    syscall

    # Encerra o programa
    li $v0, 10             # Encerra o programa
    syscall
    
