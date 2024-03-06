

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


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

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __freezoneauth_i_h__
#define __freezoneauth_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IFZAuth_FWD_DEFINED__
#define __IFZAuth_FWD_DEFINED__
typedef interface IFZAuth IFZAuth;
#endif 	/* __IFZAuth_FWD_DEFINED__ */


#ifndef __ICFZATicket_FWD_DEFINED__
#define __ICFZATicket_FWD_DEFINED__
typedef interface ICFZATicket ICFZATicket;
#endif 	/* __ICFZATicket_FWD_DEFINED__ */


#ifndef __FZAuth_FWD_DEFINED__
#define __FZAuth_FWD_DEFINED__

#ifdef __cplusplus
typedef class FZAuth FZAuth;
#else
typedef struct FZAuth FZAuth;
#endif /* __cplusplus */

#endif 	/* __FZAuth_FWD_DEFINED__ */


#ifndef __CFZATicket_FWD_DEFINED__
#define __CFZATicket_FWD_DEFINED__

#ifdef __cplusplus
typedef class CFZATicket CFZATicket;
#else
typedef struct CFZATicket CFZATicket;
#endif /* __cplusplus */

#endif 	/* __CFZATicket_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __IFZAuth_INTERFACE_DEFINED__
#define __IFZAuth_INTERFACE_DEFINED__

/* interface IFZAuth */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IFZAuth;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("77F8674B-7881-4B9C-8D0F-D5674D737E6C")
    IFZAuth : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Meth1( 
            /* [in] */ CHAR *p1,
            /* [in] */ ULONG p2,
            /* [in] */ BYTE *p3,
            /* [in] */ ULONG p4,
            /* [in] */ CHAR *p5,
            /* [in] */ CHAR *p6) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Meth2( 
            /* [in] */ BSTR p1,
            /* [in] */ BSTR p2) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Meth3( 
            /* [in] */ CHAR *p1,
            /* [in] */ CHAR *p2,
            /* [in] */ CLSID *p3,
            /* [in] */ ULONG *p4,
            /* [in] */ ULONG *p5) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFZAuthVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFZAuth * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFZAuth * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFZAuth * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Meth1 )( 
            IFZAuth * This,
            /* [in] */ CHAR *p1,
            /* [in] */ ULONG p2,
            /* [in] */ BYTE *p3,
            /* [in] */ ULONG p4,
            /* [in] */ CHAR *p5,
            /* [in] */ CHAR *p6);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Meth2 )( 
            IFZAuth * This,
            /* [in] */ BSTR p1,
            /* [in] */ BSTR p2);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Meth3 )( 
            IFZAuth * This,
            /* [in] */ CHAR *p1,
            /* [in] */ CHAR *p2,
            /* [in] */ CLSID *p3,
            /* [in] */ ULONG *p4,
            /* [in] */ ULONG *p5);
        
        END_INTERFACE
    } IFZAuthVtbl;

    interface IFZAuth
    {
        CONST_VTBL struct IFZAuthVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFZAuth_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IFZAuth_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IFZAuth_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IFZAuth_Meth1(This,p1,p2,p3,p4,p5,p6)	\
    (This)->lpVtbl -> Meth1(This,p1,p2,p3,p4,p5,p6)

#define IFZAuth_Meth2(This,p1,p2)	\
    (This)->lpVtbl -> Meth2(This,p1,p2)

#define IFZAuth_Meth3(This,p1,p2,p3,p4,p5)	\
    (This)->lpVtbl -> Meth3(This,p1,p2,p3,p4,p5)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IFZAuth_Meth1_Proxy( 
    IFZAuth * This,
    /* [in] */ CHAR *p1,
    /* [in] */ ULONG p2,
    /* [in] */ BYTE *p3,
    /* [in] */ ULONG p4,
    /* [in] */ CHAR *p5,
    /* [in] */ CHAR *p6);


void __RPC_STUB IFZAuth_Meth1_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IFZAuth_Meth2_Proxy( 
    IFZAuth * This,
    /* [in] */ BSTR p1,
    /* [in] */ BSTR p2);


void __RPC_STUB IFZAuth_Meth2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IFZAuth_Meth3_Proxy( 
    IFZAuth * This,
    /* [in] */ CHAR *p1,
    /* [in] */ CHAR *p2,
    /* [in] */ CLSID *p3,
    /* [in] */ ULONG *p4,
    /* [in] */ ULONG *p5);


void __RPC_STUB IFZAuth_Meth3_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IFZAuth_INTERFACE_DEFINED__ */


#ifndef __ICFZATicket_INTERFACE_DEFINED__
#define __ICFZATicket_INTERFACE_DEFINED__

/* interface ICFZATicket */
/* [unique][helpstring][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_ICFZATicket;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BE3509B5-7071-450E-B46D-BADE91F805DE")
    ICFZATicket : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Meth1( 
            /* [in] */ CHAR *p1,
            /* [in] */ BYTE *p2) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICFZATicketVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICFZATicket * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICFZATicket * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICFZATicket * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Meth1 )( 
            ICFZATicket * This,
            /* [in] */ CHAR *p1,
            /* [in] */ BYTE *p2);
        
        END_INTERFACE
    } ICFZATicketVtbl;

    interface ICFZATicket
    {
        CONST_VTBL struct ICFZATicketVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICFZATicket_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ICFZATicket_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ICFZATicket_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ICFZATicket_Meth1(This,p1,p2)	\
    (This)->lpVtbl -> Meth1(This,p1,p2)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ICFZATicket_Meth1_Proxy( 
    ICFZATicket * This,
    /* [in] */ CHAR *p1,
    /* [in] */ BYTE *p2);


void __RPC_STUB ICFZATicket_Meth1_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ICFZATicket_INTERFACE_DEFINED__ */



#ifndef __freezoneauthLib_LIBRARY_DEFINED__
#define __freezoneauthLib_LIBRARY_DEFINED__

/* library freezoneauthLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_freezoneauthLib;

EXTERN_C const CLSID CLSID_FZAuth;

#ifdef __cplusplus

class DECLSPEC_UUID("616CEC65-3F9A-4BEB-A782-0C5EB55DFBED")
FZAuth;
#endif

EXTERN_C const CLSID CLSID_CFZATicket;

#ifdef __cplusplus

class DECLSPEC_UUID("D80A91FA-14FF-49D0-AD88-223DF3D92841")
CFZATicket;
#endif
#endif /* __freezoneauthLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


