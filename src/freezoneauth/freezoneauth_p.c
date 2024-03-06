

/* this ALWAYS GENERATED file contains the proxy stub code */


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
#if _MSC_VER >= 1200
#pragma warning(push)
#endif
#pragma warning( disable: 4100 ) /* unreferenced arguments in x86 call */
#pragma warning( disable: 4211 )  /* redefine extent to static */
#pragma warning( disable: 4232 )  /* dllimport identity*/
#define USE_STUBLESS_PROXY


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 475
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "freezoneauth_i.h"

#define TYPE_FORMAT_STRING_SIZE   73                                
#define PROC_FORMAT_STRING_SIZE   211                               
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   1            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


static RPC_SYNTAX_IDENTIFIER  _RpcTransferSyntax = 
{{0x8A885D04,0x1CEB,0x11C9,{0x9F,0xE8,0x08,0x00,0x2B,0x10,0x48,0x60}},{2,0}};


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IFZAuth_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO IFZAuth_ProxyInfo;


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO ICFZATicket_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO ICFZATicket_ProxyInfo;


extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ];

#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

#if !(TARGET_IS_NT50_OR_LATER)
#error You need a Windows 2000 or later to run this stub because it uses these features:
#error   /robust command line switch.
#error However, your C/C++ compilation flags indicate you intend to run this app on earlier systems.
#error This app will die there with the RPC_X_WRONG_STUB_VERSION error.
#endif


