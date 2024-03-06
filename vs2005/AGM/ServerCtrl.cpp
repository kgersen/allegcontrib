#include "StdAfx.h"
#include "AGM.h"
#include "..\ICE\corestruct.h"
#include "AGMEventsHandler.h"
#include "serverctrl.h"

CServerCtrl::CServerCtrl()
{
	m_cRef = 0;
	AddRef();
	iadms = NULL;
	iasc = NULL;
	icp = NULL;
	icpc = NULL;
	iserver = NULL;
}
CServerCtrl::~CServerCtrl()
{
	//Release();
}

CServerEvents::CServerEvents()
{
	m_cRef = 0;
	AddRef();
	m_cStrong = 0;
	ceh = NULL;
}
CServerEvents::~CServerEvents()
{
	//Release();
}
const ULONG CSKey[4] = {
  0x8a1e3f7f,
  0x4fbf7a21,
  0x2cd0399b,
  0x02540ddb};

// the 'magic' stuff. v2: doesnt use AGCVersionInfo anymore but a binary VSINFO block with valid info in it
HRESULT STDMETHODCALLTYPE CServerCtrl::raw_GetIdentity(long nCookie, IUnknown * * ppIdentity)
{
	csevents.MyCookie = nCookie; // not really needed
	HRESULT hr;
	//IUnknown * puk = NULL;

	//hr = CoCreateInstance(
	//	__uuidof(AGCVersionInfo),
	//	NULL,
	//	(CLSCTX_INPROC_SERVER|CLSCTX_INPROC_HANDLER |CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER), // = 0x17
	//	IID_IUnknown,
	//	(LPVOID *)&puk);
	//hr = OleRun(puk);

	//IAGCVersionInfoPtr piagcver = NULL;
	//hr = puk->QueryInterface(__uuidof(IAGCVersionInfo),(LPVOID *)&piagcver);
	//puk->Release();
	//hr = piagcver->put_FileName(NULL);
	//IPersistStream *pipstm = NULL;
	//hr = piagcver->QueryInterface(IID_IPersistStream,(LPVOID *)&pipstm);

	LPSTREAM ppstm;
	hr = CreateStreamOnHGlobal(NULL,TRUE,&ppstm);
	//hr = pipstm->Save(ppstm,FALSE);
	CString resnum;
	HMODULE module = GetModuleHandle("AGMLib.dll");

	resnum.Format("#%d",IDR_VSINFO1);
	HRSRC res = FindResource(module,resnum,"VSINFO");
	DWORD vsblocksize = SizeofResource(module,res);
	HGLOBAL vsblockhandle = LoadResource(module,res);
	LPVOID vsblock = LockResource(vsblockhandle);
	hr  = ppstm->Write(vsblock,vsblocksize,NULL);
	
	LARGE_INTEGER lpos;
	lpos.HighPart = 0;
	lpos.LowPart = 0;
	hr = ppstm->Seek(lpos,0,NULL);

	ULONG buff[4]; // at least 4
	ULONG cbRead = 0;
	LPSTREAM ppstm2;
	hr = CreateStreamOnHGlobal(NULL,TRUE,&ppstm2);
	hr = ppstm2->Seek(lpos,0,NULL);
	do {
		hr = ppstm->Read(buff,0x10/* =4*sizeof(ULONG) */,&cbRead);
		if (cbRead == 0) break;
		buff[0] = buff[0] ^ CSKey[0];
		buff[1] = buff[1] ^ CSKey[1];
		buff[2] = buff[2] ^ CSKey[2];
		buff[3] = buff[3] ^ CSKey[3];
		hr = ppstm2->Write(buff,cbRead,NULL);
	} while (true);

	//STATSTG stat;
	//hr = ppstm2->Stat(&stat,STATFLAG_NONAME);
	//CStdioFile f3("stream.bin", CFile::modeCreate | CFile::modeWrite | CFile::typeBinary);
	//BYTE *tempo = new BYTE[stat.cbSize.LowPart];
	//hr = ppstm->Seek(lpos,0,NULL);
	//hr = ppstm->Read(tempo,stat.cbSize.LowPart,&cbRead);
	//f3.Write(tempo,stat.cbSize.LowPart);
	//f3.Close();

	MyCookie = nCookie;
	if (ppstm) ppstm->Release();
	//if (piagcver) piagcver->Release();
	*ppIdentity = ppstm2; // return the "destination" stream
	return nCookie & 0x7FFFFFFF; // some 'magic' stuff again
}
STDMETHODIMP CServerCtrl::QueryInterface
                    (REFIID                     riid,
                     LPVOID *                   ppvObj)
{
	if (riid == IID_IUnknown)
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}
	if (riid == __uuidof(IAdminSessionHostPtr))
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}
	return  E_NOINTERFACE ; 
}
// IAdminSessionEvents
struct __declspec(uuid("4C1E39E1-E3E3-4296-AA86-EC938D896E92")) ispec;
STDMETHODIMP CServerEvents::QueryInterface
                    (REFIID                     riid,
                     LPVOID *                   ppvObj)
{
	if (riid == IID_IUnknown)
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}
	if (riid == __uuidof(IAdminSessionEvents))
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}
	/*if (riid == __uuidof(ispec))
	{
		*ppvObj = this;
		AddRef();
		return S_OK;
	}*/
	return  E_NOINTERFACE ; 
}
HRESULT _stdcall CServerEvents::raw_OnEvent(IAGCEvent* pEvent)
{
	if (pEvent == NULL) return S_OK;
	if (ceh)
		ceh->OnAGCEvent(pEvent);
	return S_OK;
}


