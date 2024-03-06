

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0361 */
/* at Mon Jun 30 17:03:04 2003
 */
/* Compiler settings for .\zzauth.idl:
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

#ifndef __zzauth_i_h__
#define __zzauth_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __Icomauth_FWD_DEFINED__
#define __Icomauth_FWD_DEFINED__
typedef interface Icomauth Icomauth;
#endif 	/* __Icomauth_FWD_DEFINED__ */


#ifndef __comauth_FWD_DEFINED__
#define __comauth_FWD_DEFINED__

#ifdef __cplusplus
typedef class comauth comauth;
#else
typedef struct comauth comauth;
#endif /* __cplusplus */

#endif 	/* __comauth_FWD_DEFINED__ */


/* header files for imported files */
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __Icomauth_INTERFACE_DEFINED__
#define __Icomauth_INTERFACE_DEFINED__

/* interface Icomauth */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_Icomauth;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("42BA50D6-3424-11D3-BA6C-00C04F8EF92F")
    Icomauth : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE testmeth( 
            /* [out][in] */ BSTR *p1test,
            /* [out][in] */ BSTR *p2test) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE meth2( 
            /* [in] */ BSTR *p1,
            /* [in] */ BSTR *p2) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE meth3( 
            /* [in] */ BSTR *p1,
            /* [in] */ BSTR *p2,
            /* [in] */ BSTR *p3,
            /* [in] */ BSTR *p4) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_prop1( 
            /* [in] */ BSTR param1,
            /* [retval][out] */ BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_prop1( 
            /* [in] */ BSTR param1,
            /* [in] */ BSTR newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IcomauthVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            Icomauth * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            Icomauth * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            Icomauth * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *testmeth )( 
            Icomauth * This,
            /* [out][in] */ BSTR *p1test,
            /* [out][in] */ BSTR *p2test);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *meth2 )( 
            Icomauth * This,
            /* [in] */ BSTR *p1,
            /* [in] */ BSTR *p2);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *meth3 )( 
            Icomauth * This,
            /* [in] */ BSTR *p1,
            /* [in] */ BSTR *p2,
            /* [in] */ BSTR *p3,
            /* [in] */ BSTR *p4);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_prop1 )( 
            Icomauth * This,
            /* [in] */ BSTR param1,
            /* [retval][out] */ BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_prop1 )( 
            Icomauth * This,
            /* [in] */ BSTR param1,
            /* [in] */ BSTR newVal);
        
        END_INTERFACE
    } IcomauthVtbl;

    interface Icomauth
    {
        CONST_VTBL struct IcomauthVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define Icomauth_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define Icomauth_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define Icomauth_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define Icomauth_testmeth(This,p1test,p2test)	\
    (This)->lpVtbl -> testmeth(This,p1test,p2test)

#define Icomauth_meth2(This,p1,p2)	\
    (This)->lpVtbl -> meth2(This,p1,p2)

#define Icomauth_meth3(This,p1,p2,p3,p4)	\
    (This)->lpVtbl -> meth3(This,p1,p2,p3,p4)

#define Icomauth_get_prop1(This,param1,pVal)	\
    (This)->lpVtbl -> get_prop1(This,param1,pVal)

#define Icomauth_put_prop1(This,param1,newVal)	\
    (This)->lpVtbl -> put_prop1(This,param1,newVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Icomauth_testmeth_Proxy( 
    Icomauth * This,
    /* [out][in] */ BSTR *p1test,
    /* [out][in] */ BSTR *p2test);


void __RPC_STUB Icomauth_testmeth_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Icomauth_meth2_Proxy( 
    Icomauth * This,
    /* [in] */ BSTR *p1,
    /* [in] */ BSTR *p2);


void __RPC_STUB Icomauth_meth2_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Icomauth_meth3_Proxy( 
    Icomauth * This,
    /* [in] */ BSTR *p1,
    /* [in] */ BSTR *p2,
    /* [in] */ BSTR *p3,
    /* [in] */ BSTR *p4);


void __RPC_STUB Icomauth_meth3_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE Icomauth_get_prop1_Proxy( 
    Icomauth * This,
    /* [in] */ BSTR param1,
    /* [retval][out] */ BSTR *pVal);


void __RPC_STUB Icomauth_get_prop1_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE Icomauth_put_prop1_Proxy( 
    Icomauth * This,
    /* [in] */ BSTR param1,
    /* [in] */ BSTR newVal);


void __RPC_STUB Icomauth_put_prop1_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __Icomauth_INTERFACE_DEFINED__ */



#ifndef __zzauth_LIBRARY_DEFINED__
#define __zzauth_LIBRARY_DEFINED__

/* library zzauth */
/* [version][uuid] */ 


EXTERN_C const IID LIBID_zzauth;

EXTERN_C const CLSID CLSID_comauth;

#ifdef __cplusplus

class DECLSPEC_UUID("42BA50D5-3424-11D3-BA6C-00C04F8EF92F")
comauth;
#endif
#endif /* __zzauth_LIBRARY_DEFINED__ */

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


