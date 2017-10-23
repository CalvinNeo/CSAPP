Dump of assembler code for function phase_2:
   0x0000000000400efc <+0>:	push   %rbp
   0x0000000000400efd <+1>:	push   %rbx
   0x0000000000400efe <+2>:	sub    $0x28,%rsp
   0x0000000000400f02 <+6>:	mov    %rsp,%rsi
   0x0000000000400f05 <+9>:	callq  0x40145c <read_six_numbers>
   => 0x0000000000400f0a <+14>:	cmpl   $0x1,(%rsp) ; the first integer you input
   0x0000000000400f0e <+18>:	je     0x400f30 <phase_2+52> ; should == 0x1
   0x0000000000400f10 <+20>:	callq  0x40143a <explode_bomb>
   0x0000000000400f15 <+25>:	jmp    0x400f30 <phase_2+52>
   0x0000000000400f17 <+27>:	mov    -0x4(%rbx),%eax
   => 0x0000000000400f1a <+30>:	add    %eax,%eax
   => 0x0000000000400f1c <+32>:	cmp    %eax,(%rbx)
   0x0000000000400f1e <+34>:	je     0x400f25 <phase_2+41>
   0x0000000000400f20 <+36>:	callq  0x40143a <explode_bomb>
   0x0000000000400f25 <+41>:	add    $0x4,%rbx
   0x0000000000400f29 <+45>:	cmp    %rbp,%rbx
   0x0000000000400f2c <+48>:	jne    0x400f17 <phase_2+27>
   0x0000000000400f2e <+50>:	jmp    0x400f3c <phase_2+64>
   0x0000000000400f30 <+52>:	lea    0x4(%rsp),%rbx
   0x0000000000400f35 <+57>:	lea    0x18(%rsp),%rbp
   0x0000000000400f3a <+62>:	jmp    0x400f17 <phase_2+27>
   0x0000000000400f3c <+64>:	add    $0x28,%rsp
   0x0000000000400f40 <+68>:	pop    %rbx
   0x0000000000400f41 <+69>:	pop    %rbp
   0x0000000000400f42 <+70>:	retq   
End of assembler dump.

Dump of assembler code for function read_six_numbers:
   0x000000000040145c <+0>:	sub    $0x18,%rsp
   0x0000000000401460 <+4>:	mov    %rsi,%rdx
   0x0000000000401463 <+7>:	lea    0x4(%rsi),%rcx
   0x0000000000401467 <+11>:	lea    0x14(%rsi),%rax
   0x000000000040146b <+15>:	mov    %rax,0x8(%rsp)
   0x0000000000401470 <+20>:	lea    0x10(%rsi),%rax
   0x0000000000401474 <+24>:	mov    %rax,(%rsp)
   ; pass arguments by register. 1: rdi, 2: rsi, 3: rdx, 4: rcx, 5: r8, 6: r9
   0x0000000000401478 <+28>:	lea    0xc(%rsi),%r9
   0x000000000040147c <+32>:	lea    0x8(%rsi),%r8 ; use print {char*} ($rsi+8) to get what you input
   0x0000000000401480 <+36>:	mov    $0x4025c3,%esi ; use print {char[30]} 0x4025c3 to get format %d %d %d %d %d %d
   0x0000000000401485 <+41>:	mov    $0x0,%eax
   0x000000000040148a <+46>:	callq  0x400bf0 <__isoc99_sscanf@plt>
   ; print {int[20]} ($rsp) to get your parsed input
   0x000000000040148f <+51>:	cmp    $0x5,%eax ; eax is return value
   0x0000000000401492 <+54>:	jg     0x401499 <read_six_numbers+61> ; if more than 5 args are parsed, $eax supposed to be 6
   0x0000000000401494 <+56>:	callq  0x40143a <explode_bomb>
   0x0000000000401499 <+61>:	add    $0x18,%rsp
   0x000000000040149d <+65>:	retq   
End of assembler dump.


