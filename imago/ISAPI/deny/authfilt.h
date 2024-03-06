#ifndef _AUTHFILT_H_
#define _AUTHFILT_H_

//
//  Constants
//

#define ISWHITE( ch )      ((ch) && ((ch) == ' ' || (ch) == '\t' ||  \
                            (ch) == '\n' || (ch) == '\r'))

#ifdef _DEBUG
#define DEST               buff
#define DbgWrite( x )      {                                    \
                                char buff[256];                 \
                                wsprintf x;                     \
                                OutputDebugString( buff );      \
                           }
#define DEBUG_BREAK _asm int 3
#else
#define DEBUG_BREAK
#define DbgWrite( x )      /* nothing */
#endif


#define TOTAL_PORTS 10

//
//  Globals
//


//
// Event log routines
//

VOID ReportWFEvent(PTSTR string1,PTSTR string2,PTSTR string3,PTSTR string4,WORD eventType, WORD eventID);

//
//  Database routines
//

BOOL
InitializeDatabase(
    VOID
    );

BOOL
ValidateAddress(
    CHAR * pszIP,
    BOOL * pfValid
    );

BOOL
AddAddressToDb(
    CHAR * pszIP
    );

BOOL
LookupAddressInDb(
    IN CHAR * pszIP,
    OUT BOOL * pfFound
    );

VOID
TerminateDatabase(
    VOID
    );

//
//  Cache routines
//

BOOL
InitializeCache(
    VOID
    );

BOOL
LookupAddressInCache(
    CHAR * pszIP,
    BOOL * pfFound
    );

BOOL
ValidAddressLookup(
    CHAR * pszIP,
    BOOL * pfFound
    );

BOOL
AddValidAddress(
    CHAR * pszIP
    );

BOOL
AddAddressToCache(
    CHAR * pszIP
    );

VOID
TerminateCache(
    VOID
    );

//
// Proxy routines
//

BOOL SexAddress(
	IN OUT CHAR * pszIP
    );

#endif //_AUTHFILT_H_
