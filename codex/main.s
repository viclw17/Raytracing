	.file	"main.cpp"
	.text
	.section .rdata,"dr"
_ZStL19piecewise_construct:
	.space 1
	.section	.text$_ZnwmPv,"x"
	.linkonce discard
	.globl	_ZnwmPv
	.def	_ZnwmPv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZnwmPv
_ZnwmPv:
.LFB355:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZdlPvS_,"x"
	.linkonce discard
	.globl	_ZdlPvS_
	.def	_ZdlPvS_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZdlPvS_
_ZdlPvS_:
.LFB357:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.text
	.def	_ZL18__gthread_active_pv;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZL18__gthread_active_pv
_ZL18__gthread_active_pv:
.LFB528:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	$1, %eax
	popq	%rbp
	ret
	.seh_endproc
	.def	_ZN9__gnu_cxxL18__exchange_and_addEPVii;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxxL18__exchange_and_addEPVii
_ZN9__gnu_cxxL18__exchange_and_addEPVii:
.LFB557:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	24(%rbp), %edx
	movq	16(%rbp), %rax
	lock xaddl	%edx, (%rax)
	movl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.def	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii
_ZN9__gnu_cxxL25__exchange_and_add_singleEPii:
.LFB559:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	16(%rbp), %rax
	movl	(%rax), %edx
	movl	24(%rbp), %eax
	addl	%eax, %edx
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii:
.LFB561:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	call	_ZL18__gthread_active_pv
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L11
	movl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxxL18__exchange_and_addEPVii
	jmp	.L12
