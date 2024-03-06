
//  Microsoft (R) .NET Framework IL Disassembler.  Version 1.1.4322.573
//  Copyright (C) Microsoft Corporation 1998-2002. All rights reserved.

.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 1:0:5000:0
}
.assembly extern Interop.AGCLib
{
  .ver 1:0:0:0
}
.assembly Interop.ALLEGIANCESERVERLib
{
  .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 62 62 35 66 63 34 31 63 2D 64 64 61 34   // ..$bb5fc41c-dda4
                                                                                                  2D 31 31 64 32 2D 38 62 34 36 2D 30 30 63 30 34   // -11d2-8b46-00c04
                                                                                                  66 36 38 31 36 33 33 00 00 )                      // f681633..
  .custom instance void [mscorlib]System.Runtime.InteropServices.ImportedFromTypeLibAttribute::.ctor(string) = ( 01 00 13 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                                 56 45 52 4C 69 62 00 00 )                         // VERLib..
  .hash algorithm 0x00008004
  .ver 1:0:0:0
}
.module ALLEGIANCESERVERLib.dll
// MVID: {0FD30F74-84E6-4F62-959C-2F59EA440FB1}
.imagebase 0x00400000
.subsystem 0x00000003
.file alignment 4096
.corflags 0x00000001
// Image base: 0x00c80000
//
// ============== CLASS STRUCTURE DECLARATION ==================
//
.namespace ALLEGIANCESERVERLib
{
  .class public auto ansi import AdminInterfacesClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib.AdminInterfaces,
                    ALLEGIANCESERVERLib.IAdminSessionEvents,
                    ALLEGIANCESERVERLib._IAdminSessionEvents,
                    ALLEGIANCESERVERLib.IAdminSessionClass,
                    ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.IAdminShip,
                    ALLEGIANCESERVERLib.IAdminGame,
                    ALLEGIANCESERVERLib.IAdminGames,
                    ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.IAdminUser,
                    ALLEGIANCESERVERLib.IAdminUsers
  {
  } // end of class AdminInterfacesClass

  .class interface public abstract auto ansi import AdminInterfaces
         implements ALLEGIANCESERVERLib.IAdminSession
  {
  } // end of class AdminInterfaces

  .class interface public abstract auto ansi import IAdminSession
  {
  } // end of class IAdminSession

  .class interface public abstract auto ansi import IAdminServer
  {
  } // end of class IAdminServer

  .class interface public abstract auto ansi import IAdminGames
         implements [Interop.AGCLib]AGCLib.IAGCCollection
  {
  } // end of class IAdminGames

  .class interface public abstract auto ansi import IAdminGame
         implements [Interop.AGCLib]AGCLib.IAGCGame
  {
  } // end of class IAdminGame

  .class interface public abstract auto ansi import IAdminUsers
         implements [Interop.AGCLib]AGCLib.ITCCollection
  {
  } // end of class IAdminUsers

  .class interface public abstract auto ansi import IAdminUser
  {
  } // end of class IAdminUser

  .class interface public abstract auto ansi import IAdminShip
         implements [Interop.AGCLib]AGCLib.IAGCShip
  {
  } // end of class IAdminShip

  .class interface public abstract auto ansi import IAdminSessionEvents
  {
  } // end of class IAdminSessionEvents

  .class interface public abstract auto ansi import _IAdminSessionEvents
  {
  } // end of class _IAdminSessionEvents

  .class interface public abstract auto ansi import IAdminSessionClass
  {
  } // end of class IAdminSessionClass

  .class interface public abstract auto ansi import IAdminSessionHost
  {
  } // end of class IAdminSessionHost

  .class public auto ansi import AdminSessionClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib.AdminSession,
                    ALLEGIANCESERVERLib._IAdminSessionEvents_Event,
                    ALLEGIANCESERVERLib.IAdminSessionEvents_Event
  {
  } // end of class AdminSessionClass

  .class interface public abstract auto ansi _IAdminSessionEvents_Event
  {
  } // end of class _IAdminSessionEvents_Event

  .class public auto ansi sealed _IAdminSessionEvents_OnEventEventHandler
         extends [mscorlib]System.MulticastDelegate
  {
  } // end of class _IAdminSessionEvents_OnEventEventHandler

  .class interface public abstract auto ansi IAdminSessionEvents_Event
  {
  } // end of class IAdminSessionEvents_Event

  .class public auto ansi sealed IAdminSessionEvents_OnEventEventHandler
         extends [mscorlib]System.MulticastDelegate
  {
  } // end of class IAdminSessionEvents_OnEventEventHandler

  .class interface public abstract auto ansi import AdminSession
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib._IAdminSessionEvents_Event
  {
  } // end of class AdminSession

  .class public auto ansi import AdminShipClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminShip,
                    ALLEGIANCESERVERLib.AdminShip
  {
  } // end of class AdminShipClass

  .class interface public abstract auto ansi import AdminShip
         implements ALLEGIANCESERVERLib.IAdminShip
  {
  } // end of class AdminShip

  .class public auto ansi import AdminGameClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminGame,
                    ALLEGIANCESERVERLib.AdminGame
  {
  } // end of class AdminGameClass

  .class interface public abstract auto ansi import AdminGame
         implements ALLEGIANCESERVERLib.IAdminGame
  {
  } // end of class AdminGame

  .class public auto ansi import AdminGamesClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminGames,
                    ALLEGIANCESERVERLib.AdminGames
  {
  } // end of class AdminGamesClass

  .class interface public abstract auto ansi import AdminGames
         implements ALLEGIANCESERVERLib.IAdminGames
  {
  } // end of class AdminGames

  .class public auto ansi import AdminServerClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.AdminServer
  {
  } // end of class AdminServerClass

  .class interface public abstract auto ansi import AdminServer
         implements ALLEGIANCESERVERLib.IAdminServer
  {
  } // end of class AdminServer

  .class public auto ansi import AdminUserClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminUser,
                    ALLEGIANCESERVERLib.AdminUser
  {
  } // end of class AdminUserClass

  .class interface public abstract auto ansi import AdminUser
         implements ALLEGIANCESERVERLib.IAdminUser
  {
  } // end of class AdminUser

  .class public auto ansi import AdminUsersClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminUsers,
                    ALLEGIANCESERVERLib.AdminUsers
  {
  } // end of class AdminUsersClass

  .class interface public abstract auto ansi import AdminUsers
         implements ALLEGIANCESERVERLib.IAdminUsers
  {
  } // end of class AdminUsers

  .class public auto ansi sealed _IAdminSessionEvents_SinkHelper
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib._IAdminSessionEvents
  {
  } // end of class _IAdminSessionEvents_SinkHelper

  .class private auto ansi sealed _IAdminSessionEvents_EventProvider
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib._IAdminSessionEvents_Event,
                    [mscorlib]System.IDisposable
  {
  } // end of class _IAdminSessionEvents_EventProvider

  .class public auto ansi sealed IAdminSessionEvents_SinkHelper
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSessionEvents
  {
  } // end of class IAdminSessionEvents_SinkHelper

  .class private auto ansi sealed IAdminSessionEvents_EventProvider
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSessionEvents_Event,
                    [mscorlib]System.IDisposable
  {
  } // end of class IAdminSessionEvents_EventProvider

} // end of namespace ALLEGIANCESERVERLib


// =============================================================


// =============== GLOBAL FIELDS AND METHODS ===================


// =============================================================


// =============== CLASS MEMBERS DECLARATION ===================
//   note that class flags, 'extends' and 'implements' clauses
//          are provided here for information only

