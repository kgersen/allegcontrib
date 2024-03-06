// zzauth.h : main header file for the zzauth DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
#include "zzauth_i.h"


// CzzauthApp
// See zzauth.cpp for the implementation of this class
//

class CzzauthApp : public CWinApp
{
public:
	CzzauthApp();

// Overrides
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
