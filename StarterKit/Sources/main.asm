;**********************************************************************
; Símbolos a exportar
;**********************************************************************
			XDEF	asm_main

;**********************************************************************
; Inclusión de archivo con definiciones de ports de I/O
;**********************************************************************
            INCLUDE 'MC9S08SH8.inc'

;**********************************************************************
; Constantes
;**********************************************************************

;**********************************************************************
; Sección de variables en página Z
;**********************************************************************
MY_ZEROPAGE: 	SECTION		SHORT

;**********************************************************************
; Sección de variables desde página 1
;**********************************************************************
DEFAULT_RAM:	SECTION

;**********************************************************************
; Sección de código
;**********************************************************************
DEFAULT_ROM:     SECTION	

;**********************************************************************
; Función que ejecuta cada 1ms invocada por temporizador del MCU
;**********************************************************************
asm_main:
		CLI			; habilitar interrupciones
loop:
		NOP
		BRA	loop
		RTI
