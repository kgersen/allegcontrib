// comauth.cpp : Implementation of Ccomauth

#include "stdafx.h"
#include "comauth.h"


// Ccomauth


STDMETHODIMP Ccomauth::testmeth(BSTR* p1test, BSTR* p2test)
{ // 1st called
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here
	char *pweb = (char *)p2test;
	strcpy(pweb+0x48-0xC,"Pointweb01");

	char *UK1 = (char *)p2test;
	UK1 += 0x20-0xC;
	char *auth1 = UK1+0x70;
	strcpy(auth1,"Allegiance");
	auth1 += 0x20;
	strcpy(auth1,"Zone");
	return S_OK;
}

STDMETHODIMP Ccomauth::meth2(BSTR* p1,BSTR* p2)
{
	// p2 = zoneticket
	AFX_MANAGE_STATE(AfxGetStaticModuleState());
	// TODO: Add your implementation code here
	// 0C11207D6h in alleg = 0C11207D8h
	/*char *pc2 = (char *)p2;
	strcpy(pc2,"KGJV");*/
	ULONG *charid = (ULONG *)(p1+2);
	*charid = 1;
	charid = (ULONG *)(p1+3);
	*charid = 1;
	//wcscpy((BSTR)p2,L"KGJV");
	//strcpy((char *)p2,"KGJV");
	//charid = (ULONG *)(p2);
	//*charid = 1;
	return 0; //0x0C1120001;
}

STDMETHODIMP Ccomauth::meth3(BSTR* p1,BSTR* p2,BSTR* p3,BSTR* p4)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	return S_OK;
}

STDMETHODIMP Ccomauth::get_prop1(BSTR param1, BSTR* pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	return S_OK;
}

STDMETHODIMP Ccomauth::put_prop1(BSTR param1, BSTR newVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState());

	// TODO: Add your implementation code here

	return S_OK;
}
