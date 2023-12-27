	.file	"AcmeO2Adapter.c"
	.text
	.globl	AcmeO2Adapter_Init
	.def	AcmeO2Adapter_Init;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_Init
AcmeO2Adapter_Init:
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
	movq	.refptr.getO2Conc(%rip), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	8(%rax), %rax
	movq	.refptr.getO2Flow(%rip), %rdx
	movq	%rdx, 8(%rax)
.L3:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	AcmeO2Adapter_Cleanup
	.def	AcmeO2Adapter_Cleanup;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_Cleanup
AcmeO2Adapter_Cleanup:
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
	.globl	AcmeO2Adapter_Create
	.def	AcmeO2Adapter_Create;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_Create
AcmeO2Adapter_Create:
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
	call	AcmeO2Adapter_Init
.L8:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	AcmeO2Adapter_Destroy
	.def	AcmeO2Adapter_Destroy;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_Destroy
AcmeO2Adapter_Destroy:
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
	call	AcmeO2Adapter_Destroy
.L11:
	movq	16(%rbp), %rcx
	call	free
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	AcmeO2Adapter_gimmeO2Conc
	.def	AcmeO2Adapter_gimmeO2Conc;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_gimmeO2Conc
AcmeO2Adapter_gimmeO2Conc:
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
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	AcmeO2Adapter_gimmeO2Flow
	.def	AcmeO2Adapter_gimmeO2Flow;	.scl	2;	.type	32;	.endef
	.seh_proc	AcmeO2Adapter_gimmeO2Flow
AcmeO2Adapter_gimmeO2Flow:
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
	movq	8(%rax), %rax
	call	*%rax
	imull	$60, %eax, %eax
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.getO2Flow, "dr"
	.globl	.refptr.getO2Flow
	.linkonce	discard
.refptr.getO2Flow:
	.quad	getO2Flow
	.section	.rdata$.refptr.getO2Conc, "dr"
	.globl	.refptr.getO2Conc
	.linkonce	discard
.refptr.getO2Conc:
	.quad	getO2Conc
