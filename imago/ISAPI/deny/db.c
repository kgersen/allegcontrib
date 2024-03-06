// TODO: AppendAddress - Durrr

#include <windows.h>
#include <stdio.h>
#include <httpfilt.h>
#include "authfilt.h"

//
//  This is the name of the /file/ that contains the address list
//  Change this to a database interface when you need remote apps to use it too (future)
//

#define DENY_LIST_FILE     "c:\\inetpub\\deny.ips"

//
//  Globals
//

CHAR * pszUserFile = NULL;


BOOL
ValidateAddress(
    IN OUT CHAR * pszIP,
    OUT    BOOL * pfValid
    )
/*++

Routine Description:

    Looks up the ip and confirms request is not denied, does the good stuff

Arguments:

    pszIP		- The ip to validate from the request
    pfValid     - Set to TRUE if the user should be logged on.

Return Value:

    TRUE on success, FALSE on failure

--*/
{
    BOOL fFound = FALSE;

    //
    //  Assume we're going to pass validation
    //

    *pfValid = TRUE;


    if ( !LookupAddressInCache( pszIP, &fFound ) )
    {
        return FALSE;
    }

    if ( !fFound )
    {
        if ( !LookupAddressInDb( pszIP, &fFound) )
        {
            return FALSE;
        }

        if ( fFound )
        {	
			*pfValid = FALSE;
            AddAddressToCache( pszIP );
			return TRUE;
        }

        return TRUE;
    
	} else //found in cache 
	{
		*pfValid = FALSE;
		return TRUE;
	}

    return TRUE;
}

BOOL
InitializeDatabase(
    VOID
    )
/*++

Routine Description:

    Retrieves the ip's from the file.  If the ip's were coming from a
    database, this routine would connect to the database. (only gets called when IIS sets up the ISAPI)

Return Value:

    TRUE on success, FALSE on failure

--*/
{
    HANDLE hFile;
    DWORD  cbFile;
    DWORD  cbRead;

    //
    //  Open and read the file.  The System account must have access to the
    //  file.
    //

    hFile = CreateFile( DENY_LIST_FILE,
                        GENERIC_READ,
                        FILE_SHARE_READ,
                        NULL,
                        OPEN_EXISTING,
                        0,
                        NULL );

    if ( hFile == INVALID_HANDLE_VALUE )
    {

		ReportWFEvent("[Deny Filter]",
				"[OnDBInit] no C:\\InetPub\\deny.ips file found",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 

        DbgWrite(( DEST,
                   "[InitializeUserDatabase] Error %d openning %s\n",
                   GetLastError(),
                   DENY_LIST_FILE ));

        return FALSE;
    }

    cbFile = GetFileSize( hFile, NULL );

    if ( cbFile == (DWORD) -1 )
    {
        CloseHandle( hFile );
        return FALSE;
    }

    pszUserFile = LocalAlloc( LPTR, cbFile + 1 );

    if ( !pszUserFile )
    {
        SetLastError( ERROR_NOT_ENOUGH_MEMORY ); //`yq
        CloseHandle( hFile );
        return FALSE;
    }

    if ( !ReadFile( hFile,
                    pszUserFile,
                    cbFile,
                    &cbRead,
                    NULL ))
    {
        CloseHandle( hFile );
        LocalFree( pszUserFile );

        return FALSE;
    }

    CloseHandle( hFile );

    //
    //  Zero terminate the file data
    //

    pszUserFile[cbRead] = '\0';

    return TRUE;
}

BOOL
LookupAddressInDb(
    IN CHAR * pszIP,
    OUT BOOL * pfFound
    )
/*++

Routine Description:

    Looks up the IP address in the database and returns any other attributes
    associated with this IP.

    The file data is not sorted to simulate the cost of an external database
    lookup - besides the fact we initialize with a nice self-sorting cache.

Arguments:

    pszIP	    - The username to find in the database (case insensitive)
    pfFound     - Set to TRUE if the specified user name was found in the
                  database

Return Value:

    TRUE on success, FALSE on failure

--*/
{
    CHAR * pch = pszUserFile;
    DWORD  cchUser = strlen( pszIP );

    //
    //  Assume not found
    //

    *pfFound = FALSE;

    //
    //  Scan for the remote ip address.  We're expecting one ip per line in
    //  the form:
    //
	//		0.0.0.0
    //      255.255.255.255
    //

    while ( pch && *pch )
    {
        while ( ISWHITE( *pch ) )
            pch++;

        if ( !strnicmp( pszIP, pch, cchUser ) )
        {

            *pfFound = TRUE;
			return TRUE;
        }

        pch = strchr( pch+1, '\n' );
    }

    return TRUE;
}

BOOL
AddAddressToDb(
    CHAR * pszIP
    )
/*++

Routine Description:

    Adds the specified ip to the end of the file
	NOTE: we do not check for duplicates!  We shouldn't have to,
	as this function only gets called if they are not already found in here!

Arguments:

    pszIP - IP Address to add

Return Value:

    TRUE if no errors occurred.

--*/
{
	HANDLE hFile;
    DWORD  cbFile;
	DWORD  cbBuff;
	DWORD  dwPos = 0;
	DWORD  dwBytesWritten = 0;
	char * Buff = NULL;

	Buff = pszIP;
	strcat(Buff,"\n");
	cbBuff = strlen(Buff);

    //
    //  Open the file for append.  The System account must have access to the
    //  file.
    //

    hFile = CreateFile( DENY_LIST_FILE,
                        GENERIC_WRITE,
                        FILE_SHARE_READ,
                        NULL,
                        OPEN_EXISTING,
                        FILE_ATTRIBUTE_NORMAL,
                        NULL );

    if ( hFile == INVALID_HANDLE_VALUE )
    {

		ReportWFEvent("[Deny Filter]",
				"[OnDBInit] no C:\\InetPub\\deny.ips can't append",
				"",
				"",
				EVENTLOG_ERROR_TYPE,
				3 ); 

        return FALSE;
    }

    cbFile = GetFileSize( hFile, NULL );

    if ( cbFile == (DWORD) -1 )
    {
        CloseHandle( hFile );
        return FALSE;
    }
	
    dwPos = SetFilePointer(hFile, cbFile, NULL, FILE_BEGIN); 
   
	LockFile(hFile, dwPos, 0, cbBuff, 0); 
    WriteFile(hFile, Buff, cbBuff, &dwBytesWritten, NULL); 
    UnlockFile(hFile, dwPos, 0, cbBuff, 0); 

	CloseHandle( hFile );

	if (dwBytesWritten) 
	{
		return TRUE;
	} else
	{
		return FALSE;
	}
}

VOID
TerminateDatabase(
    VOID
    )
/*++

Routine Description:

    Shuts down the address database.

--*/
{
    if ( pszUserFile )
    {
        LocalFree( pszUserFile );
    }
}