Dump of assembler code for function phase_3:
   0x0000000000400f43 <+0>:	sub    $0x18,%rsp
   0x0000000000400f47 <+4>:	lea    0xc(%rsp),%rcx
   0x0000000000400f4c <+9>:	lea    0x8(%rsp),%rdx
   0x0000000000400f51 <+14>:	mov    $0x4025cf,%esi
   0x0000000000400f56 <+19>:	mov    $0x0,%eax
   0x0000000000400f5b <+24>:	callq  0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000400f60 <+29>:	cmp    $0x1,%eax
   0x0000000000400f63 <+32>:	jg     0x400f6a <phase_3+39> ; must read more than 1 integers
   0x0000000000400f65 <+34>:	callq  0x40143a <explode_bomb> ; or boom
   0x0000000000400f6a <+39>:	cmpl   $0x7,0x8(%rsp) ; if the first integer > 7
   0x0000000000400f6f <+44>:	ja     0x400fad <phase_3+106> ; then boom
   0x0000000000400f71 <+46>:	mov    0x8(%rsp),%eax ; move the first integer to eax
   0x0000000000400f75 <+50>:	jmpq   *0x402470(,%rax,8) ; 0x402470 + %rax * 8 is a pointer to a int64 which shows where to jump, use print /x {long long[7]} (0x402470 + $rax*8) 
   ; {0x400fb9, 0x400f83, 0x400f8a, 0x400f91, 0x400f98, 0x400f9f, 0x400fa6}
   ; this is a switch struct
   0x0000000000400f7c <+57>:	mov    $0xcf,%eax
   0x0000000000400f81 <+62>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f83 <+64>:	mov    $0x2c3,%eax
   0x0000000000400f88 <+69>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f8a <+71>:	mov    $0x100,%eax
   0x0000000000400f8f <+76>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f91 <+78>:	mov    $0x185,%eax
   0x0000000000400f96 <+83>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f98 <+85>:	mov    $0xce,%eax
   0x0000000000400f9d <+90>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f9f <+92>:	mov    $0x2aa,%eax
   0x0000000000400fa4 <+97>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400fa6 <+99>:	mov    $0x147,%eax
   0x0000000000400fab <+104>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400fad <+106>:	callq  0x40143a <explode_bomb>
   0x0000000000400fb2 <+111>:	mov    $0x0,%eax
   0x0000000000400fb7 <+116>:	jmp    0x400fbe <phase_3+123>
   => 0x0000000000400fb9 <+118>:	mov    $0x137,%eax
   => 0x0000000000400fbe <+123>:	cmp    0xc(%rsp),%eax 
   0x0000000000400fc2 <+127>:	je     0x400fc9 <phase_3+134>
   0x0000000000400fc4 <+129>:	callq  0x40143a <explode_bomb>
   0x0000000000400fc9 <+134>:	add    $0x18,%rsp
   0x0000000000400fcd <+138>:	retq   
End of assembler dump.

Dump of assembler code for function phase_4:
   0x000000000040100c <+0>:	sub    $0x18,%rsp
   0x0000000000401010 <+4>:	lea    0xc(%rsp),%rcx ; %rcx = & %rsp+0xc
   0x0000000000401015 <+9>:	lea    0x8(%rsp),%rdx ; pointer to output of __isoc99_sscanf ; 
   0x000000000040101a <+14>:	mov    $0x4025cf,%esi ; format string ; print (char *) 0x4025cf
   0x000000000040101f <+19>:	mov    $0x0,%eax
   0x0000000000401024 <+24>:	callq  0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000401029 <+29>:	cmp    $0x2,%eax ; print {int[20]} ($rsp+8) to get your parsed input
   0x000000000040102c <+32>:	jne    0x401035 <phase_4+41> ; if not 2 integers then explode
   0x000000000040102e <+34>:	cmpl   $0xe,0x8(%rsp) ; the first integer you input
   => 0x0000000000401033 <+39>:	jbe    0x40103a <phase_4+46> ; should < 0xe
   0x0000000000401035 <+41>:	callq  0x40143a <explode_bomb>
   0x000000000040103a <+46>:	mov    $0xe,%edx
   0x000000000040103f <+51>:	mov    $0x0,%esi
   0x0000000000401044 <+56>:	mov    0x8(%rsp),%edi
   ; pass arguments by register. 1: rdi, 2: rsi, 3: rdx
   => 0x0000000000401048 <+60>:	callq  0x400fce <func4>
   0x000000000040104d <+65>:	test   %eax,%eax ; if eax != 0
   0x000000000040104f <+67>:	jne    0x401058 <phase_4+76> ; then goto boom
   0x0000000000401051 <+69>:	cmpl   $0x0,0xc(%rsp) ; the second integer you input must be 0
   0x0000000000401056 <+74>:	je     0x40105d <phase_4+81> ; or goto boom
   0x0000000000401058 <+76>:	callq  0x40143a <explode_bomb>
   0x000000000040105d <+81>:	add    $0x18,%rsp
   0x0000000000401061 <+85>:	retq   
