// CFZATicket.h : Declaration of the CCFZATicket

#pragma once
#include "resource.h"       // main symbols

#include "freezoneauth.h"


// CCFZATicket

class ATL_NO_VTABLE CCFZATicket : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CCFZATicket, &CLSID_CFZATicket>,
	public IDispatchImpl<ICFZATicket, &IID_ICFZATicket, &LIBID_freezoneauthLib, /*wMajor =*/ 1, /*wMinor =*/ 0>
{
public:
	CCFZATicket()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_CFZATICKET)

BEGIN_COM_MAP(CCFZATicket)
	COM_INTERFACE_ENTRY(ICFZATicket)
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

	STDMETHOD(Meth1)(CHAR* p1, BYTE* p2);
};

OBJECT_ENTRY_AUTO(__uuidof(CFZATicket), CCFZATicket)

class IDummyTicket : IUnknown
{
	public:
		virtual ULONG STDMETHODCALLTYPE Meth1(ULONG* p1, BYTE* p2);
		virtual ULONG STDMETHODCALLTYPE Meth2(CHAR* p1);
};
class CDummyTicket : public IDummyTicket
{
public:
    STDMETHODIMP QueryInterface(REFIID riid, LPVOID *ppvObj);
    inline STDMETHODIMP_(ULONG) AddRef
                    () { return InterlockedIncrement(&m_cRef);};
    inline STDMETHODIMP_(ULONG) Release
                    () { ULONG ulCount = InterlockedDecrement(&m_cRef);
                         //if (!ulCount)  delete this; 
                         return ulCount;};
    virtual ULONG STDMETHODCALLTYPE Meth1(ULONG* p1, BYTE* p2);
    virtual ULONG STDMETHODCALLTYPE Meth2(CHAR* p1);
public :
    CDummyTicket ();
    ~CDummyTicket ();
private :
    volatile LONG               m_cRef; 
};
