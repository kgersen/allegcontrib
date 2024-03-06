// FZAuth.cpp : Implementation of CFZAuth

#include "stdafx.h"
#include "FZAuth.h"
#include "CFZATicket.h"


STDMETHODIMP CFZAuth::Meth1(CHAR *p1, ULONG p2, BYTE *p3, ULONG p4, CHAR *p5, CHAR *p6)
{// 6 parameters
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	//return S_OK;
	return 0x0C11207D8;
}

STDMETHODIMP CFZAuth::Meth2(BSTR p1, BSTR p2)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	return S_OK;
}

STDMETHODIMP CFZAuth::Meth3(CHAR *p1, CHAR *p2, CLSID *p3, ULONG *p4, ULONG *p5)
{
	// p1 = ZAuth entry of .cfg file
	// p2 = "Allegiance"
	// p3 = some CLSID
	// p4 = event HANDLE
	// P5 = return pointer
	/*
	p3 =	0x00567D40  81662310 11d0fcb4
			0x00567D48  60008aa8 bf8fb597
			0x00567D50  77f8674b 4b9c7881
			0x00567D58  67d50f8d 6c7e734d
			0x00567D60  616cec65 4beb3f9a
	*/
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	HANDLE evt = (HANDLE) p4;
	// TODO: Add your implementation code here
	SetEvent(evt);
	CDummyTicket *itick = new CDummyTicket();
	*p5 = (ULONG) itick;
	//*p5 = "something";
	return S_OK;
}

