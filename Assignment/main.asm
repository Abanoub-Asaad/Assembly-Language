INCLUDE Irvine32FCIS.inc ;DO NOT CHANGE THIS LINE

;###################################################################################;#
;							AUTOGRADER RELATED .DATA								;#
;				DO NOT MODIFY, DELETE NOR ADD ANY LINE HERE							;#
;###################################################################################;#
.data																				;#
																					;#
	prmpt byte "Please enter question number 1, 2, 3, 4, 5, 6 or enter 0 to exit:", 0	        ;#
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

	arr dword 100 dup (?) 
	num_elements dword ?
	tmp1 dword ?
	str1 byte "Enter number of Elements: ", 0
	str2 byte "Enter your Elements: ", 0
	str3 byte "Your Rotated Elements are: [", 0	
	str4 byte ", ", 0
	str5 byte "]", 0

;-----------------------Q1 DATA End---------------------	


																					
;-------------------------Q2 DATA-----------------------	

	first_index_q2 dword ?
	second_index_q2 dword ?
	first_char_q2 byte ?
	second_char_q2 byte ? 
	str_size_q2 byte ?
	str_q2 byte 30 dup (?) 
	str1_q2 byte "Please, Enter your first index: ", 0
	str2_q2 byte "Please, Enter your second index: ", 0
	str3_q2 byte "Please, Enter your word: ", 0	
	str4_q2 byte "Your Swapped word: ", 0

;-----------------------Q2 DATA End---------------------	


;-------------------------Q3 DATA-----------------------	

	str1_size_q3 byte ?
	str2_size_q3 byte ?
	str1_q3 byte 20 dup (?) 
	str2_q3 byte 20 dup (?) 
	str3_q3 byte " IS ALMOST CORRECT", 0
	str4_q3 byte " IS CORRECT", 0
	str5_q3 byte " IS WRONG", 0
	num1_q3 dword 0
	num2_q3 dword 3

;-----------------------Q3 DATA End---------------------	


;-------------------------Q4 DATA-----------------------	

	arrSize_q4 dword ?
	arr1_q4 dword 30 dup (?)
	arr2_q4 dword 30 dup (?)
	str1_q4 byte "Enter the number of intervals N: ", 0
	str2_q4 byte "Enter the N intervals: ", 0
	str3_q4 byte "The input number exists the following number of times in the N intervals: ", 0

;-----------------------Q4 DATA End---------------------	


;-------------------------Q5 DATA-----------------------	

	num_q5 dword ?
	str1_q5 byte "Please Enter N: ", 0
	str2_q5 byte "The factorial is: ", 0 

;-----------------------Q5 DATA End---------------------	


;-------------------------Q6 DATA-----------------------	

	a_q6 dword ?
	r_q6 dword ? 
	n_q6 dword ? 
	str1_q6 byte "Enter a: ", 0
	str2_q6 byte "Enter r: ", 0
	str3_q6 byte "Enter n: ", 0
	str4_q6 byte "The generated sequence: ", 0

;-----------------------Q6 DATA End---------------------	
														
														
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
		JE _Q2									      ;#
													  ;#		
		CMP EAX, 3									  ;#
		JE _Q3										  ;#
													  ;#
		CMP EAX, 4									  ;#
		JE _Q4										  ;#
													  ;#		
		CMP EAX, 5								      ;#
		JE _Q5										  ;#
													  ;#
		CMP EAX, 6									  ;#
		JE _Q6										  ;#
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
		_Q4:										  ;#		
		CALL Q4										  ;#
		JMP CONT									  ;#
													  ;#		
		_Q5:										  ;#		
		CALL Q5										  ;#
		JMP CONT									  ;#
													  ;#
		_Q6:										  ;#		
		CALL Q6										  ;#
		JMP CONT							   		  ;#
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
	
	mov edi, offset arr

	; read number of elements 
	mov edx, offset str1
	call writeString  
	call readint 
	mov ecx, eax 
	mov num_elements, ecx

	; read first two elements in the array 
	mov edx, offset str2
	call writeString 
	call readint 
	mov ebx, eax ; ebx is the first element 
	call readint 
	mov edx, eax ; edx is the second element
	mov tmp1, edx 
	
	sub ecx, 2 
	mov edi, offset arr 

	; read rest of the elements 
	loop_read : 
		
		call readint 
		mov [edi], eax  
		add edi, 4 
			
		LOOP loop_read  

	mov [edi], ebx
	add edi, 4
	mov [edi], edx
    
	; ------------ The Output 
	mov edx, offset str3
	call writestring 

	mov bx, 0
	mov ecx, num_elements 
	dec ecx 
	loop_write : 

		mov eax, dword ptr [arr+bx] 
		call writedec
		add bx, 4 
		
		mov edx, offset str4 
		call writestring 

		LOOP loop_write

	mov eax, tmp1 
	call writedec 
	mov edx, offset str5
	call writestring
	call crlf 

	RET

