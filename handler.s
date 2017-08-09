.text
.global handler_timer

INTPND: .word 0x10140000 @Interrupt status register
INTSEL: .word 0x1014000C @interrupt select register( 0 = irq, 1 = fiq)
INTEN: .word 0x10140010 @interrupt enable register
TIMER0L: .word 0x101E2000 @Timer 0 load register
TIMER0V: .word 0x101E2004 @Timer 0 value registers
TIMER0C: .word 0x101E2008 @timer 0 control register
TIMER0X: .word 0x101E200c @timer 0 interrupt clear register


handler_timer:
  STMFD sp!, {r0 - r12, lr} @Empilha os registradores
  LDR r0, TIMER0X
  MOV r1, #0x0
  STR r1, [r0] @p no registrador TIMER0X para limpar o pedido de interrupção
  @ Inserir código que sera executado na interrupção de timer aqui (chaveamento de processos, ou alternar LED por exemplo)
  LDMFD sp!, {r0 - r12, pc} @retorna
