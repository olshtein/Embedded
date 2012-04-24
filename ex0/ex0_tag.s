	.file	"ex0.c"
	.option	%reg
	.ident	"hc8.4.6 -a6 -core1 -g -O1 ex0.c"
	.ident	"09292009.204929"
	.equ	.CC_I,0
	.global	.CC_I
	.seg	".text",text
.L00TEXT:
	; --------------| replace |--------------
	.align	4
	.global	replace
replace:
	.cfa_bf	replace
..D2L.3:		; line #2
	push	%fp
	.cfa_push	{%fp}
	mov	%fp,%sp
	.cfa_def_cfa_register	%fp
..D2L.4:
..D2L.6:		; line #3
..D2L.7:		; line #5
	ld_s	%r3,[%r0] 
..D2L.8:		; line #6
	ld_s	%r2,[%r1] 
	st_s	%r2,[%r0] 
..D2L.9:		; line #7
	st_s	%r3,[%r1] 
..D2L.10:		; line #8
..D2L.5:
..D2L.11:
	mov	%sp,%fp
	.cfa_def_cfa_register	%sp
	pop	%fp
	.cfa_pop	{%fp}
	j_s	[%blink]
	.cfa_ef

	.type replace,@function
	.size replace,.-replace

..D2L.2:
	; --------------| modify |--------------
	.align	4
	.global	modify
modify:
	.cfa_bf	modify
..D2L.13:		; line #12
	push	%fp
	.cfa_push	{%fp}
	mov	%fp,%sp
	.cfa_def_cfa_register	%fp
	mov	%r8,%blink
	.cfa_register	%blink,%r8
	mov_s	%r7,%r0
	mov_s	%r6,%r1
..D2L.14:
..D2L.16:		; line #13
..D2L.17:		; line #15
	mov	%r5,0
.LN02.4:
	brle	%r6,%r5,.LN02.11
..D2L.18:		; line #17
	add	%r4,%r5,1
.LN02.6:
	brle	%r6,%r4,.LN02.10
..D2L.19:		; line #19
	asl	%r0,%r5,2
	add_s	%r0,%r0,%r7
	ld_s	%r0,[%r0] 
	asl	%r1,%r4,2
	add_s	%r1,%r1,%r7
	ld_s	%r1,[%r1] 
	brle	%r0,%r1,.LN02.9
..D2L.20:		; line #21
	asl	%r0,%r5,2
	add_s	%r0,%r0,%r7
	asl	%r1,%r4,2
	add_s	%r1,%r1,%r7
	;replace the array's cells using %r3 as temp register 
	ld_s	%r3,[%r0] 
	ld_s	%r2,[%r1] 
	st_s	%r2,[%r0] 
	st_s	%r3,[%r1] 

.LN02.9:
..D2L.21:		; line #23
	add	%r4,%r4,1
	b_s	.LN02.6
.LN02.10:
..D2L.22:		; line #24
	add	%r5,%r5,1
	b_s	.LN02.4
.LN02.11:
..D2L.23:		; line #25
..D2L.15:
..D2L.24:
	mov	%blink,%r8
	.cfa_restore	{%blink}
	mov	%sp,%fp
	.cfa_def_cfa_register	%sp
	pop	%fp
	.cfa_pop	{%fp}
	j_s	[%blink]
	.cfa_ef

	.type modify,@function
	.size modify,.-modify

..D2L.12:
	.seg	".data1",data
.L00BDATA:
	.align	4
	.global	data
data:
	.size	data,0x20
	.type	data, @object
	.long	0x4	; (4)
	.long	0x8	; (8)
	.long	0x2	; (2)
	.long	0x6	; (6)
	.long	0x7	; (7)
	.long	0x8	; (8)
	.long	0xa	; (10)
	.long	0x5	; (5)
	.seg	".text"
	; --------------| main |--------------
	.align	4
	.global	main
main:
	.cfa_bf	main
..D2L.26:		; line #32
	push_s	%blink
	.cfa_push	{%blink}
..D2L.27:
..D2L.29:		; line #33
	mov	%r9,8
..D2L.30:		; line #35
	mov_s	%r0,data 
	mov_s	%r1,8
	bl_s	modify
..D2L.31:		; line #36
..D2L.28:
..D2L.32:
	pop_s	%blink
	.cfa_pop	{%blink}
	j_s	[%blink]
	.cfa_ef

	.type main,@function
	.size main,.-main

..D2L.25:
	.section	.debug_abbrev
..startof.debug_abbrev:
	.type	..startof.debug_abbrev,@object
