#include <windows.h>
#include <stdio.h>
#include <httpfilt.h>
#include "authfilt.h"

//
// Constants
//

//
//  The maximum number of ip addresses we will cache.  If there will be a larger number
//  of simultaneous connections, bump this value
//

#define MAX_CACHED_ADDRESSES        200

//
//  The position after which we'll move a cache entry to the front of the list
//

#define LIST_REORDER_THRESHOLD  100

//
//  Cached user structure
//

typedef struct _DENY_INFO
{
    LIST_ENTRY  ListEntry;  // Double linked list entry

	CHAR  achIP[16];  // Remote IP of request 

} DENY_INFO, *PDENY_INFO;

typedef struct _ALLOW_INFO
{
    LIST_ENTRY  AllowListEntry;  // Double linked list entry

	CHAR  bchIP[16];  // Remote IP of request 

} ALLOW_INFO, *PALLOW_INFO;


//
//  Globals
//

//
//  Circular double linked list of cached users
//

LIST_ENTRY CacheListHead;
LIST_ENTRY AllowCacheListHead;

//
//  Critical section protects cache list
//

CRITICAL_SECTION csCacheLock;
CRITICAL_SECTION csAllowCacheLock;

//
//  Indicates whether we are initialized
//

BOOL fCacheInitialized = FALSE;

//
//  Number of items in the cache
//

DWORD cCacheItems = 0;
DWORD cAllowCacheItems = 0;


BOOL
InitializeCache(
    VOID
    )
/*++

Routine Description:

    Initializes the cache module

Return Value:

    TRUE if initialized successfully, FALSE on error

--*/
{
    if ( fCacheInitialized )
        return TRUE;

    InitializeCriticalSection( &csCacheLock );
	InitializeCriticalSection( &csAllowCacheLock );
    
	CacheListHead.Blink = CacheListHead.Flink = &CacheListHead;
	AllowCacheListHead.Blink = AllowCacheListHead.Flink = &AllowCacheListHead;
    
	fCacheInitialized = TRUE;

    return TRUE;
}

BOOL
ValidAddressLookup(
    CHAR * pszIP,
    BOOL * pfFound
    )
/*++

Routine Description:

    Checks to see if a IP address is in the ALLOW cache

Arguments:

    pszIP		- String IP to find
    pfFound     - Set to TRUE if the specified user was found

Return Value:

    TRUE if no errors occurred.

--*/
{
    LIST_ENTRY * pEntry;
    ALLOW_INFO *  pUser;
    DWORD        cPosition = 0;

    //
    //  Search the cache for the specified IP
    //

    EnterCriticalSection( &csAllowCacheLock );

    for ( pEntry  = AllowCacheListHead.Flink;
          pEntry != &AllowCacheListHead;
          pEntry = pEntry->Flink )
    {
        pUser = CONTAINING_RECORD( pEntry, ALLOW_INFO, AllowListEntry );

        if ( !stricmp( pszIP, pUser->bchIP ))
        {
            goto Found;
        }

        cPosition++;
    }

    LeaveCriticalSection( &csAllowCacheLock );

    //
    //  Not Found
    //

    *pfFound = FALSE;
    return TRUE;

Found:

    //
    //  Move this IP address entry to the front of the list as we're probably going
    //  to get subsequent requests for it.  Note we only move it
    //  if it's not already near the front
    //

    if ( cPosition > LIST_REORDER_THRESHOLD )
    {
        //
        //  Remove from the old position...
        //

        pEntry->Blink->Flink = pEntry->Flink;
        pEntry->Flink->Blink = pEntry->Blink;

        //
        // ...and insert it at the beginning of the list
        //

        pEntry->Blink = &AllowCacheListHead;
        pEntry->Flink = AllowCacheListHead.Flink;

        AllowCacheListHead.Flink->Blink = pEntry;
        AllowCacheListHead.Flink        = pEntry;
    }

    LeaveCriticalSection( &csAllowCacheLock );

    *pfFound = TRUE;

    return TRUE;
}


BOOL
LookupAddressInCache(
    CHAR * pszIP,
    BOOL * pfFound
    )
