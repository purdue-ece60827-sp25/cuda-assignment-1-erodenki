In archive ./libcpuLib.a:

cpuLib.cpp.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000114 <_Z12verifyVectorPfS_S_fi>:
 114:	55                   	push   %rbp
 115:	48 89 e5             	mov    %rsp,%rbp
 118:	48 83 ec 50          	sub    $0x50,%rsp
 11c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
 120:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
 124:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
 128:	f3 0f 11 45 b4       	movss  %xmm0,-0x4c(%rbp)
 12d:	89 4d b0             	mov    %ecx,-0x50(%rbp)
 130:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 137:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 13e:	e9 a7 02 00 00       	jmpq   3ea <_Z12verifyVectorPfS_S_fi+0x2d6>
 143:	bf 04 00 00 00       	mov    $0x4,%edi
 148:	e8 00 00 00 00       	callq  14d <_Z12verifyVectorPfS_S_fi+0x39>
 14d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 151:	bf 04 00 00 00       	mov    $0x4,%edi
 156:	e8 00 00 00 00       	callq  15b <_Z12verifyVectorPfS_S_fi+0x47>
 15b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 15f:	bf 04 00 00 00       	mov    $0x4,%edi
 164:	e8 00 00 00 00       	callq  169 <_Z12verifyVectorPfS_S_fi+0x55>
 169:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 16d:	bf 04 00 00 00       	mov    $0x4,%edi
 172:	e8 00 00 00 00       	callq  177 <_Z12verifyVectorPfS_S_fi+0x63>
 177:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 17b:	bf 04 00 00 00       	mov    $0x4,%edi
 180:	e8 00 00 00 00       	callq  185 <_Z12verifyVectorPfS_S_fi+0x71>
 185:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
 189:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 18d:	f3 0f 10 45 b4       	movss  -0x4c(%rbp),%xmm0
 192:	f3 0f 11 00          	movss  %xmm0,(%rax)
 196:	8b 45 f8             	mov    -0x8(%rbp),%eax
 199:	48 98                	cltq   
 19b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1a2:	00 
 1a3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 1a7:	48 01 d0             	add    %rdx,%rax
 1aa:	f3 0f 10 00          	movss  (%rax),%xmm0
 1ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1b2:	f3 0f 11 00          	movss  %xmm0,(%rax)
 1b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
 1b9:	48 98                	cltq   
 1bb:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1c2:	00 
 1c3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 1c7:	48 01 d0             	add    %rdx,%rax
 1ca:	f3 0f 10 00          	movss  (%rax),%xmm0
 1ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 1d2:	f3 0f 11 00          	movss  %xmm0,(%rax)
 1d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1da:	f3 0f 10 08          	movss  (%rax),%xmm1
 1de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 1e2:	f3 0f 10 00          	movss  (%rax),%xmm0
 1e6:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
 1ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 1ee:	f3 0f 11 00          	movss  %xmm0,(%rax)
 1f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 1f6:	f3 0f 10 08          	movss  (%rax),%xmm1
 1fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 1fe:	f3 0f 10 00          	movss  (%rax),%xmm0
 202:	f3 0f 58 c1          	addss  %xmm1,%xmm0
 206:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 20a:	f3 0f 11 00          	movss  %xmm0,(%rax)
 20e:	8b 45 f8             	mov    -0x8(%rbp),%eax
 211:	48 98                	cltq   
 213:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 21a:	00 
 21b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 21f:	48 01 d0             	add    %rdx,%rax
 222:	f3 0f 10 00          	movss  (%rax),%xmm0
 226:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 22a:	f3 0f 10 08          	movss  (%rax),%xmm1
 22e:	0f 2e c1             	ucomiss %xmm1,%xmm0
 231:	0f 9a c0             	setp   %al
 234:	ba 01 00 00 00       	mov    $0x1,%edx
 239:	0f 2e c1             	ucomiss %xmm1,%xmm0
 23c:	0f 45 c2             	cmovne %edx,%eax
 23f:	84 c0                	test   %al,%al
 241:	0f 84 9f 01 00 00    	je     3e6 <_Z12verifyVectorPfS_S_fi+0x2d2>
 247:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 24b:	8b 45 f8             	mov    -0x8(%rbp),%eax
 24e:	48 98                	cltq   
 250:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 257:	00 
 258:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 25c:	48 01 d0             	add    %rdx,%rax
 25f:	f3 0f 10 00          	movss  (%rax),%xmm0
 263:	0f 28 c8             	movaps %xmm0,%xmm1
 266:	f3 0f 59 4d b4       	mulss  -0x4c(%rbp),%xmm1
 26b:	8b 45 f8             	mov    -0x8(%rbp),%eax
 26e:	48 98                	cltq   
 270:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 277:	00 
 278:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 27c:	48 01 d0             	add    %rdx,%rax
 27f:	f3 0f 10 00          	movss  (%rax),%xmm0
 283:	f3 0f 58 c1          	addss  %xmm1,%xmm0
 287:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
 28b:	8b 45 f8             	mov    -0x8(%rbp),%eax
 28e:	48 98                	cltq   
 290:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 297:	00 
 298:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 29c:	48 01 d0             	add    %rdx,%rax
 29f:	f3 0f 10 08          	movss  (%rax),%xmm1
 2a3:	66 0f ef d2          	pxor   %xmm2,%xmm2
 2a7:	f3 0f 5a d1          	cvtss2sd %xmm1,%xmm2
 2ab:	66 48 0f 7e d0       	movq   %xmm2,%rax
 2b0:	66 0f 28 c8          	movapd %xmm0,%xmm1
 2b4:	66 48 0f 6e c0       	movq   %rax,%xmm0
 2b9:	bf 00 00 00 00       	mov    $0x0,%edi
 2be:	b8 02 00 00 00       	mov    $0x2,%eax
 2c3:	e8 00 00 00 00       	callq  2c8 <_Z12verifyVectorPfS_S_fi+0x1b4>
 2c8:	be 00 00 00 00       	mov    $0x0,%esi
 2cd:	bf 00 00 00 00       	mov    $0x0,%edi
 2d2:	e8 00 00 00 00       	callq  2d7 <_Z12verifyVectorPfS_S_fi+0x1c3>
 2d7:	48 89 c2             	mov    %rax,%rdx
 2da:	8b 45 f8             	mov    -0x8(%rbp),%eax
 2dd:	89 c6                	mov    %eax,%esi
 2df:	48 89 d7             	mov    %rdx,%rdi
 2e2:	e8 00 00 00 00       	callq  2e7 <_Z12verifyVectorPfS_S_fi+0x1d3>
 2e7:	be 00 00 00 00       	mov    $0x0,%esi
 2ec:	48 89 c7             	mov    %rax,%rdi
 2ef:	e8 00 00 00 00       	callq  2f4 <_Z12verifyVectorPfS_S_fi+0x1e0>
 2f4:	48 89 c2             	mov    %rax,%rdx
 2f7:	8b 45 f8             	mov    -0x8(%rbp),%eax
 2fa:	48 98                	cltq   
 2fc:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 303:	00 
 304:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 308:	48 01 c8             	add    %rcx,%rax
 30b:	f3 0f 10 00          	movss  (%rax),%xmm0
 30f:	0f 28 c8             	movaps %xmm0,%xmm1
 312:	f3 0f 59 4d b4       	mulss  -0x4c(%rbp),%xmm1
 317:	8b 45 f8             	mov    -0x8(%rbp),%eax
 31a:	48 98                	cltq   
 31c:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 323:	00 
 324:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 328:	48 01 c8             	add    %rcx,%rax
 32b:	f3 0f 10 00          	movss  (%rax),%xmm0
 32f:	f3 0f 58 c8          	addss  %xmm0,%xmm1
 333:	66 0f 7e c8          	movd   %xmm1,%eax
 337:	66 0f 6e c0          	movd   %eax,%xmm0
 33b:	48 89 d7             	mov    %rdx,%rdi
 33e:	e8 00 00 00 00       	callq  343 <_Z12verifyVectorPfS_S_fi+0x22f>
 343:	be 00 00 00 00       	mov    $0x0,%esi
 348:	48 89 c7             	mov    %rax,%rdi
 34b:	e8 00 00 00 00       	callq  350 <_Z12verifyVectorPfS_S_fi+0x23c>
 350:	48 89 c2             	mov    %rax,%rdx
 353:	8b 45 f8             	mov    -0x8(%rbp),%eax
 356:	48 98                	cltq   
 358:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 35f:	00 
 360:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 364:	48 01 c8             	add    %rcx,%rax
 367:	8b 00                	mov    (%rax),%eax
 369:	66 0f 6e c0          	movd   %eax,%xmm0
 36d:	48 89 d7             	mov    %rdx,%rdi
 370:	e8 00 00 00 00       	callq  375 <_Z12verifyVectorPfS_S_fi+0x261>
 375:	be 00 00 00 00       	mov    $0x0,%esi
 37a:	48 89 c7             	mov    %rax,%rdi
 37d:	e8 00 00 00 00       	callq  382 <_Z12verifyVectorPfS_S_fi+0x26e>
 382:	48 89 c2             	mov    %rax,%rdx
 385:	8b 45 f8             	mov    -0x8(%rbp),%eax
 388:	48 98                	cltq   
 38a:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 391:	00 
 392:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 396:	48 01 c8             	add    %rcx,%rax
 399:	8b 00                	mov    (%rax),%eax
 39b:	66 0f 6e c0          	movd   %eax,%xmm0
 39f:	48 89 d7             	mov    %rdx,%rdi
 3a2:	e8 00 00 00 00       	callq  3a7 <_Z12verifyVectorPfS_S_fi+0x293>
 3a7:	be 00 00 00 00       	mov    $0x0,%esi
 3ac:	48 89 c7             	mov    %rax,%rdi
 3af:	e8 00 00 00 00       	callq  3b4 <_Z12verifyVectorPfS_S_fi+0x2a0>
 3b4:	48 89 c2             	mov    %rax,%rdx
 3b7:	8b 45 f8             	mov    -0x8(%rbp),%eax
 3ba:	48 98                	cltq   
 3bc:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 3c3:	00 
 3c4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 3c8:	48 01 c8             	add    %rcx,%rax
 3cb:	8b 00                	mov    (%rax),%eax
 3cd:	66 0f 6e c0          	movd   %eax,%xmm0
 3d1:	48 89 d7             	mov    %rdx,%rdi
 3d4:	e8 00 00 00 00       	callq  3d9 <_Z12verifyVectorPfS_S_fi+0x2c5>
 3d9:	be 00 00 00 00       	mov    $0x0,%esi
 3de:	48 89 c7             	mov    %rax,%rdi
 3e1:	e8 00 00 00 00       	callq  3e6 <_Z12verifyVectorPfS_S_fi+0x2d2>
 3e6:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 3ea:	8b 45 f8             	mov    -0x8(%rbp),%eax
 3ed:	3b 45 b0             	cmp    -0x50(%rbp),%eax
 3f0:	0f 8c 4d fd ff ff    	jl     143 <_Z12verifyVectorPfS_S_fi+0x2f>
 3f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
 3f9:	c9                   	leaveq 
 3fa:	c3                   	retq   
