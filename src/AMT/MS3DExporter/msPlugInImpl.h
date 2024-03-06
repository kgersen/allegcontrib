#ifndef __MS_PLUGIN_IMPL_H__
#define __MS_PLUGIN_IMPL_H__



#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif



#include "resource.h"
#include <msPlugIn.h>
#include <msLib.h>
#include <CVHFile.h>
#include <MDLFile.h>


/////////////////////////////////////////////////////////////////////////////
// CMsPlugInApp
//
//

class CMsPlugInApp : public CWinApp
{
public:
	CMsPlugInApp();

	//{{AFX_VIRTUAL(CMsPlugInApp)
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CMsPlugInApp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};



/////////////////////////////////////////////////////////////////////////////
// cPlugIn
//
//

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

private:
	int				PrintError ();
	bool ConvertCVHFile(msModel *,CCVHFile*);
	bool ConvertMDLFile(msModel *,CMDLFile*);
	bool ComputeMDLBB(msModel *,float *,float *, float *);
	bool DumpToText(msModel *,CString);
	void Rotate(float,float,float,float *rx,float *ry, float *rz);
	int nOptionFlags;
};



/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ fügt unmittelbar vor der vorhergehenden Zeile zusätzliche Deklarationen ein.

#endif // __MS_PLUGIN_IMPL_H__