End of assembler dump.
   
Dump of assembler code for function func4:
; first call
; edx = 0xe = 14
; esi = 0
; edi = arg[0]
   0x0000000000400fce <+0>:	sub    $0x8,%rsp ; allocate on stack
   0x0000000000400fd2 <+4>:	mov    %edx,%eax ; eax = edx
   0x0000000000400fd4 <+6>:	sub    %esi,%eax ; eax -= esi
   0x0000000000400fd6 <+8>:	mov    %eax,%ecx ; ecx = eax
   0x0000000000400fd8 <+10>:	shr    $0x1f,%ecx ; ecx >> 31
   0x0000000000400fdb <+13>:	add    %ecx,%eax ; eax += ecx
   0x0000000000400fdd <+15>:	sar    %eax ; eax >>> 1
   ; this lea is used to do simple calculation instead of compute an address for somebody to load from(which use mov)
   0x0000000000400fdf <+17>:	lea    (%rax,%rsi,1),%ecx ; ecx = rax+rsi*1
   ; x = (edx - esi)
   ; y = x + (x >> 31)
   ; eax = (y >>> 1)
   ; ecx = eax + esi
   0x0000000000400fe2 <+20>:	cmp    %edi,%ecx
   0x0000000000400fe4 <+22>:	jle    0x400ff2 <func4+36> ; if ecx <= edi goto +36
   ; this lea is used to do simple calculation instead of compute an address for somebody to load from(which use mov)
   0x0000000000400fe6 <+24>:	lea    -0x1(%rcx),%edx ; edx = rcx - 0x1
   ; edx = ecx - 1
   0x0000000000400fe9 <+27>:	callq  0x400fce <func4>
   0x0000000000400fee <+32>:	add    %eax,%eax
   0x0000000000400ff0 <+34>:	jmp    0x401007 <func4+57> ; goto +57(end)
   0x0000000000400ff2 <+36>:	mov    $0x0,%eax ; now everthing is almost ok, set eax to 0
   0x0000000000400ff7 <+41>:	cmp    %edi,%ecx ; if ecx >= edi
   0x0000000000400ff9 <+43>:	jge    0x401007 <func4+57> ; then goto +57(end)
   0x0000000000400ffb <+45>:	lea    0x1(%rcx),%esi ; else, func4 again
   0x0000000000400ffe <+48>:	callq  0x400fce <func4>
   0x0000000000401003 <+53>:	lea    0x1(%rax,%rax,1),%eax
   0x0000000000401007 <+57>:	add    $0x8,%rsp
   0x000000000040100b <+61>:	retq   
End of assembler dump.
   
```
__int64 __fastcall func4(__int64 a1, __int64 a2, int a3)
{
  signed int v3; // ecx@1
  __int64 result; // rax@2

  v3 = (a3 - (signed int)a2) / 2 + a2;
  if ( v3 <= (signed int)a1 )
  {
    result = 0LL;
    if ( v3 < (signed int)a1 )
      result = (unsigned int)(2 * func4(a1, (unsigned int)(v3 + 1)) + 1);
  }
  else
  {
    result = (unsigned int)(2 * func4(a1, a2));
  }
  return result;
}
```


