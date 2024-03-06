// AGMLib.h : main header file for the AGMLib DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols


// CAGMLibApp
// See AGMLib.cpp for the implementation of this class
//

class CAGMLibApp : public CWinApp
{
public:
	CAGMLibApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
