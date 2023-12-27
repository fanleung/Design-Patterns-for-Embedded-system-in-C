	.file	"UltimateO2Adapter.c"
	.text
	.globl	UltimateO2Adapter_Init
	.def	UltimateO2Adapter_Init;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_Init
UltimateO2Adapter_Init:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$16, %ecx
	call	malloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L3
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	.refptr.accessO2Conc(%rip), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	.refptr.accessGasFlow(%rip), %rdx
	movq	%rdx, 8(%rax)
.L3:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	UltimateO2Adapter_Cleanup
	.def	UltimateO2Adapter_Cleanup;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_Cleanup
UltimateO2Adapter_Cleanup:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L6
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L6
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rcx
	call	free
.L6:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	UltimateO2Adapter_Create
	.def	UltimateO2Adapter_Create;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_Create
UltimateO2Adapter_Create:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$16, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L8
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	UltimateO2Adapter_Init
.L8:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	UltimateO2Adapter_Destroy
	.def	UltimateO2Adapter_Destroy;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_Destroy
UltimateO2Adapter_Destroy:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L11
	movq	16(%rbp), %rcx
	call	UltimateO2Adapter_Destroy
.L11:
	movq	16(%rbp), %rcx
	call	free
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	UltimateO2Adapter_gimmeO2Conc
	.def	UltimateO2Adapter_gimmeO2Conc;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_gimmeO2Conc
UltimateO2Adapter_gimmeO2Conc:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	call	*%rax
	imull	$100, %eax, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	UltimateO2Adapter_gimmeO2Flow
	.def	UltimateO2Adapter_gimmeO2Flow;	.scl	2;	.type	32;	.endef
	.seh_proc	UltimateO2Adapter_gimmeO2Flow
UltimateO2Adapter_gimmeO2Flow:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	call	*%rax
	movl	%eax, %edx
	testq	%rdx, %rdx
	js	.L15
	cvtsi2sdq	%rdx, %xmm0
	jmp	.L16
.L15:
	movq	%rdx, %rax
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
.L16:
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	call	*%rax
	movl	%eax, %edx
	testq	%rdx, %rdx
	js	.L17
	cvtsi2sdq	%rdx, %xmm0
	jmp	.L18
.L17:
	movq	%rdx, %rax
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
.L18:
	mulsd	-8(%rbp), %xmm0
	cvttsd2si	%xmm0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.align 8
.LC1:
	.long	0
	.long	1078853632
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.accessGasFlow, "dr"
	.globl	.refptr.accessGasFlow
	.linkonce	discard
.refptr.accessGasFlow:
	.quad	accessGasFlow
	.section	.rdata$.refptr.accessO2Conc, "dr"
	.globl	.refptr.accessO2Conc
	.linkonce	discard
.refptr.accessO2Conc:
	.quad	accessO2Conc