static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {

	/* Procedure Meth1 */

			0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/*  2 */	NdrFcLong( 0x0 ),	/* 0 */
/*  6 */	NdrFcShort( 0x3 ),	/* 3 */
/*  8 */	NdrFcShort( 0x20 ),	/* x86 Stack size/offset = 32 */
/* 10 */	NdrFcShort( 0x74 ),	/* 116 */
/* 12 */	NdrFcShort( 0x8 ),	/* 8 */
/* 14 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x7,		/* 7 */
/* 16 */	0x8,		/* 8 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 18 */	NdrFcShort( 0x0 ),	/* 0 */
/* 20 */	NdrFcShort( 0x0 ),	/* 0 */
/* 22 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p1 */

/* 24 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 26 */	NdrFcShort( 0x4 ),	/* x86 Stack size/offset = 4 */
/* 28 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Parameter p2 */

/* 30 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 32 */	NdrFcShort( 0x8 ),	/* x86 Stack size/offset = 8 */
/* 34 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p3 */

/* 36 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 38 */	NdrFcShort( 0xc ),	/* x86 Stack size/offset = 12 */
/* 40 */	0x1,		/* FC_BYTE */
			0x0,		/* 0 */

	/* Parameter p4 */

/* 42 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 44 */	NdrFcShort( 0x10 ),	/* x86 Stack size/offset = 16 */
/* 46 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p5 */

/* 48 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 50 */	NdrFcShort( 0x14 ),	/* x86 Stack size/offset = 20 */
/* 52 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Parameter p6 */

/* 54 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 56 */	NdrFcShort( 0x18 ),	/* x86 Stack size/offset = 24 */
/* 58 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Return value */

/* 60 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 62 */	NdrFcShort( 0x1c ),	/* x86 Stack size/offset = 28 */
/* 64 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure Meth2 */

/* 66 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 68 */	NdrFcLong( 0x0 ),	/* 0 */
/* 72 */	NdrFcShort( 0x4 ),	/* 4 */
/* 74 */	NdrFcShort( 0x10 ),	/* x86 Stack size/offset = 16 */
/* 76 */	NdrFcShort( 0x0 ),	/* 0 */
/* 78 */	NdrFcShort( 0x8 ),	/* 8 */
/* 80 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 82 */	0x8,		/* 8 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 84 */	NdrFcShort( 0x0 ),	/* 0 */
/* 86 */	NdrFcShort( 0x2 ),	/* 2 */
/* 88 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p1 */

/* 90 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 92 */	NdrFcShort( 0x4 ),	/* x86 Stack size/offset = 4 */
/* 94 */	NdrFcShort( 0x24 ),	/* Type Offset=36 */

	/* Parameter p2 */

/* 96 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 98 */	NdrFcShort( 0x8 ),	/* x86 Stack size/offset = 8 */
/* 100 */	NdrFcShort( 0x24 ),	/* Type Offset=36 */

	/* Return value */

/* 102 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 104 */	NdrFcShort( 0xc ),	/* x86 Stack size/offset = 12 */
/* 106 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure Meth3 */

/* 108 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 110 */	NdrFcLong( 0x0 ),	/* 0 */
/* 114 */	NdrFcShort( 0x5 ),	/* 5 */
/* 116 */	NdrFcShort( 0x1c ),	/* x86 Stack size/offset = 28 */
/* 118 */	NdrFcShort( 0xae ),	/* 174 */
/* 120 */	NdrFcShort( 0x8 ),	/* 8 */
/* 122 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x6,		/* 6 */
/* 124 */	0x8,		/* 8 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 126 */	NdrFcShort( 0x0 ),	/* 0 */
/* 128 */	NdrFcShort( 0x0 ),	/* 0 */
/* 130 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p1 */

/* 132 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 134 */	NdrFcShort( 0x4 ),	/* x86 Stack size/offset = 4 */
/* 136 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Parameter p2 */

/* 138 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 140 */	NdrFcShort( 0x8 ),	/* x86 Stack size/offset = 8 */
/* 142 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Parameter p3 */

/* 144 */	NdrFcShort( 0x10a ),	/* Flags:  must free, in, simple ref, */
/* 146 */	NdrFcShort( 0xc ),	/* x86 Stack size/offset = 12 */
/* 148 */	NdrFcShort( 0x38 ),	/* Type Offset=56 */

	/* Parameter p4 */

/* 150 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 152 */	NdrFcShort( 0x10 ),	/* x86 Stack size/offset = 16 */
/* 154 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p5 */

/* 156 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 158 */	NdrFcShort( 0x14 ),	/* x86 Stack size/offset = 20 */
/* 160 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Return value */

/* 162 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 164 */	NdrFcShort( 0x18 ),	/* x86 Stack size/offset = 24 */
/* 166 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure Meth1 */

/* 168 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 170 */	NdrFcLong( 0x0 ),	/* 0 */
/* 174 */	NdrFcShort( 0x3 ),	/* 3 */
/* 176 */	NdrFcShort( 0x10 ),	/* x86 Stack size/offset = 16 */
/* 178 */	NdrFcShort( 0x32 ),	/* 50 */
/* 180 */	NdrFcShort( 0x8 ),	/* 8 */
/* 182 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x3,		/* 3 */
/* 184 */	0x8,		/* 8 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 186 */	NdrFcShort( 0x0 ),	/* 0 */
/* 188 */	NdrFcShort( 0x0 ),	/* 0 */
/* 190 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p1 */

/* 192 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 194 */	NdrFcShort( 0x4 ),	/* x86 Stack size/offset = 4 */
/* 196 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Parameter p2 */

/* 198 */	NdrFcShort( 0x148 ),	/* Flags:  in, base type, simple ref, */
/* 200 */	NdrFcShort( 0x8 ),	/* x86 Stack size/offset = 8 */
/* 202 */	0x1,		/* FC_BYTE */
			0x0,		/* 0 */

	/* Return value */

/* 204 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 206 */	NdrFcShort( 0xc ),	/* x86 Stack size/offset = 12 */
/* 208 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x11, 0x8,	/* FC_RP [simple_pointer] */
/*  4 */	0x2,		/* FC_CHAR */
			0x5c,		/* FC_PAD */
/*  6 */	
			0x11, 0x8,	/* FC_RP [simple_pointer] */
/*  8 */	0x1,		/* FC_BYTE */
			0x5c,		/* FC_PAD */
/* 10 */	
			0x12, 0x0,	/* FC_UP */
/* 12 */	NdrFcShort( 0xe ),	/* Offset= 14 (26) */
/* 14 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 16 */	NdrFcShort( 0x2 ),	/* 2 */
/* 18 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 20 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 22 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 24 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 26 */	
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 28 */	NdrFcShort( 0x8 ),	/* 8 */
/* 30 */	NdrFcShort( 0xfff0 ),	/* Offset= -16 (14) */
/* 32 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 34 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 36 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 38 */	NdrFcShort( 0x0 ),	/* 0 */
/* 40 */	NdrFcShort( 0x4 ),	/* 4 */
/* 42 */	NdrFcShort( 0x0 ),	/* 0 */
/* 44 */	NdrFcShort( 0xffde ),	/* Offset= -34 (10) */
/* 46 */	
			0x11, 0x0,	/* FC_RP */
/* 48 */	NdrFcShort( 0x8 ),	/* Offset= 8 (56) */
/* 50 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/* 52 */	NdrFcShort( 0x8 ),	/* 8 */
/* 54 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 56 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 58 */	NdrFcShort( 0x10 ),	/* 16 */
/* 60 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 62 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 64 */	0x0,		/* 0 */
			NdrFcShort( 0xfff1 ),	/* Offset= -15 (50) */
			0x5b,		/* FC_END */
/* 68 */	
			0x11, 0x8,	/* FC_RP [simple_pointer] */
/* 70 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */

			0x0
        }
    };

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ] = 
        {
            
            {
            BSTR_UserSize
            ,BSTR_UserMarshal
            ,BSTR_UserUnmarshal
            ,BSTR_UserFree
            }

        };



