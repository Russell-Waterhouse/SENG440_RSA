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
	.file	"RSA_hardware_assist.c"
	.text
	.global	__aeabi_uldivmod
	.align	1
	.global	hw_assist_mod_exp
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	hw_assist_mod_exp, %function
hw_assist_mod_exp:
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	sub	sp, sp, #28
	str	r0, [sp]
	str	r1, [sp, #4]
	mov	r10, r2
	mov	fp, r3
	ldr	r4, [sp, #64]
	ldr	r5, [sp, #68]
	str	r4, [sp, #16]
	str	r5, [sp, #20]
	movs	r3, r4
	movs	r2, r5
	orrs	r3, r5
	beq	.L2
	movs	r0, r4
	movs	r6, #0
.L4:
	movs	r7, r6
	adds	r6, r6, #1
	lsls	r1, r2, #31
	lsrs	r3, r0, #1
	orrs	r3, r1
	lsrs	r1, r2, #1
	movs	r0, r3
	movs	r2, r1
	orrs	r3, r1
	bne	.L4
	mov	r9, r7
	str	r4, [sp, #16]
	str	r5, [sp, #20]
	lsls	r3, r6, #1
	movs	r0, #1
	lsls	r0, r0, r3
	asrs	r1, r0, #31
	movs	r2, r4
	movs	r3, r5
	bl	__aeabi_uldivmod
	movs	r0, #1
	movs	r1, #0
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r7, r0, r2, r4
@ 0 "" 2
	.thumb
	.syntax unified
	str	r7, [sp, #8]
	asrs	r1, r7, #31
	str	r1, [sp, #12]
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r3, r0, r2, r4
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r6, #0
	ble	.L5
	movs	r7, #0
	movs	r3, #1
	mov	ip, r3
	mov	r3, r9
	str	r3, [sp]
	mov	r8, r6
	movs	r2, r7
	ldr	r6, [sp, #8]
	ldr	r7, [sp, #12]
	str	r4, [sp, #64]
	str	r5, [sp, #68]
	b	.L8
.L6:
	ldr	r3, [sp, #64]
	ldr	r4, [sp, #68]
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r3, r0, r0, r3
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, r3
	asrs	r1, r3, #31
	adds	r3, r2, #1
	ldr	r4, [sp]
	cmp	r4, r2
	ble	.L12
	movs	r2, r3
.L8:
	mov	r3, ip
	lsls	r3, r3, r2
	asrs	r4, r3, #31
	mov	r9, r4
	mov	r4, r10
	ands	r3, r4
	mov	r4, r9
	mov	r5, fp
	ands	r4, r5
	orrs	r3, r4
	beq	.L6
	ldr	r3, [sp, #64]
	ldr	r4, [sp, #68]
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r3, r6, r0, r3
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r6, r3
	asrs	r7, r3, #31
	b	.L6
.L12:
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	mov	r6, r8
	ldr	r3, [sp, #64]
	ldr	r4, [sp, #68]
	str	r3, [sp, #16]
	str	r4, [sp, #20]
.L5:
	movs	r0, #1
	movs	r1, #0
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #12]
	ldr	r4, [sp, #16]
	ldr	r5, [sp, #20]
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r0, r0, r2, r4
@ 0 "" 2
	.thumb
	.syntax unified
	asrs	r1, r0, #31
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7, pc}
.L2:
	movs	r2, #0
	movs	r3, #0
	movs	r0, #1
	movs	r1, #0
	bl	__aeabi_uldivmod
	movs	r0, #1
	movs	r1, #0
	movs	r6, #0
	movs	r4, #0
	movs	r5, #0
	.syntax divided
@ 25 "RSA_hardware_assist.c" 1
	hw_assist_mod_mul_asm r2, r0, r2, r4
@ 0 "" 2
	.thumb
	.syntax unified
	str	r2, [sp, #8]
	asrs	r3, r2, #31
	str	r3, [sp, #12]
	b	.L5
	.size	hw_assist_mod_exp, .-hw_assist_mod_exp
	.align	1
	.global	hw_assist_encrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	hw_assist_encrypt, %function
hw_assist_encrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L14
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r2, #17
	movs	r3, #0
	bl	hw_assist_mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L15:
	.align	2
.L14:
	.word	3233
	.size	hw_assist_encrypt, .-hw_assist_encrypt
	.align	1
	.global	hw_assist_decrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	hw_assist_decrypt, %function
hw_assist_decrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L17
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r2, .L17+4
	movs	r3, #0
	bl	hw_assist_mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L18:
	.align	2
.L17:
	.word	3233
	.word	2753
	.size	hw_assist_decrypt, .-hw_assist_decrypt
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
	.global	hw_assist_encrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	hw_assist_encrypt_file, %function
hw_assist_encrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L28
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L25
	cmp	r1, #0
	beq	.L25
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
	bne	.L22
.L23:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	hw_assist_encrypt
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
	beq	.L23
.L22:
	ldr	r3, .L28
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L27
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L25:
	ldr	r1, .L28+4
	movs	r0, #1
	bl	__printf_chk
	b	.L22
.L27:
	bl	__stack_chk_fail
.L29:
	.align	2
.L28:
	.word	.LC2
	.word	.LC0
	.size	hw_assist_encrypt_file, .-hw_assist_encrypt_file
	.section	.rodata.cst4
	.align	2
.LC4:
	.word	__stack_chk_guard
	.text
	.align	1
	.global	hw_assist_decrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	hw_assist_decrypt_file, %function
hw_assist_decrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L39
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L36
	cmp	r1, #0
	beq	.L36
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L33
.L34:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	hw_assist_decrypt
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
	beq	.L34
.L33:
	ldr	r3, .L39
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L38
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L36:
	ldr	r1, .L39+4
	movs	r0, #1
	bl	__printf_chk
	b	.L33
.L38:
	bl	__stack_chk_fail
.L40:
	.align	2
.L39:
	.word	.LC4
	.word	.LC0
	.size	hw_assist_decrypt_file, .-hw_assist_decrypt_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
