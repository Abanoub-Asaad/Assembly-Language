INCLUDE Irvine32FCIS.inc ;DO NOT CHANGE THIS LINE

;###################################################################################;#
;							AUTOGRADER RELATED .DATA								;#
;				DO NOT MODIFY, DELETE NOR ADD ANY LINE HERE							;#
;###################################################################################;#
.data																				;#
																					;#
	prmpt byte "Please enter question number 1, 2, 3, or enter 0 to exit:", 0	    ;#
	wrongChoice byte "Please enter a valid question number!", 0						;#
	tmpstr byte 5 dup(?), 0															;#
;###################################################################################;#
																					
;#######################################################							
;				STUDENTS  .DATA	SECTION     		   #							
;		   THIS SECTION MADE FOR STUDENTS' DATA        #							
;      YOU CAN MODIFY, ADD OR EDIT TO THIS SECTION     #							
;#######################################################							
																					
.data																				
;-------------------------Q1 DATA-----------------------	

	num_q1 dword ?
	cnt_loop dword ?
	center_line dword ? 
	space_q1 byte " ", 0
	star_q1 byte "*", 0	

;-----------------------Q1 DATA End---------------------	

									
;-------------------------Q2 DATA-----------------------	

	num_q2 dword ?
	divisor_q2 dword 10	
	str1_q2 byte "Enter a number: ", 0
	str2_q2 byte "Reverse of the number: ", 0

;-----------------------Q2 DATA End---------------------	


;-------------------------Q3 DATA-----------------------	

	num_q3 dword ? 
	digit dword ?
	divisor_q3 dword 10	
	str1_q3 byte "Enter A NUMBER: ", 0
	str2_q3 byte "THE RESULT = : ", 0

;-----------------------Q3 DATA End---------------------	
														
														
.code													
;########################################################
;			AUTOGRADER RELATED METHOD			       ;#
;			  DO NOT MODIFY, DELETE					   ;#
;			  NOR ADD ANY LINE HERE					   ;#
;#######################################################
;#######################################################
MAIN PROC											  ;#
	PROGLOOP:										  ;#
		MOV EDX, OFFSET PRMPT						  ;#
		CALL WRITESTRING							  ;#
		CALL CRLF									  ;#
		CALL READINT								  ;#
		CMP EAX, 0									  ;#
		JE FIN										  ;#
													  ;#
		CMP EAX, 1									  ;#
		JE _Q1										  ;#
													  ;#
		CMP EAX, 2									  ;#
		JE _Q2										  ;#
													  ;#		
		CMP EAX, 3									  ;#
		JE _Q3										  ;#
		JMP WRONG									  ;#
													  ;#
		_Q1:										  ;#
		CALL Q1										  ;#
		JMP CONT									  ;#
													  ;#
		_Q2:										  ;#		
		CALL Q2										  ;#
		JMP CONT									  ;#
													  ;#
		_Q3:										  ;#		
		CALL Q3										  ;#
		JMP CONT									  ;#
													  ;#
												      ;#
		WRONG:										  ;#
		MOV EDX, OFFSET wrongChoice					  ;#
		CALL WRITESTRING							  ;#
		CALL CRLF									  ;#
													  ;#
		CONT:										  ;#
		JMP PROGLOOP								  ;#
													  ;#
		FIN:										  ;#
													  ;#
	EXIT											  ;#
MAIN ENDP											  ;#
;#######################################################


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question one procedure here
;----------------------------------------------------------
Q1 PROC

	; read N 
	call readint 

	mov num_q1, eax 
	mov cnt_loop, eax
	mov ecx, cnt_loop 
	mov esi, 1 ; esi : num of stars

	first_part : ; loop n-1 times ; 3
		mov ebx, ecx  ; ebx : num of spaces 
		push ecx 
		mov ecx, ebx 

		loop1 :
			mov edx, offset space_q1
			call writestring 
		LOOP loop1 

		mov ecx, esi 

		loop2 : 
			mov edx, offset star_q1 
			call writestring 
		LOOP loop2 

		dec ebx 
		add esi, 2 
		pop ecx 
		call crlf 
	LOOP first_part 
	
	; ------- (^_^) -------
	
	mov ecx, num_q1 
	dec ecx		 ;  loop counter  
	mov ebx, 2	 ;	ebx : num of spaces 
	sub esi, 4 	 ;  esi : num of stars  

	second_part : 
		push ecx 
		mov ecx, ebx 

		first_loop : 
			mov edx, offset space_q1
			call writestring 
		LOOP first_loop 

		mov ecx, esi 

		second_loop :
			mov edx, offset star_q1 
			call writestring 
		LOOP second_loop 

		inc ebx
		sub esi, 2  
		pop ecx
		call crlf 
	LOOP second_part

	RET

Q1 ENDP


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question two procedure here
;----------------------------------------------------------
Q2 PROC
	
	; read the number to be reversed 
	mov edx, offset str1_q2
	call writestring 
	call readint 

	; The Output
	mov edx, offset str2_q2
	call writestring
	mov num_q2, eax  
	mov ecx, 100
	mov esi, 0

	L :
		cmp num_q2, esi 
		jna finish_loop

		mov edx, 0
		mov eax, num_q2  
		mov ebx, divisor_q2 
		div ebx  
		mov num_q2, eax
		mov eax, edx 
		call writedec 

	LOOP L 

	finish_loop : 
			jmp close

	close : 
		call crlf 

	RET

Q2 ENDP


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question three procedure here
;----------------------------------------------------------
Q3 PROC
	
		; read N
	mov edx, offset str1_q3 
	call writestring 
	call readint 
	mov num_q3, eax 
	 
	mov ecx, 100  
	mov esi, 0 
	mov ebx, 0
	mov edi, 0 ; Total Sum 

	L :
		cmp num_q3, esi 
		jna finish_loop

		; Get Each Digit 
		mov edx, 0
		mov eax, num_q3  
		mov ebx, divisor_q3 
		div ebx  
		mov num_q3, eax
		mov eax, edx 

		; Make the digit to the power 3
		mov ebx, edx 
		mul ebx 
		mul ebx 
		add edi, eax 
	LOOP L 

	finish_loop : 
			mov edx, offset str2_q3
			call writestring 
			jmp close
	close : 
		mov eax, edi 
		call writedec 
		call crlf 

	RET

Q3 ENDP


END MAIN