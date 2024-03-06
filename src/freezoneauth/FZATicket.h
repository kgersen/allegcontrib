// FZATicket.h : Declaration of the CFZATicket

#pragma once
#include "resource.h"       // main symbols

#include "freezoneauth.h"


// CFZATicket

class ATL_NO_VTABLE CFZATicket : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CFZATicket, &CLSID_FZATicket>,
	public IFZATicket
{
public:
	CFZATicket()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_FZATICKET)


BEGIN_COM_MAP(CFZATicket)
	COM_INTERFACE_ENTRY(IFZATicket)
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

	STDMETHOD(Meth1)(CHAR* p1, CHAR* p2);
	STDMETHOD(Meth2)(CHAR* p1, CHAR* p2);
};

OBJECT_ENTRY_AUTO(__uuidof(FZATicket), CFZATicket)
