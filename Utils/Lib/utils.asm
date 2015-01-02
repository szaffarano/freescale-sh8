;************************************************************************
;* Símbolos a exportar													*
;************************************************************************
           	XDEF toggle_led, square_wave, uart_echo

;************************************************************************
;* Símbolos externos usados dentro del módulo							*
;************************************************************************

;***********************************************************************
;* Inclusión de archivo con definiciones de ports de I/O				*
;***********************************************************************
            INCLUDE 'MC9S08SH8.inc'

;************************************************************************
;* Definición de constantes (EQU)										*
;************************************************************************
TOGGLE_DELAY:		EQU		500
LED_PORT:			EQU		PTBD
LED_PIN:			EQU		(1 << PTBD_PTBD4)

FLAG_PORT:			EQU		PTBD
FLAG_PIN:			EQU		(1 << PTBD_PTBD2)
		
QUEUE_SIZE:			EQU		10

;************************************************************************
;* Definición de variables en la página Z								*
;************************************************************************
MY_ZEROPAGE: 	SECTION		SHORT

counter:	DS.B		1

;************************************************************************
;* Definición de variables a partir de la página #1						*
;************************************************************************
DEFAULT_RAM:	SECTION

;************************************************************************
;* Código del módulo													*
;************************************************************************
DEFAULT_ROM:     SECTION	

;************************************************************************
;* Función que togglea un LED											*
;************************************************************************
toggle_led:
		LDHX	counter				; Se carga el contador en HX y se incrementa
		AIX		#1
		CPHX	#TOGGLE_DELAY
		BLT		end					; Si aun no se alcanzó #TOGGLE_DELAY, saltar a end, sino continuar
toggle:
		LDA		#LED_PIN
		LDA		LED_PORT			; Togglear el led
		EOR		#LED_PIN
		STA		LED_PORT

		CLRH						; Limpiar HX (contador)
		CLRX
end:
		STHX		counter			; Guardar el contenido de HX en memoria
		RTS

;************************************************************************
;* Función que togglea un pin para generar una onda cuadrada de f=1khz	*
;************************************************************************	
square_wave:
		LDA		FLAG_PORT			; Togglear pin para generar onda cuadrada de 1 ms
		EOR		#FLAG_PIN
		STA		FLAG_PORT

		RTS

;************************************************************************
;* Función que lee un dato de la UART y lo escribe, haciendo un "echo"	*
;************************************************************************	
uart_echo:
		BCLR	SCIS1_RDRF, SCIS1
		LDA	SCID
wait_ready:
		BRCLR	SCIS1_TDRE, SCIS1, wait_ready 	
		STA	SCID
		RTS
