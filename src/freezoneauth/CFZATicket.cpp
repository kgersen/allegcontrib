// CFZATicket.cpp : Implementation of CCFZATicket

#include "stdafx.h"
#include "CFZATicket.h"


// CCFZATicket


STDMETHODIMP CCFZATicket::Meth1(CHAR* p1, BYTE* p2)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	return S_OK;
}

CDummyTicket::CDummyTicket()
{
	m_cRef = 0;
	AddRef();
}
CDummyTicket::~CDummyTicket()
{
}
STDMETHODIMP CDummyTicket::QueryInterface
                    (REFIID                     riid,
                     LPVOID *                   ppvObj)
{
	if (riid == IID_IUnknown)
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}
	return  E_NOINTERFACE ; 
}
ULONG STDMETHODCALLTYPE CDummyTicket::Meth1(ULONG* p1, BYTE* p2)
{
	// TODO: Add your implementation code here
	// *P1 = 4 -> unavailable ?
	// *P1 = 5 -> zoneauth
	*p1 = 5;
	return S_OK;
}
ULONG STDMETHODCALLTYPE CDummyTicket::Meth2(CHAR* p1)
{ // 1 param
	// TODO: Add your implementation code here
	return S_OK;
}
ULONG STDMETHODCALLTYPE IDummyTicket::Meth1(ULONG* p1, BYTE* p2)
{
	// TODO: Add your implementation code here
	// *P1 = 4 -> unavailable ?
	// *P1 = 5 -> zoneauth
	*p1 = 4;
	return S_OK;
}
ULONG STDMETHODCALLTYPE IDummyTicket::Meth2(CHAR* p1)
{
	// TODO: Add your implementation code here
	return S_OK;
}