//
bool CServerCtrl::StartServer()
{
	HRESULT hr;
	hr = CoGetClassObject(
		__uuidof(AdminSession),// REFCLSID rclsid, //CLSID associated with the class object
		CLSCTX_LOCAL_SERVER,//DWORD dwClsContext,
		//Context for running executable code
		NULL,//COSERVERINFO * pServerInfo,
		//Pointer to machine on which the object is to 
		// be instantiated
		__uuidof(IAdminSessionClassPtr),//REFIID riid, //Reference to the identifier of the interface
		(LPVOID *)&iasc//LPVOID * ppv //Address of output variable that receives the 
		// interface pointer requested in riid
	);
	if (hr != S_OK)
		return false;

	try
	{
		iadms = iasc->CreateSession(this);
	}
	catch (...)
	{
		ReleaseServer(true);
		return false;
	}

	/*
	COleDateTime oletime1;
	oletime1 = COleDateTime::GetCurrentTime();
	DATE dt = oletime1.m_dt;
	hr = iadms->SendAdminChat("test",1,dt);
	ITCSessionInfoPtr isi = iadms->GetSessionInfo();
	*/
	//hr = iadms->get_Server(&iserver);
	return true;
	/*
	BSTR machinename = new WCHAR[200];
	hr = iserver->get_MachineName(&machinename);
	*/
	/*
	long mcount = 0;
	hr = iserver->get_MissionCount(&mcount);
	*/
	IAdminGamesPtr igames = NULL;
	hr = iserver->get_Games(&igames);
	long ngames = 0;
	hr = igames->get_Count(&ngames);
	if (ngames == 0)
	{
		IAGCGameParametersPtr iparams = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
		hr = igames->raw_Add(iparams);
		//iparams.Release();
	}
	//hr = igames->Release();
	igames = NULL;
	/*
	IAdminGamePtr igame;
	VARIANT pvi;
	pvi.vt = VT_I4;
	pvi.lVal = 0;
	hr = igames->get_Item(&pvi,&igame);
	IAdminUserPtr iowner;
	hr = igame->get_GameOwnerUser(&iowner);
	BSTR username = new WCHAR[200];
	hr = iowner->get_Name(&username);
	hr = iowner->SendMsg((LPCTSTR)sCustomMap);
	hr = igame->StartGame();
	IAGCEventPtr pstats;
	hr = iowner->get_PlayerStats(&pstats);
	hr = pstats->raw_SaveToString(&username);
	*/
	return true;
}
void CServerCtrl::SetEventsHook(AGMEventsHandler *ceh)
{
	HRESULT hr;
	if (iadms == NULL) return;
	csevents.ceh = ceh;
	hr = iadms->QueryInterface(IID_IConnectionPointContainer ,(LPVOID *)&icpc);
	hr = icpc->FindConnectionPoint(__uuidof(IAdminSessionEvents),&icp);
	hr = icp->Advise((IUnknown *)&csevents,&CPcookie);
	hr = iadms->ActivateAllEvents();
}
void CServerCtrl::ReleaseServer(bool stop_it)
{
	HRESULT hr;
	if (iserver)
	{
		if (stop_it)
		{
			//hr = iserver->SendMsg("Server is shuting down in 5 seconds");
			//Sleep(5000);
		}
		//iserver->Release();
		iserver = NULL;
	}
	if (iadms)
	{
		hr = iadms->DeactivateAllEvents();
		if (icp)
		{
			hr = icp->Unadvise(CPcookie);
			icp->Release();
			icp = NULL;
		}
		if (icpc)
		{
			icpc->Release();
			icpc = NULL;
		}
		if (stop_it)
			hr = iadms->Stop();
		//hr = iadms->Release();
		iadms = NULL;
	}
	if (iasc)
	{
		//iasc->Release();
		iasc = NULL;
	}
}
