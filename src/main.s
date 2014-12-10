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
	.file	"main.c"
	.text
	.align	2
	.global	instruct
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L7
	ldr	r3, .L7+4
	ldr	r0, .L7+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L2
	ldr	r2, .L7+12
	ldr	r0, [r2, #0]
	ands	r5, r0, #8
	beq	.L5
.L2:
	tst	r3, #4
	beq	.L1
	ldr	r3, .L7+12
	ldr	r0, [r3, #0]
	ands	r4, r0, #4
	beq	.L6
.L1:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	ldr	r3, .L7+16
	str	r4, [r3, #0]
	ldr	r3, .L7+20
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L7+24
	mov	lr, pc
	bx	r3
	b	.L1
.L5:
	ldr	r3, .L7+16
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L7+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L7+28
	mov	r0, r5
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L2
.L8:
	.align	2
.L7:
	.word	oldButtons
	.word	drawBackgroundImage4
	.word	HelpBitmap
	.word	buttons
	.word	state
	.word	waitForVblank
	.word	fillScreen3
	.word	fillScreen4
	.size	instruct, .-instruct
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r4, .L10
	mov	r0, #120
	ldr	r3, .L10+4
	ldr	r6, .L10+8
	str	r0, [r4, #24]
	str	r0, [r4, #60]
	mov	r0, #170
	str	r0, [r4, #72]
	mov	lr, #96
	mov	r0, #100
	mov	r1, #360
	str	lr, [r6, #0]
	str	r0, [r3, #8]
	mov	lr, #102
	mov	r0, #118
	ldr	r7, .L10+12
	mov	ip, #280
	mov	r2, #140
	str	lr, [r4, #8]
	str	r1, [r4, #76]
	str	r0, [r3, #12]
	str	r1, [r3, #44]
	mov	lr, #184
	mov	r0, #420
	mov	r1, #190
	mov	r5, #0
	str	ip, [r4, #12]
	str	lr, [r4, #28]
	str	ip, [r4, #44]
	str	r2, [r3, #24]
	mov	ip, #160
	str	r0, [r3, #28]
	str	r1, [r3, #56]
	str	r2, [r3, #72]
	mov	r1, #195
	mov	r2, #54
	mov	lr, #165
	mov	r0, #95
	str	ip, [r4, #56]
	str	r1, [r3, #60]
	str	r2, [r3, #76]
	str	r5, [r7, #0]
	str	lr, [r4, #40]
	str	r0, [r3, #40]
	ldr	r3, .L10+16
	mov	lr, pc
	bx	r3
	ldr	r1, .L10+20
	smull	r3, r1, r0, r1
	mov	r3, r0, asr #31
	rsb	r1, r3, r1, asr #1
	add	r1, r1, r1, asl #2
	rsb	r1, r1, r0
	add	r4, r4, r1, asl #4
	ldr	r3, [r4, #12]
	ldr	r8, [r6, #0]
	ldr	r0, [r4, #8]
	add	r6, r3, #13
	ldr	sl, [r7, #0]
	rsb	r6, r8, r6
	ldr	r8, .L10+24
	ldr	r2, .L10+28
	sub	r7, r0, #25
	mov	r3, #1
	mov	r4, #16
	rsb	r7, sl, r7
	str	r1, [r8, #0]
	mov	r1, #7
	str	r7, [r2, #0]
	str	r6, [r2, #4]
	str	r4, [r2, #24]
	str	r4, [r2, #28]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	str	r5, [r2, #32]
	str	r1, [r2, #36]
	str	r5, [r2, #40]
	ldr	r2, .L10+32
	str	r5, [r2, #0]
	ldr	r2, .L10+36
	str	r5, [r2, #0]
	ldr	r2, .L10+40
	str	r5, [r2, #0]
	ldr	r2, .L10+44
	str	r5, [r2, #0]
	ldr	r2, .L10+48
	mov	r0, #1296
	str	r3, [r2, #0]
	ldr	r2, .L10+52
	add	r0, r0, #4
	str	r0, [r2, #0]
	ldr	r2, .L10+56
	str	r3, [r2, #0]
	ldr	r2, .L10+60
	str	r3, [r2, #0]
	ldr	r2, .L10+64
	ldr	ip, .L10+68
	str	r3, [r2, #0]
	ldr	r2, .L10+72
	str	r3, [ip, #0]
	str	r3, [r2, #0]
	str	r3, [ip, #4]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	bushes
	.word	boringBushes
	.word	hOff
	.word	vOff
	.word	rand
	.word	1717986919
	.word	currBush
	.word	enemies
	.word	health
	.word	score
	.word	scoreTenth
	.word	actualScore
	.word	level
	.word	enemyFreq
	.word	shotFlag
	.word	flyingBloodFlag
	.word	lockFlag
	.word	.LANCHOR0
	.word	levelSpriteFlag
	.size	initialize, .-initialize
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #4
	strh	r3, [r2, #0]	@ movhi
	bl	initialize
	ldr	r4, .L17
	ldr	r0, .L17+4
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+12
	ldr	r0, .L17+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L13
	ldr	r2, .L17+20
	ldr	r0, [r2, #0]
	ands	r5, r0, #8
	beq	.L15
.L13:
	tst	r3, #4
	beq	.L12
	ldr	r3, .L17+20
	ldr	r0, [r3, #0]
	ands	r4, r0, #4
	beq	.L16
.L12:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L16:
	ldr	r3, .L17+24
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L17+28
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L17+32
	mov	lr, pc
	bx	r3
	b	.L12
.L15:
	ldr	r3, .L17+24
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L17+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+32
	mov	r0, r5
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L13
.L18:
	.align	2
.L17:
	.word	oldButtons
	.word	SplashPal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	SplashBitmap
	.word	buttons
	.word	state
	.word	waitForVblank
	.word	fillScreen4
	.size	splash, .-splash
	.align	2
	.global	checkShot
	.type	checkShot, %function
checkShot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r2, [r3, #0]
	cmp	r2, #71
	bgt	.L20
	ldr	r1, [r3, #4]
	cmp	r1, #119
	ble	.L25
.L20:
	mov	r1, #11072
	mov	r2, #22016
	ldr	r0, .L26+4
	add	r1, r1, #49
	add	r2, r2, #34
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
.L19:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L25:
	cmp	r2, #48
	ble	.L20
	cmp	r1, #88
	ble	.L20
	ldr	r2, [r3, #36]
	cmp	r2, #7
	bne	.L20
	ldr	r2, .L26+12
	ldr	r0, [r2, #0]
	ldr	r2, .L26+16
	mov	r6, #15
	ldr	r1, [r2, #0]
	mov	r2, #0
	str	r2, [r3, #32]
	str	r6, [r3, #36]
	ldr	r3, .L26+20
	ldr	r4, .L26+24
	ldr	r5, .L26+28
	str	r2, [r3, #0]
	ldr	r3, .L26+32
	ldr	lr, [r4, #0]
	ldr	ip, [r5, #0]
	str	r0, [r3, #0]
	ldr	r3, .L26+36
	add	lr, lr, #1
	add	ip, ip, #1
	str	r1, [r3, #0]
	str	lr, [r4, #0]
	ldr	r3, .L26+40
	str	ip, [r5, #0]
	mov	lr, pc
	bx	r3
	tst	r0, #1
	ldreq	r3, .L26+44
	ldrne	r3, .L26+44
	moveq	r2, #24
	movne	r2, #26
	streq	r2, [r3, #0]
	strne	r2, [r3, #0]
	ldr	r3, [r4, #0]
	cmp	r3, #9
	ble	.L23
	ldr	r3, .L26+48
	ldr	r1, [r5, #0]
	ldr	r2, [r3, #0]
	cmp	r1, #99
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r1, .L26+24
	ldrgt	r3, .L26+52
	mov	r0, #0
	movgt	r2, #4
	str	r0, [r1, #0]
	strgt	r2, [r3, #0]
.L23:
	mov	r2, #47872
	ldr	r0, .L26+56
	mov	r1, #62208
	add	r2, r2, #128
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
	b	.L19
.L27:
	.align	2
.L26:
	.word	enemies
	.word	GunShot
	.word	playSoundB
	.word	scopeBigRow
	.word	scopeBigCol
	.word	shotFlag
	.word	score
	.word	actualScore
	.word	oldScopeBigRow
	.word	oldScopeBigCol
	.word	rand
	.word	whichBloodSprite
	.word	scoreTenth
	.word	state
	.word	TeemoDeath
	.size	checkShot, .-checkShot
	.align	2
	.global	checkDead
	.type	checkDead, %function
checkDead:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L39
	ldr	r3, [r2, #0]
	cmp	r3, #0
	bne	.L29
	ldr	r1, .L39+4
	ldr	r0, [r1, #0]
	add	r0, r0, #1
	cmp	r0, #15
	str	r0, [r1, #0]
	bgt	.L36
.L29:
	ldr	r2, .L39+8
	ldr	r3, [r2, #0]
	cmp	r3, #0
	beq	.L37
	ldr	r3, .L39+12
	ldr	r2, [r3, #36]
	cmp	r2, #15
	bxne	lr
.L38:
	ldr	r2, [r3, #40]
	cmp	r2, #70
	movgt	r1, #16
	add	r2, r2, #1
	strgt	r1, [r3, #32]
	str	r2, [r3, #40]
	bx	lr
.L36:
	mov	r0, #1
	str	r0, [r2, #0]
	ldr	r2, .L39+8
	str	r3, [r2, #0]
	ldr	r3, .L39+12
	ldr	r2, [r3, #36]
	cmp	r2, #15
	str	r0, [r1, #0]
	bxne	lr
	b	.L38
.L37:
	ldr	r0, .L39+4
	ldr	r1, [r0, #0]
	add	r1, r1, #1
	cmp	r1, #10
	str	r1, [r0, #0]
	bne	.L32
.L35:
	ldr	r3, .L39+16
	ldr	r2, [r3, #8]
	add	r2, r2, #1
	str	r2, [r3, #8]
	ldr	r3, .L39+12
	ldr	r2, [r3, #36]
	cmp	r2, #15
	bxne	lr
	b	.L38
.L32:
	cmp	r1, #20
	beq	.L35
	cmp	r1, #30
	movgt	r1, #1
	strgt	r1, [r2, #0]
	strgt	r3, [r0, #0]
	ldrgt	r2, .L39+16
	ldr	r3, .L39+12
	strgt	r1, [r2, #8]
	ldr	r2, [r3, #36]
	cmp	r2, #15
	bxne	lr
	b	.L38
.L40:
	.align	2
.L39:
	.word	shotFlag
	.word	.LANCHOR1
	.word	flyingBloodFlag
	.word	enemies
	.word	.LANCHOR0
	.size	checkDead, .-checkDead
	.align	2
	.global	respawn
	.type	respawn, %function
respawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L44
	ldr	r2, [r3, #36]
	cmp	r2, #15
	beq	.L43
.L41:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L43:
	ldr	r2, [r3, #40]
	cmp	r2, #160
	ble	.L41
	mov	r2, #0
	str	r2, [r3, #32]
	str	r2, [r3, #40]
	mov	r2, #7
	str	r2, [r3, #36]
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+8
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	ldr	r2, .L44+12
	rsb	r0, r3, r0
	str	r0, [r2, #0]
	b	.L41
.L45:
	.align	2
.L44:
	.word	enemies
	.word	rand
	.word	1717986919
	.word	currBush
	.size	respawn, .-respawn
	.global	__aeabi_idivmod
	.align	2
	.global	didHeShoot
	.type	didHeShoot, %function
didHeShoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #36]
	cmp	r3, #7
	beq	.L47
.L51:
	ldr	r4, .L52+4
	ldr	r3, [r4, #4]
.L48:
	cmp	r3, #0
	bne	.L46
	ldr	r3, .L52+8
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	cmp	r2, #20
	str	r2, [r3, #0]
	movgt	r3, #1
	strgt	r3, [r4, #4]
.L46:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L47:
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+16
	ldr	r1, [r3, #0]
	ldr	r3, .L52+20
	mov	lr, pc
	bx	r3
	cmp	r1, #1
	bne	.L51
	ldr	r4, .L52+4
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bne	.L48
	ldr	ip, .L52+24
	ldr	lr, [ip, #0]
	add	lr, lr, #1
	str	lr, [ip, #0]
	ldr	ip, .L52+8
	mov	r3, #0
	mov	r1, #18432
	mov	r2, #44032
	str	r3, [r4, #4]
	str	r3, [ip, #0]
	ldr	r0, .L52+28
	ldr	r3, .L52+32
	add	r1, r1, #206
	add	r2, r2, #68
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	b	.L48
.L53:
	.align	2
.L52:
	.word	enemies
	.word	.LANCHOR0
	.word	bloodCounter
	.word	rand
	.word	enemyFreq
	.word	__aeabi_idivmod
	.word	health
	.word	TeemoShot
	.word	playSoundB
	.size	didHeShoot, .-didHeShoot
	.align	2
	.global	didHeMove
	.type	didHeMove, %function
didHeMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #36]
	cmp	r3, #7
	beq	.L56
.L54:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L56:
	ldr	r4, .L57+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+8
	ldr	r1, [r3, #0]
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	cmp	r1, #2
	bne	.L54
	ldr	r3, .L57+16
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L54
	mov	lr, pc
	bx	r4
	ldr	ip, .L57+20
	smull	r3, ip, r0, ip
	mov	r3, r0, asr #31
	rsb	ip, r3, ip, asr #1
	add	ip, ip, ip, asl #2
	ldr	r3, .L57+24
	rsb	ip, ip, r0
	mov	r1, #97280
	mov	r2, #44032
	str	ip, [r3, #0]
	ldr	r0, .L57+28
	add	r1, r1, #564
	add	r2, r2, #68
	ldr	r3, .L57+32
	mov	lr, pc
	bx	r3
	b	.L54
.L58:
	.align	2
.L57:
	.word	enemies
	.word	rand
	.word	enemyFreq
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	1717986919
	.word	currBush
	.word	TeemoMove
	.word	playSoundB
	.size	didHeMove, .-didHeMove
	.align	2
	.global	checkLevel
	.type	checkLevel, %function
checkLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L73
	ldr	r2, .L73+4
	ldr	r3, [r4, #0]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, asl #2
	subs	r2, r3, r2
	beq	.L60
	ldr	r3, .L73+8
	ldr	r3, [r3, #0]
.L61:
	cmp	r2, #1
	ldreq	r2, .L73+12
	moveq	r1, #0
	streq	r1, [r2, #4]
.L67:
	cmp	r3, #0
	bne	.L59
	ldr	r3, .L73+16
	ldr	r2, .L73+4
	ldr	r3, [r3, #0]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, asl #2
	cmp	r3, r2
	ldreq	r3, .L73+20
	ldreq	r2, [r3, #0]
	addeq	r2, r2, #1
	streq	r2, [r3, #0]
.L59:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	ldr	r5, .L73+12
	ldr	r2, [r5, #4]
	cmp	r2, #1
	ble	.L62
.L71:
	ldr	r3, .L73+8
	ldr	r3, [r3, #0]
	b	.L67
.L62:
	cmp	r3, #0
	ble	.L71
	ldr	r6, .L73+16
	ldr	r3, [r6, #0]
	cmp	r2, #0
	add	r3, r3, #1
	str	r3, [r6, #0]
	ldrne	r7, .L73+8
	beq	.L72
.L65:
	cmp	r3, #51
	ldrle	r3, [r7, #0]
	ble	.L67
	mov	r1, #75776
	mov	r2, #44032
	ldr	r3, .L73+24
	ldr	r0, .L73+28
	add	r1, r1, #448
	add	r2, r2, #68
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #0]
	ldr	ip, .L73+4
	smull	r3, ip, r1, ip
	mov	r2, r1, asr #31
	mov	r3, #1
	rsb	r2, r2, ip, asr r3
	mov	ip, #2
	str	ip, [r5, #4]
	ldr	ip, .L73+20
	mov	r0, #0
	add	r2, r2, r2, asl #2
	str	r0, [r6, #0]
	str	r3, [r7, #0]
	str	r0, [ip, #0]
	rsb	r2, r2, r1
	b	.L61
.L72:
	ldr	r0, .L73+32
	ldr	r1, .L73+36
	ldr	r8, [r0, #0]
	ldr	ip, [r1, #0]
	add	r8, r8, #1
	str	r8, [r0, #0]
	ldr	r7, .L73+8
	sub	ip, ip, #100
	ldr	r0, .L73+40
	str	ip, [r1, #0]
	mov	r1, #1
	str	r2, [r0, #0]
	str	r1, [r5, #4]
	str	r2, [r7, #0]
	b	.L65
.L74:
	.align	2
.L73:
	.word	actualScore
	.word	1717986919
	.word	levelSpriteFlag
	.word	.LANCHOR1
	.word	soundCounter
	.word	levelUpVelocity
	.word	playSoundB
	.word	CaitlynShot
	.word	level
	.word	enemyFreq
	.word	health
	.size	checkLevel, .-checkLevel
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #1024
	add	r3, r3, #4
	mov	r4, #67108864
	ldr	r0, .L82
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L82+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L82+8
	ldr	r3, .L82+12
	mov	lr, pc
	bx	r3
	ldr	r1, .L82+16
	ldr	r0, .L82+20
	ldr	r2, [r1, #0]
.L76:
	ldr	r3, [r4, #304]
	tst	r2, #8
	str	r2, [r0, #0]
	str	r3, [r1, #0]
	beq	.L77
	ands	r5, r3, #8
	beq	.L80
.L77:
	tst	r2, #4
	beq	.L79
	ands	r5, r3, #4
	beq	.L81
.L79:
	mov	r2, r3
	b	.L76
.L81:
	bl	initialize
.L80:
	ldr	r3, .L82+24
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r3, .L82+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+32
	mov	lr, pc
	bx	r3
	mov	r0, r5
	ldr	r3, .L82+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	SplashPal
	.word	loadPalette
	.word	PauseBitmap
	.word	drawBackgroundImage4
	.word	buttons
	.word	oldButtons
	.word	state
	.word	unpauseSound
	.word	waitForVblank
	.word	fillScreen4
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1024
	stmfd	sp!, {r4, lr}
	add	r3, r3, #4
	mov	r4, #67108864
	mov	r1, #126976
	mov	r2, #44032
	add	r1, r1, #444
	add	r2, r2, #68
	ldr	r0, .L88
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L88+8
	ldr	r3, .L88+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L88+16
	ldr	r3, .L88+20
	mov	lr, pc
	bx	r3
	ldr	r1, .L88+24
	ldr	ip, .L88+28
	ldr	r2, [r1, #0]
	mov	r0, r4
.L85:
	ldr	r3, [r0, #304]
	tst	r2, #8
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	beq	.L86
	ands	r4, r3, #8
	beq	.L87
.L86:
	mov	r2, r3
	b	.L85
.L87:
	ldr	r3, .L88+32
	mov	r1, #536576
	add	r1, r1, #300
	ldr	r0, .L88+36
	add	r1, r1, #3
	mov	r2, #8000
	str	r4, [r3, #0]
	ldr	r3, .L88+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+44
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L88+48
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	Victory
	.word	playSoundB
	.word	SplashPal
	.word	loadPalette
	.word	WinBitmap
	.word	drawBackgroundImage4
	.word	buttons
	.word	oldButtons
	.word	state
	.word	CharSelect
	.word	playSoundA
	.word	waitForVblank
	.word	fillScreen4
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #131072
	mov	r3, #1024
	stmfd	sp!, {r4, lr}
	add	r3, r3, #4
	mov	r4, #67108864
	add	r1, r1, #328
	mov	r2, #44032
	add	r1, r1, #2
	add	r2, r2, #68
	ldr	r0, .L94
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L94+8
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L94+16
	ldr	r3, .L94+20
	mov	lr, pc
	bx	r3
	ldr	r1, .L94+24
	ldr	ip, .L94+28
	ldr	r2, [r1, #0]
	mov	r0, r4
.L91:
	ldr	r3, [r0, #304]
	tst	r2, #8
	str	r2, [ip, #0]
	str	r3, [r1, #0]
	beq	.L92
	ands	r4, r3, #8
	beq	.L93
.L92:
	mov	r2, r3
	b	.L91
.L93:
	ldr	r3, .L94+32
	mov	r1, #536576
	add	r1, r1, #300
	ldr	r0, .L94+36
	add	r1, r1, #3
	mov	r2, #8000
	str	r4, [r3, #0]
	ldr	r3, .L94+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+44
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	Defeat
	.word	playSoundB
	.word	SplashPal
	.word	loadPalette
	.word	LoseBitmap
	.word	drawBackgroundImage4
	.word	buttons
	.word	oldButtons
	.word	state
	.word	CharSelect
	.word	playSoundA
	.word	waitForVblank
	.word	fillScreen4
	.size	lose, .-lose
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L99
	mov	r3, #0
.L97:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L97
	bx	lr
.L100:
	.align	2
.L99:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r4, .L112
	sub	sp, sp, #32
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L102
	ldr	r3, .L112+4
	mvn	r1, #12096
	mov	r2, #4864
	mov	r0, #49152
	sub	r1, r1, #15
	add	r2, r2, #8
	mov	r5, #1120	@ movhi
	mov	r6, #4864	@ movhi
	mov	r7, #1024	@ movhi
	strh	r5, [r3, #48]	@ movhi
	strh	r0, [r3, #50]	@ movhi
	strh	r6, [r3, #52]	@ movhi
	strh	r5, [r3, #56]	@ movhi
	strh	r1, [r3, #58]	@ movhi
	strh	r6, [r3, #60]	@ movhi
	strh	r7, [r3, #64]	@ movhi
	strh	r0, [r3, #66]	@ movhi
	strh	r2, [r3, #68]	@ movhi
	strh	r7, [r3, #72]	@ movhi
	strh	r1, [r3, #74]	@ movhi
	strh	r2, [r3, #76]	@ movhi
.L103:
	ldr	r0, .L112+8
	ldr	ip, .L112+12
	ldr	r8, [ip, #36]
	ldr	sl, [ip, #4]
	ldrb	r9, [ip, #0]	@ zero_extendqisi2
	ldr	r7, [ip, #32]
	ldrb	ip, [r0, #0]	@ zero_extendqisi2
	ldr	fp, [r0, #20]
	str	ip, [sp, #8]
	ldrb	ip, [r0, #16]	@ zero_extendqisi2
	mov	fp, fp, asl #23
	str	ip, [sp, #12]
	ldrb	ip, [r0, #32]	@ zero_extendqisi2
	ldr	r6, [r0, #4]
	mvn	fp, fp, lsr #5
	str	ip, [sp, #16]
	add	r7, r7, r8, asl #5
	mvn	fp, fp, lsr #18
	ldrb	ip, [r0, #48]	@ zero_extendqisi2
	ldr	r1, [r0, #52]
	ldr	r2, [r0, #68]
	ldr	r5, [r0, #36]
	str	r7, [sp, #0]
	ldrb	r0, [r0, #64]	@ zero_extendqisi2
	ldr	r7, [sp, #8]
	str	fp, [sp, #4]
	mov	r6, r6, asl #23
	ldr	fp, [sp, #16]
	mvn	r6, r6, lsr #5
	str	ip, [sp, #24]
	str	r0, [sp, #28]
	ldr	r8, [sp, #12]
	orr	r7, r7, #16384
	mvn	r6, r6, lsr #18
	orr	fp, fp, #16384
	str	r7, [sp, #8]
	str	r6, [sp, #20]
	add	r6, sp, #24
	ldmia	r6, {r6, r7}	@ phole ldm
	str	fp, [sp, #16]
	ldr	fp, [sp, #0]
	orr	r8, r8, #16384
	mov	r2, r2, asl #23
	str	r8, [sp, #12]
	mov	r2, r2, lsr #23
	orr	r8, r6, #16384
	orr	r6, r7, #16384
	orr	r7, fp, #2048
	ldr	fp, [sp, #8]
	orr	r2, r2, #-16777216
	strh	fp, [r3, #0]	@ movhi
	orr	r2, r2, #16711680
	ldr	fp, [sp, #20]
	mov	r0, #6144
	orr	r2, r2, #53248
	strh	fp, [r3, #2]	@ movhi
	mov	ip, r0
	strh	r2, [r3, #34]	@ movhi
	ldr	r2, .L112+16
	add	ip, ip, #8
	mov	r5, r5, asl #23
	strh	ip, [r3, #12]	@ movhi
	strh	ip, [r3, #28]	@ movhi
	ldr	ip, [r2, #0]
	ldr	r2, .L112+20
	ldr	fp, [sp, #12]
	mov	r1, r1, asl #23
	mvn	r5, r5, lsr #5
	strh	r6, [r3, #32]	@ movhi
	mov	r6, #1	@ movhi
	mvn	r5, r5, lsr #18
	mov	r1, r1, lsr #23
	strh	r6, [r3, #80]	@ movhi
	ldr	r6, [r2, #0]
	ldr	r2, .L112+24
	orr	r1, r1, #-16777216
	strh	fp, [r3, #8]	@ movhi
	strh	r5, [r3, #18]	@ movhi
	ldr	fp, [sp, #4]
	mov	r5, #6144	@ movhi
	orr	r1, r1, #16711680
	strh	r5, [r3, #20]	@ movhi
	ldr	r5, [r2, #0]
	add	r0, r0, #16
	orr	r1, r1, #53248
	ldr	r2, [r4, #0]
	mov	sl, sl, asl #23
	strh	fp, [r3, #10]	@ movhi
	add	ip, ip, #32
	ldr	fp, [sp, #16]
	mvn	r9, r9, asl #17
	mvn	sl, sl, lsr #5
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #26]	@ movhi
	strh	r0, [r3, #36]	@ movhi
	add	r6, r6, #192
	add	r5, r5, #192
	mov	r0, #16384
	mvn	r1, #32512
	mov	ip, ip, asl #2
	mvn	r9, r9, lsr #17
	mvn	sl, sl, lsr #18
	strh	fp, [r3, #16]	@ movhi
	strh	r8, [r3, #24]	@ movhi
	strh	r7, [r3, #44]	@ movhi
	orr	r6, r6, #4096
	mov	r7, #224	@ movhi
	orr	r5, r5, #4096
	add	r0, r0, #1
	sub	r1, r1, #254
	orr	ip, ip, #4096
	cmp	r2, #0
	mov	r8, #1	@ movhi
	mov	fp, #232	@ movhi
	strh	r9, [r3, #40]	@ movhi
	strh	sl, [r3, #42]	@ movhi
	strh	r7, [r3, #82]	@ movhi
	ldr	r2, .L112+4
	strh	r6, [r3, #84]	@ movhi
	strh	r8, [r3, #88]	@ movhi
	strh	fp, [r3, #90]	@ movhi
	strh	r5, [r3, #92]	@ movhi
	strh	r0, [r3, #96]	@ movhi
	strh	r1, [r3, #98]	@ movhi
	strh	ip, [r3, #100]	@ movhi
	bne	.L104
	mov	r0, #16384
	mov	r1, #4288
	add	r0, r0, #152
	add	r1, r1, #10
	strh	r0, [r2, #104]	@ movhi
	strh	r7, [r2, #106]	@ movhi
	strh	r1, [r2, #108]	@ movhi
.L105:
	ldr	r2, .L112+28
	ldr	r1, [r2, #0]
	ldr	r2, .L112+32
	ldr	r2, [r2, #0]
	add	r1, r1, #192
	cmp	r2, #0
	ldr	r2, .L112+4
	orr	r1, r1, #4096
	mov	r0, #152	@ movhi
	mov	r5, #32	@ movhi
	movne	r6, #512	@ movhi
	strh	r0, [r3, #112]	@ movhi
	strh	r5, [r3, #114]	@ movhi
	strh	r1, [r3, #116]	@ movhi
	strneh	r6, [r2, #120]	@ movhi
	bne	.L107
	ldr	r1, .L112+36
	ldr	r0, [r1, #0]
	ldr	r1, .L112+40
	ldr	ip, .L112+44
	ldr	r1, [r1, #0]
	sub	r0, r0, #8
	ldr	r5, .L112+48
	rsb	r0, r1, r0
	ldr	ip, [ip, #0]
	ldr	r1, .L112+52
	ldr	r5, [r5, #0]
	sub	ip, ip, #8
	mov	r0, r0, asl #23
	ldr	r1, [r1, #0]
	rsb	ip, r5, ip
	mov	r0, r0, lsr #23
	and	ip, ip, #255
	orr	r0, r0, #16384
	orr	r1, r1, #5120
	strh	ip, [r2, #120]	@ movhi
	strh	r0, [r2, #122]	@ movhi
	strh	r1, [r2, #124]	@ movhi
.L107:
	ldr	r2, .L112+56
	ldr	r2, [r2, #0]
	cmp	r2, #0
	bne	.L108
	ldr	r2, .L112+44
	ldr	r5, [r2, #0]
	ldr	r2, .L112+48
	ldr	r0, [r2, #0]
	ldr	r2, .L112+36
	ldr	ip, [r2, #0]
	ldr	r2, .L112+40
	ldr	r1, [r2, #0]
	ldrh	r2, [r4, #8]
	rsb	r0, r0, r5
	rsb	ip, r1, ip
	mov	r0, r0, asl #16
	rsb	r1, r2, #0
	mov	ip, ip, asl #16
	mov	r0, r0, lsr #16
	mov	ip, ip, lsr #16
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	add	r5, r0, r2
	add	r4, ip, r2
	mov	r5, r5, asl #16
	add	ip, ip, r1
	mov	r4, r4, asl #16
	mov	r5, r5, lsr #16
	mov	r4, r4, lsr #16
	add	r0, r0, r1
	sub	ip, ip, #6
	mov	r1, #5120
	add	r7, r5, #2
	add	r6, r4, #2
	mov	r2, r1
	sub	r0, r0, #6
	mov	ip, ip, asl #23
	add	r5, r5, #6
	add	r4, r4, #6
	add	r1, r1, #28
	and	r0, r0, #255
	mov	ip, ip, lsr #23
	add	r2, r2, #29
	and	r7, r7, #255
	bic	r6, r6, #65024
	and	r5, r5, #255
	bic	r4, r4, #65024
	strh	r7, [r3, #128]	@ movhi
	strh	r6, [r3, #130]	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r0, [r3, #136]	@ movhi
	strh	ip, [r3, #138]	@ movhi
	strh	r1, [r3, #140]	@ movhi
	strh	r5, [r3, #144]	@ movhi
	strh	ip, [r3, #146]	@ movhi
	strh	r2, [r3, #148]	@ movhi
	strh	r0, [r3, #152]	@ movhi
	strh	r4, [r3, #154]	@ movhi
	strh	r2, [r3, #156]	@ movhi
.L109:
	ldr	r2, .L112+60
	ldr	r2, [r2, #0]
	cmp	r2, #0
	movne	fp, #512	@ movhi
	strneh	fp, [r3, #160]	@ movhi
	strneh	fp, [r3, #168]	@ movhi
	bne	.L111
	ldr	r1, .L112+64
	ldr	ip, [r1, #0]
	mov	r0, #4224
	rsb	ip, ip, #144
	mov	r1, r0
	and	ip, ip, #255
	orr	ip, ip, #16384
	add	r0, r0, #20
	add	r1, r1, #22
	mov	r8, #18	@ movhi
	strh	ip, [r3, #160]	@ movhi
	strh	r2, [r3, #162]	@ movhi
	strh	r0, [r3, #164]	@ movhi
	strh	ip, [r3, #168]	@ movhi
	strh	r8, [r3, #170]	@ movhi
	strh	r1, [r3, #172]	@ movhi
.L111:
	ldr	r2, .L112+68
	ldr	ip, [r2, #52]
	ldr	sl, [r2, #4]
	ldr	r7, [r2, #20]
	ldr	r5, [r2, #36]
	ldr	r0, [r2, #68]
	mov	ip, ip, asl #23
	ldrb	r9, [r2, #0]	@ zero_extendqisi2
	ldrb	r8, [r2, #16]	@ zero_extendqisi2
	ldrb	r6, [r2, #32]	@ zero_extendqisi2
	ldrb	r4, [r2, #48]	@ zero_extendqisi2
	ldrb	fp, [r2, #64]	@ zero_extendqisi2
	mov	sl, sl, asl #23
	mov	r2, #6144
	mov	r7, r7, asl #23
	mov	r5, r5, asl #23
	mov	r0, r0, asl #23
	mvn	ip, ip, lsr #5
	mov	r1, r2
	mvn	ip, ip, lsr #18
	mvn	sl, sl, lsr #5
	mvn	r7, r7, lsr #5
	mvn	r5, r5, lsr #5
	mvn	r0, r0, lsr #5
	add	r2, r2, #8
	orr	r9, r9, #16384
	mvn	sl, sl, lsr #18
	orr	r8, r8, #16384
	mvn	r7, r7, lsr #18
	orr	r6, r6, #16384
	mvn	r5, r5, lsr #18
	add	r1, r1, #16
	orr	r4, r4, #16384
	orr	fp, fp, #16384
	mvn	r0, r0, lsr #18
	strh	ip, [r3, #202]	@ movhi
	mov	ip, #6144	@ movhi
	strh	r9, [r3, #176]	@ movhi
	strh	sl, [r3, #178]	@ movhi
	strh	r8, [r3, #184]	@ movhi
	strh	r7, [r3, #186]	@ movhi
	strh	r2, [r3, #188]	@ movhi
	strh	r6, [r3, #192]	@ movhi
	strh	r5, [r3, #194]	@ movhi
	strh	r1, [r3, #196]	@ movhi
	strh	r4, [r3, #200]	@ movhi
	strh	r2, [r3, #204]	@ movhi
	strh	fp, [r3, #208]	@ movhi
	strh	r0, [r3, #210]	@ movhi
	strh	ip, [r3, #180]	@ movhi
	strh	ip, [r3, #212]	@ movhi
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L108:
	mov	r7, #512	@ movhi
	strh	r7, [r3, #128]	@ movhi
	strh	r7, [r3, #136]	@ movhi
	strh	r7, [r3, #144]	@ movhi
	strh	r7, [r3, #152]	@ movhi
	b	.L109
.L104:
	mov	r0, #16384
	mov	r1, #4288
	add	r0, r0, #152
	add	r1, r1, #12
	mov	ip, #224	@ movhi
	strh	r0, [r2, #104]	@ movhi
	strh	r1, [r2, #108]	@ movhi
	strh	ip, [r2, #106]	@ movhi
	b	.L105
.L102:
	ldr	r3, .L112+4
	mov	r8, #512	@ movhi
	strh	r8, [r3, #48]	@ movhi
	strh	r8, [r3, #56]	@ movhi
	strh	r8, [r3, #64]	@ movhi
	strh	r8, [r3, #72]	@ movhi
	b	.L103
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	bushes
	.word	enemies
	.word	health
	.word	scoreTenth
	.word	score
	.word	level
	.word	shotFlag
	.word	oldScopeBigCol
	.word	hOff
	.word	oldScopeBigRow
	.word	vOff
	.word	whichBloodSprite
	.word	flyingBloodFlag
	.word	levelSpriteFlag
	.word	levelUpVelocity
	.word	boringBushes
	.size	updateOAM, .-updateOAM
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	ip, #8064	@ movhi
	mov	r4, #67108864
	mov	r1, #610304
	mvn	r3, #10560
	strh	ip, [r4, #8]	@ movhi
	sub	r3, r3, #57
	mov	ip, #4864	@ movhi
	add	r1, r1, #2544
	add	r1, r1, #5
	mov	r2, #8000
	strh	ip, [r4, #0]	@ movhi
	ldr	r0, .L154
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L154+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L154+8
	ldr	r3, .L154+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L154+16
	mov	r2, #100663296
	mov	r3, #1120
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L154+24
	add	r2, r2, #63488
	mov	r3, #1024
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r3, #14016
	mov	r0, #3
	ldr	r1, .L154+28
	add	r2, r2, #16384
	add	r3, r3, #32
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L154+32
	add	r2, r2, #45056
	mov	r3, #4096
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L154+36
	add	r2, r2, #65536
	mov	r3, #16384
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r2, #83886080
	mov	r0, #3
	add	r2, r2, #512
	mov	r3, #256
	ldr	r1, .L154+40
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	mov	r3, #2048
	mov	r0, #272	@ movhi
	add	r3, r3, #8
	ldr	r2, .L154+44
	strh	r0, [r4, #80]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	mov	r3, #0
.L115:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L115
	ldr	r2, .L154+48
	ldr	fp, .L154+52
	ldr	r4, .L154+56
	ldr	r6, .L154+60
	ldr	r7, .L154+64
	add	r5, r2, #80
.L144:
	ldr	r2, [r6, #0]
	ldr	ip, .L154+68
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	str	r2, [ip, #0]
	str	r3, [r6, #0]
	bl	checkDead
	bl	respawn
	bl	didHeShoot
	bl	didHeMove
	bl	checkLevel
	ldr	r2, .L154+72
	ldr	r0, [fp, #0]
	ldr	r1, [r2, #0]
	ldr	r3, .L154+48
	ldr	r2, .L154+76
.L116:
	ldr	sl, [r3, #8]
	ldr	r8, [r3, #12]
	ldr	ip, [r2, #0]
	ldr	r9, [r2, #4]
	rsb	sl, r0, sl
	rsb	r8, r1, r8
	str	sl, [r3, #0]
	str	r8, [r3, #4]
	add	r3, r3, #16
	rsb	ip, r0, ip
	rsb	r9, r1, r9
	cmp	r3, r5
	str	ip, [r2, #-8]
	str	r9, [r2, #-4]
	add	r2, r2, #16
	bne	.L116
	ldr	r3, [r7, #8]
	ldr	ip, .L154+80
	add	r3, r3, #1
	smull	r2, sl, ip, r3
	ldr	ip, .L154+84
	ldr	r2, [ip, #0]
	ldr	ip, .L154+48
	add	r2, ip, r2, asl #4
	ldr	ip, [r2, #8]
	ldr	r2, [r2, #12]
	mov	r8, r3, asr #31
	sub	ip, ip, #25
	add	r2, r2, #13
	rsb	ip, r0, ip
	rsb	r2, r1, r2
	rsb	sl, r8, sl, asr #1
	add	r9, r2, r1
	add	r8, ip, r0
	add	sl, sl, sl, asl #2
	str	ip, [r4, #0]
	str	r2, [r4, #4]
	ldr	ip, .L154+88
	ldr	r2, .L154+92
	add	r0, r0, #80
	add	r1, r1, #120
	cmp	r3, sl
	str	r8, [r4, #8]
	str	r9, [r4, #12]
	str	r0, [r2, #0]
	str	r1, [ip, #0]
	str	r3, [r7, #8]
	beq	.L117
	ldr	r0, .L154+56
	ldr	r1, [r0, #36]
.L118:
	mov	r2, #9984
	add	r2, r2, #16
	cmp	r3, r2
	movgt	r3, #0
	strgt	r3, [r7, #8]
	cmp	r1, #15
	beq	.L148
.L120:
	ldr	ip, .L154+68
	ldr	r3, [ip, #0]
	tst	r3, #8
	beq	.L123
	ldr	r2, [r6, #0]
	tst	r2, #8
	beq	.L149
.L123:
	tst	r3, #4
	beq	.L125
	ldr	r2, [r6, #0]
	ands	r2, r2, #4
	bne	.L125
	ldr	r0, .L154+96
	ldr	r1, [r0, #0]
	cmp	r1, #0
	moveq	r2, #1
	streq	r2, [r0, #0]
	beq	.L127
	ldr	r1, .L154+96
	str	r2, [r1, #0]
.L128:
	tst	r3, #64
	beq	.L129
	ldr	r2, [r6, #0]
	tst	r2, #64
	beq	.L130
.L129:
	tst	r3, #128
	beq	.L131
	ldr	r2, [r6, #0]
	tst	r2, #128
	beq	.L130
.L131:
	tst	r3, #16
	beq	.L132
	ldr	r2, [r6, #0]
	tst	r2, #16
	beq	.L130
.L132:
	tst	r3, #32
	beq	.L133
	ldr	r2, [r6, #0]
	tst	r2, #32
	bne	.L133
.L130:
	add	r1, r4, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	r0, .L154+72
	sub	r1, r1, #52
	sub	r2, r2, #104
	str	r1, [fp, #0]
	str	r2, [r0, #0]
.L133:
	tst	r3, #2
	beq	.L141
	ldr	r3, [r6, #0]
	ands	r8, r3, #2
	beq	.L150
.L141:
	ldr	r2, .L154+100
	ldr	r3, [r2, #0]
	cmp	r3, #43
	bgt	.L151
.L142:
	ldr	r3, .L154+104
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bgt	.L152
	ldr	r3, .L154+72
	ldrh	r2, [fp, #0]
	ldrh	r1, [r3, #0]
	mov	r3, #67108864
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	bl	updateOAM
	mov	r0, #3
	ldr	r1, .L154+44
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L154+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L154+108
	mov	lr, pc
	bx	r3
	b	.L144
.L125:
	ldr	ip, .L154+96
	ldr	r2, [ip, #0]
	cmp	r2, #0
	beq	.L128
.L127:
	ldr	r1, .L154+112
	ldr	r2, [r1, #0]
	cmp	r2, #0
	bne	.L134
	ldr	r2, [fp, #0]
	cmp	r2, #5
	ldrgt	ip, .L154+52
	subgt	r2, r2, #5
	ldr	r0, .L154+112
	strgt	r2, [ip, #0]
	mov	r2, #1
	str	r2, [r0, #0]
	b	.L133
.L117:
	ldr	r2, .L154+56
	ldr	r1, [r2, #36]
	cmp	r1, #7
	bne	.L118
	ldr	r2, [r2, #32]
	add	r2, r2, #4
	cmp	r2, #29
	ldr	ip, .L154+56
	movgt	r2, #0
	str	r2, [ip, #32]
	mov	r2, #9984
	add	r2, r2, #16
	cmp	r3, r2
	movgt	r3, #0
	strgt	r3, [r7, #8]
	cmp	r1, #15
	bne	.L120
.L148:
	ldr	r3, [r7, #12]
	ldr	r0, .L154+80
	add	r3, r3, #1
	smull	r2, r1, r0, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	str	r3, [r7, #12]
	ldreq	r3, [r4, #32]
	ldrne	r3, [r4, #32]
	addeq	r3, r3, #4
	streq	r3, [r4, #32]
	cmp	r3, #12
	moveq	r3, #0
	streq	r3, [r7, #12]
	b	.L120
.L134:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L136
	ldr	r3, [fp, #0]
	cmp	r3, #0
	ldrgt	r1, .L154+52
	subgt	r3, r3, #1
	strgt	r3, [r1, #0]
.L136:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L137
	ldr	r3, [fp, #0]
	cmp	r3, #95
	ldrle	r2, .L154+52
	addle	r3, r3, #1
	strle	r3, [r2, #0]
.L137:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L138
	ldr	ip, .L154+72
	ldr	r3, [ip, #0]
	cmp	r3, #272
	addlt	r3, r3, #1
	strlt	r3, [ip, #0]
.L138:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L147
	ldr	r1, .L154+72
	ldr	r3, [r1, #0]
	cmp	r3, #0
	ble	.L153
	ldr	ip, .L154+72
	sub	r3, r3, #1
	str	r3, [ip, #0]
.L147:
	ldr	r0, .L154+68
	ldr	r3, [r0, #0]
	b	.L133
.L150:
	bl	checkShot
	ldr	r2, .L154+100
	ldr	r3, [r2, #0]
	ldr	r1, .L154+112
	cmp	r3, #43
	str	r8, [r1, #0]
	ble	.L142
.L151:
	ldr	r3, .L154+116
	mov	r2, #4
	str	r2, [r3, #0]
.L114:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L153:
	ldr	r2, .L154+68
	ldr	r3, [r2, #0]
	b	.L133
.L152:
	ldr	r3, .L154+116
	mov	r2, #5
	str	r2, [r3, #0]
	b	.L114
.L149:
	ldr	r3, .L154+116
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, .L154+120
	mov	lr, pc
	bx	r3
	b	.L114
.L155:
	.align	2
.L154:
	.word	BgMusic
	.word	playSoundA
	.word	BgPal
	.word	loadPalette
	.word	ScopeTiles
	.word	DMANow
	.word	ScopeMap
	.word	BgTiles
	.word	BgMap
	.word	SpritesTiles
	.word	SpritesPal
	.word	shadowOAM
	.word	bushes
	.word	vOff
	.word	enemies
	.word	buttons
	.word	.LANCHOR1
	.word	oldButtons
	.word	hOff
	.word	boringBushes+8
	.word	1717986919
	.word	currBush
	.word	scopeBigCol
	.word	scopeBigRow
	.word	.LANCHOR0
	.word	actualScore
	.word	health
	.word	waitForVblank
	.word	lockFlag
	.word	state
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r6, #67108864
	ldr	r3, [r6, #304]
	ldr	r5, .L169
	ldr	r4, .L169+4
	mov	r2, #0
	str	r2, [r5, #0]
	str	r3, [r4, #0]
	ldr	r3, .L169+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L169+12
	mov	lr, pc
	bx	r3
	mov	r1, #536576
	add	r1, r1, #300
	ldr	r0, .L169+16
	add	r1, r1, #3
	mov	r2, #8000
	ldr	r3, .L169+20
	mov	lr, pc
	bx	r3
	ldr	r7, .L169+24
.L168:
	ldr	r3, [r4, #0]
	ldr	r2, [r5, #0]
.L158:
	str	r3, [r7, #0]
	ldr	r3, [r6, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L158
.L165:
	.word	.L159
	.word	.L160
	.word	.L161
	.word	.L162
	.word	.L163
	.word	.L164
.L164:
	bl	lose
	b	.L168
.L163:
	bl	win
	b	.L168
.L162:
	bl	pause
	b	.L168
.L161:
	bl	game
	b	.L168
.L160:
	bl	instruct
	b	.L168
.L159:
	bl	splash
	b	.L168
.L170:
	.align	2
.L169:
	.word	state
	.word	buttons
	.word	setupInterrupts
	.word	setupSounds
	.word	CharSelect
	.word	playSoundA
	.word	oldButtons
	.size	main, .-main
	.global	animationCounter
	.global	shootingFlag
	.global	cheatFlag
	.global	levelFlag
	.global	enemyBloodCounter
	.global	bloodVelocity
	.global	deathAnimationCounter
	.global	recoilCount
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	enemies,44,4
	.comm	bushes,80,4
	.comm	boringBushes,80,4
	.comm	shadowOAM,1024,4
	.comm	deathCounter,4,4
	.comm	bloodCounter,4,4
	.comm	score,4,4
	.comm	scoreTenth,4,4
	.comm	actualScore,4,4
	.comm	health,4,4
	.comm	currBush,4,4
	.comm	state,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	level,4,4
	.comm	enemyFreq,4,4
	.comm	soundCounter,4,4
	.comm	shotFlag,4,4
	.comm	scopeBigRow,4,4
	.comm	scopeBigCol,4,4
	.comm	oldScopeBigRow,4,4
	.comm	oldScopeBigCol,4,4
	.comm	whichBloodSprite,4,4
	.comm	flyingBloodFlag,4,4
	.comm	lockFlag,4,4
	.comm	levelSpriteFlag,4,4
	.comm	levelUpVelocity,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cheatFlag, %object
	.size	cheatFlag, 4
cheatFlag:
	.word	1
	.type	shootingFlag, %object
	.size	shootingFlag, 4
shootingFlag:
	.word	1
	.type	bloodVelocity, %object
	.size	bloodVelocity, 4
bloodVelocity:
	.word	1
	.type	recoilCount, %object
	.size	recoilCount, 4
recoilCount:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	enemyBloodCounter, %object
	.size	enemyBloodCounter, 4
enemyBloodCounter:
	.space	4
	.type	levelFlag, %object
	.size	levelFlag, 4
levelFlag:
	.space	4
	.type	animationCounter, %object
	.size	animationCounter, 4
animationCounter:
	.space	4
	.type	deathAnimationCounter, %object
	.size	deathAnimationCounter, 4
deathAnimationCounter:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