Q1 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question two procedure here
;----------------------------------------------------------
Q2 PROC
		
	; read first index 
	mov edx, offset str1_q2
	call writestring 
	call readint 
	mov first_index_q2, eax

	; read second index 
	mov edx, offset str2_q2
	call writestring 
	call readint 
	mov second_index_q2, eax

	; read the word
	mov edx, offset str3_q2 
	call writestring  
	mov edx, offset str_q2  
	mov ecx, lengthof str_q2  
	call readstring 
	mov str_size_q2, al

	
	dec first_index_q2
	dec second_index_q2 
	mov edx, 0 ; index 
	mov cl, str_size_q2
	
	mov edx, dword ptr first_index_q2
	mov esi, offset str_q2 
	mov al, [str_q2+edx] 
	mov edx, dword ptr second_index_q2 
	mov esi, offset str_q2 
	mov bl, [str_q2+edx] 

	mov edx, offset str4_q2
	call writestring 

	mov first_char_q2, al
	mov second_char_q2, bl
	mov edx, 0

	L :

		cmp edx, first_index_q2
		je equal_first 
		cmp edx, second_index_q2
		je equal_second 
		jmp other 

		equal_first :
			mov al, second_char_q2 
			call writechar 
			jmp next 
		equal_second : 
			mov al,  first_char_q2
			call writechar 
			jmp next 
		other : 
			mov esi, offset str_q2 
			mov al, [str_q2+edx] 
			call writechar 
		next : 
			inc edx
	loop L
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
	
	; read first string
	mov edx, offset str1_q3  
	mov ecx, lengthof str1_q3  
	call readstring 
	mov str1_size_q3, al 
	mov esi, offset str1_q3  

	; read second string 
	mov edx, offset str2_q3  
	mov ecx, lengthof str2_q3  
	call readstring 
	mov str2_size_q3, al
	mov edi, offset str2_q3  
	
	movzx eax, str2_size_q3
	cmp al, str1_size_q3
	ja adjust_ecx 
	mov cl, str1_size_q3
	jmp main_code

	adjust_ecx : 
		mov cl,  str2_size_q3
	main_code : 
		
		mov edx, 0
		mov esi, 0 

		L : 
			mov al, [str1_q3+edx] 
			mov bl, [str2_q3+edx]
	
			cmp al, bl
			jne else_part
	
			jmp next 

			else_part : 
				inc esi 
			next :
				inc edx 

		loop L

	mov edx, 0
	mov cl, str2_size_q3

	print_loop :
		mov al, [str2_q3+edx] 
		call writechar
		inc edx
	LOOP print_loop

	cmp esi, num1_q3 
	je equal_zero	
	cmp esi, num2_q3
	jb less_than_three
	jmp else_part_

	equal_zero : 
		mov edx, offset str4_q3
		call writestring 
		jmp last_part
	less_than_three : 
		mov edx, offset str3_q3
		call writestring 
		jmp last_part 
	else_part_ : 
		mov edx, offset str5_q3
		call writestring 
		jmp last_part
	last_part : 
		call crlf
	RET

Q3 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question four procedure here
;----------------------------------------------------------
Q4 PROC
	
	; read n , number of intervals
	mov edx, offset str1_q4 
	call writestring
	call readint 
	mov ecx, eax 
	mov arrSize_q4, eax 

	; read elements
	mov edx, offset str2_q4
	call writestring
	call crlf
	mov edi, offset arr1_q4
	mov esi, offset arr2_q4

	L : 
		call readint 
		mov [edi], eax 
		add edi, 4

		call readint 
		mov [esi], eax 
		add esi, 4

	LOOP L

	; read m and put it in ebx register 
	call readint 
	mov ebx, eax 

	; ------------ The Output 
	mov edx, offset str3_q4
	call writestring 
	call NumOnRange
	call writedec 
	call crlf

	NumOnRange proc 

		mov eax, 0
		mov edi, offset arr1_q4
		mov esi, offset arr2_q4
		mov ecx, arrSize_q4
		
		L1 : 
			cmp ebx, [edi]
			jb next
			cmp ebx, [esi]
			ja next 
			inc eax

			next : 
				add edi, 4
				add esi, 4 
		LOOP L1 

	ret 
	NumOnRange endp 

	RET

Q4 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question five procedure here
;----------------------------------------------------------
Q5 PROC
	
	; read N
	mov edx, offset str1_q5
	call writestring 
	call readint ; stored in eax 
	mov ecx, eax 
	dec ecx 
	mov eax, 1
	mov edx, 1 ; Total Summation 

	Outter_Loop :
		push ecx 
		mov ecx, eax 
		mov ebx, edx 

		Inner_Loop :
			add edx, ebx
		LOOP Inner_Loop

		inc eax 
		pop ecx 
	LOOP Outter_Loop
	
	mov eax, edx 
	mov edx, offset str2_q5
	call writestring 
	call writedec 
	call crlf 

	RET

Q5 ENDP



;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question six procedure here
;----------------------------------------------------------
Q6 PROC
	
	; read a
	mov edx, offset str1_q6
	call writestring 
	call readint 
	mov a_q6, eax 

	; read r
	mov edx, offset str2_q6
	call writestring 
	call readint 
	mov r_q6, eax 

	; read n
	mov edx, offset str3_q6
	call writestring 
	call readint 
	mov n_q6, eax 

	mov edx, offset str4_q6
	call writestring 
	call crlf 

	mov ecx, n_q6
	dec ecx 
	mov eax, a_q6 
	mov edx, eax 
	mov ebx, r_q6
	call writedec 
	call crlf 

	L : 
		push ecx 
		mov ecx, r_q6 
		dec ecx 
		mov ebx, eax 

		L1 : 
			add eax, ebx 
		LOOP L1

		pop ecx 
		call writedec 
		call crlf 
	LOOP L

	RET

Q6 ENDP

END MAIN 