..D2L.33:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0x1b
	.byte	0x8
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x10
	.byte	0x6
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.2byte	0x0
	.byte	0x2
	.byte	0x24
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.2byte	0x0
	.byte	0x3
	.byte	0xf
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0xb
	.byte	0xb
	.2byte	0x0
	.byte	0x4
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x40
	.byte	0xa
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.2byte	0x0
	.byte	0x5
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x2
	.byte	0xa
	.2byte	0x0
	.byte	0x6
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.2byte	0x0
	.byte	0x7
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x2
	.byte	0xa
	.2byte	0x0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.2byte	0x0
	.byte	0x9
	.byte	0x21
	.byte	0x0
	.byte	0x2f
	.byte	0xb
	.2byte	0x0
	.byte	0xa
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x2
	.byte	0xa
	.2byte	0x0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0xc
	.byte	0x3
	.byte	0x8
	.byte	0x40
	.byte	0xa
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.2byte	0x0
	.byte	0x0
	.previous
	.section	.debug_info
..startof.debug_info:
	.type	..startof.debug_info,@object
..D2L.0:
	.4byte	..D2L.1 - ..D2L.0 - 0x4
	.2byte	0x2
	.4byte	..D2L.33
	.byte	0x4
..D2tag.1:
	.byte	0x1
	.ascii	"ex0.c"
	.byte	0x0	; (0)
	.ascii	"/a/fr-01/vol/home/grad/avishl02/devl/embsys/ex0/"
	.byte	0x0	; (0)
	.ascii	"MetaWare hc3.2a"
	.byte	0x0	; (0)
	.byte	0x2
	.4byte	..startof.debug_line
	.4byte	replace
	.4byte	replace + ( ..D2L.25 - replace )
	.4byte	..D2tag.28 - ..startof.debug_info
..D2tag.3:
	.byte	0x2
	.ascii	"int"
	.byte	0x0	; (0)
	.byte	0x4
	.byte	0x5
..D2tag.2:
	.byte	0x3
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x4
..D2tag.4:
	.byte	0x4
	.byte	0x1
	.ascii	"replace"
	.byte	0x0	; (0)
	.byte	..D2L.35 - ..D2L.34
..D2L.34:
	.byte	0x6b
..D2L.35:
	.4byte	replace
	.4byte	replace + ( ..D2L.2 - replace )
	.byte	0x1
	.byte	0x2
	.4byte	..D2tag.11 - ..startof.debug_info
..D2tag.5:
	.byte	0x5
	.ascii	"num1"
	.byte	0x0	; (0)
	.4byte	..D2tag.2 - ..startof.debug_info
	.byte	0x1
	.byte	0x2
	.byte	..D2L.37 - ..D2L.36
..D2L.36:
	.byte	0x50
..D2L.37:
..D2tag.6:
	.byte	0x5
	.ascii	"num2"
	.byte	0x0	; (0)
	.4byte	..D2tag.2 - ..startof.debug_info
	.byte	0x1
	.byte	0x2
	.byte	..D2L.39 - ..D2L.38
..D2L.38:
	.byte	0x51
..D2L.39:
..D2tag.7:
	.byte	0x6
	.4byte	replace + ( ..D2L.4 - replace )
	.4byte	replace + ( ..D2L.5 - replace )
..D2tag.8:
	.byte	0x7
	.ascii	"temp"
	.byte	0x0	; (0)
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x1
	.byte	0x3
	.byte	..D2L.41 - ..D2L.40
..D2L.40:
	.byte	0x53
..D2L.41:
	.byte	0x0
..D2tag.9:
	.byte	0x0
..D2tag.10:
..D2tag.11:
	.byte	0x4
	.byte	0x1
	.ascii	"modify"
	.byte	0x0	; (0)
	.byte	..D2L.43 - ..D2L.42
..D2L.42:
	.byte	0x6b
..D2L.43:
	.4byte	modify
	.4byte	modify + ( ..D2L.12 - modify )
	.byte	0x1
	.byte	0xc
	.4byte	..D2tag.19 - ..startof.debug_info
..D2tag.12:
	.byte	0x5
	.ascii	"list"
	.byte	0x0	; (0)
	.4byte	..D2tag.2 - ..startof.debug_info
	.byte	0x1
	.byte	0xc
	.byte	..D2L.45 - ..D2L.44
..D2L.44:
	.byte	0x57
..D2L.45:
..D2tag.13:
	.byte	0x5
	.ascii	"size"
	.byte	0x0	; (0)
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x1
	.byte	0xc
	.byte	..D2L.47 - ..D2L.46
..D2L.46:
	.byte	0x56
..D2L.47:
..D2tag.14:
	.byte	0x6
	.4byte	modify + ( ..D2L.14 - modify )
	.4byte	modify + ( ..D2L.15 - modify )
..D2tag.15:
	.byte	0x7
	.ascii	"out"
	.byte	0x0	; (0)
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x1
	.byte	0xd
	.byte	..D2L.49 - ..D2L.48
