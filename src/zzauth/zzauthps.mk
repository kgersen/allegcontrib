
zzauthps.dll: dlldata.obj zzauth_p.obj zzauth_i.obj
	link /dll /out:zzauthps.dll /def:zzauthps.def /entry:DllMain dlldata.obj zzauth_p.obj zzauth_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \
.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del zzauthps.dll
	@del zzauthps.lib
	@del zzauthps.exp
	@del dlldata.obj
	@del zzauth_p.obj
	@del zzauth_i.obj