.L11:
	movl	24(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii
.L12:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
_ZN9__gnu_cxxL21__default_lock_policyE:
	.long	2
_ZStL13allocator_arg:
	.space 1
_ZStL6ignore:
	.space 1
.lcomm _ZStL8__ioinit,1,1
	.section	.text$_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev
	.def	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev
_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB2670:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	call	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt10shared_ptrI7StudentED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt10shared_ptrI7StudentED1Ev
	.def	_ZNSt10shared_ptrI7StudentED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt10shared_ptrI7StudentED1Ev
_ZNSt10shared_ptrI7StudentED1Ev:
.LFB2673:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev
	.def	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev
_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB2676:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	call	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt10shared_ptrI6PersonED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt10shared_ptrI6PersonED1Ev
	.def	_ZNSt10shared_ptrI6PersonED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt10shared_ptrI6PersonED1Ev
_ZNSt10shared_ptrI6PersonED1Ev:
.LFB2679:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Jim K.\0"
.LC1:
	.ascii "Turner W.\0"
.LC2:
	.ascii "Jessica H.\0"
.LC3:
	.ascii "Execution succeeded :)\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2667:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	call	__main
	leaq	-49(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcEC1Ev
	leaq	-49(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
.LEHB0:
	call	_ZNSsC1EPKcRKSaIcE
.LEHE0:
	leaq	-64(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
.LEHB1:
	call	_ZN6PersonC1ERKSs
.LEHE1:
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	leaq	-49(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, -8(%rbp)
	leaq	-33(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcEC1Ev
	leaq	-33(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
.LEHB2:
	call	_ZNSsC1EPKcRKSaIcE
.LEHE2:
	leaq	-48(%rbp), %rsi
	movl	$48, %ecx
.LEHB3:
	call	_Znwm
.LEHE3:
	movq	%rax, %rbx
	movq	%rsi, %rdx
	movq	%rbx, %rcx
.LEHB4:
	call	_ZN7StudentC1ERKSs
.LEHE4:
	movq	%rbx, -16(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	leaq	-33(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	leaq	-32(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
.LEHB5:
	call	_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_
.LEHE5:
	leaq	-32(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt10shared_ptrI7StudentED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
.LEHB6:
	call	_ZN6Person12haveBirthdayEv
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6Person12haveBirthdayEv
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6Person12haveBirthdayEv
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv
	movq	%rax, %rcx
	call	_ZN6Person12haveBirthdayEv
	leaq	-96(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKSbIS4_S5_T1_E
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rdx
	movq	%rax, %rcx
	call	_ZNSolsEPFRSoS_E
	leaq	.LC3(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rdx
	movq	%rax, %rcx
	call	_ZNSolsEPFRSoS_E
.LEHE6:
	cmpq	$0, -16(%rbp)
	je	.L18
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rcx
	call	*%rax
.L18:
	movq	$0, -16(%rbp)
	movl	$0, %ebx
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt10shared_ptrI6PersonED1Ev
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6PersonD1Ev
	movl	%ebx, %eax
	jmp	.L34
.L28:
	movq	%rax, %rbx
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	jmp	.L21
.L27:
	movq	%rax, %rbx
.L21:
	leaq	-49(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB7:
	call	_Unwind_Resume
.L31:
	movq	%rax, %rsi
	movl	$48, %edx
	movq	%rbx, %rcx
	call	_ZdlPvm
	movq	%rsi, %rbx
	jmp	.L23
.L30:
	movq	%rax, %rbx
.L23:
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	jmp	.L24
.L29:
	movq	%rax, %rbx
.L24:
	leaq	-33(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	jmp	.L25
.L33:
	movq	%rax, %rbx
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt10shared_ptrI6PersonED1Ev
	jmp	.L25
.L32:
	movq	%rax, %rbx
.L25:
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZN6PersonD1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
	call	_Unwind_Resume
.LEHE7:
.L34:
	addq	$144, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2667:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2667-.LLSDACSB2667
.LLSDACSB2667:
	.uleb128 .LEHB0-.LFB2667
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L27-.LFB2667
	.uleb128 0
	.uleb128 .LEHB1-.LFB2667
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L28-.LFB2667
	.uleb128 0
	.uleb128 .LEHB2-.LFB2667
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L29-.LFB2667
	.uleb128 0
	.uleb128 .LEHB3-.LFB2667
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L30-.LFB2667
	.uleb128 0
	.uleb128 .LEHB4-.LFB2667
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L31-.LFB2667
	.uleb128 0
	.uleb128 .LEHB5-.LFB2667
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L32-.LFB2667
	.uleb128 0
	.uleb128 .LEHB6-.LFB2667
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L33-.LFB2667
	.uleb128 0
	.uleb128 .LEHB7-.LFB2667
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE2667:
	.text
	.seh_endproc
	.section	.text$_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_,"x"
	.linkonce discard
	.globl	_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_
	.def	_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_
_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_:
.LFB2925:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rbx
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentEC1Ev
	movq	-48(%rbp), %rax
	leaq	-81(%rbp), %rdx
	movq	%rbx, %r8
	movq	%rax, %rcx
.LEHB8:
	call	_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_
.LEHE8:
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentED1Ev
	jmp	.L39
.L38:
	movq	%rax, %rbx
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB9:
	call	_Unwind_Resume
.LEHE9:
.L39:
	movq	-48(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2925:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2925-.LLSDACSB2925
.LLSDACSB2925:
	.uleb128 .LEHB8-.LFB2925
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L38-.LFB2925
	.uleb128 0
	.uleb128 .LEHB9-.LFB2925
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSE2925:
	.section	.text$_ZSt11make_sharedI7StudentJRA11_KcEESt10shared_ptrIT_EDpOT0_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
	.def	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev:
.LFB2928:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
.L42:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E
	.def	_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E
_ZNSt10shared_ptrI6PersonEC1I7StudentvEEOS_IT_E:
.LFB2931:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-64(%rbp), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv
	.def	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv
_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv:
.LFB2935:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaI7StudentEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaI7StudentEC1Ev
	.def	_ZNSaI7StudentEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaI7StudentEC1Ev
_ZNSaI7StudentEC1Ev:
.LFB3032:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaI7StudentED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaI7StudentED2Ev
	.def	_ZNSaI7StudentED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaI7StudentED2Ev
_ZNSaI7StudentED2Ev:
.LFB3034:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaI7StudentED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaI7StudentED1Ev
	.def	_ZNSaI7StudentED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaI7StudentED1Ev
_ZNSaI7StudentED1Ev:
.LFB3035:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE,"x"
	.linkonce discard
	.globl	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	.def	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE:
.LFB3036:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_,"x"
	.linkonce discard
	.globl	_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_
	.def	_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_
_ZSt15allocate_sharedI7StudentSaIS0_EJRA11_KcEESt10shared_ptrIT_ERKT0_DpOT1_:
.LFB3037:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%r8, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	%ebx, %edx
	movq	-48(%rbp), %rcx
	call	_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
	movq	-48(%rbp), %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
	.def	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv:
.LFB3041:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	addq	$8, %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L55
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rcx
	call	*%rax
	movq	16(%rbp), %rax
	addq	$12, %rax
	movl	$-1, %edx
	movq	%rax, %rcx
	call	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L55
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rcx
	call	*%rax
.L55:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_,"x"
	.linkonce discard
	.globl	_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
	.def	_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
_ZSt4moveIRSt10shared_ptrI7StudentEEONSt16remove_referenceIT_E4typeEOS5_:
.LFB3042:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE
	.def	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE
_ZNSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EEC2I7StudentvEEOS_IT_LS2_2EE:
.LFB3044:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rcx
	call	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev
	movq	16(%rbp), %rax
	addq	$8, %rax
	movq	24(%rbp), %rdx
	addq	$8, %rdx
	movq	%rax, %rcx
	call	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_
	movq	24(%rbp), %rax
	movq	$0, (%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv
	.def	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv
_ZNKSt19__shared_ptr_accessI6PersonLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv:
.LFB3050:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev
	.def	_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev
_ZN9__gnu_cxx13new_allocatorI7StudentEC2Ev:
.LFB3084:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev
	.def	_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev
_ZN9__gnu_cxx13new_allocatorI7StudentED2Ev:
.LFB3087:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
	.def	_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
_ZNSt10shared_ptrI7StudentEC1ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_:
.LFB3091:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movb	%dl, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	movq	32(%rbp), %rbx
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rdx
	movq	48(%rbp), %rax
	movq	%rdx, %r9
	movq	%rax, %r8
	movl	%esi, %edx
	movq	%rbx, %rcx
	call	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.def	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:
.LFB3095:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L66
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	16(%rbp), %rcx
	call	*%rax
.L66:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev
	.def	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev
_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1Ev:
.LFB3098:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_
	.def	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_
_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE7_M_swapERS2_:
.LFB3099:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv
	.def	_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv
_ZNKSt12__shared_ptrI6PersonLN9__gnu_cxx12_Lock_policyE2EE3getEv:
.LFB3100:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
	.def	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_
_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EEC2ISaIS0_EJRA11_KcEEESt19_Sp_make_shared_tagRKT_DpOT0_:
.LFB3117:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movb	%dl, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	movq	32(%rbp), %rax
	movq	$0, (%rax)
	movq	32(%rbp), %rax
	leaq	8(%rax), %rbx
	movq	56(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rdx
	movq	48(%rbp), %rax
	movq	%rdx, 32(%rsp)
	movq	%rax, %r9
	movl	$0, %r8d
	movl	%esi, %edx
	movq	%rbx, %rcx
	call	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_
	movq	32(%rbp), %rax
	addq	$8, %rax
	leaq	_ZTISt19_Sp_make_shared_tag(%rip), %rdx
	movq	%rax, %rcx
	call	_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	movq	%rax, -8(%rbp)
	movq	32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	32(%rbp), %rcx
	call	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_
	nop
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.def	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB3120:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	16+_ZTVSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE(%rip), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_
	.def	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_
_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_:
.LFB3139:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 48(%rbp)
	movb	%dl, 56(%rbp)
	movq	%r8, 64(%rbp)
	movq	%r9, 72(%rbp)
	movq	48(%rbp), %rax
	movq	$0, (%rax)
	movq	72(%rbp), %rdx
	leaq	-10(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E
	leaq	-32(%rbp), %rax
	leaq	-10(%rbp), %rdx
	movq	%rax, %rcx
.LEHB10:
	call	_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_
.LEHE10:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
.LEHB11:
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv
.LEHE11:
	movq	%rax, -8(%rbp)
	movq	72(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
	movq	%rax, %rdx
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentEC1ERKS0_
	leaq	-9(%rbp), %rdi
	movq	80(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %r12
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdx
	movl	$64, %ecx
	call	_ZnwmPv
	movq	%rax, %rbx
	testq	%rbx, %rbx
	je	.L75
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
.LEHB12:
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_
.LEHE12:
.L75:
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentED1Ev
	movq	48(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	leaq	-32(%rbp), %rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev
	leaq	-10(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev
	jmp	.L82
.L81:
	movq	%rax, %rdi
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	_ZdlPvS_
	movq	%rdi, %rbx
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentED1Ev
	jmp	.L77
.L80:
	movq	%rax, %rbx
.L77:
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev
	jmp	.L78
.L79:
	movq	%rax, %rbx
.L78:
	leaq	-10(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB13:
	call	_Unwind_Resume
	nop
.LEHE13:
.L82:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3139:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3139-.LLSDACSB3139
.LLSDACSB3139:
	.uleb128 .LEHB10-.LFB3139
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L79-.LFB3139
	.uleb128 0
	.uleb128 .LEHB11-.LFB3139
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L80-.LFB3139
	.uleb128 0
	.uleb128 .LEHB12-.LFB3139
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L81-.LFB3139
	.uleb128 0
	.uleb128 .LEHB13-.LFB3139
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE3139:
	.section	.text$_ZNSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1I7StudentSaIS4_EJRA11_KcEEESt19_Sp_make_shared_tagPT_RKT0_DpOT1_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,"x"
	.linkonce discard
	.align 2
	.globl	_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.def	_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
_ZNKSt14__shared_countILN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info:
.LFB3140:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L84
	movq	16(%rbp), %rax
	movq	(%rax), %rcx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	call	*%rax
	jmp	.L86
.L84:
	movl	$0, %eax
.L86:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_
	.def	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_
_ZNSt12__shared_ptrI7StudentLN9__gnu_cxx12_Lock_policyE2EE31_M_enable_shared_from_this_withIS0_S0_EENSt9enable_ifIXntsrNS3_15__has_esft_baseIT0_vEE5valueEvE4typeEPT_:
.LFB3141:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E
	.def	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E
_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E:
.LFB3163:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev
	.def	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev
_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev:
.LFB3166:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_,"x"
	.linkonce discard
	.globl	_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_
	.def	_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_
_ZSt18__allocate_guardedISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEESt15__allocated_ptrIT_ERS8_:
.LFB3167:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rcx
	call	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_
	movq	16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev
	.def	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev
_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev:
.LFB3170:
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
	testq	%rax, %rax
	je	.L94
	movq	16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movl	$1, %r8d
	movq	%rax, %rcx
	call	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m
.L94:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3170:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3170-.LLSDACSB3170
.LLSDACSB3170:
.LLSDACSE3170:
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv
	.def	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv
_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE3getEv:
.LFB3174:
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
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_,"x"
	.linkonce discard
	.globl	_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
	.def	_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_
_ZSt4moveIRKSaI7StudentEEONSt16remove_referenceIT_E4typeEOS5_:
.LFB3175:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaI7StudentEC2ERKS0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaI7StudentEC2ERKS0_
	.def	_ZNSaI7StudentEC2ERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaI7StudentEC2ERKS0_
_ZNSaI7StudentEC2ERKS0_:
.LFB3177:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSaI7StudentEC1ERKS0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSaI7StudentEC1ERKS0_
	.def	_ZNSaI7StudentEC1ERKS0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSaI7StudentEC1ERKS0_
_ZNSaI7StudentEC1ERKS0_:
.LFB3178:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev
	.def	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev
_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev:
.LFB3182:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNSaI7StudentED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev:
.LFB3185:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_:
.LFB3187:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%r8, -32(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	leaq	16+_ZTVSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE(%rip), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-48(%rbp), %rax
	leaq	16(%rax), %rbx
	movq	-40(%rbp), %rdx
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentEC1ERKS0_
	leaq	-81(%rbp), %rax
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaI7StudentED1Ev
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rbx
	movq	-48(%rbp), %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rcx
.LEHB14:
	call	_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_
.LEHE14:
	jmp	.L106
.L105:
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB15:
	call	_Unwind_Resume
	nop
.LEHE15:
.L106:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3187:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3187-.LLSDACSB3187
.LLSDACSB3187:
	.uleb128 .LEHB14-.LFB3187
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L105-.LFB3187
	.uleb128 0
	.uleb128 .LEHB15-.LFB3187
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
.LLSDACSE3187:
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEC1IJRA11_KcEEES1_DpOT_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn
	.def	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn
_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEaSEDn:
.LFB3188:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev
	.def	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev
_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEEC2Ev:
.LFB3199:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev
	.def	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev
_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEED2Ev:
.LFB3202:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m,"x"
	.linkonce discard
	.globl	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m
	.def	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m
_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE8allocateERS6_m:
.LFB3204:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_
	.def	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_
_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_:
.LFB3207:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m,"x"
	.linkonce discard
	.globl	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m
	.def	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m
_ZNSt16allocator_traitsISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10deallocateERS6_PS5_m:
.LFB3208:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	32(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_,"x"
	.linkonce discard
	.globl	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_
	.def	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_
_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEE10_S_raw_ptrEPS5_:
.LFB3209:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_
	.def	_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_
_ZN9__gnu_cxx13new_allocatorI7StudentEC2ERKS2_:
.LFB3211:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.def	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev:
.LFB3214:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	16+_ZTVSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE(%rip), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	16(%rbp), %rax
	movl	$1, 12(%rax)
	nop
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplC1ES1_:
.LFB3218:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv:
.LFB3219:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	call	_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_,"x"
	.linkonce discard
	.globl	_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_
	.def	_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_
_ZNSt16allocator_traitsISaI7StudentEE9constructIS0_JRA11_KcEEEvRS1_PT_DpOT0_:
.LFB3220:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv
	.def	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv
_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8allocateEmPKv:
.LFB3221:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv
	cmpq	%rax, 24(%rbp)
	seta	%al
	testb	%al, %al
	je	.L124
	call	_ZSt17__throw_bad_allocv
.L124:
	movq	24(%rbp), %rax
	salq	$6, %rax
	movq	%rax, %rcx
	call	_Znwm
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_,"x"
	.linkonce discard
	.globl	_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_
	.def	_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_
_ZSt11__addressofISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEPT_RS7_:
.LFB3222:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m
	.def	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m
_ZN9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE10deallocateEPS5_m:
.LFB3223:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	_ZdlPv
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_
	.def	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_
_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EEC2ERKS1_:
.LFB3225:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZNSaI7StudentEC2ERKS0_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv
	.def	_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv
_ZN9__gnu_cxx16__aligned_bufferI7StudentE6_M_ptrEv:
.LFB3227:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_
	.def	_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_
_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_:
.LFB3228:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%r8, -16(%rbp)
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcEC1Ev
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZSt7forwardIRA11_KcEOT_RNSt16remove_referenceIS3_E4typeE
	movq	%rax, %rcx
	leaq	-81(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %r8
	movq	%rcx, %rdx
	movq	%rax, %rcx
.LEHB16:
	call	_ZNSsC1EPKcRKSaIcE
.LEHE16:
	leaq	-96(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	%rsi, %rdx
	movl	$48, %ecx
	call	_ZnwmPv
	movq	%rax, %rbx
	testq	%rbx, %rbx
	je	.L134
	movq	%rdi, %rdx
	movq	%rbx, %rcx
.LEHB17:
	call	_ZN7StudentC1ERKSs
.LEHE17:
.L134:
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	jmp	.L139
.L138:
	movq	%rax, %rdi
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	_ZdlPvS_
	movq	%rdi, %rbx
	leaq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSsD1Ev
	jmp	.L136
.L137:
	movq	%rax, %rbx
.L136:
	leaq	-81(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaIcED1Ev
	movq	%rbx, %rax
	movq	%rax, %rcx
.LEHB18:
	call	_Unwind_Resume
	nop
.LEHE18:
.L139:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3228:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3228-.LLSDACSB3228
.LLSDACSB3228:
	.uleb128 .LEHB16-.LFB3228
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L137-.LFB3228
	.uleb128 0
	.uleb128 .LEHB17-.LFB3228
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L138-.LFB3228
	.uleb128 0
	.uleb128 .LEHB18-.LFB3228
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
.LLSDACSE3228:
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentE9constructIS1_JRA11_KcEEEvPT_DpOT0_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv
	.def	_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv
_ZNK9__gnu_cxx13new_allocatorISt23_Sp_counted_ptr_inplaceI7StudentSaIS2_ELNS_12_Lock_policyE2EEE8max_sizeEv:
.LFB3229:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movabsq	$288230376151711743, %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv
	.def	_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv
_ZN9__gnu_cxx16__aligned_bufferI7StudentE7_M_addrEv:
.LFB3230:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZTVSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTVSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 8
_ZTVSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE:
	.quad	0
	.quad	_ZTISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev
	.quad	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev
	.quad	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.quad	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.quad	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.globl	_ZTVSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTVSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 8
_ZTVSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.quad	0
	.quad	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.quad	0
	.quad	0
	.quad	__cxa_pure_virtual
	.quad	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.quad	__cxa_pure_virtual
	.globl	_ZTISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 8
_ZTISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.globl	_ZTSSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTSSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 32
_ZTSSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE:
	.ascii "St23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE\0"
	.globl	_ZTISt19_Sp_make_shared_tag
	.section	.rdata$_ZTISt19_Sp_make_shared_tag,"dr"
	.linkonce same_size
	.align 8
_ZTISt19_Sp_make_shared_tag:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt19_Sp_make_shared_tag
	.globl	_ZTSSt19_Sp_make_shared_tag
	.section	.rdata$_ZTSSt19_Sp_make_shared_tag,"dr"
	.linkonce same_size
	.align 16
_ZTSSt19_Sp_make_shared_tag:
	.ascii "St19_Sp_make_shared_tag\0"
	.globl	_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 8
_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.quad	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.globl	_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 32
_ZTSSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.ascii "St16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE\0"
	.text
	.def	_Z41__static_initialization_and_destruction_0ii;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z41__static_initialization_and_destruction_0ii
_Z41__static_initialization_and_destruction_0ii:
.LFB3247:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$1, 16(%rbp)
	jne	.L146
	cmpl	$65535, 24(%rbp)
	jne	.L146
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	movq	.refptr.__dso_handle(%rip), %r8
	leaq	_ZStL8__ioinit(%rip), %rdx
	movq	.refptr._ZNSt8ios_base4InitD1Ev(%rip), %rcx
	call	__cxa_atexit
.L146:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev:
.LFB3250:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	16+_ZTVSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE(%rip), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_ImplD1Ev
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED0Ev:
.LFB3251:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev
	movl	$64, %edx
	movq	16(%rbp), %rcx
	call	_ZdlPvm
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv:
.LFB3252:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -64(%rbp)
	movq	-64(%rbp), %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv
	movq	%rax, %rbx
	movq	-64(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv
	movq	%rbx, %rdx
	movq	%rax, %rcx
	call	_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3252:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3252-.LLSDACSB3252
.LLSDACSB3252:
.LLSDACSE3252:
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:
.LFB3253:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv
	movq	%rax, %rdx
	leaq	-1(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEEC1IS0_EERKSaIT_E
	leaq	-1(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	16(%rbp), %r8
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEEC1ERS6_PS5_
	movq	16(%rbp), %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EED1Ev
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSt15__allocated_ptrISaISt23_Sp_counted_ptr_inplaceI7StudentSaIS1_ELN9__gnu_cxx12_Lock_policyE2EEEED1Ev
	leaq	-1(%rbp), %rax
	movq	%rax, %rcx
	call	_ZNSaISt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EEED1Ev
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info:
.LFB3254:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	leaq	_ZTISt19_Sp_make_shared_tag(%rip), %rdx
	movq	%rax, %rcx
	call	_ZNKSt9type_infoeqERKS_
	testb	%al, %al
	je	.L152
	movq	16(%rbp), %rcx
	call	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE6_M_ptrEv
	jmp	.L153
.L152:
	movl	$0, %eax
.L153:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv,"x"
	.linkonce discard
	.align 2
	.globl	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv
	.def	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv
_ZNSt23_Sp_counted_ptr_inplaceI7StudentSaIS0_ELN9__gnu_cxx12_Lock_policyE2EE5_Impl8_M_allocEv:
.LFB3255:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_,"x"
	.linkonce discard
	.globl	_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_
	.def	_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_
_ZNSt16allocator_traitsISaI7StudentEE7destroyIS0_EEvRS1_PT_:
.LFB3256:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_,"x"
	.linkonce discard
	.globl	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_
	.def	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_
_ZNSt14_Sp_ebo_helperILi0ESaI7StudentELb1EE6_S_getERS2_:
.LFB3257:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_,"x"
	.linkonce discard
	.align 2
	.globl	_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_
	.def	_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_
_ZN9__gnu_cxx13new_allocatorI7StudentE7destroyIS1_EEvPT_:
.LFB3258:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, %rcx
	call	*%rax
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 8
_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.globl	_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE
	.section	.rdata$_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE,"dr"
	.linkonce same_size
	.align 32
_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE:
	.ascii "St11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE\0"
	.text
	.def	_GLOBAL__sub_I_main;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I_main
_GLOBAL__sub_I_main:
.LFB3285:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$65535, %edx
	movl	$1, %ecx
	call	_Z41__static_initialization_and_destruction_0ii
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.ident	"GCC: (GNU) 7.4.0"
	.def	_ZNSaIcEC1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSsC1EPKcRKSaIcE;	.scl	2;	.type	32;	.endef
	.def	_ZN6PersonC1ERKSs;	.scl	2;	.type	32;	.endef
	.def	_ZNSsD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSaIcED1Ev;	.scl	2;	.type	32;	.endef
	.def	__real__Znwm;	.scl	2;	.type	32;	.endef
	.def	_Znwm;	.scl	2;	.type	32;	.endef
	.def	_ZN7StudentC1ERKSs;	.scl	2;	.type	32;	.endef
	.def	_ZN6Person12haveBirthdayEv;	.scl	2;	.type	32;	.endef
	.def	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKSbIS4_S5_T1_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEPFRSoS_E;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZN6PersonD1Ev;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvm;	.scl	2;	.type	32;	.endef
	.def	_ZSt17__throw_bad_allocv;	.scl	2;	.type	32;	.endef
	.def	__real__ZdlPv;	.scl	2;	.type	32;	.endef
	.def	_ZdlPv;	.scl	2;	.type	32;	.endef
	.def	__cxa_pure_virtual;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_atexit;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt9type_infoeqERKS_;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZNSt8ios_base4InitD1Ev, "dr"
	.globl	.refptr._ZNSt8ios_base4InitD1Ev
	.linkonce	discard
.refptr._ZNSt8ios_base4InitD1Ev:
	.quad	_ZNSt8ios_base4InitD1Ev
	.section	.rdata$.refptr.__dso_handle, "dr"
	.globl	.refptr.__dso_handle
	.linkonce	discard
.refptr.__dso_handle:
	.quad	__dso_handle
	.section	.rdata$.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, "dr"
	.globl	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.linkonce	discard
.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_:
	.quad	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
