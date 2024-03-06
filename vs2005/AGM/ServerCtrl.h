#pragma once
class CServerEvents : public IAdminSessionEvents
{
public:
    STDMETHODIMP QueryInterface
                    (REFIID                     riid,
                     LPVOID *                   ppvObj);
    inline STDMETHODIMP_(ULONG) AddRef
                    () { return InterlockedIncrement(&m_cRef);};
    inline STDMETHODIMP_(ULONG) Release
                    () { ULONG ulCount = InterlockedDecrement(&m_cRef);
                         //if (!ulCount)  delete this; 
                         return ulCount;};
	HRESULT _stdcall raw_OnEvent(IAGCEvent* pEvent);

public :
    CServerEvents ();
    ~CServerEvents ();
	long MyCookie;
	AGMEventsHandler *ceh;
private :
    volatile LONG               m_cRef; 
	volatile LONG m_cStrong;

};

class CServerCtrl : public IAdminSessionHost
{
public:
    STDMETHODIMP QueryInterface
                    (REFIID                     riid,
                     LPVOID *                   ppvObj);
    inline STDMETHODIMP_(ULONG) AddRef
                    () { return InterlockedIncrement(&m_cRef);};
    inline STDMETHODIMP_(ULONG) Release
                    () { ULONG ulCount = InterlockedDecrement(&m_cRef);
                         //if (!ulCount)  delete this; 
                         return ulCount;};
	HRESULT STDMETHODCALLTYPE raw_GetIdentity(long nCookie, IUnknown * * ppIdentity);
	// Constructors and destructors
public :
    CServerCtrl ();
    ~CServerCtrl ();
	bool StartServer();
	void SetEventsHook(AGMEventsHandler *);
	void ReleaseServer(bool);
	IAdminSessionPtr		iadms;
	IAdminServerPtr			iserver;
private :
	long MyCookie;
	DWORD CPcookie;
	CServerEvents			csevents;
	IAdminSessionClassPtr	iasc;
	IConnectionPointContainer *icpc;
	IConnectionPoint		*icp;
    volatile LONG			m_cRef; 
};
