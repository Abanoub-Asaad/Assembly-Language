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

	

;-----------------------Q1 DATA End---------------------	

									
;-------------------------Q2 DATA-----------------------	

	num_q1 dword ?
	divisor_q1 dword 10	
	str1_q1 byte "Enter a number: ", 0
	str2_q1 byte "Reverse of the number: ", 0

;-----------------------Q2 DATA End---------------------	


;-------------------------Q3 DATA-----------------------	

; Enter Q3 data here

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

	CALL PANIC ; Remove this line before you write your procedure code

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
	mov edx, offset str1_q1
	call writestring 
	call readint 

	; The Output
	mov edx, offset str2_q1
	call writestring
	mov num_q1, eax  
	mov ecx, 100
	mov esi, 0

	L :
		cmp num_q1, esi 
		jna finish_loop

		mov edx, 0
		mov eax, num_q1  
		mov ebx, divisor_q1  
		div ebx  
		mov num_q1, eax
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
	
	CALL PANIC ; Remove this line before you write your procedure code

	RET

Q3 ENDP


END MAIN