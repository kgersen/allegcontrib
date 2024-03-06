
freezoneauthps.dll: dlldata.obj freezoneauth_p.obj freezoneauth_i.obj
	link /dll /out:freezoneauthps.dll /def:freezoneauthps.def /entry:DllMain dlldata.obj freezoneauth_p.obj freezoneauth_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \
.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del freezoneauthps.dll
	@del freezoneauthps.lib
	@del freezoneauthps.exp
	@del dlldata.obj
	@del freezoneauth_p.obj
	@del freezoneauth_i.obj
