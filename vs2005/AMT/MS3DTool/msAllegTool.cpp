// msAllegTool.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "msAllegTool.h"
#include "msLib.h"
#include <MDLFile.h>
#include <CVHFile.h>
#include <math.h>
#include "AMTDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

BEGIN_MESSAGE_MAP(CmsAllegToolApp, CWinApp)
END_MESSAGE_MAP()


// CmsAllegToolApp construction

CmsAllegToolApp::CmsAllegToolApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CmsAllegToolApp object

CmsAllegToolApp theApp;


cMsPlugIn*
CreatePlugIn ()
{
  return new cPlugIn ();
}



cPlugIn::cPlugIn ()
{
	strcpy (szTitle, "AMT: Tools");
}



cPlugIn::~cPlugIn ()
{
}



int
cPlugIn::GetType ()
{
    return cMsPlugIn::eTypeTool;
}



const char*
cPlugIn::GetTitle ()
{
    return szTitle;
}

int
cPlugIn::Execute (msModel *pModel)
{
    if (!pModel)
        return -1;

	CAMTDlg dlg;
	dlg.pModel = pModel;
	dlg.DoModal();
	/*
	CDlgLight dlg;
	dlg.DoModal();
	int nBone = msModel_AddBone (pModel);
    msBone *pBone = msModel_GetBoneAt (pModel, nBone);
	msBone_SetParentName(pBone,"");
	CString szName;
	szName.Format("light-%03d-%03d-%03d-%03d",
		dlg.red,
		dlg.green,
		dlg.blue,
		dlg.lSpeed);
	msBone_SetName(pBone,szName);
	msBone_SetPosition(pBone,Vertex);
	*/
	return 0;
}