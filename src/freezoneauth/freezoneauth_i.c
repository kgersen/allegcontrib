

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Wed Jul 02 17:41:54 2003
 */
/* Compiler settings for .\freezoneauth.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#if !defined(_M_IA64) && !defined(_M_AMD64)


#pragma warning( disable: 4049 )  /* more than 64k source lines */


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_IFZAuth,0x77F8674B,0x7881,0x4B9C,0x8D,0x0F,0xD5,0x67,0x4D,0x73,0x7E,0x6C);


MIDL_DEFINE_GUID(IID, IID_ICFZATicket,0xBE3509B5,0x7071,0x450E,0xB4,0x6D,0xBA,0xDE,0x91,0xF8,0x05,0xDE);


MIDL_DEFINE_GUID(IID, LIBID_freezoneauthLib,0xC3CE6652,0xFCE4,0x4E76,0x9E,0x24,0xB2,0x24,0x85,0xEF,0x0E,0x30);


MIDL_DEFINE_GUID(CLSID, CLSID_FZAuth,0x616CEC65,0x3F9A,0x4BEB,0xA7,0x82,0x0C,0x5E,0xB5,0x5D,0xFB,0xED);


MIDL_DEFINE_GUID(CLSID, CLSID_CFZATicket,0xD80A91FA,0x14FF,0x49D0,0xAD,0x88,0x22,0x3D,0xF3,0xD9,0x28,0x41);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