Dump of assembler code for function phase_5:
   0x0000000000401062 <+0>:	push   %rbx
   0x0000000000401063 <+1>:	sub    $0x20,%rsp
   0x0000000000401067 <+5>:	mov    %rdi,%rbx ; rdi and rbx now points to input string
   0x000000000040106a <+8>:	mov    %fs:0x28,%rax
   0x0000000000401073 <+17>:	mov    %rax,0x18(%rsp)
   0x0000000000401078 <+22>:	xor    %eax,%eax
   0x000000000040107a <+24>:	callq  0x40131b <string_length>
   0x000000000040107f <+29>:	cmp    $0x6,%eax ; this string has length 6
   0x0000000000401082 <+32>:	je     0x4010d2 <phase_5+112>
   0x0000000000401084 <+34>:	callq  0x40143a <explode_bomb>
   0x0000000000401089 <+39>:	jmp    0x4010d2 <phase_5+112>
   ; loop begin
   0x000000000040108b <+41>:	movzbl (%rbx,%rax,1),%ecx ; load the rax-th char to ecx
   0x000000000040108f <+45>:	mov    %cl,(%rsp) ; move the char to top of the stack
   0x0000000000401092 <+48>:	mov    (%rsp),%rdx ; %rdx is the char
   0x0000000000401096 <+52>:	and    $0xf,%edx ; edx mod= 16(useless?)
   0x0000000000401099 <+55>:	movzbl 0x4024b0(%rdx),%edx ; edx = [0x4024b0(%rdx)], where rdx is the char
   ; use rdx as indexer of char table 0x4024b0
   ; 0m 1a 2d 3u 4i 5e 6r 7s 8n 9f 10o 11t 12v 13b 14y 15l
   ; flyer means 9 f e 5 6 7
   0x00000000004010a0 <+62>:	mov    %dl,0x10(%rsp,%rax,1) ; move dl, the char to rsp + rax + 0x10
   ; this operation must set the string to flyers
   0x00000000004010a4 <+66>:	add    $0x1,%rax ; inc loop_i
   0x00000000004010a8 <+70>:	cmp    $0x6,%rax ; if loop_i != 6
   0x00000000004010ac <+74>:	jne    0x40108b <phase_5+41> ; continue
   0x00000000004010ae <+76>:	movb   $0x0,0x16(%rsp)  ; add '\0' at the string's end
   0x00000000004010b3 <+81>:	mov    $0x40245e,%esi ; flyers
   0x00000000004010b8 <+86>:	lea    0x10(%rsp),%rdi ; aduier
   0x00000000004010bd <+91>:	callq  0x401338 <strings_not_equal>
   0x00000000004010c2 <+96>:	test   %eax,%eax ; if string equal goto end
   0x00000000004010c4 <+98>:	je     0x4010d9 <phase_5+119>
   0x00000000004010c6 <+100>:	callq  0x40143a <explode_bomb>
   0x00000000004010cb <+105>:	nopl   0x0(%rax,%rax,1)
   0x00000000004010d0 <+110>:	jmp    0x4010d9 <phase_5+119>
   0x00000000004010d2 <+112>:	mov    $0x0,%eax
   0x00000000004010d7 <+117>:	jmp    0x40108b <phase_5+41>
   ; loop end
   0x00000000004010d9 <+119>:	mov    0x18(%rsp),%rax
   0x00000000004010de <+124>:	xor    %fs:0x28,%rax
   0x00000000004010e7 <+133>:	je     0x4010ee <phase_5+140>
   0x00000000004010e9 <+135>:	callq  0x400b30 <__stack_chk_fail@plt>
   0x00000000004010ee <+140>:	add    $0x20,%rsp
   0x00000000004010f2 <+144>:	pop    %rbx
   0x00000000004010f3 <+145>:	retq   
End of assembler dump.

