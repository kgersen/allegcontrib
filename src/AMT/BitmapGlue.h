/*
	BitmapGlue.h - Allegiance mdl bitmap glue - Generic header

	Copyright (C) Kirth Gersen, 2001-2002.  All rights reserved.
	v 0.94
*/

void CreateBMP24File(CString pszFile, PBITMAPINFO pbi, LPBYTE lpBits);
WORD *ReadBMP(CString pszFile, long *w, long *h);
