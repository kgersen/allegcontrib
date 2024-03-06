// agmlib.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "agmlib.h"
#include ".\agmlib.h"
#include "..\AGM\AGMEventsHandler.h"
#include "..\AGM\ServerCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

// CagmlibApp

BEGIN_MESSAGE_MAP(CagmlibApp, CWinApp)
END_MESSAGE_MAP()


// CagmlibApp construction

CagmlibApp::CagmlibApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CagmlibApp object

CagmlibApp theApp;

const GUID CDECL BASED_CODE _tlid =
		{ 0xC358F127, 0x75C3, 0x415D, { 0x94, 0xA3, 0xEC, 0x69, 0x46, 0xB3, 0xED, 0xE3 } };
const WORD _wVerMajor = 1;
const WORD _wVerMinor = 0;


// CagmlibApp initialization

BOOL CagmlibApp::InitInstance()
{
	CWinApp::InitInstance();

	// Register all OLE server (factories) as running.  This enables the
	//  OLE libraries to create objects from other applications.
	COleObjectFactory::RegisterAll();

	return TRUE;
}

// DllGetClassObject - Returns class factory

STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	return AfxDllGetClassObject(rclsid, riid, ppv);
}


// DllCanUnloadNow - Allows COM to unload DLL

STDAPI DllCanUnloadNow(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	return AfxDllCanUnloadNow();
}


// DllRegisterServer - Adds entries to the system registry

STDAPI DllRegisterServer(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	if (!AfxOleRegisterTypeLib(AfxGetInstanceHandle(), _tlid))
		return SELFREG_E_TYPELIB;

	if (!COleObjectFactory::UpdateRegistryAll())
		return SELFREG_E_CLASS;

	return S_OK;
}


// DllUnregisterServer - Removes entries from the system registry

STDAPI DllUnregisterServer(void)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	if (!AfxOleUnregisterTypeLib(_tlid, _wVerMajor, _wVerMinor))
		return SELFREG_E_TYPELIB;

	if (!COleObjectFactory::UpdateRegistryAll(FALSE))
		return SELFREG_E_CLASS;

	return S_OK;
}

STDAPI GetAdminSession(IAdminSession ** ppouter)
{
	CServerCtrl sctrl;
	if (sctrl.StartServer() == true)
	{
		CServerCtrl sctrl;
		*ppouter = sctrl.iadms;
		return S_OK;
	}
	return E_FAIL;
}
