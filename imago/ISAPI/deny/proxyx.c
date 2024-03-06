#include <windows.h>
#include <process.h>
#include <stdio.h>
#include <winsock.h>
#include <httpfilt.h>
#include "authfilt.h"


//
//  Globals
//

HANDLE hThreads[TOTAL_PORTS - 1];	//thread handles array
unsigned short int ports[TOTAL_PORTS - 1];		//port (list) array
BOOL proxies[TOTAL_PORTS - 1];		//response array

char * t_pszIP = NULL;  //the threads use this address


//	Thread-safe wrapping of strtok. Note "str" is modifed as per strtok()

char *myStrTok(char *str, const char *delim, char **tok)
{
	char	*start, *end;
	int		i;

	start = str ? str : *tok;

	if (start == 0) {
		return 0;
	}
	
	i = strspn(start, delim);
	start += i;
	if (*start == '\0') {
		*tok = 0;
		return 0;
	}
	end = strpbrk(start, delim);
	if (end) {
		*end++ = '\0';
		i = strspn(end, delim);
		end += i;
	}
	*tok = end;
	return start;
}


//  My sole purpose in life

int find_code(char *line)
{
	char *responseText, *responseProto;
	char	*code, *tok;
	int responseCode;

	responseProto = myStrTok(line, " \t", &tok);
	if (responseProto == 0 || responseProto[0] == '\0') {
		return 417; //HTTP_EXPECTATION_FAILED
	}
	responseProto = strdup(responseProto);

	if (strncmp(responseProto, "HTTP/1.", 7) != 0) {
		return 505; //	HTTP_VERSION_NOT_SUPPORTED
	}

	code = myStrTok(0, " \t\r\n", &tok);
	if (code == 0 || *code == '\0') {
		return 412; //HTTP_PRECONDITION_FAILED
	}
	responseCode = atoi(code);

	responseText = myStrTok(0, "\r\n", &tok);
	if (responseText && *responseText) {
		responseText = strdup(responseText);
	}

	return responseCode;
}


// http client routine

int http_get(char * proxyname, unsigned short int port, char * server, char * request)
{
	IN_ADDR		iaHost;
	LPHOSTENT	lpHostEntry;
	SOCKET		Socket;	
	SOCKADDR_IN saServer;
	int			nRet;
	char		szBuffer[1024];

	unsigned short portnum = port;
	//char * useragent = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.6) PDF/1.0";

	iaHost.s_addr = inet_addr(proxyname);
	if (iaHost.s_addr == INADDR_NONE)
	{
		// Wasn't an IP address string, assume it is a name
		lpHostEntry = gethostbyname(proxyname);
		saServer.sin_addr = *((LPIN_ADDR)*lpHostEntry->h_addr_list);
	}
	else
	{
		// It was a valid IP address string
		saServer.sin_addr.s_addr = iaHost.s_addr;
	}

	Socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (Socket == INVALID_SOCKET)
	{
		return 1;
	}

	saServer.sin_port = htons(portnum);
	saServer.sin_family = AF_INET;

	nRet = connect(Socket, (LPSOCKADDR)&saServer, sizeof(SOCKADDR_IN));
	if (nRet == SOCKET_ERROR)
	{
		closesocket(Socket);
		return 2;
	}

    sprintf(szBuffer,"GET http://%s%s\r\n\r\n",server,request);  //we may have to make this look more like a real web-browser

	nRet = send(Socket, szBuffer, strlen(szBuffer), 0);
	if (nRet == SOCKET_ERROR)
	{
		closesocket(Socket);	
		return 3;
	}

	//
	// Receive the file contents and print to stdout
	//
	while(1)
	{
		// Wait to receive, nRet = NumberOfBytesReceived
		nRet = recv(Socket, szBuffer, sizeof(szBuffer), 0);
		if (nRet == SOCKET_ERROR)
		{
			return 4;
		}

		// Did the server close the connection?
		if (nRet == 0)
			break;
	}

	closesocket(Socket);
	return find_code(szBuffer);
}


// thread entry point

DWORD WINAPI ThreadProc( LPVOID pArguments )  
{
	int portid;
	int ires; //http response code or error code

	portid = (int)pArguments;

	//do a remote HTTP GET using the proxy
	ires=http_get(t_pszIP,ports[portid],"autoupdate.alleg.net","/Allegiance.cfg");

	if( (ires == 3) || (ires == 4) )
	{
		// ??:  connected to the port (and/or sent request)
		// but didn't get any response, consider this evil.
		proxies[portid] = TRUE;
		ExitThread( 1 );
		return 1;
	}

		//no client errors
	if ( (ires != 417) &&
		 (ires != 412) &&
		// (ires != 505) &&  //something that returns invalid HTTP can be considered evil, also.
		 (ires != 404) &&
		 (ires != 405) )
	{
		//sanity check for socket errors
		if (ires > 100) 
		{
			// a valid proxy response
			proxies[portid] = TRUE; 	//this won't work in all cases, so we store the exit
			ExitThread( 1 );			//code in a global array also.
			return 1;

		}
	}

	// not a proxy
	ExitThread( 0 );
	return 0;
}


// authfilt entry point

BOOL SexAddress(IN OUT CHAR * pszIP) // True if non-RFC proxy address
{
	int i;
	unsigned threadID = 0;
	DWORD dwExit = 0; //thread exit code
	BOOL bProxy = FALSE;
	WORD wVersionRequested = MAKEWORD(1,1);
	WSADATA wsaData;
	
	t_pszIP=pszIP;  //init the global pointer to the ip addy string so all threads can use it.

	//ports to scan, these are global and the index is passed to the thread
	//if you add some make sure to increment TOTAL_PORTS in the header

	ports[8] = 80;
	ports[1] = 81;
	ports[5] = 8080;
	ports[3] = 3128;
	ports[4] = 443;
	ports[0] = 8888;
	ports[6] = 65506;
	ports[7] = 8000;
	ports[2] = 8263;
	ports[9] = 6588;

	WSAStartup(wVersionRequested, &wsaData);

	// uncomment this to step thru a particular port check (w/o creating a thread)
	//DEBUG_BREAK;
	//dwExit = ThreadProc((LPVOID)8); //debug port 80

	// Spin up http client threads, one for each port.  if we get any more ports we might have to use a queue.
	for (i = 0; i < TOTAL_PORTS; i++) 
	{
	
		hThreads[i] = CreateThread( NULL, 0, ThreadProc, (LPVOID)i, 0, &threadID );
		
		if ((hThreads[i] == NULL) || (threadID <= 0)) 
		{
			ReportWFEvent("[Deny Filter]",
				"[TryProxyPort] Thread create errors",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 
				
				return FALSE;
		}

	}

	WaitForMultipleObjects(TOTAL_PORTS - 1,hThreads,TRUE,10000); // wait 10 seconds for all threads to close.

	//  Spin down http client threads
	for (i = 0; i < TOTAL_PORTS; i++) 
	{	
		//kill bad thread
		if (!GetExitCodeThread(hThreads[i],&dwExit))
		{
			TerminateThread(hThreads[i],0);
		//good thread
		} else
		{
			//check the thread exit code and/or the global response array
			if ( (dwExit == 1) || (proxies[i] == TRUE) ) 
			{
				bProxy = TRUE;
			//kill hung thread
			} else if (dwExit == 259)
			{
				TerminateThread(hThreads[i],0);
			}
		}

		CloseHandle(hThreads[i]);
	}

	WSACleanup();

	return bProxy;
}
