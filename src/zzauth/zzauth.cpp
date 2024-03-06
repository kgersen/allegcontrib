// zzauth.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "zzauth.h"
#include <initguid.h>
#include "zzauth_i.c"

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

// CzzauthApp


class CzzauthModule :
	public CAtlMfcModule
{
public:
	DECLARE_LIBID(LIBID_zzauth);
	DECLARE_REGISTRY_APPID_RESOURCEID(IDR_ZZAUTH, "{150D6C21-32CA-4EF0-B4F2-F870577206E8}");};

CzzauthModule _AtlModule;

BEGIN_MESSAGE_MAP(CzzauthApp, CWinApp)
END_MESSAGE_MAP()


// CzzauthApp construction

CzzauthApp::CzzauthApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}


// The one and only CzzauthApp object

CzzauthApp theApp;

const GUID CDECL BASED_CODE _tlid =
		{ 0xC692B689, 0x5239, 0x453B, { 0xB2, 0xC2, 0x5C, 0xA8, 0x13, 0x51, 0x39, 0xAF } };
//		{ 0x42BA50D5, 0x3424, 0x11D3, { 0xBA, 0x6C, 0x00, 0xC0, 0x4F, 0x8E, 0xF9, 0x2F } };
//auto: C692B689-5239-453B-B2C2-5CA8135139AF
//zzauth: 42BA50D5-3424-11D3-BA6C-00C04F8EF92F
const WORD _wVerMajor = 1;
const WORD _wVerMinor = 0;


// CzzauthApp initialization

BOOL CzzauthApp::InitInstance()
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
	if (S_OK == _AtlModule.GetClassObject(rclsid, riid, ppv))
		return S_OK;
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	return AfxDllGetClassObject(rclsid, riid, ppv);
}


// DllCanUnloadNow - Allows COM to unload DLL

#pragma comment(linker, "/EXPORT:DllCanUnloadNow=_DllCanUnloadNow@0,PRIVATE")
#pragma comment(linker, "/EXPORT:DllGetClassObject=_DllGetClassObject@12,PRIVATE")
#pragma comment(linker, "/EXPORT:DllRegisterServer=_DllRegisterServer@0,PRIVATE")
#pragma comment(linker, "/EXPORT:DllUnregisterServer=_DllUnregisterServer@0,PRIVATE")

STDAPI DllCanUnloadNow(void)
{
	if (_AtlModule.GetLockCount() > 0)
		return S_FALSE;
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	return AfxDllCanUnloadNow();
}


// DllRegisterServer - Adds entries to the system registry

STDAPI DllRegisterServer(void)
{
	_AtlModule.UpdateRegistryAppId(TRUE);
	HRESULT hRes = _AtlModule.RegisterServer(TRUE);
	if (hRes != S_OK)
		return hRes;
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
	_AtlModule.UpdateRegistryAppId(FALSE);
	HRESULT hRes = _AtlModule.UnregisterServer(TRUE);
	if (hRes != S_OK)
		return hRes;
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	if (!AfxOleUnregisterTypeLib(_tlid, _wVerMajor, _wVerMinor))
		return SELFREG_E_TYPELIB;

	if (!COleObjectFactory::UpdateRegistryAll(FALSE))
		return SELFREG_E_CLASS;

	return S_OK;
}
