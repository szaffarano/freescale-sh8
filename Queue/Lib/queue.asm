;************************************************************************
;* Símbolos a exportar													*
;************************************************************************
           	XDEF queue_push, queue_pop

;************************************************************************
;* Símbolos externos usados dentro del módulo							*
;************************************************************************

;***********************************************************************
;* Inclusión de archivo con definiciones de ports de I/O				*
;***********************************************************************

;************************************************************************
;* Definición de constantes (EQU)										*
;************************************************************************
QUEUE_SIZE:			EQU		10

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
;* Función que pone un valor en una cola circular de tamaño QUEUE_SIZE	*
;* Parámetros:
;* 		valor[IN] a poner: en registro A.
;*		resultado[OUT]: 1 si todo OK o 0 si hubo error.  En regitstro A.*
;************************************************************************
queue_push:
		; falta implementar
		INCA
		RTS

;************************************************************************
;* Función que saca un valor de una cola circular de tamaño QUEUE_SIZE	*
;* Parámetros:
;* 		valor[IN]: 	puntero a varible de 8 bits donde dejará el valor.	*
;*					Lo recibe en registro H:X.
;*		resultado[OUT]: 1 si todo OK o 0 si hubo error.  En regitstro A.*
;************************************************************************
queue_pop:
		; falta implementar
		LDA	,X
		INCA
		RTS
