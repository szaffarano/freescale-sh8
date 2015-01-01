;************************************************************************
;* Símbolos a exportar													*
;************************************************************************
			XDEF	systick, sci_receive
			
;************************************************************************
;* Símbolos externos usados dentro del módulo							*
;************************************************************************
			XREF	toggle_led, square_wave, uart_echo

;***********************************************************************
;* Inclusión de archivo con definiciones de ports de I/O				*
;***********************************************************************
            INCLUDE 'MC9S08SH8.inc'

;************************************************************************
;* Definición de constantes (EQU)										*
;************************************************************************

;************************************************************************
;* Definición de variables en la página Z								*
;************************************************************************
MY_ZEROPAGE: 	SECTION		SHORT

;************************************************************************
;* Definición de variables a partir de la página #1						*
;************************************************************************
DEFAULT_RAM:	SECTION

;************************************************************************
;* Código del módulo													*
;************************************************************************
DEFAULT_ROM:     SECTION	

;************************************************************************
;* Función que ejecuta cada 1ms invocada por temporizador del MCU		*
;************************************************************************
systick:
		PSHH						; backupear registro H
		
		BCLR   TPM1SC_TOF, TPM1SC	; limpiar el Time OverFlow Flag 
		
		JSR		toggle_led			; llamo a rutina que togglea LED
		JSR		square_wave			; llamo a rutina que togglea LED
		
		PULH						; recuperar registro H y return from interrupt
		RTI

;************************************************************************
;* Función que atiende la interrupción de recepción de UART				*
;************************************************************************		
sci_receive:
		PSHH						; backup de registro H

		JSR	uart_echo				; invocar función echo
				
		PULH						; restore de registro H
		RTI							; return from interrupt
