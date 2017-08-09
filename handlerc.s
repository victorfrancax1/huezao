	.cpu arm7tdmi-s
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"handler.c"
	.global	UART0DR
	.section	.rodata
	.align	2
	.type	UART0DR, %object
	.size	UART0DR, 4
UART0DR:
	.word	270471168
	.global	TIMER0X
	.align	2
	.type	TIMER0X, %object
	.size	TIMER0X, 4
TIMER0X:
	.word	270409740
	.text
	.align	2
	.global	print_uart0
	.type	print_uart0, %function
print_uart0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, .L4
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-8]
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L5:
	.align	2
.L4:
	.word	UART0DR
	.size	print_uart0, .-print_uart0
	.align	2
	.global	end_irq
	.type	end_irq, %function
end_irq:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
.L8:
	.align	2
.L7:
	.word	TIMER0X
	.size	end_irq, .-end_irq
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Instru\303\247\303\243o inv\303\241lida\000"
	.text
	.align	2
	.global	c_entry
	.type	c_entry, %function
c_entry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L10
	bl	print_uart0
	bl	end_irq
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LC0
	.size	c_entry, .-c_entry
	.ident	"GCC: (Sourcery G++ Lite 2011.03-42) 4.5.2"