Dump of assembler code for function phase_6:
   0x00000000004010f4 <+0>:	push   %r14
   0x00000000004010f6 <+2>:	push   %r13
   0x00000000004010f8 <+4>:	push   %r12
   0x00000000004010fa <+6>:	push   %rbp
   0x00000000004010fb <+7>:	push   %rbx
   0x00000000004010fc <+8>:	sub    $0x50,%rsp
   0x0000000000401100 <+12>:	mov    %rsp,%r13 ; r13 = rsp
   0x0000000000401103 <+15>:	mov    %rsp,%rsi ; rsi = rsp
   0x0000000000401106 <+18>:	callq  0x40145c <read_six_numbers>
   0x000000000040110b <+23>:	mov    %rsp,%r14 ; r14 = rsp -> num[0]
   0x000000000040110e <+26>:	mov    $0x0,%r12d ; r12d = 0
   ; now rbp = r13 = rsp
   ; loop_1 begin
   0x0000000000401114 <+32>:	mov    %r13,%rbp ; r13 -> num[0]
   0x0000000000401117 <+35>:	mov    0x0(%r13),%eax ; eax = num[r13]
   ; keep in mind that 0 - 1 = -1 = 0xffffffff, which, by unsigned cmp, is greater than 5
   0x000000000040111b <+39>:	sub    $0x1,%eax ; eax--
   0x000000000040111e <+42>:	cmp    $0x5,%eax ; if eax > 5
   0x0000000000401121 <+45>:	jbe    0x401128 <phase_6+52> ; then boom
   0x0000000000401123 <+47>:	callq  0x40143a <explode_bomb>
   0x0000000000401128 <+52>:	add    $0x1,%r12d ; r12d += 1 
   0x000000000040112c <+56>:	cmp    $0x6,%r12d ; if r12d == 6
   0x0000000000401130 <+60>:	je     0x401153 <phase_6+95> ; goto +95
   0x0000000000401132 <+62>:	mov    %r12d,%ebx ; else move r12d to ebx
   ; loop_1_1 begin
   0x0000000000401135 <+65>:	movslq %ebx,%rax ; WARN move ebx to rax
   0x0000000000401138 <+68>:	mov    (%rsp,%rax,4),%eax ; eax = M[rsp + 4 * rax]
   0x000000000040113b <+71>:	cmp    %eax,0x0(%rbp) ; if eax == num[0]
   0x000000000040113e <+74>:	jne    0x401145 <phase_6+81> ; then boom 
   0x0000000000401140 <+76>:	callq  0x40143a <explode_bomb>
   0x0000000000401145 <+81>:	add    $0x1,%ebx ; ebx += 1
   0x0000000000401148 <+84>:	cmp    $0x5,%ebx ; if ebx <= 5
   0x000000000040114b <+87>:	jle    0x401135 <phase_6+65> ; goto +65 ; if ebx > 5 then break
   ; loop_1_1 end
   0x000000000040114d <+89>:	add    $0x4,%r13 ; r13 += 4
   0x0000000000401151 <+93>:	jmp    0x401114 <phase_6+32> ; goto +32
   ; loop_1 end
   ```
	// pseu-code:
	r13 = rsi = r14 = rsp = num[0]
	for r12d in [0, 6):
		rbp = r13
		if nums[r13] > 6:
			boom()
		for ebx in [r12d, 5):
			if num[rbx] == *rbp:
				boom
		r13 += 4
	// 1 2 3 4 5 6 may goto here
	// forall in num, must <= 6, and not repeated, and not == 0
   ```
   0x0000000000401153 <+95>:	lea    0x18(%rsp),%rsi ; now rsi point to nums[7](which is not exist)
   0x0000000000401158 <+100>:	mov    %r14,%rax ; rax = r14, now point to num[0]
   0x000000000040115b <+103>:	mov    $0x7,%ecx ; ecx = 7
   ; loop_2 begin
   ; now rax point to num[0]
   0x0000000000401160 <+108>:	mov    %ecx,%edx ; edx = ecx
   0x0000000000401162 <+110>:	sub    (%rax),%edx ; edx -= num[rax]
   0x0000000000401164 <+112>:	mov    %edx,(%rax) ; num[rax] = edx
   0x0000000000401166 <+114>:	add    $0x4,%rax ; rax += 4 ; goto next number
   0x000000000040116a <+118>:	cmp    %rsi,%rax ; if rsi == rax
   0x000000000040116d <+121>:	jne    0x401160 <phase_6+108> ; then break
   ; loop_2 end
   ```
	// pseu-code:
	rax = &num[0]
	rsi = &num[7]
	edx = 0
	for rax from num[0] to num[6] :
		edx = ecx - num[rax]
		num[rax] = edx
	// 7-num[0], 7-num[1], ..., 7-num[6]
   ```
   ; now edx = 7-num[6]
   0x000000000040116f <+123>:	mov    $0x0,%esi
   0x0000000000401174 <+128>:	jmp    0x401197 <phase_6+163>
   ; loop_3 begin
   ; now edx = 0x6032d0, eax = 1
   0x0000000000401176 <+130>:	mov    0x8(%rdx),%rdx 
   0x000000000040117a <+134>:	add    $0x1,%eax ; eax += 1
   0x000000000040117d <+137>:	cmp    %ecx,%eax ; if ecx != eax
   0x000000000040117f <+139>:	jne    0x401176 <phase_6+130> ; then continue
   0x0000000000401181 <+141>:	jmp    0x401188 <phase_6+148> ; else goto start_loop_3_1, now ecx = eax
   ; loop_3_1 begin
   0x0000000000401183 <+143>:	mov    $0x6032d0,%edx ; {332, 1, 6304480, 0, 168, 2, 6304496, 0, 924, 3, 6304512, 0, 691, 4, 6304528, 0, 477, 5, 6304544}
   .start_loop_3_1:
   0x0000000000401188 <+148>:	mov    %rdx,0x20(%rsp,%rsi,2) ; M[rsp + 2 * rsi + 0x20] = rdx = 0x6032d0
   0x000000000040118d <+153>:	add    $0x4,%rsi ; rsi += 4 (start from 0)
   0x0000000000401191 <+157>:	cmp    $0x18,%rsi ; if rsi == 0x18, 0x18 / 4 = 6
   0x0000000000401195 <+161>:	je     0x4011ab <phase_6+183> ; then goto end_loop_3;
   .start_loop_3:
   0x0000000000401197 <+163>:	mov    (%rsp,%rsi,1),%ecx ; ecx = num[rsi]
   0x000000000040119a <+166>:	cmp    $0x1,%ecx ; if ecx <= 1
   0x000000000040119d <+169>:	jle    0x401183 <phase_6+143> ; then continue to loop_3_1 begin, else break
   ; loop_3_1 end
   0x000000000040119f <+171>:	mov    $0x1,%eax ; eax = 1
   0x00000000004011a4 <+176>:	mov    $0x6032d0,%edx ; edx = 0x6032d0
   0x00000000004011a9 <+181>:	jmp    0x401176 <phase_6+130>
   ; loop_3 end
   ```
	// pseu-code:
	esi = 0
	goto start_loop_3
	for
		while eax != ecx:
			rdx = M[rdx + 0x8]
			eax ++
		; goto start_loop_3_1
		do
			; edx = 0x6032d0
			; start_loop_3_1:
			M[rsp + 2 * rsi + 0x20] = rdx
			rsi += 4
			if rsi == 0x18:
				goto end_loop_3
			start_loop_3:
			ecx = num[rsi]
		while ecx <= 1
		eax = 1
		edx = 0x6032d0
	end_loop_3:
	// and can be simplified to
	esi = 0
	data = rsp + 0x20
	goto start_loop_3
	for
		while eax != ecx:
			rdx = M[rdx + 0x8]
			eax ++
		; eax = ecx = num[rsi]
		do 
			M[data + 2 * rsi] = rdx
			rsi += 4
			if rsi == 0x18:
				goto end_loop_3
			start_loop_3:
			ecx = num[rsi] ; ecx is set from nums[0] to nums[5]
			; at the last iteration of the outer loop, eax will not be updated to ecx
		while ecx == 1 ; because there is only one "1" in num[], and nothing below 1, so this loop will loop only once
		edx = 0x6032d0
		eax = 1
	end_loop_3:
	ecx = nums[4]
	eax = nums[5]
	// then
	esi = 0
	data = rsp + 0x20
	for
		; edx jump to next slot by every iteration in range A = {0x6032d0(6304464), 6304464, 6304480, 6304496, 6304512, 6304528, 6304544}
		; the final rdx value is A[ecx], e.g. the first loop, rdx = 6304544
		for i in [0, ecx - eax):
			rdx = M[rdx + 0x8]
		do: ; because there is only one "1" in num[], and nothing below 1
			M[data + 2 * rsi] = rdx
			; rdx = 1, 6304464, 6304480, 6304496, 6304512, 6304528, 6304544
			; data + 2 * rsi = 0x7fffffffde50, 0x7fffffffde58, 0x7fffffffde60, 0x7fffffffde68, ...
			rsi += 4
			if rsi == 0x18:
				goto end_loop_3
		while num[rsi] == 1
		eax = 1
	end_loop_3:
	ecx = nums[4]
	eax = nums[5]
   ```
   ; since rsp + 0x20 = 0x7fffffffde50 {6304544, 0, 6304528, 0, 6304512, 0, 6304496, 0, 6304480, 0, 6304464, 0, 0, 0}
   .end_loop_3:
   0x00000000004011ab <+183>:	mov    0x20(%rsp),%rbx ; rbx = M[rsp + 0x20]
   0x00000000004011b0 <+188>:	lea    0x28(%rsp),%rax ; rax = rsp + 0x28
   0x00000000004011b5 <+193>:	lea    0x50(%rsp),%rsi ; rsi = rsp = 0x50
   0x00000000004011ba <+198>:	mov    %rbx,%rcx ; rcx = rbx
   ; {[rbx, rcx]6304544, 0, [rax]6304528, 0, 6304512, 0, 6304496, 0, 6304480, 0, 6304464, 0, [rsi]0, 0}
   ; {6304544, 6304528, 6304512, 6304496, 6304480, 6304464} are pointers
   ; {443, 477, 691, 924, 168, 332}
   ; loop_4 begin
   0x00000000004011bd <+201>:	mov    (%rax),%rdx ; 
   0x00000000004011c0 <+204>:	mov    %rdx,0x8(%rcx) ; swap (rax) with (rcx + 1)
   0x00000000004011c4 <+208>:	add    $0x8,%rax ; rax + 1
   0x00000000004011c8 <+212>:	cmp    %rsi,%rax ; if reach the end
   0x00000000004011cb <+215>:	je     0x4011d2 <phase_6+222> ; then break
   0x00000000004011cd <+217>:	mov    %rdx,%rcx ; rcx = (rax)
   0x00000000004011d0 <+220>:	jmp    0x4011bd <phase_6+201>
   ; loop_4 end
   ; {443, 477, 691, 924, 168, 332}
   ; now rbx = 6304544, rcx = 6304480, rdx = 6304464
   0x00000000004011d2 <+222>:	movq   $0x0,0x8(%rdx) ; 
   0x00000000004011da <+230>:	mov    $0x5,%ebp
   ; seems to be sort zip({1, 2, 3, 4, 5, 6}, {443, 477, 691, 924, 168, 332}) or its reverse
   ; loop_5 begin
   0x00000000004011df <+235>:	mov    0x8(%rbx),%rax
   0x00000000004011e3 <+239>:	mov    (%rax),%eax
   0x00000000004011e5 <+241>:	cmp    %eax,(%rbx)
   0x00000000004011e7 <+243>:	jge    0x4011ee <phase_6+250>
   0x00000000004011e9 <+245>:	callq  0x40143a <explode_bomb>
   0x00000000004011ee <+250>:	mov    0x8(%rbx),%rbx
   0x00000000004011f2 <+254>:	sub    $0x1,%ebp
   0x00000000004011f5 <+257>:	jne    0x4011df <phase_6+235>
   ; loop_5 end
   0x00000000004011f7 <+259>:	add    $0x50,%rsp
   0x00000000004011fb <+263>:	pop    %rbx
   0x00000000004011fc <+264>:	pop    %rbp
   0x00000000004011fd <+265>:	pop    %r12
   0x00000000004011ff <+267>:	pop    %r13
   0x0000000000401201 <+269>:	pop    %r14
   0x0000000000401203 <+271>:	retq   
End of assembler dump.
