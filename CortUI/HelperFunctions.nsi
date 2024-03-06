Function un.checkForAllegProcess
	tryagainCheckProcess:
		FindProcDLL::FindProc "Allegiance.exe"
		IntCmp $R0 0 endCheckProcess
		IntCmp $R0 1 allegProcessFound allegProcessGeneralError

	allegProcessFound:
		MessageBox MB_ABORTRETRYIGNORE|MB_ICONSTOP|MB_DEFBUTTON2 "Allegiance seems to be running. CortUI can *not* be uninstalled while Allegiance is running! Please close Allegiance and retry."IDIGNORE endCheckProcess IDRETRY tryagainCheckProcess
		Abort

	allegProcessGeneralError:
		MessageBox MB_ABORTRETRYIGNORE|MB_ICONSTOP|MB_DEFBUTTON2 "An error occured while trying to check whether the Allegiance process is running. CortUI can *not* be uninstalled while Allegiance is running!"IDIGNORE endCheckProcess IDRETRY tryagainCheckProcess
		Abort

	endCheckProcess:
FunctionEnd



Function backupCoreFiles
  Call GetLocalTime
  Pop $0
  Pop $1
  Pop $2
  Pop $3
  Pop $4
  Pop $5
  Pop $6
  StrCpy $7 "$2.$1.$0 $4.$5.$6"
  StrCpy $8 "$INSTDIR\mods\CortUI\Backup $7\"
  CreateDirectory $8
  CopyFiles /silent "$INSTDIR\dialog.mdl" $8
  CopyFiles /silent "$INSTDIR\hangar.mdl" $8
  CopyFiles /silent "$INSTDIR\loadoutpane.mdl" $8
  CopyFiles /silent "$INSTDIR\missionbrief.mdl" $8
  CopyFiles /silent "$INSTDIR\partinfo.mdl" $8
  CopyFiles /silent "$INSTDIR\teamscreen.mdl" $8
  IfFileExists "$INSTDIR\cortui_settings.mdl" 0 +2
    CopyFiles /silent "$INSTDIR\cortui_settings.mdl" $8
FunctionEnd



#Function un.backupCoreFiles
#  Call un.GetLocalTime
#  Pop $0
#  Pop $1
#  Pop $2
#  Pop $3
#  Pop $4
#  Pop $5
#  Pop $6
#  StrCpy $7 "$2.$1.$0 $4.$5.$6"
#  StrCpy $8 "$INSTDIR\mods\CortUI\Backup $7\"
#  CreateDirectory $8
#  CopyFiles /silent "$INSTDIR\dialog.mdl" $8
#  CopyFiles /silent "$INSTDIR\hangar.mdl" $8
#  CopyFiles /silent "$INSTDIR\loadoutpane.mdl" $8
#  CopyFiles /silent "$INSTDIR\missionbrief.mdl" $8
#  CopyFiles /silent "$INSTDIR\partinfo.mdl" $8
#  CopyFiles /silent "$INSTDIR\teamscreen.mdl" $8
#  IfFileExists "$INSTDIR\cortui_settings.mdl" 0 +2
#    CopyFiles /silent "$INSTDIR\cortui_settings.mdl" $8
#FunctionEnd



;Functions
Function setSettings
	ClearErrors
	FileOpen $3 $settingsFilename "r"
	GetTempFileName $R0
	FileOpen $4 $R0 "w"
	loop:
	   FileRead $3 $5
	   IfErrors done
#MessageBox MB_ICONEXCLAMATION|MB_OK "|$5|"
	   StrCmp $5 "NumChatLinesLobby = ?;$\r$\n" 0 +3
	      FileWrite $4 "NumChatLinesLobby = $settingsNumChatLinesLobby;$\r$\n"
	      Goto loop
	   StrCmp $5 "NumChatLinesGlobal = ?;$\r$\n" 0 +3
	      FileWrite $4 "NumChatLinesGlobal = $settingsNumChatLinesGlobal;$\r$\n"
	      Goto loop
	   StrCmp $5 "NumChatLinesLoadout = ?;$\r$\n" 0 +3
	      FileWrite $4 "NumChatLinesLoadout = $settingsNumChatLinesLoadout;$\r$\n"
	      Goto loop
	   StrCmp $5 "AlwaysShowLoadoutWindow = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsAlwaysShowLoadoutWindow"
	      FileWrite $4 "AlwaysShowLoadoutWindow = $settingsAlwaysShowLoadoutWindow;$\r$\n"
	      Goto loop
	   StrCmp $5 "ShowMinimapAtLoadoutScreen = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsShowMinimapAtLoadoutScreen"
	      FileWrite $4 "ShowMinimapAtLoadoutScreen = $settingsShowMinimapAtLoadoutScreen;$\r$\n"
	      Goto loop
	   StrCmp $5 "ShowLastOrders = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsShowLastOrders"
	      FileWrite $4 "ShowLastOrders = $settingsShowLastOrders;$\r$\n"
	      Goto loop
	   StrCmp $5 "ShowScrollbarOnCockpitChat = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsShowScrollbar"
	      FileWrite $4 "ShowScrollbarOnCockpitChat = $settingsShowScrollbar;$\r$\n"
	      Goto loop
	   StrCmp $5 "SoftwareHUDMode = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsSoftwareHUDMode"
	      FileWrite $4 "SoftwareHUDMode = $settingsSoftwareHUDMode;$\r$\n"
	      Goto loop
	   StrCmp $5 "NormalHUDMode = ?;$\r$\n" 0 +3
#MessageBox MB_ICONEXCLAMATION|MB_OK "settingsNormalHUDMode"
	      FileWrite $4 "NormalHUDMode = $settingsNormalHUDMode;$\r$\n"
	      Goto loop
	   FileWrite $4 $5
	   Goto loop
	
	done:
	   FileClose $3
	   FileClose $4
	   Delete $settingsFilename
	   CopyFiles /SILENT $R0 $settingsFilename
	   Delete $R0

FunctionEnd



Function un.RemoveBackupDirectories
	FindFirst $1 $2 "$0\Backup *"
	loop:
		!ifdef DEBUG
			MessageBox MB_ICONEXCLAMATION|MB_OK "$0\$2"
		!endif
		StrCmp $2 "" done
		RMDir /r "$0\$2"
		#DetailPrint $2
		FindNext $1 $2
		Goto loop
	done:

FunctionEnd
