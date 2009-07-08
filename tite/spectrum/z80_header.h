/**
 * This is a Z80 file format header file relying to
 * http://www.worldofspectrum.org/faq/reference/z80format.htm
 * This is solely for version 1 format intended for Sinlair ZX Spectrum 48K.
 *
 * Mikko Nummelin, 2008
 */

typedef unsigned char	u8;
typedef unsigned short	u16;

typedef struct z80_header_stc {
	u8	a;	// offset: 0
	u8	f;	// offset: 1
	u16	bc;	// offset: 2
	u16	hl;	// offset: 4
	u16	pc;	// offset: 6
	u16	sp;	// offset: 8
	u8	i;	// offset: 10
	u8;	r;	// offset: 11

	/*
	* Bit 0   : Bit 7 of the R-register
	* Bit 1-3 : Border colour
	* Bit 4   : 1=Basic SamRom switched in
	* Bit 5   : 1=Block of data is compressed
	* Bit 6-7 : No meaning
	*/
	u8	misc1;	// offset: 12

	u16	de;	// offset: 13
	u16	bc_alt;	// offset: 15
	u16	de_alt;	// offset: 17
	u16	hl_alt;	// offset: 19
	u8	a_alt;	// offset: 21
	u8	f_alt;	// offset: 22
	u16	iy;	// offset: 23
	u16	ix;	// offset: 25

	/* Interrupt mode, 0, 1 or 2 */
	u8	interrupt;	// offset: 27

	u8	iff2;	// offset: 28

	/*
	 * Bit 0-1 : Interrupt mode (0, 1 or 2)
	 * Bit 2   : 1=Issue 2 emulation
	 * Bit 3   : 1=Double interrupt frequency
	 * Bit 4-5 : 1=High video synchronisation
	 *           3=Low video synchronisation
	 *           0,2=Normal
	 * Bit 6-7 : 0=Cursor/Protek/AGF joystick
	 *           1=Kempston joystick 2=Sinclair 2 Left joystick (or user
	 *           defined, for version 3 .z80 files)
	 *           3=Sinclair 2 Right joystick
	 */
	u8	misc2;	// offset 29
} z80_header;
