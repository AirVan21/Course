	model tiny
	.code
	.386
	org 100h
	
_:	jmp start

newstr     db '',13,10,'$'
msg 	   db 'Bye PCI printer!',13,10,'$'
hex_table  db '0123456789ABCDEF'

start: 
	mov dx, 0CF8h      ; Config_Adress for access	
	mov ecx, 80000000h ; data + adress
_c:	
	mov eax, ecx       ; out works with eax
	out dx, eax        ; sends data to port
	add dx,4           ; 0CFC - Config_Data 	
	in eax, dx         ; Gets data from defined 80000000h adress
			   ; up EAX - Device ID, AX - Vendor ID
	sub dx, 4          ; set port 0CF8h
	cmp ax, -1         ; Vendor ID == FFFF => invalid value
	je _0		   ; 

	mov edi, eax       ; Save original value in EBX
	lea bx, hex_table  ; Translate table
	shr eax, 28        ; Last 4 bits
	xlat               ; Perform translation	

	mov dl, al         ; Current chat
	mov ah, 02h        ; Print char
	int 21h            ;
	;__________________ 
	
	push ecx
	xor ecx, ecx       ;
	mov cx, 24         ; Loop counter

cycle:	
	mov eax, edi       ; Save original value in EBX
	shr eax, cl        ; Last 4 bit
	and al, 0Fh        ;  
	xlat               ; Perform translation	

	mov dl, al         ; Current chat
	mov ah, 02h        ; Print char
	int 21h            ;
	sub cx, 3          ; -2 for counter
	loop cycle         ;
	;__________________ 

	mov eax, edi       ;
	and al, 0Fh        ; in AL only last 4 bits
	xlat               ; Translation
	mov dl, al         ; Last 4 bits
	mov ah, 02h        ;
	int 21h            ;
	pop ecx            ;
	
	mov ah, 9h         ; CRLF
	lea dx, newstr     ;
	int 21h            ;      
	
_0:
	add ecx, 100h
	test ecx,1000000h
	jz _c
	mov ah, 9;
	mov dx, offset msg
	int 21h
	ret
	end _
	