..D2L.48:
	.byte	0x55
..D2L.49:
..D2tag.16:
	.byte	0x7
	.ascii	"in"
	.byte	0x0	; (0)
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x1
	.byte	0xd
	.byte	..D2L.51 - ..D2L.50
..D2L.50:
	.byte	0x54
..D2L.51:
	.byte	0x0
..D2tag.17:
	.byte	0x0
..D2tag.18:
..D2tag.19:
	.byte	0x8
	.4byte	..D2tag.3 - ..startof.debug_info
	.4byte	..D2tag.22 - ..startof.debug_info
..D2tag.20:
	.byte	0x9
	.byte	0x7
	.byte	0x0
..D2tag.21:
..D2tag.22:
	.byte	0xa
	.ascii	"data"
	.byte	0x0	; (0)
	.4byte	..D2tag.19 - ..startof.debug_info
	.byte	0x1
	.byte	0x1
	.byte	0x1d
	.byte	..D2L.53 - ..D2L.52
..D2L.52:
	.byte	0x3
	.4byte	data
..D2L.53:
..D2tag.23:
	.byte	0xb
	.byte	0x1
	.ascii	"main"
	.byte	0x0	; (0)
	.byte	..D2L.55 - ..D2L.54
..D2L.54:
	.byte	0x6c
..D2L.55:
	.4byte	main
	.4byte	main + ( ..D2L.25 - main )
	.byte	0x1
	.byte	0x20
..D2tag.24:
	.byte	0x6
	.4byte	main + ( ..D2L.27 - main )
	.4byte	main + ( ..D2L.28 - main )
..D2tag.25:
	.byte	0x7
	.ascii	"nItems"
	.byte	0x0	; (0)
	.4byte	..D2tag.3 - ..startof.debug_info
	.byte	0x1
	.byte	0x21
	.byte	..D2L.57 - ..D2L.56
..D2L.56:
	.byte	0x59
..D2L.57:
	.byte	0x0
..D2tag.26:
	.byte	0x0
..D2tag.27:
	.byte	0x0
..D2tag.28:
..D2L.1:
	.previous
	.section	.debug_aranges
..startof.debug_aranges:
	.type	..startof.debug_aranges,@object
	.4byte	..D2L.59 - ..D2L.58
..D2L.58:
	.2byte	0x2
	.4byte	..D2L.0
	.byte	0x4
	.byte	0x0
	.4byte	0x0
	.4byte	replace
	.4byte	..D2L.25 - replace
	.4byte	0x0
	.4byte	0x0
..D2L.59:
	.previous
	.section	.debug_pubnames
..startof.debug_pubnames:
	.type	..startof.debug_pubnames,@object
	.4byte	..D2L.61 - ..D2L.60
..D2L.60:
	.2byte	0x2
	.4byte	..D2L.0
	.4byte	..D2L.1 - ..D2L.0 - 0x4
	.4byte	..D2tag.4 - ..D2L.0
	.ascii	"replace"
	.byte	0x0	; (0)
	.4byte	..D2tag.11 - ..D2L.0
	.ascii	"modify"
	.byte	0x0	; (0)
	.4byte	..D2tag.22 - ..D2L.0
	.ascii	"data"
	.byte	0x0	; (0)
	.4byte	..D2tag.23 - ..D2L.0
	.ascii	"main"
	.byte	0x0	; (0)
	.4byte	0x0
..D2L.61:
	.previous
	.section	.debug_line
..startof.debug_line:
	.type	..startof.debug_line,@object
..D2L.62:
	.4byte	.end_of.debug_line - ..D2L.62 - 0x4
	.2byte	0x2
..D2L.63:
	.4byte	.end_of.debug_line_prolog - ..D2L.63 - 0x4
	.byte	0x2
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.2byte	0x0
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.ascii	"ex0.c"
	.byte	0x0	; (0)
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
.end_of.debug_line_prolog:
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.3 - replace )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.6 - replace )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.7 - replace )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.8 - replace )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.9 - replace )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	replace + ( ..D2L.10 - replace )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.13 - modify )
	.byte	0x3
	.byte	0x4
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.16 - modify )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.17 - modify )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.18 - modify )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.19 - modify )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.20 - modify )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.21 - modify )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.22 - modify )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	modify + ( ..D2L.23 - modify )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	main + ( ..D2L.26 - main )
	.byte	0x3
	.byte	0x7
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	main + ( ..D2L.29 - main )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	main + ( ..D2L.30 - main )
	.byte	0x3
	.byte	0x2
	.byte	0x1
	.byte	0x0
	.byte	0x5
	.byte	0x2
	.4byte	main + ( ..D2L.31 - main )
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x1
	.byte	0x1
.end_of.debug_line:
	.previous
	.end