/*++

Routine Description:

    Checks to see if a IP address is in the cache

Arguments:

    pszIP		- String IP to find
    pfFound     - Set to TRUE if the specified user was found

Return Value:

    TRUE if no errors occurred.

--*/
{
    LIST_ENTRY * pEntry;
    DENY_INFO *  pUser;
    DWORD        cPosition = 0;

    //
    //  Search the cache for the specified IP
    //

    EnterCriticalSection( &csCacheLock );

    for ( pEntry  = CacheListHead.Flink;
          pEntry != &CacheListHead;
          pEntry = pEntry->Flink )
    {
        pUser = CONTAINING_RECORD( pEntry, DENY_INFO, ListEntry );

        if ( !stricmp( pszIP, pUser->achIP ))
        {
            goto Found;
        }

        cPosition++;
    }

    LeaveCriticalSection( &csCacheLock );

    //
    //  Not Found
    //

    *pfFound = FALSE;
    return TRUE;

Found:

    //
    //  Move this IP address entry to the front of the list as we're probably going
    //  to get subsequent requests for it.  Note we only move it
    //  if it's not already near the front
    //

    if ( cPosition > LIST_REORDER_THRESHOLD )
    {
        //
        //  Remove from the old position...
        //

        pEntry->Blink->Flink = pEntry->Flink;
        pEntry->Flink->Blink = pEntry->Blink;

        //
        // ...and insert it at the beginning of the list
        //

        pEntry->Blink = &CacheListHead;
        pEntry->Flink = CacheListHead.Flink;

        CacheListHead.Flink->Blink = pEntry;
        CacheListHead.Flink        = pEntry;
    }

    LeaveCriticalSection( &csCacheLock );

    *pfFound = TRUE;

    return TRUE;
}

BOOL
AddValidAddress(
    CHAR * pszIP
    )
/*++

Routine Description:

    Adds the specified ip to the ALLOW cache

Arguments:

    pszIP - IP Address to add

Return Value:

    TRUE if no errors occurred.

--*/
{
    LIST_ENTRY * pEntry;
    ALLOW_INFO *  pUser;

    //
    //  Check our parameters before adding them to the cache
    //

    if ( strlen( pszIP ) > 16 )
    {
        SetLastError( ERROR_INVALID_PARAMETER );
        return FALSE;
    }

    //
    //  Search the cache for the specified address to make sure there are no
    //  duplicates
    //

    EnterCriticalSection( &csAllowCacheLock );

    for ( pEntry  = AllowCacheListHead.Flink;
          pEntry != &AllowCacheListHead;
          pEntry = pEntry->Flink )
    {
        pUser = CONTAINING_RECORD( pEntry, ALLOW_INFO, AllowListEntry );

        if ( !stricmp( pszIP, pUser->bchIP ))
        {
            goto Found;
        }
    }

    //
    //  Allocate a new cache item and put it at the head of the list
    //

    pUser = (ALLOW_INFO *) LocalAlloc( LPTR, sizeof( ALLOW_INFO ));

    if ( !pUser )
    {
        LeaveCriticalSection( &csAllowCacheLock );

        SetLastError( ERROR_NOT_ENOUGH_MEMORY );
        return FALSE;
    }

	sprintf(pUser->bchIP,"%s",pszIP);

    pUser->AllowListEntry.Flink = AllowCacheListHead.Flink;
    pUser->AllowListEntry.Blink = &AllowCacheListHead;

    AllowCacheListHead.Flink->Blink = &pUser->AllowListEntry;
    AllowCacheListHead.Flink = &pUser->AllowListEntry;

Found:

    cAllowCacheItems++;

    //
    //  If there are too many cached users, remove the least recently
    //  used one now
    //

    if ( cAllowCacheItems > MAX_CACHED_ADDRESSES )
    {
        pEntry = AllowCacheListHead.Blink;

        pEntry->Blink->Flink = &AllowCacheListHead;
        AllowCacheListHead.Blink  = pEntry->Blink;

        LocalFree( CONTAINING_RECORD( pEntry, ALLOW_INFO, AllowListEntry ));

        cAllowCacheItems--;
    }

    LeaveCriticalSection( &csAllowCacheLock );

    return TRUE;
}

BOOL
AddAddressToCache(
    CHAR * pszIP
    )
