	.arch armv5t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"RSA.c"
	.text
	.global	__aeabi_lmul
	.global	__aeabi_uldivmod
	.align	1
	.global	initial_mod_exp
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	initial_mod_exp, %function
initial_mod_exp:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	lr, r9
	mov	r7, r8
	push	{r7, lr}
	mov	r8, r0
	mov	r9, r1
	movs	r7, r2
	ldr	r4, [sp, #32]
	ldr	r5, [sp, #36]
	orrs	r3, r2
	beq	.L5
	movs	r6, #0
	movs	r0, #1
	movs	r1, #0
.L4:
	movs	r2, r0
	movs	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_lmul
	movs	r2, r4
	movs	r3, r5
	bl	__aeabi_uldivmod
	movs	r0, r2
	movs	r1, r3
	adds	r6, r6, #1
	cmp	r7, r6
	bne	.L4
.L2:
	movs	r2, r4
	movs	r3, r5
	bl	__aeabi_uldivmod
	movs	r0, r2
	movs	r1, r3
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7, pc}
.L5:
	movs	r0, #1
	movs	r1, #0
	b	.L2
	.size	initial_mod_exp, .-initial_mod_exp
	.align	1
	.global	initial_encrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	initial_encrypt, %function
initial_encrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	lr, r9
	mov	r7, r8
	push	{r7, lr}
	mov	r9, r0
	mov	r8, r1
	movs	r4, #17
	movs	r5, #0
	movs	r2, #1
	movs	r3, #0
	movs	r6, #1
	rsbs	r6, r6, #0
	asrs	r7, r6, #31
.L8:
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_lmul
	ldr	r2, .L10
	movs	r3, #0
	bl	__aeabi_uldivmod
	adds	r4, r4, r6
	adcs	r5, r5, r7
	movs	r1, r4
	orrs	r1, r5
	bne	.L8
	movs	r0, r2
	movs	r1, r3
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7, pc}
.L11:
	.align	2
.L10:
	.word	3233
	.size	initial_encrypt, .-initial_encrypt
	.align	1
	.global	initial_decrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	initial_decrypt, %function
initial_decrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	lr, r9
	mov	r7, r8
	push	{r7, lr}
	mov	r9, r0
	mov	r8, r1
	ldr	r4, .L15
	movs	r5, #0
	movs	r2, #1
	movs	r3, #0
	movs	r6, #1
	rsbs	r6, r6, #0
	asrs	r7, r6, #31
.L13:
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_lmul
	ldr	r2, .L15+4
	movs	r3, #0
	bl	__aeabi_uldivmod
	adds	r4, r4, r6
	adcs	r5, r5, r7
	movs	r1, r4
	orrs	r1, r5
	bne	.L13
	movs	r0, r2
	movs	r1, r3
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7, pc}
.L16:
	.align	2
.L15:
	.word	2753
	.word	3233
	.size	initial_decrypt, .-initial_decrypt
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR: input file or output file is null\000"
	.section	.rodata.cst4,"aM",%progbits,4
	.align	2
.LC2:
	.word	__stack_chk_guard
	.text
	.align	1
	.global	initial_encrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	initial_encrypt_file, %function
initial_encrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L26
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L23
	cmp	r1, #0
	beq	.L23
	movs	r2, #0
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r3, r0
	adds	r2, r2, #1
	movs	r1, #1
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L20
.L21:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	initial_encrypt
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	movs	r3, r5
	movs	r2, #1
	movs	r1, #8
	add	r0, sp, #8
	bl	fwrite
	movs	r3, r4
	movs	r2, #1
	movs	r1, #1
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	beq	.L21
.L20:
	ldr	r3, .L26
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L25
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L23:
	ldr	r1, .L26+4
	movs	r0, #1
	bl	__printf_chk
	b	.L20
.L25:
	bl	__stack_chk_fail
.L27:
	.align	2
.L26:
	.word	.LC2
	.word	.LC0
	.size	initial_encrypt_file, .-initial_encrypt_file
	.section	.rodata.cst4
	.align	2
.LC4:
	.word	__stack_chk_guard
	.text
	.align	1
	.global	initial_decrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	initial_decrypt_file, %function
initial_decrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L37
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L34
	cmp	r1, #0
	beq	.L34
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L31
.L32:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	initial_decrypt
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	movs	r3, r5
	movs	r2, #1
	movs	r1, #1
	add	r0, sp, #8
	bl	fwrite
	movs	r3, r4
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	beq	.L32
.L31:
	ldr	r3, .L37
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L36
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L34:
	ldr	r1, .L37+4
	movs	r0, #1
	bl	__printf_chk
	b	.L31
.L36:
	bl	__stack_chk_fail
.L38:
	.align	2
.L37:
	.word	.LC4
	.word	.LC0
	.size	initial_decrypt_file, .-initial_decrypt_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
