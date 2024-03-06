  /*
	<imago@marinms.com>
	
	  $Id: authfilt.c,v 1.1.2.3 2004/03/30 02:36:48 Imago Exp $
	
	  From the Microsoft ISAPI Auth Filter example (public domain) -

	Caches from C:\Inetpub\deny.ips on W3SVC start, a list of IP addresses that get 401.4'ed.
	Uses multi-threading and Winsock to port-scan for HTTP proxies.  
	If found, or the remote address sends HTTP proxy-like headers, the ip is added to the deny.ips

	A running cache of valid ip's is also maintained to allow subsequent requests
	without having to re-authenticate the connection.

	This provides a simple & effective solution to the problem where visitors do not provide
	us their actual IP address to the W3SVC.

  */

#include <windows.h>
#include <httpfilt.h>
#include "authfilt.h"

//
// Functions
//

BOOL
WINAPI
DllMain(
     IN HINSTANCE hinstDll,
     IN DWORD     fdwReason,
     IN LPVOID    lpvContext OPTIONAL
     )
/*++

 Routine Description:

   This function DllLibMain() is the main initialization function for
    this DLL. It initializes local variables and prepares it to be invoked
    subsequently.

 Arguments:

   hinstDll          Instance Handle of the DLL
   fdwReason         Reason why NT called this DLL
   lpvReserved       Reserved parameter for future use.

 Return Value:

    Returns TRUE is successful; otherwise FALSE is returned.
--*/
{
    BOOL        fReturn = TRUE;

    switch (fdwReason )
    {
    case DLL_PROCESS_ATTACH:

        if ( !InitializeDatabase() ||
             !InitializeCache() )
        {
			ReportWFEvent("[Deny Filter]",
				"[Initialize] ERROR",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 
            
			DbgWrite(( DEST,
                       "[GetFilterVersion] Database or cache failed, error %d\n",
                       GetLastError() ))

            return FALSE;
        }

        //
        //  We don't care about thread attach/detach notifications
        //

        DisableThreadLibraryCalls( hinstDll );


		ReportWFEvent("[Deny Filter]",
				"[Initialize] OK",
				"",
				"",
				EVENTLOG_INFORMATION_TYPE,
				3 ); 

        break;

    case DLL_PROCESS_DETACH:
        {

            if ( lpvContext != NULL)
            {
                TerminateCache();
                TerminateDatabase();
				

				ReportWFEvent("[Deny Filter]",
					"[Terminate] OK",
					"",
					"",
					EVENTLOG_INFORMATION_TYPE,
					3 ); 
            }

            break;
        } /* case DLL_PROCESS_DETACH */

    default:
        break;
    }   /* switch */

    return ( fReturn);
}  /* DllLibMain() */



BOOL
WINAPI
GetFilterVersion(
    HTTP_FILTER_VERSION * pVer
    )
{
    DbgWrite(( DEST,
               "[GetFilterVersion] Server filter version is %d.%d\n",
               HIWORD( pVer->dwServerFilterVersion ),
               LOWORD( pVer->dwServerFilterVersion ) ));

    pVer->dwFilterVersion = HTTP_FILTER_REVISION;

    //
    //  Specify the types and order of notification
    //

    pVer->dwFlags = (SF_NOTIFY_SECURE_PORT | SF_NOTIFY_NONSECURE_PORT | SF_NOTIFY_PREPROC_HEADERS | SF_NOTIFY_ORDER_HIGH);

    strcpy( pVer->lpszFilterDesc, "Proxy Deny Filter, Version 1.0" ); //sexy

    return TRUE;
}

DWORD
WINAPI
HttpFilterProc(
    HTTP_FILTER_CONTEXT *      pfc,
    DWORD                      NotificationType,
    VOID *                     pvData
    )
/*++

Routine Description:

    Filter notification entry point

Arguments:

    pfc -              Filter context
    NotificationType - Type of notification
    pvData -           Notification specific data

Return Value:

    One of the SF_STATUS response codes

--*/
{
	HTTP_FILTER_PREPROC_HEADERS *	pHeaders;
	CHAR							bchIP[16] = "";  //local address
    CHAR							achIP[16] = "";  //remote address
	DWORD							cbIP=0;
    CHAR							achGarbage[255] = "";
	DWORD							cbGarbage=0;
	BOOL							fAllowed = FALSE;

    //
    //  Handle this notification
    //

    switch ( NotificationType )
    {
	
	/*a remote client is connecting*/
    case SF_NOTIFY_PREPROC_HEADERS:
		
		//DEBUG_BREAK;  //uncomment this to step thru the entire filter (except the threads).
        
		pHeaders = (HTTP_FILTER_PREPROC_HEADERS *) pvData;

        //
        //  Make sure this ip is avail. and not in the cache || db 
        //
		
		cbIP = sizeof(achIP);

		if ( !pfc->GetServerVariable(pfc, "REMOTE_ADDR", &achIP, &cbIP) )
		{
			ReportWFEvent("[Deny Filter]",
				"[OnAuthentication] no remote address!!",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 

            DbgWrite(( DEST,
                       "[OnAuthentication] Error getting ip %d\n",
                       GetLastError()));

            return SF_STATUS_REQ_ERROR; // no way buddy
		}

        if ( !ValidateAddress(achIP, &fAllowed )) 
        {

			ReportWFEvent("[Deny Filter]",
				"[OnAuthentication] ValidateAddress() failed!!",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 

            DbgWrite(( DEST,
                       "[OnAuthentication] Error %d validating ip %s\n",
                       GetLastError(),
                       achIP ));

            return SF_STATUS_REQ_ERROR; // some kind of db error
        }

        if ( !fAllowed )
        {

			ReportWFEvent("[Deny Filter]",
				"[OnAuthentication] IP not allowed!",
				"",
				"",
				EVENTLOG_WARNING_TYPE,
				3 ); 

            //
            //  This ip isn't allowed access.  Indicate this to the server, takes care of 401 to the client
            //

			SetLastError( ERROR_ACCESS_DENIED );
			return SF_STATUS_REQ_ERROR;
        }

		//
		// Find HTTP headers for proxy detection (gets most of them)
		//

		cbGarbage = sizeof(achGarbage);

		if ( (pHeaders->GetHeader(pfc, "Via:", &achGarbage, &cbGarbage)) ||
			 (pHeaders->GetHeader(pfc, "X-Forwarded-For:", &achGarbage, &cbGarbage)) ||
			 (pHeaders->GetHeader(pfc, "Proxy-Connection:", &achGarbage, &cbGarbage)) ||
			 (pHeaders->GetHeader(pfc, "Forwarded-For:", &achGarbage, &cbGarbage))		
		   ) 
		{
			AddAddressToCache(achIP);
			AddAddressToDb(achIP);	
			
			ReportWFEvent("[Deny Filter]",
				"[OnProxy] anon proxy detected!",
				"",
				"",
				EVENTLOG_WARNING_TYPE,
				3 ); 

			SetLastError( ERROR_ACCESS_DENIED );
			return SF_STATUS_REQ_ERROR;
		}

		// we maintain a run-time cache of addresses that don't have proxy headers
		// and don't satisfy our proxy check.

		// this prevents creating socket threads after it has been checked already.

        if (!ValidAddressLookup(achIP, &fAllowed) ) 
        {
			ReportWFEvent("[Deny Filter]",
				"[OnAuthentication] ValidAddressLookup() failed!!",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 

			return SF_STATUS_REQ_ERROR; // this would be bad
        }

		if (fAllowed) 
		{
			ReportWFEvent("[Deny Filter]",
				"[OnAuthentication] [ValidAddressLookup] OK! skipping proxy check.",
				"",
				"",
				EVENTLOG_INFORMATION_TYPE,
				3 ); 

			return SF_STATUS_REQ_NEXT_NOTIFICATION;
		}

		//
        //  Are they are using a non RFC compliant HTTP proxy?  Deny all of them (for now). 
		//  If people actually have to use an HTTP proxy to connect to ASGS it's unlikley that
		//  they can even even play the game.
		// 
		//  May want to consider providing ASGS support for 401.4 responses.
		//  Indicate possible problems with playing the game, support paths, etc.  
		//  (even if the Allegiance game never uses HTTP itself)
		//
		//  This is the one root flaw with ASGS and pretty much the reason this ISAPI was written. ;-(
		//
		//  Another level of security; Have ASGS send a custom HTTP header - then we 
		//  can ban people making requests that don't have it (set it to X_HTTP_ASGS=1 then proxies will 
		//  :almost always: strip it out!).  IIS Web juggling for correct ISAPI filter placment will 
		//  likley have to occur if this happens.
        //

		pfc->GetServerVariable(pfc, "LOCAL_ADDR", &bchIP, &cbIP);	// prevent insest
		if (strcmp(bchIP,achIP)) {									//

			if ( SexAddress(achIP) ) 
			{

				AddAddressToCache(achIP);
				AddAddressToDb(achIP);

				ReportWFEvent("[Deny Filter]",
					"[OnProxy] high-anon proxy detected!",
					"",
					"",
					EVENTLOG_WARNING_TYPE,
					3 ); 
				
				SetLastError( ERROR_ACCESS_DENIED );
				return SF_STATUS_REQ_ERROR;

			} else
			{

				//
				//  No proxy intercourse, cache this as allowed
				//

				AddValidAddress(achIP);

				return SF_STATUS_REQ_NEXT_NOTIFICATION;

			}

		} else 
		{
			ReportWFEvent("[Deny Filter]",
				"[OnProxy] local request! skipping proxy check",
				"",
				"",
				EVENTLOG_INFORMATION_TYPE,
				3 ); 

			return SF_STATUS_REQ_NEXT_NOTIFICATION;
		}

		// 
		// Complete!
		//

		break;


    default:
        DbgWrite(( DEST,
                "[HttpFilterProc] Unknown notification type, %d\n",
                NotificationType ));

        return SF_STATUS_REQ_NEXT_NOTIFICATION;
    
	}

}

//used for event monitor
VOID ReportWFEvent(PTSTR string1,PTSTR string2,PTSTR string3,PTSTR string4,WORD eventType, WORD eventID) {
	HANDLE hEvent;
	PTSTR pszaStrings[4];
	WORD cStrings;

	cStrings = 0;
	if ((pszaStrings[0] = string1) && (string1[0])) cStrings++;
	if ((pszaStrings[1] = string2) && (string2[0])) cStrings++;
	if ((pszaStrings[2] = string3) && (string3[0])) cStrings++;
	if ((pszaStrings[3] = string4) && (string4[0])) cStrings++;
	if (cStrings == 0)
		return;
	
	hEvent = RegisterEventSource(
					NULL,		// server name for source (NULL means this computer)
					"Proxy Deny Filter");	// source name for registered handle  
	if (hEvent) {
		ReportEvent(hEvent,					// handle returned by RegisterEventSource 
				    eventType,				// event type to log 
				    0,						// event category 
				    eventID,				// event identifier 
				    0,						// user security identifier (optional) 
				    cStrings,				// number of strings to merge with message  
				    0,						// size of binary data, in bytes
				    pszaStrings,			// array of strings to merge with message 
				    0);		 				// address of binary data 
		DeregisterEventSource(hEvent);
	}
}
