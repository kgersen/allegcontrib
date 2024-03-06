// freezoneauth.h : main header file for the freezoneauth DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
#include "freezoneauth_i.h"


// CfreezoneauthApp
// See freezoneauth.cpp for the implementation of this class
//

class CfreezoneauthApp : public CWinApp
{
public:
	CfreezoneauthApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