/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IFZAuth, ver. 0.0,
   GUID={0x77F8674B,0x7881,0x4B9C,{0x8D,0x0F,0xD5,0x67,0x4D,0x73,0x7E,0x6C}} */

#pragma code_seg(".orpc")
static const unsigned short IFZAuth_FormatStringOffsetTable[] =
    {
    0,
    66,
    108
    };

static const MIDL_STUBLESS_PROXY_INFO IFZAuth_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &IFZAuth_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO IFZAuth_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &IFZAuth_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
CINTERFACE_PROXY_VTABLE(6) _IFZAuthProxyVtbl = 
{
    &IFZAuth_ProxyInfo,
    &IID_IFZAuth,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *) (INT_PTR) -1 /* IFZAuth::Meth1 */ ,
    (void *) (INT_PTR) -1 /* IFZAuth::Meth2 */ ,
    (void *) (INT_PTR) -1 /* IFZAuth::Meth3 */
};

const CInterfaceStubVtbl _IFZAuthStubVtbl =
{
    &IID_IFZAuth,
    &IFZAuth_ServerInfo,
    6,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};


/* Object interface: ICFZATicket, ver. 0.0,
   GUID={0xBE3509B5,0x7071,0x450E,{0xB4,0x6D,0xBA,0xDE,0x91,0xF8,0x05,0xDE}} */

#pragma code_seg(".orpc")
static const unsigned short ICFZATicket_FormatStringOffsetTable[] =
    {
    168
    };

static const MIDL_STUBLESS_PROXY_INFO ICFZATicket_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &ICFZATicket_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO ICFZATicket_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &ICFZATicket_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
CINTERFACE_PROXY_VTABLE(4) _ICFZATicketProxyVtbl = 
{
    &ICFZATicket_ProxyInfo,
    &IID_ICFZATicket,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *) (INT_PTR) -1 /* ICFZATicket::Meth1 */
};

const CInterfaceStubVtbl _ICFZATicketStubVtbl =
{
    &IID_ICFZATicket,
    &ICFZATicket_ServerInfo,
    4,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
};

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x50002, /* Ndr library version */
    0,
    0x6000169, /* MIDL Version 6.0.361 */
    0,
    UserMarshalRoutines,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0, /* cs routines */
    0,   /* proxy/server info */
    0   /* Reserved5 */
    };

const CInterfaceProxyVtbl * _freezoneauth_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_IFZAuthProxyVtbl,
    ( CInterfaceProxyVtbl *) &_ICFZATicketProxyVtbl,
    0
};

const CInterfaceStubVtbl * _freezoneauth_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_IFZAuthStubVtbl,
    ( CInterfaceStubVtbl *) &_ICFZATicketStubVtbl,
    0
};

PCInterfaceName const _freezoneauth_InterfaceNamesList[] = 
{
    "IFZAuth",
    "ICFZATicket",
    0
};


#define _freezoneauth_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _freezoneauth, pIID, n)

int __stdcall _freezoneauth_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _freezoneauth, 2, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _freezoneauth, 2, *pIndex )
    
}

const ExtendedProxyFileInfo freezoneauth_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _freezoneauth_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _freezoneauth_StubVtblList,
    (const PCInterfaceName * ) & _freezoneauth_InterfaceNamesList,
    0, // no delegation
    & _freezoneauth_IID_Lookup, 
    2,
    2,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};
#if _MSC_VER >= 1200
#pragma warning(pop)
#endif


#endif /* !defined(_M_IA64) && !defined(_M_AMD64)*/

