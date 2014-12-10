	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	mov	r5, #0
	tst	r2, #1
	strh	r5, [r3, #8]	@ movhi
	beq	.L2
	ldr	r1, .L9
	ldr	r2, .L9+4
	ldr	r3, [r1, #0]
	ldr	r4, .L9+8
	ldr	ip, [r2, #0]
	ldr	r0, [r4, #20]
	add	r3, r3, #1
	rsb	ip, ip, r3
	cmp	ip, r0
	str	r3, [r1, #0]
	movgt	r1, #67108864
	addgt	r1, r1, #256
	strgth	r5, [r1, #0]	@ movhi
	strgth	r5, [r1, #2]	@ movhi
	ldr	r1, .L9+12
	ldr	r0, [r1, #0]
	ldr	r1, .L9+16
	ldr	r1, [r1, #20]
	rsb	r0, r0, r3
	ldrle	r5, [r4, #12]
	strgt	r5, [r4, #12]
	cmp	r0, r1
	movgt	r1, #67108864
	addgt	r1, r1, #256
	movgt	r0, #0	@ movhi
	strgth	r0, [r1, #4]	@ movhi
	strgth	r0, [r1, #6]	@ movhi
	cmp	r5, #0
	beq	.L8
.L6:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r0, #1	@ movhi
	strh	r0, [r3, #2]	@ movhi
.L2:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L8:
	ldr	r1, .L9+20
	ldr	r7, [r1, #0]
	add	r6, r7, #12
	ldr	r1, [r4, #8]
	str	r3, [r2, #0]
	str	r5, [r6, #8]
	ldr	r3, .L9+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	ldr	ip, [r4, #0]
	mov	r1, #67108864
	rsb	r0, r0, #0
	mov	r2, #-1241513984
	add	r3, r1, #256
	add	r2, r2, #4194304
	mov	r0, r0, asl #16
	add	r1, r1, #160
	str	ip, [r7, #12]
	mov	r0, r0, lsr #16
	str	r1, [r6, #4]
	str	r2, [r6, #8]
	mov	r2, #128	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r0, [r3, #0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	mov	r3, #1
	str	r3, [r4, #12]
	b	.L6
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	vbCountA
	.word	soundA
	.word	vbCountB
	.word	soundB
	.word	.LANCHOR1
	.word	__aeabi_idiv
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #4]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR1
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	cmp	r2, #0
	sub	sp, sp, #12
	ble	.L14
	ldr	ip, .L18
	rsb	r0, r0, r0, asl #4
	ldmia	ip, {r4, ip}	@ phole ldm
	add	r1, r1, r0, asl #4
	add	r1, ip, r1, asl #1
	add	r0, r4, #36
	mov	ip, #0
	orr	r4, r3, #-2130706432
	add	r3, sp, #6
.L16:
	add	ip, ip, #1
	cmp	ip, r2
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	str	r4, [r0, #8]
	add	r1, r1, #480
	bne	.L16
.L14:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR1
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L20
	ldr	r5, .L24
	rsb	r1, r1, r1, asl #4
	ldr	ip, [r5, #0]
	ldr	r6, [r5, #4]
	add	r1, r2, r1, asl #4
	orr	r5, r4, #-2147483648
	add	ip, ip, #36
	mov	r4, r4, asl #1
	add	r1, r6, r1, asl #1
	mov	r2, #0
.L22:
	add	r2, r2, #1
	cmp	r2, r3
	str	r0, [ip, #0]
	str	r1, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r1, r1, #480
	bne	.L22
.L20:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR1
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	sub	sp, sp, #8
	ldr	r1, [r3, #0]
	ldr	r0, [r3, #4]
	mov	r3, #-2130706432
	add	r2, r1, #36
	add	r3, r3, #38400
	add	ip, sp, #6
	str	ip, [r1, #36]
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	add	sp, sp, #8
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR1
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	mov	r3, r0, asl #3
	ldr	r0, .L32
	add	ip, r1, r1, lsr #31
	add	r3, r3, ip, asr #1
	ldr	ip, [r0, #4]
	mov	r3, r3, asl #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	biceq	r1, r1, #255
	andne	r1, r1, #255
	orreq	r2, r2, r1
	orrne	r2, r1, r2, asl #8
	streqh	r2, [ip, r3]	@ movhi
	strneh	r2, [ip, r3]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR1
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #44
	ldrb	r4, [sp, #80]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #4]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #16]
	strh	r2, [sp, #38]	@ movhi
	ble	.L34
	rsb	r6, r0, r0, asl #4
	add	r7, r1, #1
	add	ip, r1, r1, lsr #31
	mov	r6, r6, asl #3
	add	r7, r7, r7, lsr #31
	add	r7, r6, r7, asr #1
	mov	r5, r0
	add	r6, r6, ip, asr #1
	add	r0, r3, r3, lsr #31
	ldr	ip, [sp, #16]
	mov	r0, r0, asr #1
	sub	r1, r0, #1
	sub	ip, ip, #1
	str	ip, [sp, #20]
	orr	r1, r1, #-2130706432
	mov	r2, r3, lsr #31
	str	r1, [sp, #28]
	ldr	r1, [sp, #20]
	add	fp, r3, r2
	ldr	r4, [sp, #16]
	and	fp, fp, #1
	mov	r7, r7, asl #1
	orr	r0, r0, #-2130706432
	add	r3, r1, r3
	and	r9, r4, #1
	ldr	sl, .L43
	str	r0, [sp, #12]
	rsb	fp, r2, fp
	mov	r6, r6, asl #1
	mov	r8, r7
	mov	r4, #0
	add	ip, sp, #38
	str	r3, [sp, #20]
	b	.L39
.L42:
	ldr	r2, [sl, #0]
	ldr	r1, [sl, #4]
	add	r3, r2, #36
	str	ip, [r2, #36]
	ldr	r2, [sp, #12]
	add	r1, r1, r6
	cmp	fp, #1
	str	r1, [r3, #4]
	str	r2, [r3, #8]
	beq	.L41
.L37:
	ldr	r1, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	add	r5, r5, #1
	add	r8, r8, #240
	add	r7, r7, #240
	add	r6, r6, #240
	ble	.L34
.L39:
	cmp	r9, #0
	beq	.L42
	mov	r0, r5
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	cmp	fp, #1
	mov	r0, r5
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #8]
	ldr	ip, [sp, #0]
	bne	.L38
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #0]
	add	r1, r1, r8
	add	r3, r2, #36
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	ldr	r1, [sp, #12]
	str	r1, [r3, #8]
	ldr	r1, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	add	r5, r5, #1
	add	r8, r8, #240
	add	r7, r7, #240
	add	r6, r6, #240
	bgt	.L39
.L34:
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L38:
	ldr	r3, [sl, #4]
	ldr	lr, [sl, #0]
	add	r3, r3, r7
	str	r3, [sp, #24]
	str	ip, [lr, #36]
	add	r3, lr, #36
	ldr	lr, [sp, #24]
	str	lr, [r3, #4]
	ldr	lr, [sp, #28]
	str	lr, [r3, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	ldr	ip, [sp, #0]
	b	.L37
.L41:
	mov	r0, r5
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #8]
	str	ip, [sp, #0]
	bl	setPixel4
	ldr	ip, [sp, #0]
	b	.L37
.L44:
	.align	2
.L43:
	.word	.LANCHOR1
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	sub	sp, sp, #8
	ldr	r1, [r3, #0]
	ldr	r0, [r3, #4]
	mov	r3, #-2130706432
	add	r2, r1, #36
	add	r3, r3, #19200
	add	ip, sp, #6
	str	ip, [r1, #36]
	str	r0, [r2, #4]
	str	r3, [r2, #8]
	add	sp, sp, #8
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LANCHOR1
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	ldmia	r3, {r1, ip}	@ phole ldm
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR1
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r2, #1
	stmfd	sp!, {r4, r5, r6}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L51
	ldr	r5, .L56
	rsb	r1, r1, r1, asl #4
	ldr	ip, [r5, #0]
	mov	r6, r1, asl #3
	add	r4, r4, r4, lsr #31
	ldr	r1, [r5, #4]
	add	r2, r2, r2, lsr #31
	mov	r4, r4, asr #1
	add	r2, r6, r2, asr #1
	orr	r5, r4, #-2147483648
	add	r2, r1, r2, asl #1
	add	ip, ip, #36
	mov	r4, r4, asl #1
	mov	r1, #0
.L54:
	add	r1, r1, #1
	cmp	r1, r3
	str	r0, [ip, #0]
	str	r2, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r2, r2, #240
	bne	.L54
.L51:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR1
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawSubImage4
	.type	drawSubImage4, %function
drawSubImage4:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	ip, [sp, #24]
	tst	r2, #1
	ldr	r4, [sp, #28]
	addne	r2, r2, #1
	tst	ip, #1
	addne	ip, ip, #1
	cmp	r4, #0
	ldr	r6, [sp, #32]
	ble	.L58
	add	r6, r6, r6, lsr #31
	mov	r6, r6, asr #1
	mul	r1, r6, r1
	ldr	r5, .L64
	rsb	r3, r3, r3, asl #4
	ldr	r8, [r5, #0]
	add	r2, r2, r2, lsr #31
	mov	sl, r3, asl #3
	add	ip, ip, ip, lsr #31
	ldr	r3, [r5, #4]
	add	r7, r1, r2, asr #1
	add	ip, sl, ip, asr #1
	add	ip, r3, ip, asl #1
	add	r2, r8, #36
	orr	r5, r6, #-2147483648
	mov	r1, r6, asl #1
	add	r0, r0, r7, asl #1
	mov	r3, #0
.L62:
	add	r3, r3, #1
	cmp	r3, r4
	str	r0, [r2, #0]
	str	ip, [r2, #4]
	add	r0, r0, r1
	str	r5, [r2, #8]
	add	ip, ip, #240
	bne	.L62
.L58:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR1
	.size	drawSubImage4, .-drawSubImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r1, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L68:
	.align	2
.L67:
	.word	.LANCHOR1
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L70
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #0]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR1
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L73:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L73
	mov	r2, #67108864
.L75:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L75
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L81
	ldreq	r1, .L81
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #4]
	streq	r0, [r1, #4]
	bx	lr
.L82:
	.align	2
.L81:
	.word	.LANCHOR1
	.size	flipPage, .-flipPage
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	ldr	r3, .L85+4
	mov	r4, r1
	ldr	r9, [r3, #0]
	mov	r7, #67108864
	ldr	r1, .L85+8
	mov	r3, #-1241513984
	mov	r5, r2
	mov	lr, #0
	add	r2, ip, #12
	add	sl, r7, #160
	add	r3, r3, #4194304
	add	r7, r7, #256
	str	lr, [r2, #8]
	str	r9, [r1, #0]
	ldr	r6, .L85+12
	str	r0, [ip, #12]
	mov	r1, r5
	str	sl, [r2, #4]
	mov	r8, r0
	str	r3, [r2, #8]
	mov	r0, #16777216
	strh	lr, [r7, #2]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	sl, .L85+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #0]	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r5
	str	r8, [sl, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #2]	@ movhi
	stmib	sl, {r4, r5}	@ phole stm
	mov	lr, pc
	bx	r6
	mov	r1, r5
	sub	r5, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r6
	sub	r0, r0, r0, asl #2
	add	r5, r5, r0
	mov	r3, #1
	str	r5, [sl, #20]
	str	r3, [sl, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	vbCountA
	.word	__aeabi_idiv
	.word	soundA
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L88
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	ldr	r3, .L88+4
	mov	r4, r1
	ldr	r9, [r3, #0]
	mov	r7, #67108864
	ldr	r1, .L88+8
	mov	r3, #-1241513984
	mov	r6, r2
	mov	lr, #0
	add	r2, ip, #24
	add	sl, r7, #164
	add	r3, r3, #4194304
	add	r7, r7, #256
	str	lr, [r2, #8]
	str	r9, [r1, #0]
	ldr	r5, .L88+12
	str	r0, [ip, #24]
	mov	r1, r6
	str	sl, [r2, #4]
	mov	r8, r0
	str	r3, [r2, #8]
	mov	r0, #16777216
	strh	lr, [r7, #6]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	sl, .L88+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #4]	@ movhi
	rsb	r0, r4, r4, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r6
	str	r8, [sl, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #6]	@ movhi
	str	r4, [sl, #4]
	mov	lr, pc
	bx	r5
	mov	r1, r6
	sub	r6, r0, #1
	mov	r0, r4
	mov	lr, pc
	bx	r5
	sub	r0, r0, r0, asl #2
	add	r6, r6, r0
	str	r6, [sl, #20]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	vbCountB
	.word	__aeabi_idiv
	.word	soundB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L91
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L92:
	.align	2
.L91:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #0	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r2, #128	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bx	lr
	.size	unpauseSound, .-unpauseSound
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.global	vbCount
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vbCount, %object
	.size	vbCount, 4
vbCount:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