.namespace ALLEGIANCESERVERLib
{
  .class public auto ansi import AdminInterfacesClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib.AdminInterfaces,
                    ALLEGIANCESERVERLib.IAdminSessionEvents,
                    ALLEGIANCESERVERLib._IAdminSessionEvents,
                    ALLEGIANCESERVERLib.IAdminSessionClass,
                    ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.IAdminShip,
                    ALLEGIANCESERVERLib.IAdminGame,
                    ALLEGIANCESERVERLib.IAdminGames,
                    ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.IAdminUser,
                    ALLEGIANCESERVERLib.IAdminUsers
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 10 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 41 31 45 33 46 37 46 2D 37 41 32 31   // ..$8A1E3F7F-7A21
                                                                                                    2D 34 46 42 46 2D 39 42 33 39 2D 44 30 32 43 44   // -4FBF-9B39-D02CD
                                                                                                    42 30 44 35 34 30 32 00 00 )                      // B0D5402..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminInterfacesClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance void  set_SessionInfo([in] class [Interop.AGCLib]AGCLib.ITCSessionInfo  marshal( interface) ppSessionInfo) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .override ALLEGIANCESERVERLib.IAdminSession::set_SessionInfo
    } // end of method AdminInterfacesClass::set_SessionInfo

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfo 
            marshal( interface) 
            get_SessionInfo() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_SessionInfo
    } // end of method AdminInterfacesClass::get_SessionInfo

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfos 
            marshal( interface) 
            get_SessionInfos() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_SessionInfos
    } // end of method AdminInterfacesClass::get_SessionInfos

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminServer 
            marshal( interface) 
            get_Server() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_Server
    } // end of method AdminInterfacesClass::get_Server

    .method public hidebysig newslot virtual 
            instance void  ActivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                          [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6A 10 00 00 00 00 )                         // ..j.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::ActivateEvents
    } // end of method AdminInterfacesClass::ActivateEvents

    .method public hidebysig newslot virtual 
            instance void  DeactivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                            [in][opt] int32 uniqueObjectID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 10 00 00 00 00 )                         // ..k.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::DeactivateEvents
    } // end of method AdminInterfacesClass::DeactivateEvents

    .method public hidebysig newslot specialname virtual 
            instance int32  get_IsEventActivated([in] valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                                 [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::get_IsEventActivated
    } // end of method AdminInterfacesClass::get_IsEventActivated

    .method public hidebysig newslot virtual 
            instance void  ActivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 10 00 00 00 00 )                         // ..n.....
      .override ALLEGIANCESERVERLib.IAdminSession::ActivateAllEvents
    } // end of method AdminInterfacesClass::ActivateAllEvents

    .method public hidebysig newslot virtual 
            instance void  DeactivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6F 10 00 00 00 00 )                         // ..o.....
      .override ALLEGIANCESERVERLib.IAdminSession::DeactivateAllEvents
    } // end of method AdminInterfacesClass::DeactivateAllEvents

    .method public hidebysig newslot specialname virtual 
            instance int32  get_ProcessID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_ProcessID
    } // end of method AdminInterfacesClass::get_ProcessID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo 
            marshal( interface) 
            get_Version() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_Version
    } // end of method AdminInterfacesClass::get_Version

    .method public hidebysig newslot virtual 
            instance void  Stop() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 75 10 00 00 00 00 )                         // ..u.....
      .override ALLEGIANCESERVERLib.IAdminSession::Stop
    } // end of method AdminInterfacesClass::Stop

    .method public hidebysig newslot virtual 
            instance void  Pause() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 76 10 00 00 00 00 )                         // ..v.....
      .override ALLEGIANCESERVERLib.IAdminSession::Pause
    } // end of method AdminInterfacesClass::Pause

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminSession 
            marshal( interface) 
            get_WhoStartedServer() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_WhoStartedServer
    } // end of method AdminInterfacesClass::get_WhoStartedServer

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEventLogger 
            marshal( interface) 
            get_EventLog() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_EventLog
    } // end of method AdminInterfacesClass::get_EventLog

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PerfCounters() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminSession::get_PerfCounters
    } // end of method AdminInterfacesClass::get_PerfCounters

    .method public hidebysig newslot virtual 
            instance void  SendAdminChat([in] string  marshal( bstr) bstrText,
                                         [in] int32 nUserID,
                                         [in] valuetype [mscorlib]System.DateTime dateOriginal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 10 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminSession::SendAdminChat
    } // end of method AdminInterfacesClass::SendAdminChat

    .method public hidebysig newslot virtual 
            instance void  Continue() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 11 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminSession::Continue
    } // end of method AdminInterfacesClass::Continue

    .method public hidebysig newslot virtual 
            instance void  OnEvent([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminSessionEvents::OnEvent
    } // end of method AdminInterfacesClass::OnEvent

    .method public hidebysig newslot virtual 
            instance void  _IAdminSessionEvents_OnEvent([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed preservesig internalcall
    {
      .override ALLEGIANCESERVERLib._IAdminSessionEvents::OnEvent
    } // end of method AdminInterfacesClass::_IAdminSessionEvents_OnEvent

    .method public hidebysig newslot virtual 
            instance class ALLEGIANCESERVERLib.IAdminSession 
            marshal( interface) 
            CreateSession([in] class ALLEGIANCESERVERLib.IAdminSessionHost  marshal( interface) pHost) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminSessionClass::CreateSession
    } // end of method AdminInterfacesClass::CreateSession

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminGames 
            marshal( interface) 
            get_Games() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_Games
    } // end of method AdminInterfacesClass::get_Games

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PlayerCount() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayerCount
    } // end of method AdminInterfacesClass::get_PlayerCount

    .method public hidebysig newslot specialname virtual 
            instance int32  get_MissionCount() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_MissionCount
    } // end of method AdminInterfacesClass::get_MissionCount

    .method public hidebysig newslot virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::SendMsg
    } // end of method AdminInterfacesClass::SendMsg

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            get_Users() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_Users
    } // end of method AdminInterfacesClass::get_Users

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_LookupUser([in] int32 id) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminServer::get_LookupUser
    } // end of method AdminInterfacesClass::get_LookupUser

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_FindUser([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_FindUser
    } // end of method AdminInterfacesClass::get_FindUser

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_MachineName() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_MachineName
    } // end of method AdminInterfacesClass::get_MachineName

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PacketsIn() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PacketsIn
    } // end of method AdminInterfacesClass::get_PacketsIn

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PlayersOnline() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayersOnline
    } // end of method AdminInterfacesClass::get_PlayersOnline

    .method public hidebysig newslot specialname virtual 
            instance int32  get_TimeInnerLoop() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_TimeInnerLoop
    } // end of method AdminInterfacesClass::get_TimeInnerLoop

    .method public hidebysig newslot specialname virtual 
            instance void  set_LobbyServer([in] string  marshal( bstr) pbstrLobbyServer) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::set_LobbyServer
    } // end of method AdminInterfacesClass::set_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_LobbyServer() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_LobbyServer
    } // end of method AdminInterfacesClass::get_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance void  set_PublicLobby([in] bool pbPublic) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::set_PublicLobby
    } // end of method AdminInterfacesClass::set_PublicLobby

    .method public hidebysig newslot specialname virtual 
            instance bool  get_PublicLobby() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PublicLobby
    } // end of method AdminInterfacesClass::get_PublicLobby

    .method public hidebysig newslot virtual 
            instance void  CreateDefaultGames() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::CreateDefaultGames
    } // end of method AdminInterfacesClass::CreateDefaultGames

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Type
    } // end of method AdminInterfacesClass::get_Type

    .method public hidebysig newslot specialname virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType 
            get_ObjectType() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_ObjectType
    } // end of method AdminInterfacesClass::get_ObjectType

    .method public hidebysig newslot specialname virtual 
            instance int16  get_ObjectID() runtime managed internalcall
    {
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .override ALLEGIANCESERVERLib.IAdminShip::get_ObjectID
    } // end of method AdminInterfacesClass::get_ObjectID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGame 
            marshal( interface) 
            get_Game() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Game
    } // end of method AdminInterfacesClass::get_Game

    .method public hidebysig newslot specialname virtual 
            instance int32  get_UniqueID() runtime managed internalcall
    {
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminShip::get_UniqueID
    } // end of method AdminInterfacesClass::get_UniqueID

    .method public hidebysig newslot specialname virtual 
            instance bool  get_IsVisible() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_IsVisible
    } // end of method AdminInterfacesClass::get_IsVisible

    .method public hidebysig newslot specialname virtual 
            instance bool  get_IsSeenBySide([in] class [Interop.AGCLib]AGCLib.IAGCTeam  marshal( interface) pTeam) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_IsSeenBySide
    } // end of method AdminInterfacesClass::get_IsSeenBySide

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Position() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Position
    } // end of method AdminInterfacesClass::get_Position

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Velocity() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Velocity
    } // end of method AdminInterfacesClass::get_Velocity

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCOrientation 
            marshal( interface) 
            get_Orientation() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Orientation
    } // end of method AdminInterfacesClass::get_Orientation

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Radius() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Radius
    } // end of method AdminInterfacesClass::get_Radius

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_Team() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Team
    } // end of method AdminInterfacesClass::get_Team

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Mass() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Mass
    } // end of method AdminInterfacesClass::get_Mass

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSector 
            marshal( interface) 
            get_Sector() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Sector
    } // end of method AdminInterfacesClass::get_Sector

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Signature() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Signature
    } // end of method AdminInterfacesClass::get_Signature

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Name
    } // end of method AdminInterfacesClass::get_Name

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Fraction() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Fraction
    } // end of method AdminInterfacesClass::get_Fraction

    .method public hidebysig newslot specialname virtual 
            instance bool  get_InScannerRange([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_InScannerRange
    } // end of method AdminInterfacesClass::get_InScannerRange

    .method public hidebysig newslot specialname virtual 
            instance bool  get_CanSee([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_CanSee
    } // end of method AdminInterfacesClass::get_CanSee

    .method public hidebysig newslot specialname virtual 
            instance void  set_Ammo([in] int16 pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_Ammo
    } // end of method AdminInterfacesClass::set_Ammo

    .method public hidebysig newslot specialname virtual 
            instance int16  get_Ammo() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Ammo
    } // end of method AdminInterfacesClass::get_Ammo

    .method public hidebysig newslot specialname virtual 
            instance void  set_Fuel([in] float32 pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_Fuel
    } // end of method AdminInterfacesClass::set_Fuel

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Fuel() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Fuel
    } // end of method AdminInterfacesClass::get_Fuel

    .method public hidebysig newslot specialname virtual 
            instance void  set_Energy([in] float32 pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_Energy
    } // end of method AdminInterfacesClass::set_Energy

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Energy() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_Energy
    } // end of method AdminInterfacesClass::get_Energy

    .method public hidebysig newslot specialname virtual 
            instance void  set_WingID([in] int16 pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_WingID
    } // end of method AdminInterfacesClass::set_WingID

    .method public hidebysig newslot specialname virtual 
            instance int16  get_WingID() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_WingID
    } // end of method AdminInterfacesClass::get_WingID

    .method public hidebysig newslot virtual 
            instance void  SendChat([in] string  marshal( bstr) bstrText,
                                    [in][opt] int16 idSound) runtime managed internalcall
    {
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminShip::SendChat
    } // end of method AdminInterfacesClass::SendChat

    .method public hidebysig newslot virtual 
            instance void  SendCommand([in] string  marshal( bstr) bstrCommand,
                                       [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                       [in][opt] int16 idSound) runtime managed internalcall
    {
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminShip::SendCommand
    } // end of method AdminInterfacesClass::SendCommand

    .method public hidebysig newslot specialname virtual 
            instance void  set_AutoDonate([in] class [Interop.AGCLib]AGCLib.IAGCShip  marshal( interface) ppShip) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_AutoDonate
    } // end of method AdminInterfacesClass::set_AutoDonate

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_AutoDonate() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_AutoDonate
    } // end of method AdminInterfacesClass::get_AutoDonate

    .method public hidebysig newslot specialname virtual 
            instance void  set_ShieldFraction([in] float32 pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::set_ShieldFraction
    } // end of method AdminInterfacesClass::set_ShieldFraction

    .method public hidebysig newslot specialname virtual 
            instance float32  get_ShieldFraction() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_ShieldFraction
    } // end of method AdminInterfacesClass::get_ShieldFraction

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_HullType() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_HullType
    } // end of method AdminInterfacesClass::get_HullType

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_BaseHullType() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_BaseHullType
    } // end of method AdminInterfacesClass::get_BaseHullType

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_User() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminShip::get_User
    } // end of method AdminInterfacesClass::get_User

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminGame_get_Type() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Type
    } // end of method AdminInterfacesClass::IAdminGame_get_Type

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminGame_get_Name() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Name
    } // end of method AdminInterfacesClass::IAdminGame_get_Name

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSectors 
            marshal( interface) 
            get_Sectors() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Sectors
    } // end of method AdminInterfacesClass::get_Sectors

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeams 
            marshal( interface) 
            get_Teams() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Teams
    } // end of method AdminInterfacesClass::get_Teams

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_LookupShip([in] int32 idAGC) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_LookupShip
    } // end of method AdminInterfacesClass::get_LookupShip

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShips 
            marshal( interface) 
            get_Ships() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Ships
    } // end of method AdminInterfacesClass::get_Ships

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAlephs 
            marshal( interface) 
            get_Alephs() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Alephs
    } // end of method AdminInterfacesClass::get_Alephs

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAsteroids 
            marshal( interface) 
            get_Asteroids() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Asteroids
    } // end of method AdminInterfacesClass::get_Asteroids

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGameParameters 
            marshal( interface) 
            get_GameParameters() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameParameters
    } // end of method AdminInterfacesClass::get_GameParameters

    .method public hidebysig newslot specialname virtual 
            instance int32  get_GameID() runtime managed internalcall
    {
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameID
    } // end of method AdminInterfacesClass::get_GameID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_LookupTeam([in] int16 idAGC) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_LookupTeam
    } // end of method AdminInterfacesClass::get_LookupTeam

    .method public hidebysig newslot virtual 
            instance void  IAdminGame_SendChat([in] string  marshal( bstr) bstrText,
                                               [in][opt] int16 idSound) runtime managed internalcall
    {
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminGame::SendChat
    } // end of method AdminInterfacesClass::IAdminGame_SendChat

    .method public hidebysig newslot virtual 
            instance void  IAdminGame_SendCommand([in] string  marshal( bstr) bstrCommand,
                                                  [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                                  [in][opt] int16 idSound) runtime managed internalcall
    {
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminGame::SendCommand
    } // end of method AdminInterfacesClass::IAdminGame_SendCommand

    .method public hidebysig newslot specialname virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage 
            get_GameStage() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameStage
    } // end of method AdminInterfacesClass::get_GameStage

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCProbes 
            marshal( interface) 
            get_Probes() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Probes
    } // end of method AdminInterfacesClass::get_Probes

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Buoys() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Buoys
    } // end of method AdminInterfacesClass::get_Buoys

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Treasures() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Treasures
    } // end of method AdminInterfacesClass::get_Treasures

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Mines() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Mines
    } // end of method AdminInterfacesClass::get_Mines

    .method public hidebysig newslot specialname virtual 
            instance int16  get_ReplayCount() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_ReplayCount
    } // end of method AdminInterfacesClass::get_ReplayCount

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_ContextName() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_ContextName
    } // end of method AdminInterfacesClass::get_ContextName

    .method public hidebysig newslot virtual 
            instance void  IAdminGame_SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::SendMsg
    } // end of method AdminInterfacesClass::IAdminGame_SendMsg

    .method public hidebysig newslot virtual 
            instance void  Kill() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::Kill
    } // end of method AdminInterfacesClass::Kill

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            IAdminGame_get_Users() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Users
    } // end of method AdminInterfacesClass::IAdminGame_get_Users

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_GameOwnerUser() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameOwnerUser
    } // end of method AdminInterfacesClass::get_GameOwnerUser

    .method public hidebysig newslot virtual 
            instance void  StartGame() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::StartGame
    } // end of method AdminInterfacesClass::StartGame

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Description() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::get_Description
    } // end of method AdminInterfacesClass::get_Description

    .method public hidebysig newslot virtual 
            instance void  StartCountdown() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::StartCountdown
    } // end of method AdminInterfacesClass::StartCountdown

    .method public hidebysig newslot virtual 
            instance void  SetTeamName([in] int32 iSideID,
                                       [in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::SetTeamName
    } // end of method AdminInterfacesClass::SetTeamName

    .method public hidebysig newslot virtual 
            instance void  OverrideTechBit([in] int32 iSideID,
                                           [in] int32 nTechBitID,
                                           [in] int32 bNewSetting) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::OverrideTechBit
    } // end of method AdminInterfacesClass::OverrideTechBit

    .method public hidebysig newslot virtual 
            instance void  SetDetailsFiles([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::SetDetailsFiles
    } // end of method AdminInterfacesClass::SetDetailsFiles

    .method public hidebysig newslot virtual 
            instance void  RandomizeTeams() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGame::RandomizeTeams
    } // end of method AdminInterfacesClass::RandomizeTeams

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminGames_get_Type() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGames::get_Type
    } // end of method AdminInterfacesClass::IAdminGames_get_Type

    .method public hidebysig newslot specialname virtual 
            instance int32  get_Count() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGames::get_Count
    } // end of method AdminInterfacesClass::get_Count

    .method public hidebysig newslot virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
      .override ALLEGIANCESERVERLib.IAdminGames::GetEnumerator
    } // end of method AdminInterfacesClass::GetEnumerator

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminGame 
            marshal( interface) 
            get_Item([in] object&  marshal( struct) pvIndex) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGames::get_Item
    } // end of method AdminInterfacesClass::get_Item

    .method public hidebysig newslot virtual 
            instance void  Add(class [Interop.AGCLib]AGCLib.IAGCGameParameters  marshal( interface) pGameParameters) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminGames::Add
    } // end of method AdminInterfacesClass::Add

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminGames 
            marshal( interface) 
            IAdminServer_get_Games() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_Games
    } // end of method AdminInterfacesClass::IAdminServer_get_Games

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminServer_get_PlayerCount() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayerCount
    } // end of method AdminInterfacesClass::IAdminServer_get_PlayerCount

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminServer_get_MissionCount() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_MissionCount
    } // end of method AdminInterfacesClass::IAdminServer_get_MissionCount

    .method public hidebysig newslot virtual 
            instance void  IAdminServer_SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::SendMsg
    } // end of method AdminInterfacesClass::IAdminServer_SendMsg

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            IAdminServer_get_Users() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_Users
    } // end of method AdminInterfacesClass::IAdminServer_get_Users

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            IAdminServer_get_LookupUser([in] int32 id) runtime managed internalcall
    {
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminServer::get_LookupUser
    } // end of method AdminInterfacesClass::IAdminServer_get_LookupUser

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            IAdminServer_get_FindUser([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_FindUser
    } // end of method AdminInterfacesClass::IAdminServer_get_FindUser

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminServer_get_MachineName() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_MachineName
    } // end of method AdminInterfacesClass::IAdminServer_get_MachineName

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminServer_get_PacketsIn() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PacketsIn
    } // end of method AdminInterfacesClass::IAdminServer_get_PacketsIn

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminServer_get_PlayersOnline() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayersOnline
    } // end of method AdminInterfacesClass::IAdminServer_get_PlayersOnline

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminServer_get_TimeInnerLoop() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_TimeInnerLoop
    } // end of method AdminInterfacesClass::IAdminServer_get_TimeInnerLoop

    .method public hidebysig newslot specialname virtual 
            instance void  IAdminServer_set_LobbyServer([in] string  marshal( bstr) pbstrLobbyServer) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::set_LobbyServer
    } // end of method AdminInterfacesClass::IAdminServer_set_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminServer_get_LobbyServer() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_LobbyServer
    } // end of method AdminInterfacesClass::IAdminServer_get_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance void  IAdminServer_set_PublicLobby([in] bool pbPublic) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::set_PublicLobby
    } // end of method AdminInterfacesClass::IAdminServer_set_PublicLobby

    .method public hidebysig newslot specialname virtual 
            instance bool  IAdminServer_get_PublicLobby() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::get_PublicLobby
    } // end of method AdminInterfacesClass::IAdminServer_get_PublicLobby

    .method public hidebysig newslot virtual 
            instance void  IAdminServer_CreateDefaultGames() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminServer::CreateDefaultGames
    } // end of method AdminInterfacesClass::IAdminServer_CreateDefaultGames

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            IAdminUser_get_Name() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::get_Name
    } // end of method AdminInterfacesClass::IAdminUser_get_Name

    .method public hidebysig newslot virtual 
            instance void  IAdminUser_SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::SendMsg
    } // end of method AdminInterfacesClass::IAdminUser_SendMsg

    .method public hidebysig newslot specialname virtual 
            instance bool  get_isReady() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::get_isReady
    } // end of method AdminInterfacesClass::get_isReady

    .method public hidebysig newslot specialname virtual 
            instance void  set_isReady([in] bool pVal) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::set_isReady
    } // end of method AdminInterfacesClass::set_isReady

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminShip 
            marshal( interface) 
            get_Ship() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::get_Ship
    } // end of method AdminInterfacesClass::get_Ship

    .method public hidebysig newslot virtual 
            instance void  Boot() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::Boot
    } // end of method AdminInterfacesClass::Boot

    .method public hidebysig newslot specialname virtual 
            instance int16  get_UserID() runtime managed internalcall
    {
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
      .override ALLEGIANCESERVERLib.IAdminUser::get_UserID
    } // end of method AdminInterfacesClass::get_UserID

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminUser_get_UniqueID() runtime managed internalcall
    {
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminUser::get_UniqueID
    } // end of method AdminInterfacesClass::IAdminUser_get_UniqueID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PlayerStats() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUser::get_PlayerStats
    } // end of method AdminInterfacesClass::get_PlayerStats

    .method public hidebysig newslot specialname virtual 
            instance int32  IAdminUsers_get_Count() runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUsers::get_Count
    } // end of method AdminInterfacesClass::IAdminUsers_get_Count

    .method public hidebysig newslot virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            IAdminUsers_GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
      .override ALLEGIANCESERVERLib.IAdminUsers::GetEnumerator
    } // end of method AdminInterfacesClass::IAdminUsers_GetEnumerator

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_Item([in] object  marshal( struct) index) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminUsers::get_Item
    } // end of method AdminInterfacesClass::get_Item

    .property class [Interop.AGCLib]AGCLib.ITCSessionInfo
            SessionInfo()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_SessionInfo(class [Interop.AGCLib]AGCLib.ITCSessionInfo)
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfo ALLEGIANCESERVERLib.AdminInterfacesClass::get_SessionInfo()
    } // end of property AdminInterfacesClass::SessionInfo
    .property class [Interop.AGCLib]AGCLib.ITCSessionInfos
            SessionInfos()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfos ALLEGIANCESERVERLib.AdminInterfacesClass::get_SessionInfos()
    } // end of property AdminInterfacesClass::SessionInfos
    .property class ALLEGIANCESERVERLib.IAdminServer
            Server()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
      .get instance class ALLEGIANCESERVERLib.IAdminServer ALLEGIANCESERVERLib.AdminInterfacesClass::get_Server()
    } // end of property AdminInterfacesClass::Server
    .property int32 IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                     int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                                                                         int32)
    } // end of property AdminInterfacesClass::IsEventActivated
    .property int32 ProcessID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_ProcessID()
    } // end of property AdminInterfacesClass::ProcessID
    .property class [Interop.AGCLib]AGCLib.IAGCVersionInfo
            Version()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo ALLEGIANCESERVERLib.AdminInterfacesClass::get_Version()
    } // end of property AdminInterfacesClass::Version
    .property class ALLEGIANCESERVERLib.IAdminSession
            WhoStartedServer()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
      .get instance class ALLEGIANCESERVERLib.IAdminSession ALLEGIANCESERVERLib.AdminInterfacesClass::get_WhoStartedServer()
    } // end of property AdminInterfacesClass::WhoStartedServer
    .property class [Interop.AGCLib]AGCLib.IAGCEventLogger
            EventLog()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCEventLogger ALLEGIANCESERVERLib.AdminInterfacesClass::get_EventLog()
    } // end of property AdminInterfacesClass::EventLog
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PerfCounters()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.AdminInterfacesClass::get_PerfCounters()
    } // end of property AdminInterfacesClass::PerfCounters
    .property class ALLEGIANCESERVERLib.IAdminGames
            Games()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminGames ALLEGIANCESERVERLib.AdminInterfacesClass::get_Games()
    } // end of property AdminInterfacesClass::Games
    .property int32 PlayerCount()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_PlayerCount()
    } // end of property AdminInterfacesClass::PlayerCount
    .property int32 MissionCount()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_MissionCount()
    } // end of property AdminInterfacesClass::MissionCount
    .property class ALLEGIANCESERVERLib.IAdminUsers
            Users()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.AdminInterfacesClass::get_Users()
    } // end of property AdminInterfacesClass::Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            LookupUser(int32)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::get_LookupUser(int32)
    } // end of property AdminInterfacesClass::LookupUser
    .property class ALLEGIANCESERVERLib.IAdminUser
            FindUser(string)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::get_FindUser(string)
    } // end of property AdminInterfacesClass::FindUser
    .property string MachineName()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_MachineName()
    } // end of property AdminInterfacesClass::MachineName
    .property int32 PacketsIn()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_PacketsIn()
    } // end of property AdminInterfacesClass::PacketsIn
    .property int32 PlayersOnline()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_PlayersOnline()
    } // end of property AdminInterfacesClass::PlayersOnline
    .property int32 TimeInnerLoop()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_TimeInnerLoop()
    } // end of property AdminInterfacesClass::TimeInnerLoop
    .property string LobbyServer()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_LobbyServer()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_LobbyServer(string)
    } // end of property AdminInterfacesClass::LobbyServer
    .property bool PublicLobby()
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_PublicLobby()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_PublicLobby(bool)
    } // end of property AdminInterfacesClass::PublicLobby
    .property string Type()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_Type()
    } // end of property AdminInterfacesClass::Type
    .property valuetype [Interop.AGCLib]AGCLib.AGCObjectType
            ObjectType()
    {
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType ALLEGIANCESERVERLib.AdminInterfacesClass::get_ObjectType()
    } // end of property AdminInterfacesClass::ObjectType
    .property int16 ObjectID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .get instance int16 ALLEGIANCESERVERLib.AdminInterfacesClass::get_ObjectID()
    } // end of property AdminInterfacesClass::ObjectID
    .property class [Interop.AGCLib]AGCLib.IAGCGame
            Game()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCGame ALLEGIANCESERVERLib.AdminInterfacesClass::get_Game()
    } // end of property AdminInterfacesClass::Game
    .property int32 UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_UniqueID()
    } // end of property AdminInterfacesClass::UniqueID
    .property bool IsVisible()
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_IsVisible()
    } // end of property AdminInterfacesClass::IsVisible
    .property bool IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    } // end of property AdminInterfacesClass::IsSeenBySide
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Position()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.AdminInterfacesClass::get_Position()
    } // end of property AdminInterfacesClass::Position
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Velocity()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.AdminInterfacesClass::get_Velocity()
    } // end of property AdminInterfacesClass::Velocity
    .property class [Interop.AGCLib]AGCLib.IAGCOrientation
            Orientation()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCOrientation ALLEGIANCESERVERLib.AdminInterfacesClass::get_Orientation()
    } // end of property AdminInterfacesClass::Orientation
    .property float32 Radius()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Radius()
    } // end of property AdminInterfacesClass::Radius
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            Team()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.AdminInterfacesClass::get_Team()
    } // end of property AdminInterfacesClass::Team
    .property float32 Mass()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Mass()
    } // end of property AdminInterfacesClass::Mass
    .property class [Interop.AGCLib]AGCLib.IAGCSector
            Sector()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCSector ALLEGIANCESERVERLib.AdminInterfacesClass::get_Sector()
    } // end of property AdminInterfacesClass::Sector
    .property float32 Signature()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Signature()
    } // end of property AdminInterfacesClass::Signature
    .property string Name()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_Name()
    } // end of property AdminInterfacesClass::Name
    .property float32 Fraction()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Fraction()
    } // end of property AdminInterfacesClass::Fraction
    .property bool InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property AdminInterfacesClass::InScannerRange
    .property bool CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property AdminInterfacesClass::CanSee
    .property int16 Ammo()
    {
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_Ammo(int16)
      .get instance int16 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Ammo()
    } // end of property AdminInterfacesClass::Ammo
    .property float32 Fuel()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Fuel()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_Fuel(float32)
    } // end of property AdminInterfacesClass::Fuel
    .property float32 Energy()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Energy()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_Energy(float32)
    } // end of property AdminInterfacesClass::Energy
    .property int16 WingID()
    {
      .get instance int16 ALLEGIANCESERVERLib.AdminInterfacesClass::get_WingID()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_WingID(int16)
    } // end of property AdminInterfacesClass::WingID
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            AutoDonate()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.AdminInterfacesClass::get_AutoDonate()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_AutoDonate(class [Interop.AGCLib]AGCLib.IAGCShip)
    } // end of property AdminInterfacesClass::AutoDonate
    .property float32 ShieldFraction()
    {
      .get instance float32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_ShieldFraction()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_ShieldFraction(float32)
    } // end of property AdminInterfacesClass::ShieldFraction
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            HullType()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.AdminInterfacesClass::get_HullType()
    } // end of property AdminInterfacesClass::HullType
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            BaseHullType()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.AdminInterfacesClass::get_BaseHullType()
    } // end of property AdminInterfacesClass::BaseHullType
    .property class ALLEGIANCESERVERLib.IAdminUser
            User()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::get_User()
    } // end of property AdminInterfacesClass::User
    .property string IAdminGame_Type()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminGame_get_Type()
    } // end of property AdminInterfacesClass::IAdminGame_Type
    .property string IAdminGame_Name()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminGame_get_Name()
    } // end of property AdminInterfacesClass::IAdminGame_Name
    .property class [Interop.AGCLib]AGCLib.IAGCSectors
            Sectors()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCSectors ALLEGIANCESERVERLib.AdminInterfacesClass::get_Sectors()
    } // end of property AdminInterfacesClass::Sectors
    .property class [Interop.AGCLib]AGCLib.IAGCTeams
            Teams()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeams ALLEGIANCESERVERLib.AdminInterfacesClass::get_Teams()
    } // end of property AdminInterfacesClass::Teams
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            LookupShip(int32)
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.AdminInterfacesClass::get_LookupShip(int32)
    } // end of property AdminInterfacesClass::LookupShip
    .property class [Interop.AGCLib]AGCLib.IAGCShips
            Ships()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCShips ALLEGIANCESERVERLib.AdminInterfacesClass::get_Ships()
    } // end of property AdminInterfacesClass::Ships
    .property class [Interop.AGCLib]AGCLib.IAGCAlephs
            Alephs()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCAlephs ALLEGIANCESERVERLib.AdminInterfacesClass::get_Alephs()
    } // end of property AdminInterfacesClass::Alephs
    .property class [Interop.AGCLib]AGCLib.IAGCAsteroids
            Asteroids()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCAsteroids ALLEGIANCESERVERLib.AdminInterfacesClass::get_Asteroids()
    } // end of property AdminInterfacesClass::Asteroids
    .property class [Interop.AGCLib]AGCLib.IAGCGameParameters
            GameParameters()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCGameParameters ALLEGIANCESERVERLib.AdminInterfacesClass::get_GameParameters()
    } // end of property AdminInterfacesClass::GameParameters
    .property int32 GameID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_GameID()
    } // end of property AdminInterfacesClass::GameID
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            LookupTeam(int16)
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.AdminInterfacesClass::get_LookupTeam(int16)
    } // end of property AdminInterfacesClass::LookupTeam
    .property valuetype [Interop.AGCLib]AGCLib.AGCGameStage
            GameStage()
    {
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage ALLEGIANCESERVERLib.AdminInterfacesClass::get_GameStage()
    } // end of property AdminInterfacesClass::GameStage
    .property class [Interop.AGCLib]AGCLib.IAGCProbes
            Probes()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCProbes ALLEGIANCESERVERLib.AdminInterfacesClass::get_Probes()
    } // end of property AdminInterfacesClass::Probes
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Buoys()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminInterfacesClass::get_Buoys()
    } // end of property AdminInterfacesClass::Buoys
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Treasures()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminInterfacesClass::get_Treasures()
    } // end of property AdminInterfacesClass::Treasures
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Mines()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminInterfacesClass::get_Mines()
    } // end of property AdminInterfacesClass::Mines
    .property int16 ReplayCount()
    {
      .get instance int16 ALLEGIANCESERVERLib.AdminInterfacesClass::get_ReplayCount()
    } // end of property AdminInterfacesClass::ReplayCount
    .property string ContextName()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_ContextName()
    } // end of property AdminInterfacesClass::ContextName
    .property class ALLEGIANCESERVERLib.IAdminUsers
            IAdminGame_Users()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminGame_get_Users()
    } // end of property AdminInterfacesClass::IAdminGame_Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            GameOwnerUser()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::get_GameOwnerUser()
    } // end of property AdminInterfacesClass::GameOwnerUser
    .property string Description()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::get_Description()
    } // end of property AdminInterfacesClass::Description
    .property string IAdminGames_Type()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminGames_get_Type()
    } // end of property AdminInterfacesClass::IAdminGames_Type
    .property int32 Count()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::get_Count()
    } // end of property AdminInterfacesClass::Count
    .property class ALLEGIANCESERVERLib.IAdminGame
            Item(object&)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminGame ALLEGIANCESERVERLib.AdminInterfacesClass::get_Item(object&)
    } // end of property AdminInterfacesClass::Item
    .property class ALLEGIANCESERVERLib.IAdminGames
            IAdminServer_Games()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminGames ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_Games()
    } // end of property AdminInterfacesClass::IAdminServer_Games
    .property int32 IAdminServer_PlayerCount()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_PlayerCount()
    } // end of property AdminInterfacesClass::IAdminServer_PlayerCount
    .property int32 IAdminServer_MissionCount()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_MissionCount()
    } // end of property AdminInterfacesClass::IAdminServer_MissionCount
    .property class ALLEGIANCESERVERLib.IAdminUsers
            IAdminServer_Users()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_Users()
    } // end of property AdminInterfacesClass::IAdminServer_Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            IAdminServer_LookupUser(int32)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_LookupUser(int32)
    } // end of property AdminInterfacesClass::IAdminServer_LookupUser
    .property class ALLEGIANCESERVERLib.IAdminUser
            IAdminServer_FindUser(string)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_FindUser(string)
    } // end of property AdminInterfacesClass::IAdminServer_FindUser
    .property string IAdminServer_MachineName()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_MachineName()
    } // end of property AdminInterfacesClass::IAdminServer_MachineName
    .property int32 IAdminServer_PacketsIn()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_PacketsIn()
    } // end of property AdminInterfacesClass::IAdminServer_PacketsIn
    .property int32 IAdminServer_PlayersOnline()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_PlayersOnline()
    } // end of property AdminInterfacesClass::IAdminServer_PlayersOnline
    .property int32 IAdminServer_TimeInnerLoop()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_TimeInnerLoop()
    } // end of property AdminInterfacesClass::IAdminServer_TimeInnerLoop
    .property string IAdminServer_LobbyServer()
    {
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_set_LobbyServer(string)
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_LobbyServer()
    } // end of property AdminInterfacesClass::IAdminServer_LobbyServer
    .property bool IAdminServer_PublicLobby()
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_get_PublicLobby()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminServer_set_PublicLobby(bool)
    } // end of property AdminInterfacesClass::IAdminServer_PublicLobby
    .property string IAdminUser_Name()
    {
      .get instance string ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminUser_get_Name()
    } // end of property AdminInterfacesClass::IAdminUser_Name
    .property bool isReady()
    {
      .get instance bool ALLEGIANCESERVERLib.AdminInterfacesClass::get_isReady()
      .set instance void ALLEGIANCESERVERLib.AdminInterfacesClass::set_isReady(bool)
    } // end of property AdminInterfacesClass::isReady
    .property class ALLEGIANCESERVERLib.IAdminShip
            Ship()
    {
      .get instance class ALLEGIANCESERVERLib.IAdminShip ALLEGIANCESERVERLib.AdminInterfacesClass::get_Ship()
    } // end of property AdminInterfacesClass::Ship
    .property int16 UserID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
      .get instance int16 ALLEGIANCESERVERLib.AdminInterfacesClass::get_UserID()
    } // end of property AdminInterfacesClass::UserID
    .property int32 IAdminUser_UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminUser_get_UniqueID()
    } // end of property AdminInterfacesClass::IAdminUser_UniqueID
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PlayerStats()
    {
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.AdminInterfacesClass::get_PlayerStats()
    } // end of property AdminInterfacesClass::PlayerStats
    .property int32 IAdminUsers_Count()
    {
      .get instance int32 ALLEGIANCESERVERLib.AdminInterfacesClass::IAdminUsers_get_Count()
    } // end of property AdminInterfacesClass::IAdminUsers_Count
    .property class ALLEGIANCESERVERLib.IAdminUser
            IAdminUsers_Item(object)
    {
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminInterfacesClass::get_Item(object)
    } // end of property AdminInterfacesClass::IAdminUsers_Item
  } // end of class AdminInterfacesClass

  .class interface public abstract auto ansi import AdminInterfaces
         implements ALLEGIANCESERVERLib.IAdminSession
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 44 39 42 45 30 38 38 2D 44 44 41 34   // ..$8D9BE088-DDA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 36 2D 30 30 43 30 34   // -11D2-8B46-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 28 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..(ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 49 6E 74 65   // VERLib.AdminInte
                                                                                                                            72 66 61 63 65 73 43 6C 61 73 73 00 00 )          // rfacesClass..
  } // end of class AdminInterfaces

  .class interface public abstract auto ansi import IAdminSession
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 44 39 42 45 30 38 38 2D 44 44 41 34   // ..$8D9BE088-DDA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 36 2D 30 30 43 30 34   // -11D2-8B46-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_SessionInfo([in] class [Interop.AGCLib]AGCLib.ITCSessionInfo  marshal( interface) ppSessionInfo) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
    } // end of method IAdminSession::set_SessionInfo

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfo 
            marshal( interface) 
            get_SessionInfo() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
    } // end of method IAdminSession::get_SessionInfo

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfos 
            marshal( interface) 
            get_SessionInfos() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
    } // end of method IAdminSession::get_SessionInfos

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminServer 
            marshal( interface) 
            get_Server() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
    } // end of method IAdminSession::get_Server

    .method public hidebysig newslot abstract virtual 
            instance void  ActivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                          [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6A 10 00 00 00 00 )                         // ..j.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminSession::ActivateEvents

    .method public hidebysig newslot abstract virtual 
            instance void  DeactivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                            [in][opt] int32 uniqueObjectID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 10 00 00 00 00 )                         // ..k.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminSession::DeactivateEvents

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_IsEventActivated([in] valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                                 [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminSession::get_IsEventActivated

    .method public hidebysig newslot abstract virtual 
            instance void  ActivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 10 00 00 00 00 )                         // ..n.....
    } // end of method IAdminSession::ActivateAllEvents

    .method public hidebysig newslot abstract virtual 
            instance void  DeactivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6F 10 00 00 00 00 )                         // ..o.....
    } // end of method IAdminSession::DeactivateAllEvents

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_ProcessID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
    } // end of method IAdminSession::get_ProcessID

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo 
            marshal( interface) 
            get_Version() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
    } // end of method IAdminSession::get_Version

    .method public hidebysig newslot abstract virtual 
            instance void  Stop() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 75 10 00 00 00 00 )                         // ..u.....
    } // end of method IAdminSession::Stop

    .method public hidebysig newslot abstract virtual 
            instance void  Pause() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 76 10 00 00 00 00 )                         // ..v.....
    } // end of method IAdminSession::Pause

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminSession 
            marshal( interface) 
            get_WhoStartedServer() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
    } // end of method IAdminSession::get_WhoStartedServer

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEventLogger 
            marshal( interface) 
            get_EventLog() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
    } // end of method IAdminSession::get_EventLog

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PerfCounters() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
    } // end of method IAdminSession::get_PerfCounters

    .method public hidebysig newslot abstract virtual 
            instance void  SendAdminChat([in] string  marshal( bstr) bstrText,
                                         [in] int32 nUserID,
                                         [in] valuetype [mscorlib]System.DateTime dateOriginal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 10 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminSession::SendAdminChat

    .method public hidebysig newslot abstract virtual 
            instance void  Continue() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 11 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminSession::Continue

    .property class [Interop.AGCLib]AGCLib.ITCSessionInfo
            SessionInfo()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .set instance void ALLEGIANCESERVERLib.IAdminSession::set_SessionInfo(class [Interop.AGCLib]AGCLib.ITCSessionInfo)
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfo ALLEGIANCESERVERLib.IAdminSession::get_SessionInfo()
    } // end of property IAdminSession::SessionInfo
    .property class [Interop.AGCLib]AGCLib.ITCSessionInfos
            SessionInfos()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfos ALLEGIANCESERVERLib.IAdminSession::get_SessionInfos()
    } // end of property IAdminSession::SessionInfos
    .property class ALLEGIANCESERVERLib.IAdminServer
            Server()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
      .get instance class ALLEGIANCESERVERLib.IAdminServer ALLEGIANCESERVERLib.IAdminSession::get_Server()
    } // end of property IAdminSession::Server
    .property int32 IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                     int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminSession::get_IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                                                                  int32)
    } // end of property IAdminSession::IsEventActivated
    .property int32 ProcessID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminSession::get_ProcessID()
    } // end of property IAdminSession::ProcessID
    .property class [Interop.AGCLib]AGCLib.IAGCVersionInfo
            Version()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo ALLEGIANCESERVERLib.IAdminSession::get_Version()
    } // end of property IAdminSession::Version
    .property class ALLEGIANCESERVERLib.IAdminSession
            WhoStartedServer()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
      .get instance class ALLEGIANCESERVERLib.IAdminSession ALLEGIANCESERVERLib.IAdminSession::get_WhoStartedServer()
    } // end of property IAdminSession::WhoStartedServer
    .property class [Interop.AGCLib]AGCLib.IAGCEventLogger
            EventLog()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCEventLogger ALLEGIANCESERVERLib.IAdminSession::get_EventLog()
    } // end of property IAdminSession::EventLog
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PerfCounters()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.IAdminSession::get_PerfCounters()
    } // end of property IAdminSession::PerfCounters
  } // end of class IAdminSession

  .class interface public abstract auto ansi import IAdminServer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 30 37 32 31 34 35 30 2D 45 37 43 30   // ..$20721450-E7C0
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminGames 
            marshal( interface) 
            get_Games() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 69 10 00 00 00 00 )                         // ..i.....
    } // end of method IAdminServer::get_Games

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_PlayerCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 10 00 00 00 00 )                         // ..p.....
    } // end of method IAdminServer::get_PlayerCount

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_MissionCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 10 00 00 00 00 )                         // ..q.....
    } // end of method IAdminServer::get_MissionCount

    .method public hidebysig newslot abstract virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 10 00 00 00 00 )                         // ..r.....
    } // end of method IAdminServer::SendMsg

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            get_Users() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 10 00 00 00 00 )                         // ..s.....
    } // end of method IAdminServer::get_Users

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_LookupUser([in] int32 id) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 10 00 00 00 00 )                         // ..w.....
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminServer::get_LookupUser

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_FindUser([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 78 10 00 00 00 00 )                         // ..x.....
    } // end of method IAdminServer::get_FindUser

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_MachineName() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7C 10 00 00 00 00 )                         // ..|.....
    } // end of method IAdminServer::get_MachineName

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_PacketsIn() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 10 00 00 00 00 )                         // ..}.....
    } // end of method IAdminServer::get_PacketsIn

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_PlayersOnline() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 10 00 00 00 00 )                         // ..~.....
    } // end of method IAdminServer::get_PlayersOnline

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_TimeInnerLoop() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 10 00 00 00 00 ) 
    } // end of method IAdminServer::get_TimeInnerLoop

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_LobbyServer([in] string  marshal( bstr) pbstrLobbyServer) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
    } // end of method IAdminServer::set_LobbyServer

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_LobbyServer() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
    } // end of method IAdminServer::get_LobbyServer

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_PublicLobby([in] bool pbPublic) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
    } // end of method IAdminServer::set_PublicLobby

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_PublicLobby() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
    } // end of method IAdminServer::get_PublicLobby

    .method public hidebysig newslot abstract virtual 
            instance void  CreateDefaultGames() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0F 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminServer::CreateDefaultGames

    .property class ALLEGIANCESERVERLib.IAdminGames
            Games()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 69 10 00 00 00 00 )                         // ..i.....
      .get instance class ALLEGIANCESERVERLib.IAdminGames ALLEGIANCESERVERLib.IAdminServer::get_Games()
    } // end of property IAdminServer::Games
    .property int32 PlayerCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 10 00 00 00 00 )                         // ..p.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminServer::get_PlayerCount()
    } // end of property IAdminServer::PlayerCount
    .property int32 MissionCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 10 00 00 00 00 )                         // ..q.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminServer::get_MissionCount()
    } // end of property IAdminServer::MissionCount
    .property class ALLEGIANCESERVERLib.IAdminUsers
            Users()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 10 00 00 00 00 )                         // ..s.....
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.IAdminServer::get_Users()
    } // end of property IAdminServer::Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            LookupUser(int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 10 00 00 00 00 )                         // ..w.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.IAdminServer::get_LookupUser(int32)
    } // end of property IAdminServer::LookupUser
    .property class ALLEGIANCESERVERLib.IAdminUser
            FindUser(string)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 78 10 00 00 00 00 )                         // ..x.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.IAdminServer::get_FindUser(string)
    } // end of property IAdminServer::FindUser
    .property string MachineName()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7C 10 00 00 00 00 )                         // ..|.....
      .get instance string ALLEGIANCESERVERLib.IAdminServer::get_MachineName()
    } // end of property IAdminServer::MachineName
    .property int32 PacketsIn()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 10 00 00 00 00 )                         // ..}.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminServer::get_PacketsIn()
    } // end of property IAdminServer::PacketsIn
    .property int32 PlayersOnline()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 10 00 00 00 00 )                         // ..~.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminServer::get_PlayersOnline()
    } // end of property IAdminServer::PlayersOnline
    .property int32 TimeInnerLoop()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 10 00 00 00 00 ) 
      .get instance int32 ALLEGIANCESERVERLib.IAdminServer::get_TimeInnerLoop()
    } // end of property IAdminServer::TimeInnerLoop
    .property string LobbyServer()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.IAdminServer::get_LobbyServer()
      .set instance void ALLEGIANCESERVERLib.IAdminServer::set_LobbyServer(string)
    } // end of property IAdminServer::LobbyServer
    .property bool PublicLobby()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminServer::set_PublicLobby(bool)
      .get instance bool ALLEGIANCESERVERLib.IAdminServer::get_PublicLobby()
    } // end of property IAdminServer::PublicLobby
  } // end of class IAdminServer

  .class interface public abstract auto ansi import IAdminGames
         implements [Interop.AGCLib]AGCLib.IAGCCollection
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 41 43 45 34 34 31 30 2D 45 36 44 33   // ..$3ACE4410-E6D3
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 49 74 65 6D 00 00 )                      // ...Item..
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
    } // end of method IAdminGames::get_Type

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_Count() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 03 60 00 00 )                         // .....`..
    } // end of method IAdminGames::get_Count

    .method public hidebysig newslot abstract virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 FC FF FF FF 00 00 ) 
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
    } // end of method IAdminGames::GetEnumerator

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminGame 
            marshal( interface) 
            get_Item([in] object&  marshal( struct) pvIndex) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
    } // end of method IAdminGames::get_Item

    .method public hidebysig newslot abstract virtual 
            instance void  Add(class [Interop.AGCLib]AGCLib.IAGCGameParameters  marshal( interface) pGameParameters) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 10 00 00 00 00 )                         // ..e.....
    } // end of method IAdminGames::Add

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.IAdminGames::get_Type()
    } // end of property IAdminGames::Type
    .property int32 Count()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 03 60 00 00 )                         // .....`..
      .get instance int32 ALLEGIANCESERVERLib.IAdminGames::get_Count()
    } // end of property IAdminGames::Count
    .property class ALLEGIANCESERVERLib.IAdminGame
            Item(object&)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminGame ALLEGIANCESERVERLib.IAdminGames::get_Item(object&)
    } // end of property IAdminGames::Item
  } // end of class IAdminGames

  .class interface public abstract auto ansi import IAdminGame
         implements [Interop.AGCLib]AGCLib.IAGCGame
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 46 43 35 31 34 46 38 2D 45 36 43 45   // ..$8FC514F8-E6CE
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 4E 61 6D 65 00 00 )                      // ...Name..
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
    } // end of method IAdminGame::get_Type

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Name

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSectors 
            marshal( interface) 
            get_Sectors() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C0 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Sectors

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeams 
            marshal( interface) 
            get_Teams() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C1 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Teams

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_LookupShip([in] int32 idAGC) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C2 00 00 00 00 00 ) 
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminGame::get_LookupShip

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShips 
            marshal( interface) 
            get_Ships() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BA 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Ships

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAlephs 
            marshal( interface) 
            get_Alephs() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BB 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Alephs

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAsteroids 
            marshal( interface) 
            get_Asteroids() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BC 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Asteroids

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGameParameters 
            marshal( interface) 
            get_GameParameters() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C3 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_GameParameters

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_GameID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C4 00 00 00 00 00 ) 
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
    } // end of method IAdminGame::get_GameID

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_LookupTeam([in] int16 idAGC) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C5 00 00 00 00 00 ) 
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
    } // end of method IAdminGame::get_LookupTeam

    .method public hidebysig newslot abstract virtual 
            instance void  SendChat([in] string  marshal( bstr) bstrText,
                                    [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0A 00 03 60 00 00 )                         // .....`..
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
    } // end of method IAdminGame::SendChat

    .method public hidebysig newslot abstract virtual 
            instance void  SendCommand([in] string  marshal( bstr) bstrCommand,
                                       [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                       [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0B 00 03 60 00 00 )                         // .....`..
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
    } // end of method IAdminGame::SendCommand

    .method public hidebysig newslot specialname abstract virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage 
            get_GameStage() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C6 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_GameStage

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCProbes 
            marshal( interface) 
            get_Probes() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BF 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Probes

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Buoys() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C8 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Buoys

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Treasures() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CB 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Treasures

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Mines() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CC 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_Mines

    .method public hidebysig newslot specialname abstract virtual 
            instance int16  get_ReplayCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CE 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_ReplayCount

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_ContextName() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CF 00 00 00 00 00 ) 
    } // end of method IAdminGame::get_ContextName

    .method public hidebysig newslot abstract virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
    } // end of method IAdminGame::SendMsg

    .method public hidebysig newslot abstract virtual 
            instance void  Kill() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 00 00 00 00 00 )                         // ..l.....
    } // end of method IAdminGame::Kill

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            get_Users() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 00 00 00 00 00 )                         // ..m.....
    } // end of method IAdminGame::get_Users

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_GameOwnerUser() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
    } // end of method IAdminGame::get_GameOwnerUser

    .method public hidebysig newslot abstract virtual 
            instance void  StartGame() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
    } // end of method IAdminGame::StartGame

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Description() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
    } // end of method IAdminGame::get_Description

    .method public hidebysig newslot abstract virtual 
            instance void  StartCountdown() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
    } // end of method IAdminGame::StartCountdown

    .method public hidebysig newslot abstract virtual 
            instance void  SetTeamName([in] int32 iSideID,
                                       [in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
    } // end of method IAdminGame::SetTeamName

    .method public hidebysig newslot abstract virtual 
            instance void  OverrideTechBit([in] int32 iSideID,
                                           [in] int32 nTechBitID,
                                           [in] int32 bNewSetting) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 75 00 00 00 00 00 )                         // ..u.....
    } // end of method IAdminGame::OverrideTechBit

    .method public hidebysig newslot abstract virtual 
            instance void  SetDetailsFiles([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 76 00 00 00 00 00 )                         // ..v.....
    } // end of method IAdminGame::SetDetailsFiles

    .method public hidebysig newslot abstract virtual 
            instance void  RandomizeTeams() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 00 00 00 00 00 )                         // ..w.....
    } // end of method IAdminGame::RandomizeTeams

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.IAdminGame::get_Type()
    } // end of property IAdminGame::Type
    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.IAdminGame::get_Name()
    } // end of property IAdminGame::Name
    .property class [Interop.AGCLib]AGCLib.IAGCSectors
            Sectors()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C0 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCSectors ALLEGIANCESERVERLib.IAdminGame::get_Sectors()
    } // end of property IAdminGame::Sectors
    .property class [Interop.AGCLib]AGCLib.IAGCTeams
            Teams()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C1 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeams ALLEGIANCESERVERLib.IAdminGame::get_Teams()
    } // end of property IAdminGame::Teams
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            LookupShip(int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C2 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.IAdminGame::get_LookupShip(int32)
    } // end of property IAdminGame::LookupShip
    .property class [Interop.AGCLib]AGCLib.IAGCShips
            Ships()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BA 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCShips ALLEGIANCESERVERLib.IAdminGame::get_Ships()
    } // end of property IAdminGame::Ships
    .property class [Interop.AGCLib]AGCLib.IAGCAlephs
            Alephs()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BB 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCAlephs ALLEGIANCESERVERLib.IAdminGame::get_Alephs()
    } // end of property IAdminGame::Alephs
    .property class [Interop.AGCLib]AGCLib.IAGCAsteroids
            Asteroids()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BC 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCAsteroids ALLEGIANCESERVERLib.IAdminGame::get_Asteroids()
    } // end of property IAdminGame::Asteroids
    .property class [Interop.AGCLib]AGCLib.IAGCGameParameters
            GameParameters()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C3 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCGameParameters ALLEGIANCESERVERLib.IAdminGame::get_GameParameters()
    } // end of property IAdminGame::GameParameters
    .property int32 GameID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C4 00 00 00 00 00 ) 
      .get instance int32 ALLEGIANCESERVERLib.IAdminGame::get_GameID()
    } // end of property IAdminGame::GameID
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            LookupTeam(int16)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C5 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.IAdminGame::get_LookupTeam(int16)
    } // end of property IAdminGame::LookupTeam
    .property valuetype [Interop.AGCLib]AGCLib.AGCGameStage
            GameStage()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C6 00 00 00 00 00 ) 
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage ALLEGIANCESERVERLib.IAdminGame::get_GameStage()
    } // end of property IAdminGame::GameStage
    .property class [Interop.AGCLib]AGCLib.IAGCProbes
            Probes()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BF 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCProbes ALLEGIANCESERVERLib.IAdminGame::get_Probes()
    } // end of property IAdminGame::Probes
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Buoys()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C8 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.IAdminGame::get_Buoys()
    } // end of property IAdminGame::Buoys
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Treasures()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CB 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.IAdminGame::get_Treasures()
    } // end of property IAdminGame::Treasures
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Mines()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CC 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.IAdminGame::get_Mines()
    } // end of property IAdminGame::Mines
    .property int16 ReplayCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CE 00 00 00 00 00 ) 
      .get instance int16 ALLEGIANCESERVERLib.IAdminGame::get_ReplayCount()
    } // end of property IAdminGame::ReplayCount
    .property string ContextName()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CF 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.IAdminGame::get_ContextName()
    } // end of property IAdminGame::ContextName
    .property class ALLEGIANCESERVERLib.IAdminUsers
            Users()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 00 00 00 00 00 )                         // ..m.....
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.IAdminGame::get_Users()
    } // end of property IAdminGame::Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            GameOwnerUser()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.IAdminGame::get_GameOwnerUser()
    } // end of property IAdminGame::GameOwnerUser
    .property string Description()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .get instance string ALLEGIANCESERVERLib.IAdminGame::get_Description()
    } // end of property IAdminGame::Description
  } // end of class IAdminGame

  .class interface public abstract auto ansi import IAdminUsers
         implements [Interop.AGCLib]AGCLib.ITCCollection
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 49 74 65 6D 00 00 )                      // ...Item..
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 39 45 35 32 41 37 39 2D 45 42 41 34   // ..$F9E52A79-EBA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_Count() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUsers::get_Count

    .method public hidebysig newslot abstract virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 FC FF FF FF 00 00 ) 
    } // end of method IAdminUsers::GetEnumerator

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_Item([in] object  marshal( struct) index) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
    } // end of method IAdminUsers::get_Item

    .property int32 Count()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .get instance int32 ALLEGIANCESERVERLib.IAdminUsers::get_Count()
    } // end of property IAdminUsers::Count
    .property class ALLEGIANCESERVERLib.IAdminUser
            Item(object)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.IAdminUsers::get_Item(object)
    } // end of property IAdminUsers::Item
  } // end of class IAdminUsers

  .class interface public abstract auto ansi import IAdminUser
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 35 43 39 41 44 38 30 2D 45 42 41 34   // ..$D5C9AD80-EBA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::get_Name

    .method public hidebysig newslot abstract virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 01 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::SendMsg

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_isReady() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::get_isReady

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_isReady([in] bool pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::set_isReady

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminShip 
            marshal( interface) 
            get_Ship() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 04 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::get_Ship

    .method public hidebysig newslot abstract virtual 
            instance void  Boot() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 05 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::Boot

    .method public hidebysig newslot specialname abstract virtual 
            instance int16  get_UserID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 06 00 02 60 00 00 )                         // .....`..
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
    } // end of method IAdminUser::get_UserID

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_UniqueID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 07 00 02 60 00 00 )                         // .....`..
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminUser::get_UniqueID

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PlayerStats() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 02 60 00 00 )                         // .....`..
    } // end of method IAdminUser::get_PlayerStats

    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .get instance string ALLEGIANCESERVERLib.IAdminUser::get_Name()
    } // end of property IAdminUser::Name
    .property bool isReady()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
      .set instance void ALLEGIANCESERVERLib.IAdminUser::set_isReady(bool)
      .get instance bool ALLEGIANCESERVERLib.IAdminUser::get_isReady()
    } // end of property IAdminUser::isReady
    .property class ALLEGIANCESERVERLib.IAdminShip
            Ship()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 04 00 02 60 00 00 )                         // .....`..
      .get instance class ALLEGIANCESERVERLib.IAdminShip ALLEGIANCESERVERLib.IAdminUser::get_Ship()
    } // end of property IAdminUser::Ship
    .property int16 UserID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 06 00 02 60 00 00 )                         // .....`..
      .get instance int16 ALLEGIANCESERVERLib.IAdminUser::get_UserID()
    } // end of property IAdminUser::UserID
    .property int32 UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 07 00 02 60 00 00 )                         // .....`..
      .get instance int32 ALLEGIANCESERVERLib.IAdminUser::get_UniqueID()
    } // end of property IAdminUser::UniqueID
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PlayerStats()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 02 60 00 00 )                         // .....`..
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.IAdminUser::get_PlayerStats()
    } // end of property IAdminUser::PlayerStats
  } // end of class IAdminUser

  .class interface public abstract auto ansi import IAdminShip
         implements [Interop.AGCLib]AGCLib.IAGCShip
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 40 10 00 00 )                               // ..@...
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 4E 61 6D 65 00 00 )                      // ...Name..
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 38 36 45 36 38 39 41 2D 32 44 42 34   // ..$986E689A-2DB4
                                                                                                    2D 31 31 44 33 2D 38 42 36 36 2D 30 30 43 30 34   // -11D3-8B66-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
    } // end of method IAdminShip::get_Type

    .method public hidebysig newslot specialname abstract virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType 
            get_ObjectType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 00 00 00 00 00 )                         // ..e.....
    } // end of method IAdminShip::get_ObjectType

    .method public hidebysig newslot specialname abstract virtual 
            instance int16  get_ObjectID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
    } // end of method IAdminShip::get_ObjectID

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGame 
            marshal( interface) 
            get_Game() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 00 00 00 00 00 )                         // ..g.....
    } // end of method IAdminShip::get_Game

    .method public hidebysig newslot specialname abstract virtual 
            instance int32  get_UniqueID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 00 00 00 00 00 )                         // ..h.....
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
    } // end of method IAdminShip::get_UniqueID

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_IsVisible() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 00 00 00 00 00 )                         // ..}.....
    } // end of method IAdminShip::get_IsVisible

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_IsSeenBySide([in] class [Interop.AGCLib]AGCLib.IAGCTeam  marshal( interface) pTeam) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 00 00 00 00 00 )                         // ..~.....
    } // end of method IAdminShip::get_IsSeenBySide

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Position() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Position

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Velocity() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Velocity

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCOrientation 
            marshal( interface) 
            get_Orientation() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 00 00 00 00 00 )                         // ..n.....
    } // end of method IAdminShip::get_Orientation

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Radius() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
    } // end of method IAdminShip::get_Radius

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_Team() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
    } // end of method IAdminShip::get_Team

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Mass() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
    } // end of method IAdminShip::get_Mass

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSector 
            marshal( interface) 
            get_Sector() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
    } // end of method IAdminShip::get_Sector

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Signature() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
    } // end of method IAdminShip::get_Signature

    .method public hidebysig newslot specialname abstract virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Name

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Fraction() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Fraction

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_InScannerRange([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_InScannerRange

    .method public hidebysig newslot specialname abstract virtual 
            instance bool  get_CanSee([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 83 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_CanSee

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_Ammo([in] int16 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_Ammo

    .method public hidebysig newslot specialname abstract virtual 
            instance int16  get_Ammo() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Ammo

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_Fuel([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_Fuel

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Fuel() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Fuel

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_Energy([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_Energy

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_Energy() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_Energy

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_WingID([in] int16 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_WingID

    .method public hidebysig newslot specialname abstract virtual 
            instance int16  get_WingID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_WingID

    .method public hidebysig newslot abstract virtual 
            instance void  SendChat([in] string  marshal( bstr) bstrText,
                                    [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 07 60 00 00 )                         // .....`..
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
    } // end of method IAdminShip::SendChat

    .method public hidebysig newslot abstract virtual 
            instance void  SendCommand([in] string  marshal( bstr) bstrCommand,
                                       [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                       [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 09 00 07 60 00 00 )                         // .....`..
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
    } // end of method IAdminShip::SendCommand

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_AutoDonate([in] class [Interop.AGCLib]AGCLib.IAGCShip  marshal( interface) ppShip) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_AutoDonate

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_AutoDonate() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_AutoDonate

    .method public hidebysig newslot specialname abstract virtual 
            instance void  set_ShieldFraction([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
    } // end of method IAdminShip::set_ShieldFraction

    .method public hidebysig newslot specialname abstract virtual 
            instance float32  get_ShieldFraction() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_ShieldFraction

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_HullType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B1 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_HullType

    .method public hidebysig newslot specialname abstract virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_BaseHullType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B2 00 00 00 00 00 ) 
    } // end of method IAdminShip::get_BaseHullType

    .method public hidebysig newslot specialname abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_User() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 F4 01 00 00 00 00 ) 
    } // end of method IAdminShip::get_User

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.IAdminShip::get_Type()
    } // end of property IAdminShip::Type
    .property valuetype [Interop.AGCLib]AGCLib.AGCObjectType
            ObjectType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 00 00 00 00 00 )                         // ..e.....
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType ALLEGIANCESERVERLib.IAdminShip::get_ObjectType()
    } // end of property IAdminShip::ObjectType
    .property int16 ObjectID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
      .get instance int16 ALLEGIANCESERVERLib.IAdminShip::get_ObjectID()
    } // end of property IAdminShip::ObjectID
    .property class [Interop.AGCLib]AGCLib.IAGCGame
            Game()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 00 00 00 00 00 )                         // ..g.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCGame ALLEGIANCESERVERLib.IAdminShip::get_Game()
    } // end of property IAdminShip::Game
    .property int32 UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 00 00 00 00 00 )                         // ..h.....
      .get instance int32 ALLEGIANCESERVERLib.IAdminShip::get_UniqueID()
    } // end of property IAdminShip::UniqueID
    .property bool IsVisible()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 00 00 00 00 00 )                         // ..}.....
      .get instance bool ALLEGIANCESERVERLib.IAdminShip::get_IsVisible()
    } // end of property IAdminShip::IsVisible
    .property bool IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 00 00 00 00 00 )                         // ..~.....
      .get instance bool ALLEGIANCESERVERLib.IAdminShip::get_IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    } // end of property IAdminShip::IsSeenBySide
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Position()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.IAdminShip::get_Position()
    } // end of property IAdminShip::Position
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Velocity()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.IAdminShip::get_Velocity()
    } // end of property IAdminShip::Velocity
    .property class [Interop.AGCLib]AGCLib.IAGCOrientation
            Orientation()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 00 00 00 00 00 )                         // ..n.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCOrientation ALLEGIANCESERVERLib.IAdminShip::get_Orientation()
    } // end of property IAdminShip::Orientation
    .property float32 Radius()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Radius()
    } // end of property IAdminShip::Radius
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            Team()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.IAdminShip::get_Team()
    } // end of property IAdminShip::Team
    .property float32 Mass()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Mass()
    } // end of property IAdminShip::Mass
    .property class [Interop.AGCLib]AGCLib.IAGCSector
            Sector()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCSector ALLEGIANCESERVERLib.IAdminShip::get_Sector()
    } // end of property IAdminShip::Sector
    .property float32 Signature()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Signature()
    } // end of property IAdminShip::Signature
    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.IAdminShip::get_Name()
    } // end of property IAdminShip::Name
    .property float32 Fraction()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Fraction()
    } // end of property IAdminShip::Fraction
    .property bool InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 00 00 00 00 00 ) 
      .get instance bool ALLEGIANCESERVERLib.IAdminShip::get_InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property IAdminShip::InScannerRange
    .property bool CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 83 00 00 00 00 00 ) 
      .get instance bool ALLEGIANCESERVERLib.IAdminShip::get_CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property IAdminShip::CanSee
    .property int16 Ammo()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_Ammo(int16)
      .get instance int16 ALLEGIANCESERVERLib.IAdminShip::get_Ammo()
    } // end of property IAdminShip::Ammo
    .property float32 Fuel()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Fuel()
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_Fuel(float32)
    } // end of property IAdminShip::Fuel
    .property float32 Energy()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_Energy(float32)
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_Energy()
    } // end of property IAdminShip::Energy
    .property int16 WingID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_WingID(int16)
      .get instance int16 ALLEGIANCESERVERLib.IAdminShip::get_WingID()
    } // end of property IAdminShip::WingID
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            AutoDonate()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_AutoDonate(class [Interop.AGCLib]AGCLib.IAGCShip)
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.IAdminShip::get_AutoDonate()
    } // end of property IAdminShip::AutoDonate
    .property float32 ShieldFraction()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.IAdminShip::set_ShieldFraction(float32)
      .get instance float32 ALLEGIANCESERVERLib.IAdminShip::get_ShieldFraction()
    } // end of property IAdminShip::ShieldFraction
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            HullType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B1 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.IAdminShip::get_HullType()
    } // end of property IAdminShip::HullType
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            BaseHullType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B2 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.IAdminShip::get_BaseHullType()
    } // end of property IAdminShip::BaseHullType
    .property class ALLEGIANCESERVERLib.IAdminUser
            User()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 F4 01 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.IAdminShip::get_User()
    } // end of property IAdminShip::User
  } // end of class IAdminShip

  .class interface public abstract auto ansi import IAdminSessionEvents
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 45 33 45 44 31 35 36 2D 37 36 41 30   // ..$DE3ED156-76A0
                                                                                                    2D 34 41 38 45 2D 38 43 46 45 2D 39 45 44 32 36   // -4A8E-8CFE-9ED26
                                                                                                    43 33 42 30 41 35 45 00 00 )                      // C3B0A5E..
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 80 01 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot abstract virtual 
            instance void  OnEvent([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed internalcall
    {
    } // end of method IAdminSessionEvents::OnEvent

  } // end of class IAdminSessionEvents

  .class interface public abstract auto ansi import _IAdminSessionEvents
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 00 10 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 41 39 45 36 33 32 45 2D 31 38 38 39   // ..$6A9E632E-1889
                                                                                                    2D 31 31 44 33 2D 38 42 36 31 2D 30 30 43 30 34   // -11D3-8B61-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 02 00 00 00 ) 
    .method public hidebysig newslot abstract virtual 
            instance void  OnEvent([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed preservesig internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7A 10 00 00 00 00 )                         // ..z.....
    } // end of method _IAdminSessionEvents::OnEvent

  } // end of class _IAdminSessionEvents

  .class interface public abstract auto ansi import IAdminSessionClass
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 42 33 33 33 39 43 31 42 2D 44 32 36 37   // ..$B3339C1B-D267
                                                                                                    2D 34 32 30 42 2D 42 33 44 37 2D 35 39 46 31 32   // -420B-B3D7-59F12
                                                                                                    37 43 44 44 39 43 46 00 00 )                      // 7CDD9CF..
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 00 01 00 00 ) 
    .method public hidebysig newslot abstract virtual 
            instance class ALLEGIANCESERVERLib.IAdminSession 
            marshal( interface) 
            CreateSession([in] class ALLEGIANCESERVERLib.IAdminSessionHost  marshal( interface) pHost) runtime managed internalcall
    {
    } // end of method IAdminSessionClass::CreateSession

  } // end of class IAdminSessionClass

  .class interface public abstract auto ansi import IAdminSessionHost
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 43 44 37 44 34 38 37 35 2D 33 44 36 31   // ..$CD7D4875-3D61
                                                                                                    2D 34 43 43 34 2D 38 33 43 31 2D 34 38 46 36 39   // -4CC4-83C1-48F69
                                                                                                    38 45 44 34 35 46 35 00 00 )                      // 8ED45F5..
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 00 01 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.InterfaceTypeAttribute::.ctor(int16) = ( 01 00 01 00 00 00 ) 
    .method public hidebysig newslot abstract virtual 
            instance object 
            marshal( iunknown) 
            GetIdentity([in] int32 nCookie) runtime managed internalcall
    {
    } // end of method IAdminSessionHost::GetIdentity

  } // end of class IAdminSessionHost

  .class public auto ansi import AdminSessionClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib.AdminSession,
                    ALLEGIANCESERVERLib._IAdminSessionEvents_Event,
                    ALLEGIANCESERVERLib.IAdminSessionEvents_Event
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComSourceInterfacesAttribute::.ctor(string) = ( 01 00 52 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..RALLEGIANCESER
                                                                                                                   56 45 52 4C 69 62 2E 5F 49 41 64 6D 69 6E 53 65   // VERLib._IAdminSe
                                                                                                                   73 73 69 6F 6E 45 76 65 6E 74 73 00 41 4C 4C 45   // ssionEvents.ALLE
                                                                                                                   47 49 41 4E 43 45 53 45 52 56 45 52 4C 69 62 2E   // GIANCESERVERLib.
                                                                                                                   49 41 64 6D 69 6E 53 65 73 73 69 6F 6E 45 76 65   // IAdminSessionEve
                                                                                                                   6E 74 73 00 00 00 00 )                            // nts....
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 41 41 41 38 32 37 30 46 2D 44 44 41 34   // ..$AAA8270F-DDA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 36 2D 30 30 43 30 34   // -11D2-8B46-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 02 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .method public specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminSessionClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance void  set_SessionInfo([in] class [Interop.AGCLib]AGCLib.ITCSessionInfo  marshal( interface) ppSessionInfo) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .override ALLEGIANCESERVERLib.IAdminSession::set_SessionInfo
    } // end of method AdminSessionClass::set_SessionInfo

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfo 
            marshal( interface) 
            get_SessionInfo() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_SessionInfo
    } // end of method AdminSessionClass::get_SessionInfo

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.ITCSessionInfos 
            marshal( interface) 
            get_SessionInfos() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_SessionInfos
    } // end of method AdminSessionClass::get_SessionInfos

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminServer 
            marshal( interface) 
            get_Server() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_Server
    } // end of method AdminSessionClass::get_Server

    .method public hidebysig newslot virtual 
            instance void  ActivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                          [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6A 10 00 00 00 00 )                         // ..j.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::ActivateEvents
    } // end of method AdminSessionClass::ActivateEvents

    .method public hidebysig newslot virtual 
            instance void  DeactivateEvents(valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                            [in][opt] int32 uniqueObjectID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 10 00 00 00 00 )                         // ..k.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::DeactivateEvents
    } // end of method AdminSessionClass::DeactivateEvents

    .method public hidebysig newslot specialname virtual 
            instance int32  get_IsEventActivated([in] valuetype [Interop.AGCLib]AGCLib.AGCEventID AGCEvent,
                                                 [in][opt] int32 UniqueID) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminSession::get_IsEventActivated
    } // end of method AdminSessionClass::get_IsEventActivated

    .method public hidebysig newslot virtual 
            instance void  ActivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 10 00 00 00 00 )                         // ..n.....
      .override ALLEGIANCESERVERLib.IAdminSession::ActivateAllEvents
    } // end of method AdminSessionClass::ActivateAllEvents

    .method public hidebysig newslot virtual 
            instance void  DeactivateAllEvents() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6F 10 00 00 00 00 )                         // ..o.....
      .override ALLEGIANCESERVERLib.IAdminSession::DeactivateAllEvents
    } // end of method AdminSessionClass::DeactivateAllEvents

    .method public hidebysig newslot specialname virtual 
            instance int32  get_ProcessID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_ProcessID
    } // end of method AdminSessionClass::get_ProcessID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo 
            marshal( interface) 
            get_Version() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_Version
    } // end of method AdminSessionClass::get_Version

    .method public hidebysig newslot virtual 
            instance void  Stop() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 75 10 00 00 00 00 )                         // ..u.....
      .override ALLEGIANCESERVERLib.IAdminSession::Stop
    } // end of method AdminSessionClass::Stop

    .method public hidebysig newslot virtual 
            instance void  Pause() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 76 10 00 00 00 00 )                         // ..v.....
      .override ALLEGIANCESERVERLib.IAdminSession::Pause
    } // end of method AdminSessionClass::Pause

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminSession 
            marshal( interface) 
            get_WhoStartedServer() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_WhoStartedServer
    } // end of method AdminSessionClass::get_WhoStartedServer

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEventLogger 
            marshal( interface) 
            get_EventLog() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
      .override ALLEGIANCESERVERLib.IAdminSession::get_EventLog
    } // end of method AdminSessionClass::get_EventLog

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PerfCounters() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminSession::get_PerfCounters
    } // end of method AdminSessionClass::get_PerfCounters

    .method public hidebysig newslot virtual 
            instance void  SendAdminChat([in] string  marshal( bstr) bstrText,
                                         [in] int32 nUserID,
                                         [in] valuetype [mscorlib]System.DateTime dateOriginal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 10 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminSession::SendAdminChat
    } // end of method AdminSessionClass::SendAdminChat

    .method public hidebysig newslot virtual 
            instance void  Continue() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 11 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminSession::Continue
    } // end of method AdminSessionClass::Continue

    .method public hidebysig newslot virtual 
            instance void  add_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib._IAdminSessionEvents_Event::add_OnEvent
    } // end of method AdminSessionClass::add_OnEvent

    .method public hidebysig newslot virtual 
            instance void  remove_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib._IAdminSessionEvents_Event::remove_OnEvent
    } // end of method AdminSessionClass::remove_OnEvent

    .method public hidebysig newslot virtual 
            instance void  IAdminSessionEvents_Event_add_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminSessionEvents_Event::add_OnEvent
    } // end of method AdminSessionClass::IAdminSessionEvents_Event_add_OnEvent

    .method public hidebysig newslot virtual 
            instance void  IAdminSessionEvents_Event_remove_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
      .override ALLEGIANCESERVERLib.IAdminSessionEvents_Event::remove_OnEvent
    } // end of method AdminSessionClass::IAdminSessionEvents_Event_remove_OnEvent

    .event ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler OnEvent
    {
      .addon instance void ALLEGIANCESERVERLib.AdminSessionClass::add_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler)
      .removeon instance void ALLEGIANCESERVERLib.AdminSessionClass::remove_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler)
    } // end of event AdminSessionClass::OnEvent
    .event ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler IAdminSessionEvents_Event_OnEvent
    {
      .removeon instance void ALLEGIANCESERVERLib.AdminSessionClass::IAdminSessionEvents_Event_remove_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler)
      .addon instance void ALLEGIANCESERVERLib.AdminSessionClass::IAdminSessionEvents_Event_add_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler)
    } // end of event AdminSessionClass::IAdminSessionEvents_Event_OnEvent
    .property class [Interop.AGCLib]AGCLib.ITCSessionInfo
            SessionInfo()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 10 00 00 00 00 )                         // ..f.....
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfo ALLEGIANCESERVERLib.AdminSessionClass::get_SessionInfo()
      .set instance void ALLEGIANCESERVERLib.AdminSessionClass::set_SessionInfo(class [Interop.AGCLib]AGCLib.ITCSessionInfo)
    } // end of property AdminSessionClass::SessionInfo
    .property class [Interop.AGCLib]AGCLib.ITCSessionInfos
            SessionInfos()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 10 00 00 00 00 )                         // ..g.....
      .get instance class [Interop.AGCLib]AGCLib.ITCSessionInfos ALLEGIANCESERVERLib.AdminSessionClass::get_SessionInfos()
    } // end of property AdminSessionClass::SessionInfos
    .property class ALLEGIANCESERVERLib.IAdminServer
            Server()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 10 00 00 00 00 )                         // ..h.....
      .get instance class ALLEGIANCESERVERLib.IAdminServer ALLEGIANCESERVERLib.AdminSessionClass::get_Server()
    } // end of property AdminSessionClass::Server
    .property int32 IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                     int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 10 00 00 00 00 )                         // ..l.....
      .get instance int32 ALLEGIANCESERVERLib.AdminSessionClass::get_IsEventActivated(valuetype [Interop.AGCLib]AGCLib.AGCEventID,
                                                                                      int32)
    } // end of property AdminSessionClass::IsEventActivated
    .property int32 ProcessID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 79 10 00 00 00 00 )                         // ..y.....
      .get instance int32 ALLEGIANCESERVERLib.AdminSessionClass::get_ProcessID()
    } // end of property AdminSessionClass::ProcessID
    .property class [Interop.AGCLib]AGCLib.IAGCVersionInfo
            Version()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 10 00 00 00 00 )                         // ..t.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCVersionInfo ALLEGIANCESERVERLib.AdminSessionClass::get_Version()
    } // end of property AdminSessionClass::Version
    .property class ALLEGIANCESERVERLib.IAdminSession
            WhoStartedServer()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 10 00 00 00 00 )                         // ..m.....
      .get instance class ALLEGIANCESERVERLib.IAdminSession ALLEGIANCESERVERLib.AdminSessionClass::get_WhoStartedServer()
    } // end of property AdminSessionClass::WhoStartedServer
    .property class [Interop.AGCLib]AGCLib.IAGCEventLogger
            EventLog()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7B 10 00 00 00 00 )                         // ..{.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCEventLogger ALLEGIANCESERVERLib.AdminSessionClass::get_EventLog()
    } // end of property AdminSessionClass::EventLog
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PerfCounters()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 10 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.AdminSessionClass::get_PerfCounters()
    } // end of property AdminSessionClass::PerfCounters
  } // end of class AdminSessionClass

  .class interface public abstract auto ansi _IAdminSessionEvents_Event
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 10 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = ( 01 00 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComEventInterfaceAttribute::.ctor(class [mscorlib]System.Type,
                                                                                                     class [mscorlib]System.Type) = ( 01 00 29 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..)ALLEGIANCESER
                                                                                                                                      56 45 52 4C 69 62 2E 5F 49 41 64 6D 69 6E 53 65   // VERLib._IAdminSe
                                                                                                                                      73 73 69 6F 6E 45 76 65 6E 74 73 00 37 41 4C 4C   // ssionEvents.7ALL
                                                                                                                                      45 47 49 41 4E 43 45 53 45 52 56 45 52 4C 69 62   // EGIANCESERVERLib
                                                                                                                                      2E 5F 49 41 64 6D 69 6E 53 65 73 73 69 6F 6E 45   // ._IAdminSessionE
                                                                                                                                      76 65 6E 74 73 5F 45 76 65 6E 74 50 72 6F 76 69   // vents_EventProvi
                                                                                                                                      64 65 72 00 00 00 )                               // der...
    .method public hidebysig newslot abstract virtual 
            instance void  add_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
    } // end of method _IAdminSessionEvents_Event::add_OnEvent

    .method public hidebysig newslot abstract virtual 
            instance void  remove_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
    } // end of method _IAdminSessionEvents_Event::remove_OnEvent

    .event ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler OnEvent
    {
      .addon instance void ALLEGIANCESERVERLib._IAdminSessionEvents_Event::add_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler)
      .removeon instance void ALLEGIANCESERVERLib._IAdminSessionEvents_Event::remove_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler)
    } // end of event _IAdminSessionEvents_Event::OnEvent
  } // end of class _IAdminSessionEvents_Event

  .class public auto ansi sealed _IAdminSessionEvents_OnEventEventHandler
         extends [mscorlib]System.MulticastDelegate
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 10 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = ( 01 00 00 00 00 ) 
    .method public specialname rtspecialname 
            instance void  .ctor(object A_1,
                                 native unsigned int A_2) runtime managed
    {
    } // end of method _IAdminSessionEvents_OnEventEventHandler::.ctor

    .method public virtual instance void 
            Invoke([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed preservesig
    {
    } // end of method _IAdminSessionEvents_OnEventEventHandler::Invoke

  } // end of class _IAdminSessionEvents_OnEventEventHandler

  .class interface public abstract auto ansi IAdminSessionEvents_Event
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 10 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = ( 01 00 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComEventInterfaceAttribute::.ctor(class [mscorlib]System.Type,
                                                                                                     class [mscorlib]System.Type) = ( 01 00 28 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..(ALLEGIANCESER
                                                                                                                                      56 45 52 4C 69 62 2E 49 41 64 6D 69 6E 53 65 73   // VERLib.IAdminSes
                                                                                                                                      73 69 6F 6E 45 76 65 6E 74 73 00 36 41 4C 4C 45   // sionEvents.6ALLE
                                                                                                                                      47 49 41 4E 43 45 53 45 52 56 45 52 4C 69 62 2E   // GIANCESERVERLib.
                                                                                                                                      49 41 64 6D 69 6E 53 65 73 73 69 6F 6E 45 76 65   // IAdminSessionEve
                                                                                                                                      6E 74 73 5F 45 76 65 6E 74 50 72 6F 76 69 64 65   // nts_EventProvide
                                                                                                                                      72 00 00 00 )                                     // r...
    .method public hidebysig newslot abstract virtual 
            instance void  add_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
    } // end of method IAdminSessionEvents_Event::add_OnEvent

    .method public hidebysig newslot abstract virtual 
            instance void  remove_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) runtime managed internalcall
    {
    } // end of method IAdminSessionEvents_Event::remove_OnEvent

    .event ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler OnEvent
    {
      .addon instance void ALLEGIANCESERVERLib.IAdminSessionEvents_Event::add_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler)
      .removeon instance void ALLEGIANCESERVERLib.IAdminSessionEvents_Event::remove_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler)
    } // end of event IAdminSessionEvents_Event::OnEvent
  } // end of class IAdminSessionEvents_Event

  .class public auto ansi sealed IAdminSessionEvents_OnEventEventHandler
         extends [mscorlib]System.MulticastDelegate
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibTypeAttribute::.ctor(int16) = ( 01 00 10 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::.ctor(bool) = ( 01 00 00 00 00 ) 
    .method public specialname rtspecialname 
            instance void  .ctor(object A_1,
                                 native unsigned int A_2) runtime managed
    {
    } // end of method IAdminSessionEvents_OnEventEventHandler::.ctor

    .method public virtual instance void 
            Invoke([in] class [Interop.AGCLib]AGCLib.IAGCEvent  marshal( interface) pEvent) runtime managed
    {
    } // end of method IAdminSessionEvents_OnEventEventHandler::Invoke

  } // end of class IAdminSessionEvents_OnEventEventHandler

  .class interface public abstract auto ansi import AdminSession
         implements ALLEGIANCESERVERLib.IAdminSession,
                    ALLEGIANCESERVERLib._IAdminSessionEvents_Event
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 44 39 42 45 30 38 38 2D 44 44 41 34   // ..$8D9BE088-DDA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 36 2D 30 30 43 30 34   // -11D2-8B46-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 25 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..%ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 53 65 73 73   // VERLib.AdminSess
                                                                                                                            69 6F 6E 43 6C 61 73 73 00 00 )                   // ionClass..
  } // end of class AdminSession

  .class public auto ansi import AdminShipClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminShip,
                    ALLEGIANCESERVERLib.AdminShip
  {
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 4E 61 6D 65 00 00 )                      // ...Name..
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 45 33 38 39 38 30 36 2D 32 44 42 34   // ..$3E389806-2DB4
                                                                                                    2D 31 31 44 33 2D 38 42 36 36 2D 30 30 43 30 34   // -11D3-8B66-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminShipClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Type
    } // end of method AdminShipClass::get_Type

    .method public hidebysig newslot specialname virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType 
            get_ObjectType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 00 00 00 00 00 )                         // ..e.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_ObjectType
    } // end of method AdminShipClass::get_ObjectType

    .method public hidebysig newslot specialname virtual 
            instance int16  get_ObjectID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .override ALLEGIANCESERVERLib.IAdminShip::get_ObjectID
    } // end of method AdminShipClass::get_ObjectID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGame 
            marshal( interface) 
            get_Game() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 00 00 00 00 00 )                         // ..g.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Game
    } // end of method AdminShipClass::get_Game

    .method public hidebysig newslot specialname virtual 
            instance int32  get_UniqueID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 00 00 00 00 00 )                         // ..h.....
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminShip::get_UniqueID
    } // end of method AdminShipClass::get_UniqueID

    .method public hidebysig newslot specialname virtual 
            instance bool  get_IsVisible() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 00 00 00 00 00 )                         // ..}.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_IsVisible
    } // end of method AdminShipClass::get_IsVisible

    .method public hidebysig newslot specialname virtual 
            instance bool  get_IsSeenBySide([in] class [Interop.AGCLib]AGCLib.IAGCTeam  marshal( interface) pTeam) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 00 00 00 00 00 )                         // ..~.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_IsSeenBySide
    } // end of method AdminShipClass::get_IsSeenBySide

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Position() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Position
    } // end of method AdminShipClass::get_Position

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCVector 
            marshal( interface) 
            get_Velocity() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Velocity
    } // end of method AdminShipClass::get_Velocity

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCOrientation 
            marshal( interface) 
            get_Orientation() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 00 00 00 00 00 )                         // ..n.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Orientation
    } // end of method AdminShipClass::get_Orientation

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Radius() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Radius
    } // end of method AdminShipClass::get_Radius

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_Team() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Team
    } // end of method AdminShipClass::get_Team

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Mass() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Mass
    } // end of method AdminShipClass::get_Mass

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSector 
            marshal( interface) 
            get_Sector() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Sector
    } // end of method AdminShipClass::get_Sector

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Signature() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
      .override ALLEGIANCESERVERLib.IAdminShip::get_Signature
    } // end of method AdminShipClass::get_Signature

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Name
    } // end of method AdminShipClass::get_Name

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Fraction() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Fraction
    } // end of method AdminShipClass::get_Fraction

    .method public hidebysig newslot specialname virtual 
            instance bool  get_InScannerRange([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_InScannerRange
    } // end of method AdminShipClass::get_InScannerRange

    .method public hidebysig newslot specialname virtual 
            instance bool  get_CanSee([in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModel) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 83 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_CanSee
    } // end of method AdminShipClass::get_CanSee

    .method public hidebysig newslot specialname virtual 
            instance void  set_Ammo([in] int16 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_Ammo
    } // end of method AdminShipClass::set_Ammo

    .method public hidebysig newslot specialname virtual 
            instance int16  get_Ammo() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Ammo
    } // end of method AdminShipClass::get_Ammo

    .method public hidebysig newslot specialname virtual 
            instance void  set_Fuel([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_Fuel
    } // end of method AdminShipClass::set_Fuel

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Fuel() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Fuel
    } // end of method AdminShipClass::get_Fuel

    .method public hidebysig newslot specialname virtual 
            instance void  set_Energy([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_Energy
    } // end of method AdminShipClass::set_Energy

    .method public hidebysig newslot specialname virtual 
            instance float32  get_Energy() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_Energy
    } // end of method AdminShipClass::get_Energy

    .method public hidebysig newslot specialname virtual 
            instance void  set_WingID([in] int16 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_WingID
    } // end of method AdminShipClass::set_WingID

    .method public hidebysig newslot specialname virtual 
            instance int16  get_WingID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_WingID
    } // end of method AdminShipClass::get_WingID

    .method public hidebysig newslot virtual 
            instance void  SendChat([in] string  marshal( bstr) bstrText,
                                    [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 07 60 00 00 )                         // .....`..
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminShip::SendChat
    } // end of method AdminShipClass::SendChat

    .method public hidebysig newslot virtual 
            instance void  SendCommand([in] string  marshal( bstr) bstrCommand,
                                       [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                       [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 09 00 07 60 00 00 )                         // .....`..
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminShip::SendCommand
    } // end of method AdminShipClass::SendCommand

    .method public hidebysig newslot specialname virtual 
            instance void  set_AutoDonate([in] class [Interop.AGCLib]AGCLib.IAGCShip  marshal( interface) ppShip) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_AutoDonate
    } // end of method AdminShipClass::set_AutoDonate

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_AutoDonate() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_AutoDonate
    } // end of method AdminShipClass::get_AutoDonate

    .method public hidebysig newslot specialname virtual 
            instance void  set_ShieldFraction([in] float32 pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::set_ShieldFraction
    } // end of method AdminShipClass::set_ShieldFraction

    .method public hidebysig newslot specialname virtual 
            instance float32  get_ShieldFraction() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_ShieldFraction
    } // end of method AdminShipClass::get_ShieldFraction

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_HullType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B1 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_HullType
    } // end of method AdminShipClass::get_HullType

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCHullType 
            marshal( interface) 
            get_BaseHullType() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B2 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_BaseHullType
    } // end of method AdminShipClass::get_BaseHullType

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_User() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 F4 01 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminShip::get_User
    } // end of method AdminShipClass::get_User

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.AdminShipClass::get_Type()
    } // end of property AdminShipClass::Type
    .property valuetype [Interop.AGCLib]AGCLib.AGCObjectType
            ObjectType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 00 00 00 00 00 )                         // ..e.....
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCObjectType ALLEGIANCESERVERLib.AdminShipClass::get_ObjectType()
    } // end of property AdminShipClass::ObjectType
    .property int16 ObjectID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
      .get instance int16 ALLEGIANCESERVERLib.AdminShipClass::get_ObjectID()
    } // end of property AdminShipClass::ObjectID
    .property class [Interop.AGCLib]AGCLib.IAGCGame
            Game()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 67 00 00 00 00 00 )                         // ..g.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCGame ALLEGIANCESERVERLib.AdminShipClass::get_Game()
    } // end of property AdminShipClass::Game
    .property int32 UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 68 00 00 00 00 00 )                         // ..h.....
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .get instance int32 ALLEGIANCESERVERLib.AdminShipClass::get_UniqueID()
    } // end of property AdminShipClass::UniqueID
    .property bool IsVisible()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 00 00 00 00 00 )                         // ..}.....
      .get instance bool ALLEGIANCESERVERLib.AdminShipClass::get_IsVisible()
    } // end of property AdminShipClass::IsVisible
    .property bool IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 00 00 00 00 00 )                         // ..~.....
      .get instance bool ALLEGIANCESERVERLib.AdminShipClass::get_IsSeenBySide(class [Interop.AGCLib]AGCLib.IAGCTeam)
    } // end of property AdminShipClass::IsSeenBySide
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Position()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.AdminShipClass::get_Position()
    } // end of property AdminShipClass::Position
    .property class [Interop.AGCLib]AGCLib.IAGCVector
            Velocity()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCVector ALLEGIANCESERVERLib.AdminShipClass::get_Velocity()
    } // end of property AdminShipClass::Velocity
    .property class [Interop.AGCLib]AGCLib.IAGCOrientation
            Orientation()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6E 00 00 00 00 00 )                         // ..n.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCOrientation ALLEGIANCESERVERLib.AdminShipClass::get_Orientation()
    } // end of property AdminShipClass::Orientation
    .property float32 Radius()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Radius()
    } // end of property AdminShipClass::Radius
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            Team()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.AdminShipClass::get_Team()
    } // end of property AdminShipClass::Team
    .property float32 Mass()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Mass()
    } // end of property AdminShipClass::Mass
    .property class [Interop.AGCLib]AGCLib.IAGCSector
            Sector()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
      .get instance class [Interop.AGCLib]AGCLib.IAGCSector ALLEGIANCESERVERLib.AdminShipClass::get_Sector()
    } // end of property AdminShipClass::Sector
    .property float32 Signature()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Signature()
    } // end of property AdminShipClass::Signature
    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.AdminShipClass::get_Name()
    } // end of property AdminShipClass::Name
    .property float32 Fraction()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Fraction()
    } // end of property AdminShipClass::Fraction
    .property bool InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 82 00 00 00 00 00 ) 
      .get instance bool ALLEGIANCESERVERLib.AdminShipClass::get_InScannerRange(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property AdminShipClass::InScannerRange
    .property bool CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 83 00 00 00 00 00 ) 
      .get instance bool ALLEGIANCESERVERLib.AdminShipClass::get_CanSee(class [Interop.AGCLib]AGCLib.IAGCModel)
    } // end of property AdminShipClass::CanSee
    .property int16 Ammo()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AD 00 00 00 00 00 ) 
      .get instance int16 ALLEGIANCESERVERLib.AdminShipClass::get_Ammo()
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_Ammo(int16)
    } // end of property AdminShipClass::Ammo
    .property float32 Fuel()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AE 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Fuel()
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_Fuel(float32)
    } // end of property AdminShipClass::Fuel
    .property float32 Energy()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 AF 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_Energy()
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_Energy(float32)
    } // end of property AdminShipClass::Energy
    .property int16 WingID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B0 00 00 00 00 00 ) 
      .get instance int16 ALLEGIANCESERVERLib.AdminShipClass::get_WingID()
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_WingID(int16)
    } // end of property AdminShipClass::WingID
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            AutoDonate()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9D 00 00 00 00 00 ) 
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_AutoDonate(class [Interop.AGCLib]AGCLib.IAGCShip)
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.AdminShipClass::get_AutoDonate()
    } // end of property AdminShipClass::AutoDonate
    .property float32 ShieldFraction()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 9E 00 00 00 00 00 ) 
      .get instance float32 ALLEGIANCESERVERLib.AdminShipClass::get_ShieldFraction()
      .set instance void ALLEGIANCESERVERLib.AdminShipClass::set_ShieldFraction(float32)
    } // end of property AdminShipClass::ShieldFraction
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            HullType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B1 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.AdminShipClass::get_HullType()
    } // end of property AdminShipClass::HullType
    .property class [Interop.AGCLib]AGCLib.IAGCHullType
            BaseHullType()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 B2 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCHullType ALLEGIANCESERVERLib.AdminShipClass::get_BaseHullType()
    } // end of property AdminShipClass::BaseHullType
    .property class ALLEGIANCESERVERLib.IAdminUser
            User()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 F4 01 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminShipClass::get_User()
    } // end of property AdminShipClass::User
  } // end of class AdminShipClass

  .class interface public abstract auto ansi import AdminShip
         implements ALLEGIANCESERVERLib.IAdminShip
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 38 36 45 36 38 39 41 2D 32 44 42 34   // ..$986E689A-2DB4
                                                                                                    2D 31 31 44 33 2D 38 42 36 36 2D 30 30 43 30 34   // -11D3-8B66-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 22 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // .."ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 53 68 69 70   // VERLib.AdminShip
                                                                                                                            43 6C 61 73 73 00 00 )                            // Class..
  } // end of class AdminShip

  .class public auto ansi import AdminGameClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminGame,
                    ALLEGIANCESERVERLib.AdminGame
  {
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 4E 61 6D 65 00 00 )                      // ...Name..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 39 46 31 37 31 31 34 41 2D 45 36 43 45   // ..$9F17114A-E6CE
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminGameClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .override ALLEGIANCESERVERLib.IAdminGame::get_Type
    } // end of method AdminGameClass::get_Type

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Name
    } // end of method AdminGameClass::get_Name

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCSectors 
            marshal( interface) 
            get_Sectors() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C0 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Sectors
    } // end of method AdminGameClass::get_Sectors

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeams 
            marshal( interface) 
            get_Teams() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C1 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Teams
    } // end of method AdminGameClass::get_Teams

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShip 
            marshal( interface) 
            get_LookupShip([in] int32 idAGC) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C2 00 00 00 00 00 ) 
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_LookupShip
    } // end of method AdminGameClass::get_LookupShip

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCShips 
            marshal( interface) 
            get_Ships() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BA 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Ships
    } // end of method AdminGameClass::get_Ships

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAlephs 
            marshal( interface) 
            get_Alephs() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BB 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Alephs
    } // end of method AdminGameClass::get_Alephs

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCAsteroids 
            marshal( interface) 
            get_Asteroids() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BC 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Asteroids
    } // end of method AdminGameClass::get_Asteroids

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCGameParameters 
            marshal( interface) 
            get_GameParameters() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C3 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameParameters
    } // end of method AdminGameClass::get_GameParameters

    .method public hidebysig newslot specialname virtual 
            instance int32  get_GameID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C4 00 00 00 00 00 ) 
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameID
    } // end of method AdminGameClass::get_GameID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCTeam 
            marshal( interface) 
            get_LookupTeam([in] int16 idAGC) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C5 00 00 00 00 00 ) 
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 4F 62 6A   // ...AGCLib.AGCObj
                                                                                                              65 63 74 49 44 00 00 )                            // ectID..
      .override ALLEGIANCESERVERLib.IAdminGame::get_LookupTeam
    } // end of method AdminGameClass::get_LookupTeam

    .method public hidebysig newslot virtual 
            instance void  SendChat([in] string  marshal( bstr) bstrText,
                                    [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0A 00 03 60 00 00 )                         // .....`..
      .param [2] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminGame::SendChat
    } // end of method AdminGameClass::SendChat

    .method public hidebysig newslot virtual 
            instance void  SendCommand([in] string  marshal( bstr) bstrCommand,
                                       [in] class [Interop.AGCLib]AGCLib.IAGCModel  marshal( interface) pModelTarget,
                                       [in][opt] int16 idSound) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0B 00 03 60 00 00 )                         // .....`..
      .param [3] = int32(0xFFFFFFFF)
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 11 41 47 43 4C 69 62 2E 41 47 43 53 6F 75   // ...AGCLib.AGCSou
                                                                                                              6E 64 49 44 00 00 )                               // ndID..
      .override ALLEGIANCESERVERLib.IAdminGame::SendCommand
    } // end of method AdminGameClass::SendCommand

    .method public hidebysig newslot specialname virtual 
            instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage 
            get_GameStage() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C6 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameStage
    } // end of method AdminGameClass::get_GameStage

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCProbes 
            marshal( interface) 
            get_Probes() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BF 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Probes
    } // end of method AdminGameClass::get_Probes

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Buoys() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C8 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Buoys
    } // end of method AdminGameClass::get_Buoys

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Treasures() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CB 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Treasures
    } // end of method AdminGameClass::get_Treasures

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCModels 
            marshal( interface) 
            get_Mines() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CC 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_Mines
    } // end of method AdminGameClass::get_Mines

    .method public hidebysig newslot specialname virtual 
            instance int16  get_ReplayCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CE 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_ReplayCount
    } // end of method AdminGameClass::get_ReplayCount

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_ContextName() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CF 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGame::get_ContextName
    } // end of method AdminGameClass::get_ContextName

    .method public hidebysig newslot virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 66 00 00 00 00 00 )                         // ..f.....
      .override ALLEGIANCESERVERLib.IAdminGame::SendMsg
    } // end of method AdminGameClass::SendMsg

    .method public hidebysig newslot virtual 
            instance void  Kill() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6C 00 00 00 00 00 )                         // ..l.....
      .override ALLEGIANCESERVERLib.IAdminGame::Kill
    } // end of method AdminGameClass::Kill

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            get_Users() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 00 00 00 00 00 )                         // ..m.....
      .override ALLEGIANCESERVERLib.IAdminGame::get_Users
    } // end of method AdminGameClass::get_Users

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_GameOwnerUser() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .override ALLEGIANCESERVERLib.IAdminGame::get_GameOwnerUser
    } // end of method AdminGameClass::get_GameOwnerUser

    .method public hidebysig newslot virtual 
            instance void  StartGame() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 00 00 00 00 00 )                         // ..q.....
      .override ALLEGIANCESERVERLib.IAdminGame::StartGame
    } // end of method AdminGameClass::StartGame

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Description() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .override ALLEGIANCESERVERLib.IAdminGame::get_Description
    } // end of method AdminGameClass::get_Description

    .method public hidebysig newslot virtual 
            instance void  StartCountdown() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 00 00 00 00 00 )                         // ..s.....
      .override ALLEGIANCESERVERLib.IAdminGame::StartCountdown
    } // end of method AdminGameClass::StartCountdown

    .method public hidebysig newslot virtual 
            instance void  SetTeamName([in] int32 iSideID,
                                       [in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 74 00 00 00 00 00 )                         // ..t.....
      .override ALLEGIANCESERVERLib.IAdminGame::SetTeamName
    } // end of method AdminGameClass::SetTeamName

    .method public hidebysig newslot virtual 
            instance void  OverrideTechBit([in] int32 iSideID,
                                           [in] int32 nTechBitID,
                                           [in] int32 bNewSetting) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 75 00 00 00 00 00 )                         // ..u.....
      .override ALLEGIANCESERVERLib.IAdminGame::OverrideTechBit
    } // end of method AdminGameClass::OverrideTechBit

    .method public hidebysig newslot virtual 
            instance void  SetDetailsFiles([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 76 00 00 00 00 00 )                         // ..v.....
      .override ALLEGIANCESERVERLib.IAdminGame::SetDetailsFiles
    } // end of method AdminGameClass::SetDetailsFiles

    .method public hidebysig newslot virtual 
            instance void  RandomizeTeams() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 00 00 00 00 00 )                         // ..w.....
      .override ALLEGIANCESERVERLib.IAdminGame::RandomizeTeams
    } // end of method AdminGameClass::RandomizeTeams

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.AdminGameClass::get_Type()
    } // end of property AdminGameClass::Type
    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.AdminGameClass::get_Name()
    } // end of property AdminGameClass::Name
    .property class [Interop.AGCLib]AGCLib.IAGCSectors
            Sectors()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C0 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCSectors ALLEGIANCESERVERLib.AdminGameClass::get_Sectors()
    } // end of property AdminGameClass::Sectors
    .property class [Interop.AGCLib]AGCLib.IAGCTeams
            Teams()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C1 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeams ALLEGIANCESERVERLib.AdminGameClass::get_Teams()
    } // end of property AdminGameClass::Teams
    .property class [Interop.AGCLib]AGCLib.IAGCShip
            LookupShip(int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C2 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCShip ALLEGIANCESERVERLib.AdminGameClass::get_LookupShip(int32)
    } // end of property AdminGameClass::LookupShip
    .property class [Interop.AGCLib]AGCLib.IAGCShips
            Ships()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BA 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCShips ALLEGIANCESERVERLib.AdminGameClass::get_Ships()
    } // end of property AdminGameClass::Ships
    .property class [Interop.AGCLib]AGCLib.IAGCAlephs
            Alephs()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BB 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCAlephs ALLEGIANCESERVERLib.AdminGameClass::get_Alephs()
    } // end of property AdminGameClass::Alephs
    .property class [Interop.AGCLib]AGCLib.IAGCAsteroids
            Asteroids()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BC 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCAsteroids ALLEGIANCESERVERLib.AdminGameClass::get_Asteroids()
    } // end of property AdminGameClass::Asteroids
    .property class [Interop.AGCLib]AGCLib.IAGCGameParameters
            GameParameters()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C3 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCGameParameters ALLEGIANCESERVERLib.AdminGameClass::get_GameParameters()
    } // end of property AdminGameClass::GameParameters
    .property int32 GameID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C4 00 00 00 00 00 ) 
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 10 41 47 43 4C 69 62 2E 41 47 43 47 61 6D   // ...AGCLib.AGCGam
                                                                                                              65 49 44 00 00 )                                  // eID..
      .get instance int32 ALLEGIANCESERVERLib.AdminGameClass::get_GameID()
    } // end of property AdminGameClass::GameID
    .property class [Interop.AGCLib]AGCLib.IAGCTeam
            LookupTeam(int16)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C5 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCTeam ALLEGIANCESERVERLib.AdminGameClass::get_LookupTeam(int16)
    } // end of property AdminGameClass::LookupTeam
    .property valuetype [Interop.AGCLib]AGCLib.AGCGameStage
            GameStage()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C6 00 00 00 00 00 ) 
      .get instance valuetype [Interop.AGCLib]AGCLib.AGCGameStage ALLEGIANCESERVERLib.AdminGameClass::get_GameStage()
    } // end of property AdminGameClass::GameStage
    .property class [Interop.AGCLib]AGCLib.IAGCProbes
            Probes()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 BF 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCProbes ALLEGIANCESERVERLib.AdminGameClass::get_Probes()
    } // end of property AdminGameClass::Probes
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Buoys()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 C8 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminGameClass::get_Buoys()
    } // end of property AdminGameClass::Buoys
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Treasures()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CB 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminGameClass::get_Treasures()
    } // end of property AdminGameClass::Treasures
    .property class [Interop.AGCLib]AGCLib.IAGCModels
            Mines()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CC 00 00 00 00 00 ) 
      .get instance class [Interop.AGCLib]AGCLib.IAGCModels ALLEGIANCESERVERLib.AdminGameClass::get_Mines()
    } // end of property AdminGameClass::Mines
    .property int16 ReplayCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CE 00 00 00 00 00 ) 
      .get instance int16 ALLEGIANCESERVERLib.AdminGameClass::get_ReplayCount()
    } // end of property AdminGameClass::ReplayCount
    .property string ContextName()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 CF 00 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.AdminGameClass::get_ContextName()
    } // end of property AdminGameClass::ContextName
    .property class ALLEGIANCESERVERLib.IAdminUsers
            Users()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6D 00 00 00 00 00 )                         // ..m.....
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.AdminGameClass::get_Users()
    } // end of property AdminGameClass::Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            GameOwnerUser()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 00 00 00 00 00 )                         // ..p.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminGameClass::get_GameOwnerUser()
    } // end of property AdminGameClass::GameOwnerUser
    .property string Description()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 00 00 00 00 00 )                         // ..r.....
      .get instance string ALLEGIANCESERVERLib.AdminGameClass::get_Description()
    } // end of property AdminGameClass::Description
  } // end of class AdminGameClass

  .class interface public abstract auto ansi import AdminGame
         implements ALLEGIANCESERVERLib.IAdminGame
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 38 46 43 35 31 34 46 38 2D 45 36 43 45   // ..$8FC514F8-E6CE
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 22 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // .."ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 47 61 6D 65   // VERLib.AdminGame
                                                                                                                            43 6C 61 73 73 00 00 )                            // Class..
  } // end of class AdminGame

  .class public auto ansi import AdminGamesClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminGames,
                    ALLEGIANCESERVERLib.AdminGames
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 36 37 37 35 37 30 36 34 2D 45 36 46 43   // ..$67757064-E6FC
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 49 74 65 6D 00 00 )                      // ...Item..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminGamesClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Type() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .override ALLEGIANCESERVERLib.IAdminGames::get_Type
    } // end of method AdminGamesClass::get_Type

    .method public hidebysig newslot specialname virtual 
            instance int32  get_Count() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 03 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminGames::get_Count
    } // end of method AdminGamesClass::get_Count

    .method public hidebysig newslot virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 FC FF FF FF 00 00 ) 
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
      .override ALLEGIANCESERVERLib.IAdminGames::GetEnumerator
    } // end of method AdminGamesClass::GetEnumerator

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminGame 
            marshal( interface) 
            get_Item([in] object&  marshal( struct) pvIndex) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminGames::get_Item
    } // end of method AdminGamesClass::get_Item

    .method public hidebysig newslot virtual 
            instance void  Add(class [Interop.AGCLib]AGCLib.IAGCGameParameters  marshal( interface) pGameParameters) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 65 10 00 00 00 00 )                         // ..e.....
      .override ALLEGIANCESERVERLib.IAdminGames::Add
    } // end of method AdminGamesClass::Add

    .property string Type()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 6B 00 00 00 00 00 )                         // ..k.....
      .get instance string ALLEGIANCESERVERLib.AdminGamesClass::get_Type()
    } // end of property AdminGamesClass::Type
    .property int32 Count()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 03 60 00 00 )                         // .....`..
      .get instance int32 ALLEGIANCESERVERLib.AdminGamesClass::get_Count()
    } // end of property AdminGamesClass::Count
    .property class ALLEGIANCESERVERLib.IAdminGame
            Item(object&)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminGame ALLEGIANCESERVERLib.AdminGamesClass::get_Item(object&)
    } // end of property AdminGamesClass::Item
  } // end of class AdminGamesClass

  .class interface public abstract auto ansi import AdminGames
         implements ALLEGIANCESERVERLib.IAdminGames
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 23 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..#ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 47 61 6D 65   // VERLib.AdminGame
                                                                                                                            73 43 6C 61 73 73 00 00 )                         // sClass..
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 33 41 43 45 34 34 31 30 2D 45 36 44 33   // ..$3ACE4410-E6D3
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
  } // end of class AdminGames

  .class public auto ansi import AdminServerClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminServer,
                    ALLEGIANCESERVERLib.AdminServer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 35 42 35 45 44 32 41 36 2D 45 37 43 30   // ..$5B5ED2A6-E7C0
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminServerClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminGames 
            marshal( interface) 
            get_Games() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 69 10 00 00 00 00 )                         // ..i.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_Games
    } // end of method AdminServerClass::get_Games

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PlayerCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 10 00 00 00 00 )                         // ..p.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayerCount
    } // end of method AdminServerClass::get_PlayerCount

    .method public hidebysig newslot specialname virtual 
            instance int32  get_MissionCount() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 10 00 00 00 00 )                         // ..q.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_MissionCount
    } // end of method AdminServerClass::get_MissionCount

    .method public hidebysig newslot virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 72 10 00 00 00 00 )                         // ..r.....
      .override ALLEGIANCESERVERLib.IAdminServer::SendMsg
    } // end of method AdminServerClass::SendMsg

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUsers 
            marshal( interface) 
            get_Users() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 10 00 00 00 00 )                         // ..s.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_Users
    } // end of method AdminServerClass::get_Users

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_LookupUser([in] int32 id) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 10 00 00 00 00 )                         // ..w.....
      .param [1]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminServer::get_LookupUser
    } // end of method AdminServerClass::get_LookupUser

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_FindUser([in] string  marshal( bstr) bstrName) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 78 10 00 00 00 00 )                         // ..x.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_FindUser
    } // end of method AdminServerClass::get_FindUser

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_MachineName() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7C 10 00 00 00 00 )                         // ..|.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_MachineName
    } // end of method AdminServerClass::get_MachineName

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PacketsIn() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 10 00 00 00 00 )                         // ..}.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_PacketsIn
    } // end of method AdminServerClass::get_PacketsIn

    .method public hidebysig newslot specialname virtual 
            instance int32  get_PlayersOnline() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 10 00 00 00 00 )                         // ..~.....
      .override ALLEGIANCESERVERLib.IAdminServer::get_PlayersOnline
    } // end of method AdminServerClass::get_PlayersOnline

    .method public hidebysig newslot specialname virtual 
            instance int32  get_TimeInnerLoop() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminServer::get_TimeInnerLoop
    } // end of method AdminServerClass::get_TimeInnerLoop

    .method public hidebysig newslot specialname virtual 
            instance void  set_LobbyServer([in] string  marshal( bstr) pbstrLobbyServer) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminServer::set_LobbyServer
    } // end of method AdminServerClass::set_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_LobbyServer() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminServer::get_LobbyServer
    } // end of method AdminServerClass::get_LobbyServer

    .method public hidebysig newslot specialname virtual 
            instance void  set_PublicLobby([in] bool pbPublic) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminServer::set_PublicLobby
    } // end of method AdminServerClass::set_PublicLobby

    .method public hidebysig newslot specialname virtual 
            instance bool  get_PublicLobby() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminServer::get_PublicLobby
    } // end of method AdminServerClass::get_PublicLobby

    .method public hidebysig newslot virtual 
            instance void  CreateDefaultGames() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 0F 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminServer::CreateDefaultGames
    } // end of method AdminServerClass::CreateDefaultGames

    .property class ALLEGIANCESERVERLib.IAdminGames
            Games()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 69 10 00 00 00 00 )                         // ..i.....
      .get instance class ALLEGIANCESERVERLib.IAdminGames ALLEGIANCESERVERLib.AdminServerClass::get_Games()
    } // end of property AdminServerClass::Games
    .property int32 PlayerCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 70 10 00 00 00 00 )                         // ..p.....
      .get instance int32 ALLEGIANCESERVERLib.AdminServerClass::get_PlayerCount()
    } // end of property AdminServerClass::PlayerCount
    .property int32 MissionCount()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 71 10 00 00 00 00 )                         // ..q.....
      .get instance int32 ALLEGIANCESERVERLib.AdminServerClass::get_MissionCount()
    } // end of property AdminServerClass::MissionCount
    .property class ALLEGIANCESERVERLib.IAdminUsers
            Users()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 73 10 00 00 00 00 )                         // ..s.....
      .get instance class ALLEGIANCESERVERLib.IAdminUsers ALLEGIANCESERVERLib.AdminServerClass::get_Users()
    } // end of property AdminServerClass::Users
    .property class ALLEGIANCESERVERLib.IAdminUser
            LookupUser(int32)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 77 10 00 00 00 00 )                         // ..w.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminServerClass::get_LookupUser(int32)
    } // end of property AdminServerClass::LookupUser
    .property class ALLEGIANCESERVERLib.IAdminUser
            FindUser(string)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 78 10 00 00 00 00 )                         // ..x.....
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminServerClass::get_FindUser(string)
    } // end of property AdminServerClass::FindUser
    .property string MachineName()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7C 10 00 00 00 00 )                         // ..|.....
      .get instance string ALLEGIANCESERVERLib.AdminServerClass::get_MachineName()
    } // end of property AdminServerClass::MachineName
    .property int32 PacketsIn()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7D 10 00 00 00 00 )                         // ..}.....
      .get instance int32 ALLEGIANCESERVERLib.AdminServerClass::get_PacketsIn()
    } // end of property AdminServerClass::PacketsIn
    .property int32 PlayersOnline()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7E 10 00 00 00 00 )                         // ..~.....
      .get instance int32 ALLEGIANCESERVERLib.AdminServerClass::get_PlayersOnline()
    } // end of property AdminServerClass::PlayersOnline
    .property int32 TimeInnerLoop()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 7F 10 00 00 00 00 ) 
      .get instance int32 ALLEGIANCESERVERLib.AdminServerClass::get_TimeInnerLoop()
    } // end of property AdminServerClass::TimeInnerLoop
    .property string LobbyServer()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 80 10 00 00 00 00 ) 
      .get instance string ALLEGIANCESERVERLib.AdminServerClass::get_LobbyServer()
      .set instance void ALLEGIANCESERVERLib.AdminServerClass::set_LobbyServer(string)
    } // end of property AdminServerClass::LobbyServer
    .property bool PublicLobby()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 81 10 00 00 00 00 ) 
      .get instance bool ALLEGIANCESERVERLib.AdminServerClass::get_PublicLobby()
      .set instance void ALLEGIANCESERVERLib.AdminServerClass::set_PublicLobby(bool)
    } // end of property AdminServerClass::PublicLobby
  } // end of class AdminServerClass

  .class interface public abstract auto ansi import AdminServer
         implements ALLEGIANCESERVERLib.IAdminServer
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 32 30 37 32 31 34 35 30 2D 45 37 43 30   // ..$20721450-E7C0
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 24 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..$ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 53 65 72 76   // VERLib.AdminServ
                                                                                                                            65 72 43 6C 61 73 73 00 00 )                      // erClass..
  } // end of class AdminServer

  .class public auto ansi import AdminUserClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminUser,
                    ALLEGIANCESERVERLib.AdminUser
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 45 37 31 45 41 35 42 38 2D 45 42 41 34   // ..$E71EA5B8-EBA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminUserClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance string 
            marshal( bstr) 
            get_Name() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::get_Name
    } // end of method AdminUserClass::get_Name

    .method public hidebysig newslot virtual 
            instance void  SendMsg(string  marshal( bstr) bstrMessage) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 01 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::SendMsg
    } // end of method AdminUserClass::SendMsg

    .method public hidebysig newslot specialname virtual 
            instance bool  get_isReady() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::get_isReady
    } // end of method AdminUserClass::get_isReady

    .method public hidebysig newslot specialname virtual 
            instance void  set_isReady([in] bool pVal) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::set_isReady
    } // end of method AdminUserClass::set_isReady

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminShip 
            marshal( interface) 
            get_Ship() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 04 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::get_Ship
    } // end of method AdminUserClass::get_Ship

    .method public hidebysig newslot virtual 
            instance void  Boot() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 05 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::Boot
    } // end of method AdminUserClass::Boot

    .method public hidebysig newslot specialname virtual 
            instance int16  get_UserID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 06 00 02 60 00 00 )                         // .....`..
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
      .override ALLEGIANCESERVERLib.IAdminUser::get_UserID
    } // end of method AdminUserClass::get_UserID

    .method public hidebysig newslot specialname virtual 
            instance int32  get_UniqueID() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 07 00 02 60 00 00 )                         // .....`..
      .param [0]
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .override ALLEGIANCESERVERLib.IAdminUser::get_UniqueID
    } // end of method AdminUserClass::get_UniqueID

    .method public hidebysig newslot specialname virtual 
            instance class [Interop.AGCLib]AGCLib.IAGCEvent 
            marshal( interface) 
            get_PlayerStats() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUser::get_PlayerStats
    } // end of method AdminUserClass::get_PlayerStats

    .property string Name()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .get instance string ALLEGIANCESERVERLib.AdminUserClass::get_Name()
    } // end of property AdminUserClass::Name
    .property bool isReady()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 02 00 02 60 00 00 )                         // .....`..
      .get instance bool ALLEGIANCESERVERLib.AdminUserClass::get_isReady()
      .set instance void ALLEGIANCESERVERLib.AdminUserClass::set_isReady(bool)
    } // end of property AdminUserClass::isReady
    .property class ALLEGIANCESERVERLib.IAdminShip
            Ship()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 04 00 02 60 00 00 )                         // .....`..
      .get instance class ALLEGIANCESERVERLib.IAdminShip ALLEGIANCESERVERLib.AdminUserClass::get_Ship()
    } // end of property AdminUserClass::Ship
    .property int16 UserID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 06 00 02 60 00 00 )                         // .....`..
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 1F 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ...ALLEGIANCESER
                                                                                                              56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                              49 44 00 00 )                                     // ID..
      .get instance int16 ALLEGIANCESERVERLib.AdminUserClass::get_UserID()
    } // end of property AdminUserClass::UserID
    .property int32 UniqueID()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 07 00 02 60 00 00 )                         // .....`..
      .custom instance void [mscorlib]System.Runtime.InteropServices.ComAliasNameAttribute::.ctor(string) = ( 01 00 12 41 47 43 4C 69 62 2E 41 47 43 55 6E 69   // ...AGCLib.AGCUni
                                                                                                              71 75 65 49 44 00 00 )                            // queID..
      .get instance int32 ALLEGIANCESERVERLib.AdminUserClass::get_UniqueID()
    } // end of property AdminUserClass::UniqueID
    .property class [Interop.AGCLib]AGCLib.IAGCEvent
            PlayerStats()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 08 00 02 60 00 00 )                         // .....`..
      .get instance class [Interop.AGCLib]AGCLib.IAGCEvent ALLEGIANCESERVERLib.AdminUserClass::get_PlayerStats()
    } // end of property AdminUserClass::PlayerStats
  } // end of class AdminUserClass

  .class interface public abstract auto ansi import AdminUser
         implements ALLEGIANCESERVERLib.IAdminUser
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 44 35 43 39 41 44 38 30 2D 45 42 41 34   // ..$D5C9AD80-EBA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 22 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // .."ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                                            43 6C 61 73 73 00 00 )                            // Class..
  } // end of class AdminUser

  .class public auto ansi import AdminUsersClass
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminUsers,
                    ALLEGIANCESERVERLib.AdminUsers
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(int16) = ( 01 00 00 00 00 00 ) 
    .custom instance void [mscorlib]System.Reflection.DefaultMemberAttribute::.ctor(string) = ( 01 00 04 49 74 65 6D 00 00 )                      // ...Item..
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 30 42 44 35 31 42 39 34 2D 45 42 41 35   // ..$0BD51B94-EBA5
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .method assembly specialname rtspecialname 
            instance void  .ctor() runtime managed internalcall
    {
    } // end of method AdminUsersClass::.ctor

    .method public hidebysig newslot specialname virtual 
            instance int32  get_Count() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .override ALLEGIANCESERVERLib.IAdminUsers::get_Count
    } // end of method AdminUsersClass::get_Count

    .method public hidebysig newslot virtual 
            instance class [mscorlib]System.Collections.IEnumerator 
            marshal( custom ("System.Runtime.InteropServices.CustomMarshalers.EnumeratorToEnumVariantMarshaler, CustomMarshalers, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a","")) 
            GetEnumerator() runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 FC FF FF FF 00 00 ) 
      .custom instance void [mscorlib]System.Runtime.InteropServices.TypeLibFuncAttribute::.ctor(int16) = ( 01 00 41 00 00 00 )                               // ..A...
      .override ALLEGIANCESERVERLib.IAdminUsers::GetEnumerator
    } // end of method AdminUsersClass::GetEnumerator

    .method public hidebysig newslot specialname virtual 
            instance class ALLEGIANCESERVERLib.IAdminUser 
            marshal( interface) 
            get_Item([in] object  marshal( struct) index) runtime managed internalcall
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .override ALLEGIANCESERVERLib.IAdminUsers::get_Item
    } // end of method AdminUsersClass::get_Item

    .property int32 Count()
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 02 60 00 00 )                         // .....`..
      .get instance int32 ALLEGIANCESERVERLib.AdminUsersClass::get_Count()
    } // end of property AdminUsersClass::Count
    .property class ALLEGIANCESERVERLib.IAdminUser
            Item(object)
    {
      .custom instance void [mscorlib]System.Runtime.InteropServices.DispIdAttribute::.ctor(int32) = ( 01 00 00 00 00 00 00 00 ) 
      .get instance class ALLEGIANCESERVERLib.IAdminUser ALLEGIANCESERVERLib.AdminUsersClass::get_Item(object)
    } // end of property AdminUsersClass::Item
  } // end of class AdminUsersClass

  .class interface public abstract auto ansi import AdminUsers
         implements ALLEGIANCESERVERLib.IAdminUsers
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.GuidAttribute::.ctor(string) = ( 01 00 24 46 39 45 35 32 41 37 39 2D 45 42 41 34   // ..$F9E52A79-EBA4
                                                                                                    2D 31 31 44 32 2D 38 42 34 42 2D 30 30 43 30 34   // -11D2-8B4B-00C04
                                                                                                    46 36 38 31 36 33 33 00 00 )                      // F681633..
    .custom instance void [mscorlib]System.Runtime.InteropServices.CoClassAttribute::.ctor(class [mscorlib]System.Type) = ( 01 00 23 41 4C 4C 45 47 49 41 4E 43 45 53 45 52   // ..#ALLEGIANCESER
                                                                                                                            56 45 52 4C 69 62 2E 41 64 6D 69 6E 55 73 65 72   // VERLib.AdminUser
                                                                                                                            73 43 6C 61 73 73 00 00 )                         // sClass..
  } // end of class AdminUsers

  .class public auto ansi sealed _IAdminSessionEvents_SinkHelper
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib._IAdminSessionEvents
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(valuetype [mscorlib]System.Runtime.InteropServices.ClassInterfaceType) = ( 01 00 00 00 00 00 00 00 ) 
    .field public class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler m_OnEventDelegate
    .field public int32 m_dwCookie
    .method public virtual instance void 
            OnEvent(class [Interop.AGCLib]AGCLib.IAGCEvent A_1) cil managed
    {
      // Code size       34 (0x22)
      .maxstack  2
      IL_0000:  ldarg      0
      IL_0004:  ldfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0009:  brfalse    IL_0021

      IL_000e:  ldarg      0
      IL_0012:  ldfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0017:  ldarg      A_1
      IL_001b:  callvirt   instance void ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler::Invoke(class [Interop.AGCLib]AGCLib.IAGCEvent)
      IL_0020:  ret

      IL_0021:  ret
    } // end of method _IAdminSessionEvents_SinkHelper::OnEvent

    .method assembly specialname rtspecialname 
            instance void  .ctor() cil managed
    {
      // Code size       34 (0x22)
      .maxstack  4
      IL_0000:  ldarg      0
      IL_0004:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0009:  ldarg      0
      IL_000d:  ldc.i4     0x0
      IL_0012:  stfld      int32 ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_dwCookie
      IL_0017:  ldarg      0
      IL_001b:  ldnull
      IL_001c:  stfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0021:  ret
    } // end of method _IAdminSessionEvents_SinkHelper::.ctor

  } // end of class _IAdminSessionEvents_SinkHelper

  .class private auto ansi sealed _IAdminSessionEvents_EventProvider
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib._IAdminSessionEvents_Event,
                    [mscorlib]System.IDisposable
  {
    .field private class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer m_ConnectionPointContainer
    .field private class [mscorlib]System.Collections.ArrayList m_aEventSinkHelpers
    .field private class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint m_ConnectionPoint
    .method private instance void  Init() cil managed
    {
      // Code size       261 (0x105)
      .maxstack  5
      .locals init (class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint V_0,
               valuetype [mscorlib]System.Guid V_1,
               unsigned int8[] V_2)
      IL_0000:  ldnull
      IL_0001:  stloc.0
      IL_0002:  ldc.i4     0x10
      IL_0007:  newarr     [mscorlib]System.Byte
      IL_000c:  stloc.2
      IL_000d:  ldloc.2
      IL_000e:  ldc.i4     0x0
      IL_0013:  ldc.i4     0x2e
      IL_0018:  stelem.i1
      IL_0019:  ldloc.2
      IL_001a:  ldc.i4     0x1
      IL_001f:  ldc.i4     0x63
      IL_0024:  stelem.i1
      IL_0025:  ldloc.2
      IL_0026:  ldc.i4     0x2
      IL_002b:  ldc.i4     0x9e
      IL_0030:  stelem.i1
      IL_0031:  ldloc.2
      IL_0032:  ldc.i4     0x3
      IL_0037:  ldc.i4     0x6a
      IL_003c:  stelem.i1
      IL_003d:  ldloc.2
      IL_003e:  ldc.i4     0x4
      IL_0043:  ldc.i4     0x89
      IL_0048:  stelem.i1
      IL_0049:  ldloc.2
      IL_004a:  ldc.i4     0x5
      IL_004f:  ldc.i4     0x18
      IL_0054:  stelem.i1
      IL_0055:  ldloc.2
      IL_0056:  ldc.i4     0x6
      IL_005b:  ldc.i4     0xd3
      IL_0060:  stelem.i1
      IL_0061:  ldloc.2
      IL_0062:  ldc.i4     0x7
      IL_0067:  ldc.i4     0x11
      IL_006c:  stelem.i1
      IL_006d:  ldloc.2
      IL_006e:  ldc.i4     0x8
      IL_0073:  ldc.i4     0x8b
      IL_0078:  stelem.i1
      IL_0079:  ldloc.2
      IL_007a:  ldc.i4     0x9
      IL_007f:  ldc.i4     0x61
      IL_0084:  stelem.i1
      IL_0085:  ldloc.2
      IL_0086:  ldc.i4     0xa
      IL_008b:  ldc.i4     0x0
      IL_0090:  stelem.i1
      IL_0091:  ldloc.2
      IL_0092:  ldc.i4     0xb
      IL_0097:  ldc.i4     0xc0
      IL_009c:  stelem.i1
      IL_009d:  ldloc.2
      IL_009e:  ldc.i4     0xc
      IL_00a3:  ldc.i4     0x4f
      IL_00a8:  stelem.i1
      IL_00a9:  ldloc.2
      IL_00aa:  ldc.i4     0xd
      IL_00af:  ldc.i4     0x68
      IL_00b4:  stelem.i1
      IL_00b5:  ldloc.2
      IL_00b6:  ldc.i4     0xe
      IL_00bb:  ldc.i4     0x16
      IL_00c0:  stelem.i1
      IL_00c1:  ldloc.2
      IL_00c2:  ldc.i4     0xf
      IL_00c7:  ldc.i4     0x33
      IL_00cc:  stelem.i1
      IL_00cd:  ldloca.s   V_1
      IL_00cf:  ldloc.2
      IL_00d0:  call       instance void [mscorlib]System.Guid::.ctor(unsigned int8[])
      IL_00d5:  ldarg      0
      IL_00d9:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPointContainer
      IL_00de:  ldloca.s   V_1
      IL_00e0:  ldloca.s   V_0
      IL_00e2:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer::FindConnectionPoint(valuetype [mscorlib]System.Guid&,
                                                                                                                                     class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint&)
      IL_00e7:  ldarg      0
      IL_00eb:  ldloc.0
      IL_00ec:  castclass  [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint
      IL_00f1:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
      IL_00f6:  ldarg      0
      IL_00fa:  newobj     instance void [mscorlib]System.Collections.ArrayList::.ctor()
      IL_00ff:  stfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
      IL_0104:  ret
    } // end of method _IAdminSessionEvents_EventProvider::Init

    .method public virtual instance void 
            add_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) cil managed
    {
      // Code size       116 (0x74)
      .maxstack  6
      .locals init (class ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper V_0,
               int32 V_1)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        IL_0009:  ldarg      0
        IL_000d:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0012:  brtrue     IL_0020

        IL_0017:  ldarg      0
        IL_001b:  call       instance void ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::Init()
        IL_0020:  newobj     instance void ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::.ctor()
        IL_0025:  stloc.0
        IL_0026:  ldc.i4.0
        IL_0027:  stloc.1
        IL_0028:  ldarg      0
        IL_002c:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0031:  ldloc.0
        IL_0032:  castclass  [mscorlib]System.Object
        IL_0037:  ldloca.s   V_1
        IL_0039:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Advise(object,
                                                                                                                 int32&)
        IL_003e:  ldloc.0
        IL_003f:  ldloc.1
        IL_0040:  stfld      int32 ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_dwCookie
        IL_0045:  ldloc.0
        IL_0046:  ldarg      A_1
        IL_004a:  stfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_004f:  ldarg      0
        IL_0053:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0058:  ldloc.0
        IL_0059:  castclass  [mscorlib]System.Object
        IL_005e:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::Add(object)
        IL_0063:  pop
        IL_0064:  leave      IL_0073

      }  // end .try
      finally
      {
        IL_0069:  ldarg      0
        IL_006d:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_0072:  endfinally
      }  // end handler
      IL_0073:  ret
    } // end of method _IAdminSessionEvents_EventProvider::add_OnEvent

    .method public virtual instance void 
            remove_OnEvent(class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler A_1) cil managed
    {
      // Code size       227 (0xe3)
      .maxstack  6
      .locals init (int32 V_0,
               int32 V_1,
               class ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper V_2)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        IL_0009:  ldarg      0
        IL_000d:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0012:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::get_Count()
        IL_0017:  stloc.0
        IL_0018:  ldc.i4     0x0
        IL_001d:  stloc.1
        IL_001e:  ldc.i4     0x0
        IL_0023:  ldloc.0
        IL_0024:  bge        IL_00d3

        IL_0029:  ldarg      0
        IL_002d:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0032:  ldloc.1
        IL_0033:  callvirt   instance object [mscorlib]System.Collections.ArrayList::get_Item(int32)
        IL_0038:  castclass  ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper
        IL_003d:  stloc.2
        IL_003e:  ldloc.2
        IL_003f:  ldfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_0044:  ldnull
        IL_0045:  beq        IL_00c4

        IL_004a:  ldloc.2
        IL_004b:  ldfld      class ALLEGIANCESERVERLib._IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_0050:  ldarg      A_1
        IL_0054:  castclass  [mscorlib]System.Object
        IL_0059:  callvirt   instance bool [mscorlib]System.Delegate::Equals(object)
        IL_005e:  ldc.i4     0xff
        IL_0063:  and
        IL_0064:  ldc.i4     0x0
        IL_0069:  beq        IL_00c4

        IL_006e:  ldarg      0
        IL_0072:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0077:  ldloc.1
        IL_0078:  callvirt   instance void [mscorlib]System.Collections.ArrayList::RemoveAt(int32)
        IL_007d:  ldarg      0
        IL_0081:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0086:  ldloc.2
        IL_0087:  ldfld      int32 ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_dwCookie
        IL_008c:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Unadvise(int32)
        IL_0091:  ldloc.0
        IL_0092:  ldc.i4     0x1
        IL_0097:  bgt        IL_00d3

        IL_009c:  ldarg      0
        IL_00a0:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_00a5:  call       int32 [mscorlib]System.Runtime.InteropServices.Marshal::ReleaseComObject(object)
        IL_00aa:  pop
        IL_00ab:  ldarg      0
        IL_00af:  ldnull
        IL_00b0:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_00b5:  ldarg      0
        IL_00b9:  ldnull
        IL_00ba:  stfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_00bf:  br         IL_00d3

        IL_00c4:  ldloc.1
        IL_00c5:  ldc.i4     0x1
        IL_00ca:  add
        IL_00cb:  stloc.1
        IL_00cc:  ldloc.1
        IL_00cd:  ldloc.0
        IL_00ce:  blt        IL_0029

        IL_00d3:  leave      IL_00e2

      }  // end .try
      finally
      {
        IL_00d8:  ldarg      0
        IL_00dc:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_00e1:  endfinally
      }  // end handler
      IL_00e2:  ret
    } // end of method _IAdminSessionEvents_EventProvider::remove_OnEvent

    .method public specialname rtspecialname 
            instance void  .ctor(object A_1) cil managed
    {
      // Code size       28 (0x1c)
      .maxstack  4
      IL_0000:  ldarg      0
      IL_0004:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0009:  ldarg      0
      IL_000d:  ldarg      A_1
      IL_0011:  castclass  [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer
      IL_0016:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPointContainer
      IL_001b:  ret
    } // end of method _IAdminSessionEvents_EventProvider::.ctor

    .method public virtual instance void 
            Finalize() cil managed
    {
      // Code size       153 (0x99)
      .maxstack  5
      .locals init (int32 V_0,
               int32 V_1,
               class ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper V_2)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        .try
        {
          IL_0009:  ldarg      0
          IL_000d:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0012:  brfalse    IL_007e

          IL_0017:  ldarg      0
          IL_001b:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
          IL_0020:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::get_Count()
          IL_0025:  stloc.0
          IL_0026:  ldc.i4     0x0
          IL_002b:  stloc.1
          IL_002c:  ldc.i4     0x0
          IL_0031:  ldloc.0
          IL_0032:  bge        IL_006f

          IL_0037:  ldarg      0
          IL_003b:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
          IL_0040:  ldloc.1
          IL_0041:  callvirt   instance object [mscorlib]System.Collections.ArrayList::get_Item(int32)
          IL_0046:  castclass  ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper
          IL_004b:  stloc.2
          IL_004c:  ldarg      0
          IL_0050:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0055:  ldloc.2
          IL_0056:  ldfld      int32 ALLEGIANCESERVERLib._IAdminSessionEvents_SinkHelper::m_dwCookie
          IL_005b:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Unadvise(int32)
          IL_0060:  ldloc.1
          IL_0061:  ldc.i4     0x1
          IL_0066:  add
          IL_0067:  stloc.1
          IL_0068:  ldloc.1
          IL_0069:  ldloc.0
          IL_006a:  blt        IL_0037

          IL_006f:  ldarg      0
          IL_0073:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0078:  call       int32 [mscorlib]System.Runtime.InteropServices.Marshal::ReleaseComObject(object)
          IL_007d:  pop
          IL_007e:  leave      IL_0089

        }  // end .try
        catch [mscorlib]System.Exception 
        {
          IL_0083:  pop
          IL_0084:  leave      IL_0089

        }  // end handler
        IL_0089:  leave      IL_0098

      }  // end .try
      finally
      {
        IL_008e:  ldarg      0
        IL_0092:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_0097:  endfinally
      }  // end handler
      IL_0098:  ret
    } // end of method _IAdminSessionEvents_EventProvider::Finalize

    .method public virtual instance void 
            Dispose() cil managed
    {
      // Code size       19 (0x13)
      .maxstack  2
      IL_0000:  ldarg      0
      IL_0004:  callvirt   instance void ALLEGIANCESERVERLib._IAdminSessionEvents_EventProvider::Finalize()
      IL_0009:  ldarg      0
      IL_000d:  call       void [mscorlib]System.GC::SuppressFinalize(object)
      IL_0012:  ret
    } // end of method _IAdminSessionEvents_EventProvider::Dispose

  } // end of class _IAdminSessionEvents_EventProvider

  .class public auto ansi sealed IAdminSessionEvents_SinkHelper
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSessionEvents
  {
    .custom instance void [mscorlib]System.Runtime.InteropServices.ClassInterfaceAttribute::.ctor(valuetype [mscorlib]System.Runtime.InteropServices.ClassInterfaceType) = ( 01 00 00 00 00 00 00 00 ) 
    .field public class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler m_OnEventDelegate
    .field public int32 m_dwCookie
    .method public virtual instance void 
            OnEvent(class [Interop.AGCLib]AGCLib.IAGCEvent A_1) cil managed
    {
      // Code size       34 (0x22)
      .maxstack  2
      IL_0000:  ldarg      0
      IL_0004:  ldfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0009:  brfalse    IL_0021

      IL_000e:  ldarg      0
      IL_0012:  ldfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0017:  ldarg      A_1
      IL_001b:  callvirt   instance void ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler::Invoke(class [Interop.AGCLib]AGCLib.IAGCEvent)
      IL_0020:  ret

      IL_0021:  ret
    } // end of method IAdminSessionEvents_SinkHelper::OnEvent

    .method assembly specialname rtspecialname 
            instance void  .ctor() cil managed
    {
      // Code size       34 (0x22)
      .maxstack  4
      IL_0000:  ldarg      0
      IL_0004:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0009:  ldarg      0
      IL_000d:  ldc.i4     0x0
      IL_0012:  stfld      int32 ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_dwCookie
      IL_0017:  ldarg      0
      IL_001b:  ldnull
      IL_001c:  stfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
      IL_0021:  ret
    } // end of method IAdminSessionEvents_SinkHelper::.ctor

  } // end of class IAdminSessionEvents_SinkHelper

  .class private auto ansi sealed IAdminSessionEvents_EventProvider
         extends [mscorlib]System.Object
         implements ALLEGIANCESERVERLib.IAdminSessionEvents_Event,
                    [mscorlib]System.IDisposable
  {
    .field private class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer m_ConnectionPointContainer
    .field private class [mscorlib]System.Collections.ArrayList m_aEventSinkHelpers
    .field private class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint m_ConnectionPoint
    .method private instance void  Init() cil managed
    {
      // Code size       261 (0x105)
      .maxstack  5
      .locals init (class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint V_0,
               valuetype [mscorlib]System.Guid V_1,
               unsigned int8[] V_2)
      IL_0000:  ldnull
      IL_0001:  stloc.0
      IL_0002:  ldc.i4     0x10
      IL_0007:  newarr     [mscorlib]System.Byte
      IL_000c:  stloc.2
      IL_000d:  ldloc.2
      IL_000e:  ldc.i4     0x0
      IL_0013:  ldc.i4     0x56
      IL_0018:  stelem.i1
      IL_0019:  ldloc.2
      IL_001a:  ldc.i4     0x1
      IL_001f:  ldc.i4     0xd1
      IL_0024:  stelem.i1
      IL_0025:  ldloc.2
      IL_0026:  ldc.i4     0x2
      IL_002b:  ldc.i4     0x3e
      IL_0030:  stelem.i1
      IL_0031:  ldloc.2
      IL_0032:  ldc.i4     0x3
      IL_0037:  ldc.i4     0xde
      IL_003c:  stelem.i1
      IL_003d:  ldloc.2
      IL_003e:  ldc.i4     0x4
      IL_0043:  ldc.i4     0xa0
      IL_0048:  stelem.i1
      IL_0049:  ldloc.2
      IL_004a:  ldc.i4     0x5
      IL_004f:  ldc.i4     0x76
      IL_0054:  stelem.i1
      IL_0055:  ldloc.2
      IL_0056:  ldc.i4     0x6
      IL_005b:  ldc.i4     0x8e
      IL_0060:  stelem.i1
      IL_0061:  ldloc.2
      IL_0062:  ldc.i4     0x7
      IL_0067:  ldc.i4     0x4a
      IL_006c:  stelem.i1
      IL_006d:  ldloc.2
      IL_006e:  ldc.i4     0x8
      IL_0073:  ldc.i4     0x8c
      IL_0078:  stelem.i1
      IL_0079:  ldloc.2
      IL_007a:  ldc.i4     0x9
      IL_007f:  ldc.i4     0xfe
      IL_0084:  stelem.i1
      IL_0085:  ldloc.2
      IL_0086:  ldc.i4     0xa
      IL_008b:  ldc.i4     0x9e
      IL_0090:  stelem.i1
      IL_0091:  ldloc.2
      IL_0092:  ldc.i4     0xb
      IL_0097:  ldc.i4     0xd2
      IL_009c:  stelem.i1
      IL_009d:  ldloc.2
      IL_009e:  ldc.i4     0xc
      IL_00a3:  ldc.i4     0x6c
      IL_00a8:  stelem.i1
      IL_00a9:  ldloc.2
      IL_00aa:  ldc.i4     0xd
      IL_00af:  ldc.i4     0x3b
      IL_00b4:  stelem.i1
      IL_00b5:  ldloc.2
      IL_00b6:  ldc.i4     0xe
      IL_00bb:  ldc.i4     0xa
      IL_00c0:  stelem.i1
      IL_00c1:  ldloc.2
      IL_00c2:  ldc.i4     0xf
      IL_00c7:  ldc.i4     0x5e
      IL_00cc:  stelem.i1
      IL_00cd:  ldloca.s   V_1
      IL_00cf:  ldloc.2
      IL_00d0:  call       instance void [mscorlib]System.Guid::.ctor(unsigned int8[])
      IL_00d5:  ldarg      0
      IL_00d9:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPointContainer
      IL_00de:  ldloca.s   V_1
      IL_00e0:  ldloca.s   V_0
      IL_00e2:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer::FindConnectionPoint(valuetype [mscorlib]System.Guid&,
                                                                                                                                     class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint&)
      IL_00e7:  ldarg      0
      IL_00eb:  ldloc.0
      IL_00ec:  castclass  [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint
      IL_00f1:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
      IL_00f6:  ldarg      0
      IL_00fa:  newobj     instance void [mscorlib]System.Collections.ArrayList::.ctor()
      IL_00ff:  stfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
      IL_0104:  ret
    } // end of method IAdminSessionEvents_EventProvider::Init

    .method public virtual instance void 
            add_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) cil managed
    {
      // Code size       116 (0x74)
      .maxstack  6
      .locals init (class ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper V_0,
               int32 V_1)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        IL_0009:  ldarg      0
        IL_000d:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0012:  brtrue     IL_0020

        IL_0017:  ldarg      0
        IL_001b:  call       instance void ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::Init()
        IL_0020:  newobj     instance void ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::.ctor()
        IL_0025:  stloc.0
        IL_0026:  ldc.i4.0
        IL_0027:  stloc.1
        IL_0028:  ldarg      0
        IL_002c:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0031:  ldloc.0
        IL_0032:  castclass  [mscorlib]System.Object
        IL_0037:  ldloca.s   V_1
        IL_0039:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Advise(object,
                                                                                                                 int32&)
        IL_003e:  ldloc.0
        IL_003f:  ldloc.1
        IL_0040:  stfld      int32 ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_dwCookie
        IL_0045:  ldloc.0
        IL_0046:  ldarg      A_1
        IL_004a:  stfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_004f:  ldarg      0
        IL_0053:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0058:  ldloc.0
        IL_0059:  castclass  [mscorlib]System.Object
        IL_005e:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::Add(object)
        IL_0063:  pop
        IL_0064:  leave      IL_0073

      }  // end .try
      finally
      {
        IL_0069:  ldarg      0
        IL_006d:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_0072:  endfinally
      }  // end handler
      IL_0073:  ret
    } // end of method IAdminSessionEvents_EventProvider::add_OnEvent

    .method public virtual instance void 
            remove_OnEvent(class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler A_1) cil managed
    {
      // Code size       227 (0xe3)
      .maxstack  6
      .locals init (int32 V_0,
               int32 V_1,
               class ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper V_2)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        IL_0009:  ldarg      0
        IL_000d:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0012:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::get_Count()
        IL_0017:  stloc.0
        IL_0018:  ldc.i4     0x0
        IL_001d:  stloc.1
        IL_001e:  ldc.i4     0x0
        IL_0023:  ldloc.0
        IL_0024:  bge        IL_00d3

        IL_0029:  ldarg      0
        IL_002d:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0032:  ldloc.1
        IL_0033:  callvirt   instance object [mscorlib]System.Collections.ArrayList::get_Item(int32)
        IL_0038:  castclass  ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper
        IL_003d:  stloc.2
        IL_003e:  ldloc.2
        IL_003f:  ldfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_0044:  ldnull
        IL_0045:  beq        IL_00c4

        IL_004a:  ldloc.2
        IL_004b:  ldfld      class ALLEGIANCESERVERLib.IAdminSessionEvents_OnEventEventHandler ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_OnEventDelegate
        IL_0050:  ldarg      A_1
        IL_0054:  castclass  [mscorlib]System.Object
        IL_0059:  callvirt   instance bool [mscorlib]System.Delegate::Equals(object)
        IL_005e:  ldc.i4     0xff
        IL_0063:  and
        IL_0064:  ldc.i4     0x0
        IL_0069:  beq        IL_00c4

        IL_006e:  ldarg      0
        IL_0072:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_0077:  ldloc.1
        IL_0078:  callvirt   instance void [mscorlib]System.Collections.ArrayList::RemoveAt(int32)
        IL_007d:  ldarg      0
        IL_0081:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_0086:  ldloc.2
        IL_0087:  ldfld      int32 ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_dwCookie
        IL_008c:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Unadvise(int32)
        IL_0091:  ldloc.0
        IL_0092:  ldc.i4     0x1
        IL_0097:  bgt        IL_00d3

        IL_009c:  ldarg      0
        IL_00a0:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_00a5:  call       int32 [mscorlib]System.Runtime.InteropServices.Marshal::ReleaseComObject(object)
        IL_00aa:  pop
        IL_00ab:  ldarg      0
        IL_00af:  ldnull
        IL_00b0:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
        IL_00b5:  ldarg      0
        IL_00b9:  ldnull
        IL_00ba:  stfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
        IL_00bf:  br         IL_00d3

        IL_00c4:  ldloc.1
        IL_00c5:  ldc.i4     0x1
        IL_00ca:  add
        IL_00cb:  stloc.1
        IL_00cc:  ldloc.1
        IL_00cd:  ldloc.0
        IL_00ce:  blt        IL_0029

        IL_00d3:  leave      IL_00e2

      }  // end .try
      finally
      {
        IL_00d8:  ldarg      0
        IL_00dc:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_00e1:  endfinally
      }  // end handler
      IL_00e2:  ret
    } // end of method IAdminSessionEvents_EventProvider::remove_OnEvent

    .method public specialname rtspecialname 
            instance void  .ctor(object A_1) cil managed
    {
      // Code size       28 (0x1c)
      .maxstack  4
      IL_0000:  ldarg      0
      IL_0004:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0009:  ldarg      0
      IL_000d:  ldarg      A_1
      IL_0011:  castclass  [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer
      IL_0016:  stfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPointContainer ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPointContainer
      IL_001b:  ret
    } // end of method IAdminSessionEvents_EventProvider::.ctor

    .method public virtual instance void 
            Finalize() cil managed
    {
      // Code size       153 (0x99)
      .maxstack  5
      .locals init (int32 V_0,
               int32 V_1,
               class ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper V_2)
      IL_0000:  ldarg      0
      IL_0004:  call       void [mscorlib]System.Threading.Monitor::Enter(object)
      .try
      {
        .try
        {
          IL_0009:  ldarg      0
          IL_000d:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0012:  brfalse    IL_007e

          IL_0017:  ldarg      0
          IL_001b:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
          IL_0020:  callvirt   instance int32 [mscorlib]System.Collections.ArrayList::get_Count()
          IL_0025:  stloc.0
          IL_0026:  ldc.i4     0x0
          IL_002b:  stloc.1
          IL_002c:  ldc.i4     0x0
          IL_0031:  ldloc.0
          IL_0032:  bge        IL_006f

          IL_0037:  ldarg      0
          IL_003b:  ldfld      class [mscorlib]System.Collections.ArrayList ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_aEventSinkHelpers
          IL_0040:  ldloc.1
          IL_0041:  callvirt   instance object [mscorlib]System.Collections.ArrayList::get_Item(int32)
          IL_0046:  castclass  ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper
          IL_004b:  stloc.2
          IL_004c:  ldarg      0
          IL_0050:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0055:  ldloc.2
          IL_0056:  ldfld      int32 ALLEGIANCESERVERLib.IAdminSessionEvents_SinkHelper::m_dwCookie
          IL_005b:  callvirt   instance void [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint::Unadvise(int32)
          IL_0060:  ldloc.1
          IL_0061:  ldc.i4     0x1
          IL_0066:  add
          IL_0067:  stloc.1
          IL_0068:  ldloc.1
          IL_0069:  ldloc.0
          IL_006a:  blt        IL_0037

          IL_006f:  ldarg      0
          IL_0073:  ldfld      class [mscorlib]System.Runtime.InteropServices.UCOMIConnectionPoint ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::m_ConnectionPoint
          IL_0078:  call       int32 [mscorlib]System.Runtime.InteropServices.Marshal::ReleaseComObject(object)
          IL_007d:  pop
          IL_007e:  leave      IL_0089

        }  // end .try
        catch [mscorlib]System.Exception 
        {
          IL_0083:  pop
          IL_0084:  leave      IL_0089

        }  // end handler
        IL_0089:  leave      IL_0098

      }  // end .try
      finally
      {
        IL_008e:  ldarg      0
        IL_0092:  call       void [mscorlib]System.Threading.Monitor::Exit(object)
        IL_0097:  endfinally
      }  // end handler
      IL_0098:  ret
    } // end of method IAdminSessionEvents_EventProvider::Finalize

    .method public virtual instance void 
            Dispose() cil managed
    {
      // Code size       19 (0x13)
      .maxstack  2
      IL_0000:  ldarg      0
      IL_0004:  callvirt   instance void ALLEGIANCESERVERLib.IAdminSessionEvents_EventProvider::Finalize()
      IL_0009:  ldarg      0
      IL_000d:  call       void [mscorlib]System.GC::SuppressFinalize(object)
      IL_0012:  ret
    } // end of method IAdminSessionEvents_EventProvider::Dispose

  } // end of class IAdminSessionEvents_EventProvider


// =============================================================

} // end of namespace ALLEGIANCESERVERLib

//*********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file Interop.ALLEGIANCESERVERLib.res