/*++

Routine Description:

    Adds the specified ip to the DENY cache

Arguments:

    pszIP - IP Address to add

Return Value:

    TRUE if no errors occurred.

--*/
{
    LIST_ENTRY * pEntry;
    DENY_INFO *  pUser;

    //
    //  Check our parameters before adding them to the cache
    //

    if ( strlen( pszIP ) > 16 )
    {
        SetLastError( ERROR_INVALID_PARAMETER );
        return FALSE;
    }

    //
    //  Search the cache for the specified address to make sure there are no
    //  duplicates
    //

    EnterCriticalSection( &csCacheLock );

    for ( pEntry  = CacheListHead.Flink;
          pEntry != &CacheListHead;
          pEntry = pEntry->Flink )
    {
        pUser = CONTAINING_RECORD( pEntry, DENY_INFO, ListEntry );

        if ( !stricmp( pszIP, pUser->achIP ))
        {
            goto Found;
        }
    }

    //
    //  Allocate a new cache item and put it at the head of the list
    //

    pUser = (DENY_INFO *) LocalAlloc( LPTR, sizeof( DENY_INFO ));

    if ( !pUser )
    {
        LeaveCriticalSection( &csCacheLock );

        SetLastError( ERROR_NOT_ENOUGH_MEMORY );
        return FALSE;
    }

	sprintf(pUser->achIP,"%s",pszIP);

    pUser->ListEntry.Flink = CacheListHead.Flink;
    pUser->ListEntry.Blink = &CacheListHead;

    CacheListHead.Flink->Blink = &pUser->ListEntry;
    CacheListHead.Flink = &pUser->ListEntry;

Found:

    cCacheItems++;

    //
    //  If there are too many cached users, remove the least recently
    //  used one now
    //

    if ( cCacheItems > MAX_CACHED_ADDRESSES )
    {
        pEntry = CacheListHead.Blink;

        pEntry->Blink->Flink = &CacheListHead;
        CacheListHead.Blink  = pEntry->Blink;

        LocalFree( CONTAINING_RECORD( pEntry, DENY_INFO, ListEntry ));

        cCacheItems--;
    }

    LeaveCriticalSection( &csCacheLock );

    return TRUE;
}

VOID
TerminateCache(
    VOID
    )
/*++

Routine Description:

    Terminates the cache module and frees any allocated memory

--*/
{
    LIST_ENTRY * pEntry;
    LIST_ENTRY * pEntryNext;
    DENY_INFO *  pUser;

    LIST_ENTRY * pAEntry;
    LIST_ENTRY * pAEntryNext;
    ALLOW_INFO *  pAUser;

    if ( !fCacheInitialized )
        return;

    EnterCriticalSection( &csCacheLock );
    EnterCriticalSection( &csAllowCacheLock );

    //
    //  Free all of the cache entries
    //

    for ( pEntry  = CacheListHead.Flink;
          pEntry != &CacheListHead;
          pEntry  = pEntryNext )

    {
        pUser = CONTAINING_RECORD( pEntry, DENY_INFO, ListEntry );

        pEntryNext = pEntry->Flink;

        //
        //  Remove this entry from the list and free it
        //

        pEntry->Blink->Flink = pEntry->Flink;
        pEntry->Flink->Blink = pEntry->Blink;

        LocalFree( pUser );
    }
    for ( pAEntry  = AllowCacheListHead.Flink;
          pAEntry != &AllowCacheListHead;
          pAEntry  = pAEntryNext )

    {
        pAUser = CONTAINING_RECORD( pAEntry, ALLOW_INFO, AllowListEntry );

        pAEntryNext = pAEntry->Flink;

        //
        //  Remove this entry from the list and free it
        //

        pAEntry->Blink->Flink = pAEntry->Flink;
        pAEntry->Flink->Blink = pAEntry->Blink;

        LocalFree( pAUser );
    }

    cCacheItems = 0;
    LeaveCriticalSection( &csCacheLock );
    DeleteCriticalSection( &csCacheLock );
    cAllowCacheItems = 0;
    LeaveCriticalSection( &csAllowCacheLock );
    DeleteCriticalSection( &csAllowCacheLock );


    fCacheInitialized = FALSE;
}
