// FZAuth.h : Declaration of the CFZAuth

#pragma once
#include "resource.h"       // main symbols

#include "freezoneauth.h"


// CFZAuth

class ATL_NO_VTABLE CFZAuth : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CFZAuth, &CLSID_FZAuth>,
	public IDispatchImpl<IFZAuth, &IID_IFZAuth, &LIBID_freezoneauthLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CFZAuth()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_FZAUTH)


BEGIN_COM_MAP(CFZAuth)
	COM_INTERFACE_ENTRY(IFZAuth)
	COM_INTERFACE_ENTRY(IUnknown)
END_COM_MAP()


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK;
	}
	
	void FinalRelease() 
	{
	}

public:

	STDMETHOD(Meth1)(CHAR *p1, ULONG p2, BYTE *p3, ULONG p4, CHAR *p5, CHAR *p6);
	STDMETHOD(Meth2)(BSTR p1, BSTR p2);
	STDMETHOD(Meth3)(CHAR *p1, CHAR *p2, CLSID *p3, ULONG *p4,ULONG *p5);
};

OBJECT_ENTRY_AUTO(__uuidof(FZAuth), CFZAuth)

