; export symbols
            XDEF enable_interrupts

            INCLUDE 'MC9S08SH8.inc'

; variable/data section
MY_ZEROPAGE: SECTION  SHORT
; Insert here your data definition. For demonstration, temp_byte is used.
temp_byte:  DS.B   1

; code section
DEFAULT_ROM:     SECTION

;**********************************************************************
; Rutina que habilita las interrupciones
;**********************************************************************
enable_interrupts:
			CLI
			RTS
