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
	ble	.L146
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
	b	.L141
.L137:
	mov	r3, fp
	subs	r2, r3, r5
	ldr	r3, [sp, #4]
	lsls	r3, r3, r2
	mov	r1, r9
	lsrs	r1, r1, r5
	orrs	r1, r3
	b	.L138
.L139:
	cmp	r10, r1
	beq	.L147
	ldr	r1, [sp, #8]
.L140:
	adds	r2, r2, r6
	adds	r2, r2, r1
	asrs	r6, r2, #1
	adds	r5, r5, #1
	cmp	r4, r5
	beq	.L152
.L141:
	movs	r3, #32
	rsbs	r3, r3, #0
	adds	r2, r5, r3
	bmi	.L137
	ldr	r3, [sp, #4]
	lsrs	r3, r3, r2
	movs	r1, r3
.L138:
	movs	r2, r1
	ands	r2, r7
	movs	r1, r7
	ands	r1, r6
	movs	r3, r2
	ands	r3, r0
	mov	r10, r3
	cmp	r2, #0
	beq	.L139
	ldr	r2, [sp, #12]
	b	.L139
.L147:
	movs	r1, #0
	b	.L140
.L152:
	movs	r3, r6
	mov	r6, ip
.L136:
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r6, r1
	bhi	.L135
	mov	r2, r8
	beq	.L153
.L149:
	subs	r3, r3, r2
	movs	r0, r3
	asrs	r1, r3, #31
	cmp	r6, r1
	bhi	.L135
	bne	.L149
	cmp	r2, r3
	bls	.L149
.L135:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7, pc}
.L146:
	movs	r3, #0
	b	.L136
.L153:
	cmp	r8, r3
	bls	.L149
	b	.L135
	.size	mod_mul, .-mod_mul
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
	beq	.L155
	mov	r0, r8
	movs	r6, #0
.L157:
	str	r6, [sp, #16]
	adds	r6, r6, #1
	lsls	r1, r2, #31
	lsrs	r3, r0, #1
	orrs	r3, r1
	lsrs	r1, r2, #1
	movs	r0, r3
	movs	r2, r1
	orrs	r3, r1
	bne	.L157
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
	ble	.L158
	movs	r7, #0
	movs	r3, #1
	mov	fp, r3
	b	.L161
.L159:
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
	ble	.L158
	movs	r7, r3
.L161:
	mov	r3, fp
	lsls	r3, r3, r7
	asrs	r2, r3, #31
	mov	r1, r10
	ands	r3, r1
	ldr	r1, [sp, #20]
	ands	r2, r1
	orrs	r3, r2
	beq	.L159
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
	b	.L159
.L155:
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
.L158:
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
	ldr	r2, .L166
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	movs	r2, #17
	movs	r3, #0
	bl	mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L167:
	.align	2
.L166:
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
	ldr	r2, .L169
	movs	r3, #0
	str	r2, [sp]
	str	r3, [sp, #4]
	ldr	r2, .L169+4
	movs	r3, #0
	bl	mod_exp
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L170:
	.align	2
.L169:
	.word	3233
	.word	2753
	.size	decrypt, .-decrypt
	.section	.rodata.cst4
	.align	2
.LC6:
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
	ldr	r3, .L180
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L177
	cmp	r1, #0
	beq	.L177
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
	bne	.L174
.L175:
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
	beq	.L175
.L174:
	ldr	r3, .L180
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L179
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L177:
	ldr	r1, .L180+4
	movs	r0, #1
	bl	__printf_chk
	b	.L174
.L179:
	bl	__stack_chk_fail
.L181:
	.align	2
.L180:
	.word	.LC6
	.word	.LC0
	.size	encrypt_file, .-encrypt_file
	.section	.rodata.cst4
	.align	2
.LC8:
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
	ldr	r3, .L191
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L188
	cmp	r1, #0
	beq	.L188
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L185
.L186:
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
	beq	.L186
.L185:
	ldr	r3, .L191
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L190
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L188:
	ldr	r1, .L191+4
	movs	r0, #1
	bl	__printf_chk
	b	.L185
.L190:
	bl	__stack_chk_fail
.L192:
	.align	2
.L191:
	.word	.LC8
	.word	.LC0
	.size	decrypt_file, .-decrypt_file
	.global	__aeabi_lmul
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
	beq	.L197
	movs	r6, #0
	movs	r0, #1
	movs	r1, #0
.L196:
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
	bne	.L196
.L194:
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
.L197:
	movs	r0, #1
	movs	r1, #0
	b	.L194
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
.L200:
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_lmul
	ldr	r2, .L202
	movs	r3, #0
	bl	__aeabi_uldivmod
	adds	r4, r4, r6
	adcs	r5, r5, r7
	movs	r1, r4
	orrs	r1, r5
	bne	.L200
	movs	r0, r2
	movs	r1, r3
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7, pc}
.L203:
	.align	2
.L202:
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
	ldr	r4, .L207
	movs	r5, #0
	movs	r2, #1
	movs	r3, #0
	movs	r6, #1
	rsbs	r6, r6, #0
	asrs	r7, r6, #31
.L205:
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_lmul
	ldr	r2, .L207+4
	movs	r3, #0
	bl	__aeabi_uldivmod
	adds	r4, r4, r6
	adcs	r5, r5, r7
	movs	r1, r4
	orrs	r1, r5
	bne	.L205
	movs	r0, r2
	movs	r1, r3
	@ sp needed
	pop	{r6, r7}
	mov	r9, r7
	mov	r8, r6
	pop	{r3, r4, r5, r6, r7, pc}
.L208:
	.align	2
.L207:
	.word	2753
	.word	3233
	.size	initial_decrypt, .-initial_decrypt
	.section	.rodata.cst4
	.align	2
.LC10:
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
	ldr	r3, .L218
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L215
	cmp	r1, #0
	beq	.L215
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
	bne	.L212
.L213:
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
	beq	.L213
.L212:
	ldr	r3, .L218
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L217
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L215:
	ldr	r1, .L218+4
	movs	r0, #1
	bl	__printf_chk
	b	.L212
.L217:
	bl	__stack_chk_fail
.L219:
	.align	2
.L218:
	.word	.LC10
	.word	.LC0
	.size	initial_encrypt_file, .-initial_encrypt_file
	.section	.rodata.cst4
	.align	2
.LC12:
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
	ldr	r3, .L229
	ldr	r3, [r3]
	str	r3, [sp, #20]
	movs	r3,#0
	cmp	r0, #0
	beq	.L226
	cmp	r1, #0
	beq	.L226
	movs	r3, r0
	movs	r2, #1
	movs	r1, #8
	mov	r0, sp
	bl	fread
	cmp	r0, #1
	bne	.L223
.L224:
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
	beq	.L224
.L223:
	ldr	r3, .L229
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	movs	r3, #0
	cmp	r2, #0
	bne	.L228
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L226:
	ldr	r1, .L229+4
	movs	r0, #1
	bl	__printf_chk
	b	.L223
.L228:
	bl	__stack_chk_fail
.L230:
	.align	2
.L229:
	.word	.LC12
	.word	.LC0
	.size	initial_decrypt_file, .-initial_decrypt_file
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
