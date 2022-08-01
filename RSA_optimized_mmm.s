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
	.file	"RSA_optimized_mmm.c"
	.text
	.global	__aeabi_uldivmod
	.align	1
	.global	optimized_mod_exp
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	optimized_mod_exp, %function
optimized_mod_exp:
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, fp
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7, lr}
	sub	sp, sp, #36
	str	r0, [sp, #8]
	mov	r9, r1
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	ldr	r6, [sp, #72]
	ldr	r5, [sp, #76]
	movs	r3, r6
	orrs	r3, r5
	bne	.LCB20
	b	.L2	@long jump
.LCB20:
	movs	r1, r6
	movs	r4, r5
	movs	r7, #0
.L4:
	movs	r0, r7
	adds	r7, r7, #1
	lsls	r2, r4, #31
	lsrs	r3, r1, #1
	orrs	r3, r2
	lsrs	r2, r4, #1
	movs	r1, r3
	movs	r4, r2
	orrs	r3, r2
	bne	.L4
	mov	r8, r0
	str	r1, [sp]
	lsls	r3, r7, #1
	movs	r0, #1
	lsls	r0, r0, r3
	asrs	r1, r0, #31
	movs	r2, r6
	movs	r3, r5
	bl	__aeabi_uldivmod
	cmp	r7, #0
	bgt	.LCB49
	b	.L5	@long jump
.LCB49:
	movs	r3, #0
	movs	r0, #0
	movs	r4, #1
	str	r2, [sp, #4]
	ldr	r1, [sp]
	str	r1, [sp, #12]
	str	r6, [sp]
	mov	r10, r6
	mov	ip, r5
	mov	r5, r8
	mov	r8, r7
	b	.L10
.L8:
	cmp	r7, r6
	beq	.L61
	ldr	r6, [sp]
.L9:
	adds	r1, r1, r3
	adds	r1, r1, r6
	asrs	r3, r1, #1
	adds	r1, r0, #1
	cmp	r5, r0
	ble	.L94
	movs	r0, r1
.L10:
	movs	r1, r4
	lsrs	r1, r1, r0
	cmp	r0, #32
	bmi	.L7
	movs	r1, #0
.L7:
	ands	r1, r4
	movs	r7, r4
	ands	r7, r3
	movs	r6, r1
	ands	r6, r2
	cmp	r1, #0
	beq	.L8
	ldr	r1, [sp, #4]
	b	.L8
.L61:
	ldr	r6, [sp, #12]
	b	.L9
.L94:
	mov	r7, r8
	mov	r6, r10
	mov	r5, ip
	str	r3, [sp, #20]
	asrs	r1, r3, #31
	mov	r8, r1
	cmp	r5, r1
	bhi	.L11
	beq	.L95
.L77:
	subs	r3, r3, r6
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r5, r1
	bhi	.L73
	bne	.L77
	cmp	r6, r3
	bls	.L77
.L73:
	str	r0, [sp, #20]
	mov	r8, r1
	cmp	r7, #0
	bgt	.LCB129
	b	.L15	@long jump
.LCB129:
.L11:
	movs	r3, #0
	movs	r0, #0
	movs	r1, #32
	mov	fp, r1
	movs	r4, #1
	str	r2, [sp, #4]
	str	r6, [sp]
	mov	ip, r6
	movs	r6, r2
	mov	r10, r5
	b	.L20
.L95:
	cmp	r6, r3
	bls	.L77
	b	.L11
.L16:
	mov	r2, fp
	subs	r2, r2, r0
	mov	r1, r9
	lsls	r1, r1, r2
	movs	r2, r1
	ldr	r1, [sp, #8]
	lsrs	r1, r1, r0
	orrs	r1, r2
	b	.L17
.L18:
	cmp	r5, r2
	beq	.L63
	ldr	r2, [sp]
.L19:
	adds	r3, r1, r3
	adds	r3, r3, r2
	asrs	r3, r3, #1
	adds	r0, r0, #1
	cmp	r0, r7
	beq	.L96
.L20:
	movs	r2, #32
	rsbs	r2, r2, #0
	adds	r2, r0, r2
	bmi	.L16
	mov	r1, r9
	lsrs	r1, r1, r2
.L17:
	ands	r1, r4
	movs	r5, r4
	ands	r5, r3
	movs	r2, r6
	ands	r2, r1
	cmp	r1, #0
	beq	.L18
	ldr	r1, [sp, #4]
	b	.L18
.L63:
	movs	r2, #0
	b	.L19
.L96:
	mov	r6, ip
	mov	r5, r10
	str	r3, [sp]
	asrs	r4, r3, #31
	cmp	r5, r4
	bhi	.L21
	beq	.L97
.L78:
	subs	r3, r3, r6
	asrs	r4, r3, #31
	cmp	r5, r4
	bhi	.L86
	bne	.L78
	cmp	r6, r3
	bls	.L78
	str	r3, [sp]
	b	.L60
.L97:
	cmp	r6, r3
	bls	.L78
	b	.L21
.L86:
	str	r3, [sp]
.L60:
	cmp	r7, #0
	bgt	.LCB234
	b	.L64	@long jump
.LCB234:
.L21:
	movs	r3, #0
	str	r3, [sp, #16]
	adds	r3, r3, #1
	mov	ip, r3
	movs	r3, #0
	str	r3, [sp, #12]
	str	r6, [sp, #4]
	mov	r9, r7
	b	.L45
.L103:
	ldr	r3, [sp]
	mov	fp, r3
	movs	r3, #0
	movs	r1, #0
	mov	r2, fp
	str	r2, [sp, #8]
	mov	r7, r9
	mov	r10, r6
	mov	r9, r5
	mov	r5, r8
	mov	r8, r4
	movs	r4, r3
	mov	r3, fp
	b	.L32
.L28:
	movs	r2, #32
	subs	r2, r2, r1
	movs	r0, r5
	lsls	r0, r0, r2
	movs	r2, r0
	ldr	r0, [sp, #20]
	lsrs	r0, r0, r1
	orrs	r0, r2
	b	.L29
.L30:
	cmp	r6, r0
	beq	.L65
	ldr	r0, [sp, #4]
.L31:
	adds	r2, r2, r4
	adds	r2, r2, r0
	asrs	r4, r2, #1
	adds	r1, r1, #1
	cmp	r1, r7
	beq	.L98
.L32:
	movs	r2, #32
	rsbs	r2, r2, #0
	adds	r2, r1, r2
	bmi	.L28
	movs	r0, r5
	lsrs	r0, r0, r2
.L29:
	mov	r2, ip
	ands	r2, r0
	mov	r6, ip
	ands	r6, r4
	movs	r0, r2
	ands	r0, r3
	cmp	r2, #0
	beq	.L30
	ldr	r2, [sp, #8]
	b	.L30
.L65:
	ldr	r0, [sp, #12]
	b	.L31
.L98:
	movs	r3, r4
	mov	r4, r8
	mov	r6, r10
	mov	r5, r9
	mov	r9, r7
	str	r3, [sp, #20]
	asrs	r2, r3, #31
	mov	r8, r2
	cmp	r5, r2
	bhi	.L26
	beq	.L99
.L79:
	subs	r3, r3, r6
	asrs	r2, r3, #31
	cmp	r5, r2
	bhi	.L88
	bne	.L79
	cmp	r6, r3
	bls	.L79
	str	r3, [sp, #20]
	mov	r8, r2
	b	.L26
.L99:
	cmp	r6, r3
	bls	.L79
	b	.L26
.L88:
	str	r3, [sp, #20]
	mov	r8, r2
	b	.L26
.L36:
	movs	r2, #32
	subs	r2, r2, r1
	movs	r0, r5
	lsls	r0, r0, r2
	movs	r2, r0
	ldr	r0, [sp]
	lsrs	r0, r0, r1
	orrs	r0, r2
	b	.L37
.L38:
	cmp	r6, r0
	beq	.L66
	ldr	r0, [sp, #4]
.L39:
	adds	r2, r2, r3
	adds	r2, r2, r0
	asrs	r3, r2, #1
	adds	r0, r1, #1
	cmp	r0, r7
	beq	.L100
	movs	r1, r0
.L40:
	movs	r2, #32
	rsbs	r2, r2, #0
	adds	r2, r1, r2
	bmi	.L36
	movs	r0, r5
	lsrs	r0, r0, r2
.L37:
	mov	r2, ip
	ands	r2, r0
	mov	r6, ip
	ands	r6, r3
	movs	r0, r2
	ands	r0, r4
	cmp	r2, #0
	beq	.L38
	ldr	r2, [sp, #8]
	b	.L38
.L66:
	ldr	r0, [sp, #12]
	b	.L39
.L100:
	mov	r6, r10
	mov	r5, r9
	mov	r9, r7
	str	r3, [sp]
	asrs	r4, r3, #31
	cmp	r5, r4
	bhi	.L41
	beq	.L101
.L80:
	subs	r3, r3, r6
	asrs	r4, r3, #31
	cmp	r5, r4
	bhi	.L90
	bne	.L80
	cmp	r6, r3
	bls	.L80
	str	r3, [sp]
	b	.L41
.L101:
	cmp	r6, r3
	bls	.L80
	b	.L41
.L90:
	str	r3, [sp]
.L41:
	ldr	r2, [sp, #16]
	adds	r3, r2, #1
	cmp	r2, r1
	beq	.L102
	str	r3, [sp, #16]
.L45:
	mov	r3, ip
	ldr	r2, [sp, #16]
	lsls	r3, r3, r2
	asrs	r2, r3, #31
	ldr	r1, [sp, #24]
	ands	r3, r1
	ldr	r1, [sp, #28]
	ands	r2, r1
	orrs	r3, r2
	beq	.LCB460
	b	.L103	@long jump
.LCB460:
.L26:
	ldr	r3, [sp]
	mov	fp, r3
	movs	r3, #0
	movs	r1, #0
	mov	r2, fp
	str	r2, [sp, #8]
	mov	r7, r9
	mov	r10, r6
	mov	r9, r5
	movs	r5, r4
	mov	r4, fp
	b	.L40
.L49:
	cmp	r7, r1
	beq	.L69
	ldr	r1, [sp]
.L50:
	adds	r2, r2, r3
	adds	r2, r2, r1
	asrs	r3, r2, #1
	adds	r2, r0, #1
	cmp	r6, r0
	beq	.L104
	movs	r0, r2
.L51:
	movs	r2, r4
	lsrs	r2, r2, r0
	cmp	r0, #32
	bmi	.L48
	movs	r2, #0
.L48:
	ands	r2, r4
	movs	r7, r4
	ands	r7, r3
	movs	r1, r5
	ands	r1, r2
	cmp	r2, #0
	beq	.L49
	ldr	r2, [sp, #4]
	b	.L49
.L69:
	movs	r1, #0
	b	.L50
.L104:
	mov	r6, ip
	mov	r5, r8
.L25:
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r5, r1
	bhi	.L1
	beq	.L105
.L81:
	subs	r3, r3, r6
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r5, r1
	bhi	.L1
	bne	.L81
	cmp	r6, r3
	bls	.L81
.L1:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7, pc}
.L64:
	movs	r3, #0
	b	.L25
.L105:
	cmp	r6, r3
	bls	.L81
	b	.L1
.L102:
	ldr	r7, [sp, #20]
	movs	r3, #0
	movs	r0, #0
	movs	r4, #1
	str	r7, [sp, #4]
	str	r6, [sp]
	mov	ip, r6
	movs	r6, r1
	mov	r8, r5
	movs	r5, r7
	b	.L51
.L2:
	movs	r2, #0
	movs	r3, #0
	movs	r0, #1
	movs	r1, #0
	bl	__aeabi_uldivmod
	movs	r3, #0
	movs	r7, #0
	b	.L77
.L15:
	movs	r3, #0
	movs	r2, r6
	orrs	r2, r5
	bne	.LCB595
	b	.L78	@long jump
.LCB595:
	b	.L25
.L5:
	movs	r3, r6
	orrs	r3, r5
	bne	.L106
	str	r6, [sp, #20]
	mov	r8, r5
	movs	r3, #0
	b	.L78
.L106:
	ldr	r3, [sp]
	str	r3, [sp, #20]
	mov	r8, r4
	b	.L60
	.size	optimized_mod_exp, .-optimized_mod_exp
	.align	1
	.global	optimized_encrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	optimized_encrypt, %function
optimized_encrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L108
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r2, #17
	movs	r3, #0
	bl	optimized_mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L109:
	.align	2
.L108:
	.word	3233
	.size	optimized_encrypt, .-optimized_encrypt
	.align	1
	.global	optimized_decrypt
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	optimized_decrypt, %function
optimized_decrypt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #12
	ldr	r2, .L111
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r2, .L111+4
	movs	r3, #0
	bl	optimized_mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L112:
	.align	2
.L111:
	.word	3233
	.word	2753
	.size	optimized_decrypt, .-optimized_decrypt
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
	.global	optimized_encrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	optimized_encrypt_file, %function
optimized_encrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L122
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L119
	cmp	r1, #0
	beq	.L119
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
	bne	.L116
.L117:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	optimized_encrypt
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
	beq	.L117
.L116:
	ldr	r3, .L122
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L121
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L119:
	ldr	r1, .L122+4
	movs	r0, #1
	bl	__printf_chk
	b	.L116
.L121:
	bl	__stack_chk_fail
.L123:
	.align	2
.L122:
	.word	.LC2
	.word	.LC0
	.size	optimized_encrypt_file, .-optimized_encrypt_file
	.section	.rodata.cst4
	.align	2
.LC4:
	.word	__stack_chk_guard
	.text
	.align	1
	.global	optimized_decrypt_file
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	optimized_decrypt_file, %function
optimized_decrypt_file:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	movs	r4, r0
	movs	r5, r1
	ldr	r3, .L133
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L130
	cmp	r1, #0
	beq	.L130
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L127
.L128:
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	bl	optimized_decrypt
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
	beq	.L128
.L127:
	ldr	r3, .L133
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L132
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L130:
	ldr	r1, .L133+4
	movs	r0, #1
	bl	__printf_chk
	b	.L127
.L132:
	bl	__stack_chk_fail
.L134:
	.align	2
.L133:
	.word	.LC4
	.word	.LC0
	.size	optimized_decrypt_file, .-optimized_decrypt_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
