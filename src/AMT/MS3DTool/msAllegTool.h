// msAllegTool.h : main header file for the msAllegTool DLL
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
#include <msPlugIn.h>
#include <msLib.h>
#include <CVHFile.h>
#include <MDLFile.h>


class CmsAllegToolApp : public CWinApp
{
public:
	CmsAllegToolApp();

	DECLARE_MESSAGE_MAP()
};
struct msModel;
class cPlugIn : public cMsPlugIn
{
    char szTitle[64];

public:
	cPlugIn ();
    virtual ~cPlugIn ();

public:
    int             GetType ();
    const char *    GetTitle ();
    int             Execute (msModel* pModel);
};

