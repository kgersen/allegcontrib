# *****************************************************************************
# * 
# *****************************************************************************
!define MUI_ABORTWARNING

!define MUI_WELCOMEPAGE_TEXT "You're using this installer on your own risk. You might want to backup your complete \artwork directory before using it.\r\n\r\nThe uninstaller will remove the CortUI files and restore the replaced UI files as of version 1.8.5 of the freeallegiance.org-installer. It will *not* restore any files you edited before installing CortUI. But it will backup all replaced files before installing and before uninstalling (in the directory '\artwork\mods\CortUI\backup *').\r\n\r\nPlease contact me if you have any problems or feature requests for this installer or CortUI itself. (PM 'Cortex' at freeallegiance.org, e-mail: henrik@heimbuerger.de, ICQ: 14011335, MSN: h.heimbuerger@gmx.net)\r\n\r\n[Installer build: ${INSTALLER_BUILD}]"
!insertmacro MUI_PAGE_WELCOME


# *****************************************************************************
# * Welcome page
# *****************************************************************************
#Page custom openWelcome

# *****************************************************************************
# * Components selection page
# *****************************************************************************
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE cbLeaveComponentsPage
!insertmacro MUI_PAGE_COMPONENTS

# *****************************************************************************
# * Configuration page
# *****************************************************************************
Page custom openConfigurationScreen

# *****************************************************************************
# * Directory selection page
# *****************************************************************************
!insertmacro MUI_PAGE_DIRECTORY

# *****************************************************************************
# * Install files page
# *****************************************************************************
!insertmacro MUI_PAGE_INSTFILES

# *****************************************************************************
# * Finish page
# *****************************************************************************
#!define MUI_FINISHPAGE_RUN_TEXT "Run Allegiance"
#!define MUI_FINISHPAGE_RUN "$allegiancePath\ASGSClient.exe"
#!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_PAGE_CUSTOMFUNCTION_PRE cbPreFinishPage
!define MUI_FINISHPAGE_NOAUTOCLOSE
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Show Release Notes"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\mods\CortUI\# Release Notes.txt"
!define MUI_FINISHPAGE_SHOWREADME_CHECKED
!insertmacro MUI_PAGE_FINISH





# ===============================================================================  
# ===============================================================================  
# ===============================================================================  





# *****************************************************************************
# * Welcome page
# *****************************************************************************
!define MUI_WELCOMEPAGE_TEXT "You're using this uninstaller on your own risk. Hopefully, you have read the installer welcome page and have your \artwork directory backup ready now. ;)\r\n\r\nThe uninstaller will remove the CortUI files and restore the replaced UI files as of version 1.8.5 of the freeallegiance.org-installer. It will *not* restore any files you edited before installing CortUI. But there is a backup of all replaced files in the directory '\artwork\mods\CortUI\backup *').\r\n\r\nPlease contact me if you have any problems or feature requests for this installer or CortUI itself. (PM 'Cortex' at freeallegiance.org, e-mail: henrik@heimbuerger.de, ICQ: 14011335, MSN: h.heimbuerger@gmx.net)\r\n\r\n[Uninstaller build: ${INSTALLER_BUILD}]"

# *****************************************************************************
# * Custom options page
# *****************************************************************************
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE un.checkForAllegProcess
!insertmacro MUI_UNPAGE_COMPONENTS
#UninstPage custom un.openUninstallerOptions

# *****************************************************************************
# * Uninstall files page
# *****************************************************************************
!insertmacro MUI_UNPAGE_INSTFILES
