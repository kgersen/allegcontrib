// AGM.cpp : Defines the class behaviors for the application.
//
#include "stdafx.h"
#include "AGM.h"
#include "..\ICE\corestruct.h"
#include "AGMEventsHandler.h"
#include "ServerCtrl.h"
#include "AGMDlg.h"
#include "SvrUI.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


// CAGMApp

BEGIN_MESSAGE_MAP(CAGMApp, CWinApp)
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()


// CAGMApp construction

CAGMApp::CAGMApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CAGMApp object

CAGMApp theApp;


// CAGMApp initialization

BOOL CAGMApp::InitInstance()
{
	srand( (unsigned)time( NULL ) );
	CWinApp::InitInstance();

	if (!AfxSocketInit())
	{
		AfxMessageBox(IDP_SOCKETS_INIT_FAILED);
		return FALSE;
	}

	AfxEnableControlContainer();

//---------------------------------
	char pdata[255];
	DWORD psize = 255;
	char adata[255];
	DWORD asize = 255;
	LONG regres,regresa;
	HKEY hKey;

	// read the parameters in the registry
	regres = RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Microsoft Games\\Allegiance\\1.0\\Server",0, KEY_READ, &hKey);
	if (regres != ERROR_SUCCESS)
	{
		AfxMessageBox(_T("Allegiance server not found in registry !!!"));
		return FALSE;
	}
	regres = RegQueryValueEx(hKey,"EXE Path",NULL,NULL,(LPBYTE)pdata,&psize);
	regresa = RegQueryValueEx(hKey,"ArtPath",NULL,NULL,(LPBYTE)adata,&asize);
	RegCloseKey(hKey);

	// create igpp based on the registry
	if (regres != ERROR_SUCCESS)
	{
		AfxMessageBox(_T("Allegiance server EXE Path not found in registry !!!"));
		return FALSE;
	}
	CoInitialize(NULL);
	//------------------------------------
	CServerCtrl sctrl;
	if (!sctrl.StartServer())
	{
		AfxMessageBox("cant connect to Allegiance Server !");
		return false;
	}

	//------------------------------------
	CSvrUI dlg;
	dlg.cArtPath = pdata;
	dlg.cServerPath = pdata;
	dlg.psctrl = &sctrl;
	if (regresa != ERROR_SUCCESS)
	{
		dlg.cArtPath += "\\Artwork";
	}
	else
	{
		dlg.cArtPath = adata;
	}

	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();

	bool stopit;
	if (nResponse == IDYES)
	{
		stopit = true;
	}
	else if (nResponse == IDNO)
	{
		stopit=false;
	}
	sctrl.ReleaseServer(stopit);
	//dlg.ReleaseSvr();
    CoUninitialize();

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}


