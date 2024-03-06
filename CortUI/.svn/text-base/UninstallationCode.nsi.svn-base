Section -un.Uninstall

  ReadRegStr $INSTDIR HKLM "Software\CortUI" "InstallDir"
  StrCpy $OUTDIR $INSTDIR

#  Call un.backupCoreFiles
SectionEnd



Section /o "${SECTIONTITLE_UN_CORTUI}" UN_SECIDX_CORTUI
  	File unCode\*
    Delete "$INSTDIR\cortui_settings.mdl"
    RMDir /r "$INSTDIR\mods\CortUI\media"
    Delete "$INSTDIR\mods\CortUI\# Release Notes.txt"
SectionEnd



Section /o "${SECTIONTITLE_UN_REMOVEBACKUPS}" UN_SECIDX_REMOVEBACKUPS
  	StrCpy $0 "$INSTDIR\mods\CortUI"
	Call un.RemoveBackupDirectories
SectionEnd



Section "${SECTIONTITLE_UN_REMOVEUNINSTALLER}" UN_SECIDX_REMOVEUNINSTALLER
    Delete "$INSTDIR\mods\CortUI\Uninstall.exe"
    DeleteRegKey HKLM "Software\CortUI"
    DeleteRegKey HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\CortUI"
SectionEnd



Section -un.Uninstall
	!ifdef DEBUG
		MessageBox MB_OK "removing $INSTDIR\mods\CortUI"
	!endif

	#SetOutPath "$INSTDIR\mods"
	RMDir "$INSTDIR\mods\CortUI"
SectionEnd



Function un.onInit
	ReadRegStr $isCortUIInstalled HKLM "Software\CortUI" "isCortUIInstalled"
	StrCmp $isCortUIInstalled "1" 0 dont
		!insertmacro SetSectionFlag ${UN_SECIDX_CORTUI} ${SF_SELECTED}
	dont:

  SectionSetSize ${UN_SECIDX_CORTUI} 0
FunctionEnd
