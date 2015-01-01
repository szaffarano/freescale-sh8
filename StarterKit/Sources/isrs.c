/*
 * isrs.c
 *
 *  Created on: Dec 26, 2014
 *      Author: sebas
 */

#include "IO_Map.h"
#include "PE_Types.h"


ISR(sci_receive) {
	static volatile uint8_t c;

	clrReg8Bit(SCIS1, RDRF);
	c = getReg(SCID);
	while (getRegBit(SCIS1, TDRE) == 0)
		;
	setReg(SCID, c);
}

ISR(sci_error) {
	asm(NOP);
}

ISR(SystemTick) {
	static volatile int counter = 0;

	clrReg8Bits(TPM1SC, TPM1SC_TOF_MASK);

	if (counter++ >= 1000) {
		PTBD ^= PTBD_PTBD4_MASK;
		counter = 0;
	}
	PTBD ^= PTBD_PTBD3_MASK;
}
