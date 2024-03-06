// comauth.h : Declaration of the Ccomauth

#pragma once
#include "resource.h"       // main symbols
#include "zzauth.h"


// Ccomauth

class ATL_NO_VTABLE Ccomauth : 
	public CComObjectRootEx<CComMultiThreadModel>,
	public CComCoClass<Ccomauth, &CLSID_comauth>,
	public IDispatchImpl<Icomauth, &IID_Icomauth, &LIBID_zzauth, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	Ccomauth()
		: var1(0)
		, var2(0)
	{
	}

	DECLARE_REGISTRY_RESOURCEID(IDR_COMAUTH)


	BEGIN_COM_MAP(Ccomauth)
		COM_INTERFACE_ENTRY(Icomauth)
		COM_INTERFACE_ENTRY(IUnknown)
	END_COM_MAP()


	DECLARE_PROTECT_FINAL_CONSTRUCT()

	HRESULT FinalConstruct()
	{
		return S_OK; // S_FALSE
	}

	void FinalRelease() 
	{
	}

public:

	STDMETHOD(testmeth)(BSTR* p1test, BSTR* p2test);
	STDMETHOD(meth2)(BSTR* p1,BSTR* p2);
	STDMETHOD(meth3)(BSTR* p1,BSTR* p2,BSTR* p3,BSTR* p4);
	STDMETHOD(get_prop1)(BSTR param1, BSTR* pVal);
	STDMETHOD(put_prop1)(BSTR param1, BSTR newVal);
	int var1;
	int var2;

};

OBJECT_ENTRY_AUTO(__uuidof(comauth), Ccomauth)
