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
	.file	"RSA_plain_mmm.c"
	.text
	.align	1
	.global	mod_mul
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	mod_mul, %function
mod_mul:
	@ args = 12, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	sub	sp, sp, #20
	mov	r9, r0
	ldr	r3, [sp, #56]
	mov	r8, r3
	ldr	r6, [sp, #60]
	ldr	r3, [sp, #64]
	mov	r10, r3
	movs	r0, r2
	cmp	r3, #0
	ble	.L12
	movs	r3, #0
	movs	r5, #0
	movs	r2, #32
	mov	fp, r2
	movs	r7, #1
	str	r0, [sp, #12]
	mov	r2, r8
	str	r2, [sp, #8]
	mov	r4, r10
	movs	r2, r6
	movs	r6, r3
	str	r1, [sp, #4]
	mov	ip, r2
	b	.L7
.L3:
	mov	r3, fp
	subs	r2, r3, r5
	ldr	r3, [sp, #4]
	lsls	r3, r3, r2
	mov	r1, r9
	lsrs	r1, r1, r5
	orrs	r1, r3
	b	.L4
.L5:
	cmp	r10, r1
	beq	.L13
	ldr	r1, [sp, #8]
.L6:
	adds	r2, r2, r6
	adds	r2, r2, r1
	asrs	r6, r2, #1
	adds	r5, r5, #1
	cmp	r4, r5
	beq	.L18
.L7:
	movs	r3, #32
	rsbs	r3, r3, #0
	adds	r2, r5, r3
	bmi	.L3
	ldr	r3, [sp, #4]
	lsrs	r3, r3, r2
	movs	r1, r3
.L4:
	movs	r2, r1
	ands	r2, r7
	movs	r1, r7
	ands	r1, r6
	movs	r3, r2
	ands	r3, r0
	mov	r10, r3
	cmp	r2, #0
	beq	.L5
	ldr	r2, [sp, #12]
	b	.L5
.L13:
	movs	r1, #0
	b	.L6
.L18:
	movs	r3, r6
	mov	r6, ip
.L2:
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r6, r1
	bhi	.L1
	mov	r2, r8
	beq	.L19
.L15:
	subs	r3, r3, r2
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r6, r1
	bhi	.L1
	bne	.L15
	cmp	r2, r3
	bls	.L15
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7, pc}
.L12:
	movs	r3, #0
	b	.L2
.L19:
	cmp	r8, r3
	bls	.L15
	b	.L1
	.size	mod_mul, .-mod_mul
	.global	__aeabi_uldivmod
	.align	1
	.global	mod_exp
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	mod_exp, %function
mod_exp:
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	sub	sp, sp, #36
	mov	fp, r0
	movs	r7, r1
	mov	r10, r2
	str	r3, [sp, #20]
	ldr	r3, [sp, #72]
	mov	r8, r3
	ldr	r3, [sp, #76]
	mov	r9, r3
	mov	r3, r8
	mov	r2, r9
	orrs	r3, r2
	beq	.L21
	mov	r0, r8
	movs	r6, #0
.L23:
	str	r6, [sp, #16]
	adds	r6, r6, #1
	lsls	r1, r2, #31
	lsrs	r3, r0, #1
	orrs	r3, r1
	lsrs	r1, r2, #1
	movs	r0, r3
	movs	r2, r1
	orrs	r3, r1
	bne	.L23
	lsls	r3, r6, #1
	movs	r0, #1
	lsls	r0, r0, r3
	asrs	r1, r0, #31
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_uldivmod
	movs	r5, r2
	movs	r4, r3
	str	r6, [sp, #8]
	mov	r3, r8
	str	r3, [sp]
	mov	r3, r9
	str	r3, [sp, #4]
	movs	r2, r5
	movs	r3, r4
	movs	r0, #1
	movs	r1, #0
	bl	mod_mul
	str	r0, [sp, #24]
	str	r1, [sp, #28]
	str	r6, [sp, #8]
	mov	r3, r8
	str	r3, [sp]
	mov	r3, r9
	str	r3, [sp, #4]
	movs	r2, r5
	movs	r3, r4
	mov	r0, fp
	movs	r1, r7
	bl	mod_mul
	movs	r4, r0
	movs	r5, r1
	cmp	r6, #0
	ble	.L24
	movs	r7, #0
	movs	r3, #1
	mov	fp, r3
	b	.L27
.L25:
	str	r6, [sp, #8]
	mov	r3, r8
	str	r3, [sp]
	mov	r3, r9
	str	r3, [sp, #4]
	movs	r2, r4
	movs	r3, r5
	movs	r0, r4
	movs	r1, r5
	bl	mod_mul
	movs	r4, r0
	movs	r5, r1
	adds	r3, r7, #1
	ldr	r2, [sp, #16]
	cmp	r2, r7
	ble	.L24
	movs	r7, r3
.L27:
	mov	r3, fp
	lsls	r3, r3, r7
	asrs	r2, r3, #31
	mov	r1, r10
	ands	r3, r1
	ldr	r1, [sp, #20]
	ands	r2, r1
	orrs	r3, r2
	beq	.L25
	str	r6, [sp, #8]
	mov	r3, r8
	str	r3, [sp]
	mov	r3, r9
	str	r3, [sp, #4]
	movs	r2, r4
	movs	r3, r5
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #28]
	bl	mod_mul
	str	r0, [sp, #24]
	str	r1, [sp, #28]
	b	.L25
.L21:
	movs	r2, #0
	movs	r3, #0
	movs	r0, #1
	movs	r1, #0
	bl	__aeabi_uldivmod
	mov	r10, r2
	movs	r4, #0
	str	r4, [sp, #8]
	movs	r5, #0
	movs	r6, #0
	str	r5, [sp]
	str	r6, [sp, #4]
	str	r3, [sp, #16]
	movs	r0, #1
	movs	r1, #0
	bl	mod_mul
	str	r0, [sp, #24]
	str	r1, [sp, #28]
	str	r4, [sp, #8]
	str	r5, [sp]
	str	r6, [sp, #4]
	mov	r2, r10
	ldr	r3, [sp, #16]
	mov	r0, fp
	movs	r1, r7
	bl	mod_mul
	movs	r6, #0
.L24:
	str	r6, [sp, #8]
	mov	r3, r8
	str	r3, [sp]
	mov	r3, r9
	str	r3, [sp, #4]
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	movs	r0, #1
	movs	r1, #0
	bl	mod_mul
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7, pc}
	.size	mod_exp, .-mod_exp
	.align	1
	.global	encrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	encrypt, %function
encrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L32
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r2, #17
	movs	r3, #0
	bl	mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L33:
	.align	2
.L32:
	.word	3233
	.size	encrypt, .-encrypt
	.align	1
	.global	decrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	decrypt, %function
decrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L35
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r2, .L35+4
	movs	r3, #0
	bl	mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L36:
	.align	2
.L35:
	.word	3233
	.word	2753
	.size	decrypt, .-decrypt
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
	.global	encrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	encrypt_file, %function
encrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L46
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L43
	cmp	r1, #0
	beq	.L43
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
	bne	.L40
.L41:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	encrypt
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
	beq	.L41
.L40:
	ldr	r3, .L46
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L45
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L43:
	ldr	r1, .L46+4
	movs	r0, #1
	bl	__printf_chk
	b	.L40
.L45:
	bl	__stack_chk_fail
.L47:
	.align	2
.L46:
	.word	.LC2
	.word	.LC0
	.size	encrypt_file, .-encrypt_file
	.section	.rodata.cst4
	.align	2
.LC4:
	.word	__stack_chk_guard
	.text
	.align	1
	.global	decrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	decrypt_file, %function
decrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L57
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L54
	cmp	r1, #0
	beq	.L54
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L51
.L52:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	decrypt
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
	beq	.L52
.L51:
	ldr	r3, .L57
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L56
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L54:
	ldr	r1, .L57+4
	movs	r0, #1
	bl	__printf_chk
	b	.L51
.L56:
	bl	__stack_chk_fail
.L58:
	.align	2
.L57:
	.word	.LC4
	.word	.LC0
	.size	decrypt_file, .-decrypt_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
