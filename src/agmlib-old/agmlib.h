// agmlib.h : main header file for the agmlib DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols


// CagmlibApp
// See agmlib.cpp for the implementation of this class
//

class CagmlibApp : public CWinApp
{
public:
	CagmlibApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
