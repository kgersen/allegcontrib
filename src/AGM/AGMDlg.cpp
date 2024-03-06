// AGMDlg.cpp : implementation file
//
#include "stdafx.h"
#include "..\ICE\corestruct.h"
#include "AGM.h"
#include "AGMDlg.h"
#include "mapstruct.h"
//#include "MAPDlg.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


// CAGMDlg dialog



CAGMDlg::CAGMDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAGMDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	bModeCreate=false;
	pigccore = NULL;
}

void CAGMDlg::DoDataExchange(CDataExchange* pDX)
{
	DDX_Text(pDX, IDC_MapSize, gp_sMapSize);
	DDX_CBString(pDX, IDC_MapType, gp_sMap);
	int i;
	DDX_CBString(pDX, IDC_Teams,gp_wTeams);

	DDX_Check(pDX, IDC_IsConquest, gp_bIsGoalConquest);
	DDX_Check(pDX, IDC_IsDM, gp_bIsGoalTeamKills);
	DDX_Check(pDX, IDC_StatsCount, gp_bStatsCount);
	DDX_Check(pDX, IDC_SquadGame, gp_bSquadGame);

	DDX_CBString(pDX, IDC_DMKills,gp_wGoalTeamKills);

	DDX_Check(pDX, IDC_IsMoney, gp_bIsGoalTeamMoney);

	CComboBox *cbimbal = (CComboBox *)GetDlgItem(IDC_MaxImbalance);
	CComboBox *cbmoney = (CComboBox *)GetDlgItem(IDC_GoalMoney);
	// data to UI
	if (!pDX->m_bSaveAndValidate)
	{
		OnSelchangeTeams();
		OnBnClickedIsdm();
		OnBnClickedIsmoney();

		if (gp_wMaxImbalance == 32767)
			cbimbal->SetCurSel(0);
		else
			cbimbal->SetCurSel(gp_wMaxImbalance);
		cbmoney->SetCurSel(gp_lGoalTeamMoney-1);
	}
	for (i=0;i<GP_MAXTEAMS;i++)
	{
		// CAUTION: asumes that IDC_TeamName1,IDC_TeamName2,... are contigus values
		// as well as IDC_CivIDs1,IDC_CivIDs2,...
		DDX_Text(pDX, IDC_TeamName1+i,gp_sTeamName[i]);
		DDX_CBString(pDX, IDC_CivIDs1+i,gp_wCivIDs[i]);
	}
	DDX_CBString(pDX, IDC_TotalMaxPlayers,gp_wTotalMaxPlayers);
	DDX_CBString(pDX, IDC_MaxPlayers,gp_wMaxPlayers);
	DDX_CBString(pDX, IDC_MinPlayers,gp_wMinPlayers);

	DDX_Text(pDX, IDC_StartingMoney,gp_fStartingMoney);
	DDX_Text(pDX, IDC_He3Density,gp_fHe3Density);
	DDX_Text(pDX, IDC_GameLength,gp_fGameLength);
	DDX_CBString(pDX, IDC_NeutralSectorSpecialAsteroids,gp_wNeutralSectorSpecialAsteroids);
	DDX_CBString(pDX, IDC_PlayerSectorSpecialAsteroids,gp_wPlayerSectorSpecialAsteroids);
	DDX_CBString(pDX, IDC_NeutralSectorMineableAsteroids,gp_wNeutralSectorMineableAsteroids);
	DDX_CBString(pDX, IDC_PlayerSectorMineableAsteroids,gp_wPlayerSectorMineableAsteroids);
	DDX_CBString(pDX, IDC_NeutralSectorAsteroids,gp_wNeutralSectorAsteroids);
	DDX_CBString(pDX, IDC_PlayerSectorAsteroids,gp_wPlayerSectorAsteroids);

	DDX_CBString(pDX, IDC_MaxMinersPerTeam, gp_uMaxMinersPerTeam);
	DDX_CBString(pDX, IDC_InitialMinersPerTeam, gp_uInitialMinersPerTeam);

	DDX_Check(pDX, IDC_ShowMap,gp_bShowMap);
	DDX_Check(pDX, IDC_Drones,gp_bDrones);
	DDX_Check(pDX, IDC_AllowSupremacyPath,gp_bAllowSupremacyPath);
	DDX_Check(pDX, IDC_AllowTacticalPath,gp_bAllowTacticalPath);
	DDX_Check(pDX, IDC_AllowExpansionPath,gp_bAllowExpansionPath);
	DDX_Check(pDX, IDC_AllowShipyardPath,gp_bAllowShipyardPath);
	DDX_Check(pDX, IDC_EjectPods, gp_bEjectPods);
	DDX_Check(pDX, IDC_LockTeamSettings, gp_bLockTeamSettings);
	DDX_Check(pDX, IDC_LockGameOpen, gp_bLockGameOpen);
	DDX_Check(pDX, IDC_AllowEmptyTeams, gp_bAllowEmptyTeams);

	DDX_Check(pDX, IDC_PUBLICGAME, gp_bPublicGame);

	DDX_Check(pDX, IDC_FriendlyFire, gp_bFF);
	DDX_CBString(pDX, IDC_Lives, gp_wLives);


	DDX_Text(pDX, IDC_CustomMap, gp_sCustomMap);
	DDX_Text(pDX, IDC_GameName, gp_sGameName);
	DDX_Text(pDX, IDC_StoryText, gp_sStoryText);
	DDX_Text(pDX, IDC_EDITRES, m_res);

	DDX_Text(pDX, IDC_StaticCore, gp_sStaticFile);

	OnSelchangeMaptype();
	// UI to data
	if (pDX->m_bSaveAndValidate)
	{
		gp_wMaxImbalance = cbimbal->GetCurSel();
		if (gp_wMaxImbalance == 0) gp_wMaxImbalance = 32767;
		gp_lGoalTeamMoney = cbmoney->GetCurSel()+1;

		if ((gp_fStartingMoney<0.0) || (gp_fStartingMoney>9.0))
		{
			AfxMessageBox("Starting money must be between 0 and 9  - resetting to 1");
			SetDlgItemText(IDC_StartingMoney,"1.0");
			DDX_Text(pDX, IDC_StartingMoney,gp_fStartingMoney);
		}
		if ((gp_fHe3Density<0.0) || (gp_fHe3Density>9.0))
		{
			AfxMessageBox("Total money must be between 0 and 9  - resetting to 1");
			SetDlgItemText(IDC_He3Density,"1.0");
			DDX_Text(pDX, IDC_He3Density,gp_fHe3Density);
		}
	}

	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAGMDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUT_LOADREG, OnClickedButLoadreg)
	ON_BN_CLICKED(IDC_BUT_SAVEREG, OnClickedButSavereg)
	ON_BN_CLICKED(IDC_BUT_LOADFILE, OnClickedButLoadfile)
	ON_BN_CLICKED(IDC_BUT_SAVEFILE, OnClickedButSavefile)
//	ON_BN_CLICKED(IDC_BUT_About, OnClickedButAbout)
	//ON_BN_CLICKED(IDC_BUT_2H, OnClickedBut2h)
	//ON_BN_CLICKED(IDC_BUT_2F, OnClickedBut2f)
	ON_BN_CLICKED(IDC_BUT_MAP, OnClickedButMap)
	ON_CBN_SELCHANGE(IDC_MapType, OnSelchangeMaptype)
	//ON_BN_CLICKED(IDC_BUT_CORE, OnClickedButCore)
//	ON_BN_CLICKED(IDC_MAPEDIT, OnClickedMapedit)
	ON_CBN_SELCHANGE(IDC_Teams, OnSelchangeTeams)
	ON_BN_CLICKED(IDC_BUT_RESET, OnClickedButReset)
	ON_BN_CLICKED(IDOK, OnClickedOk)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_IsDM, OnBnClickedIsdm)
	ON_BN_CLICKED(IDC_IsConquest, OnBnClickedIsconquest)
	ON_BN_CLICKED(IDC_BUT_CORE, OnBnClickedButCore)
	ON_BN_CLICKED(IDC_IsMoney, OnBnClickedIsmoney)
	ON_CBN_SELCHANGE(IDC_GoalMoney, OnCbnSelchangeGoalmoney)
END_MESSAGE_MAP()


// CAGMDlg message handlers

BOOL CAGMDlg::OnInitDialog()
{

	CDialog::OnInitDialog();

	CComboBox *cbm = (CComboBox *)CWnd::GetDlgItem(IDC_MapType);
	cbm->ResetContent();
	for(int i=0;i<IGCMAXMAPS+1;i++) //remove +1 for custom off
		cbm->AddString(IGCMapTypeNames[i]);
	
	// TODO: SetLimitText on CEdit 
	CEdit *ce = (CEdit *)CWnd::GetDlgItem(IDC_CustomMap);
	ce->SetLimitText(12);
	ce = (CEdit *)CWnd::GetDlgItem(IDC_GameName);
	ce->SetLimitText(25);
	ce = (CEdit *)CWnd::GetDlgItem(IDC_StaticCore);
	ce->SetLimitText(11);

	//GetDlgItem(IDC_BUT_LOADREG)->EnableWindow(true);
	GetDlgItem(IDC_BUT_SAVEREG)->EnableWindow(bModeCreate);
	SetDlgItemText(IDOK,bModeCreate?"Cancel":"Close");
	SetDlgItemText(IDC_BUT_LOADREG,bModeCreate?"Load from registry":"Load from game");
	ServerCore(FALSE);

	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CAGMDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	CDialog::OnSysCommand(nID, lParam);
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CAGMDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CAGMDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CAGMDlg::ParamsToReg(IAGCGameParametersPtr iparams)
{
	HRESULT hr = E_FAIL;
	IPersistStreamInit* pIPersistStreamInit;

	if (iparams == NULL)
	{
		AfxMessageBox(_T("ParamsToFile : NULL AGCGameParametersPtr"));
		return;
	}
    hr = iparams->QueryInterface(IID_IPersistStreamInit, (void **)&pIPersistStreamInit);
    if (SUCCEEDED(hr))
	{
		ULARGE_INTEGER plarge;
		HANDLE pmem = NULL;
		LPBYTE pdata = NULL;
		DWORD psize = 4096;
		LONG regres;
		IStream* pIStream;

		pIPersistStreamInit->GetSizeMax(&plarge);
		psize = plarge.LowPart;
		pmem = GlobalAlloc(GHND,psize);
		if ((hr = CreateStreamOnHGlobal(pmem,FALSE,&pIStream)) == S_OK)
		{
			HKEY hKey;

			hr = pIPersistStreamInit->Save(pIStream,TRUE);

			pdata = (LPBYTE) GlobalLock(pmem);
			// now write pdata with psize to registry
			regres = RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Microsoft Games\\Allegiance\\1.0\\Server",0, KEY_WRITE, &hKey);
			if (regres != ERROR_SUCCESS)
			{
				m_res = "ERROR: Alleg server not found in registry)";
				UpdateData(FALSE);
			}
			else
			{
				regres = RegSetValueEx(hKey,"GameParameters",NULL,REG_BINARY,pdata,psize);
				RegCloseKey(hKey);
				m_res.FormatMessage("REGISTRY UPDATED (%1!d!,%2!d!)",psize,regres);
				UpdateData(FALSE);
			}
			pIStream->Release();
			GlobalUnlock(pmem);
		}
		else
		{
			m_res.FormatMessage("ERROR: hr = %1!x!",hr);
			UpdateData(FALSE);
		}
		pIPersistStreamInit->Release();
		if (pmem) GlobalFree(pmem);
	}
}

//--------------------------------------------------------------------------------
IAGCGameParametersPtr CAGMDlg::ParamsFromReg(void)
{
	HRESULT hr = E_FAIL;
	HANDLE pmem = NULL;
	LPBYTE pdata = NULL;
	DWORD psize = 32768;
	LONG regres;
	HKEY hKey;
	IAGCGameParametersPtr iparams = NULL;

	// read the parameters in the registry
	pmem = GlobalAlloc(GHND,psize);
	pdata = (LPBYTE) GlobalLock(pmem);
	regres = RegOpenKeyEx(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Microsoft Games\\Allegiance\\1.0\\Server",0, KEY_READ, &hKey);
	if (regres != ERROR_SUCCESS)
	{
		m_res = "Alleg server not found in registry)";
		UpdateData(FALSE);
		return NULL;
	}
	regres = RegQueryValueEx(hKey,"GameParameters",NULL,NULL,pdata,&psize);
	RegCloseKey(hKey);

	// create igpp based on the registry
	if (regres == ERROR_SUCCESS)
	{
		IStream* pIStream;
		IPersistStreamInit* pIPersistStreamInit;
		iparams = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
	    hr = iparams->QueryInterface(IID_IPersistStreamInit, (void **)&pIPersistStreamInit);
	    if (SUCCEEDED(hr))
		{
			if ((hr = CreateStreamOnHGlobal(pmem,FALSE,&pIStream)) == S_OK)
			{
				hr = pIPersistStreamInit->Load(pIStream);
				pIStream->Release();
				m_res.FormatMessage("Read from server");
				//UpdateData(FALSE);

			}
			else
			{
				m_res.FormatMessage("hr = %1!x!",hr);
				UpdateData(FALSE);
				iparams = NULL;
			}
		}
	}
	else
	{
		m_res.FormatMessage("regquery = %1!d!",regres) ;
		UpdateData(FALSE);
	}
	GlobalUnlock(pmem);
	if (pmem) GlobalFree(pmem);
	return iparams;
}

IAGCGameParametersPtr CAGMDlg::ParamsFromFile(CString sFilePath)
{
	HRESULT hr = E_FAIL;
	HANDLE pmem = NULL;
	LPBYTE pdata = NULL;
	DWORD psize = 32768;
	IAGCGameParametersPtr iparams = NULL;
	int rc;

	// read the parameters from the file
	pmem = GlobalAlloc(GHND,psize);
	pdata = (LPBYTE) GlobalLock(pmem);

	CFile cf(sFilePath,CFile::modeRead);
	rc = cf.Read(pdata,cf.GetLength());
	// create igpp based on the file
	if (rc == cf.GetLength())
	{
		IStream* pIStream;
		IPersistStreamInit* pIPersistStreamInit;
		iparams = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
	    hr = iparams->QueryInterface(IID_IPersistStreamInit, (void **)&pIPersistStreamInit);
	    if (SUCCEEDED(hr))
		{
			if ((hr = CreateStreamOnHGlobal(pmem,FALSE,&pIStream)) == S_OK)
			{
				hr = pIPersistStreamInit->Load(pIStream);
				pIStream->Release();
				m_res.FormatMessage("Read from file");
				//UpdateData(FALSE);

			}
			else
			{
				m_res.FormatMessage("hr = %1!x!",hr);
				AfxMessageBox(m_res);
				iparams = NULL;
			}
		}
	}
	else
	{
		AfxMessageBox("CANT READ AGM FILE !!!");
	}
	cf.Close();
	GlobalUnlock(pmem);
	if (pmem) GlobalFree(pmem);
	return iparams;
}

void CAGMDlg::ParamsToFile(IAGCGameParametersPtr iparams,CString sFilePath)
{
	HRESULT hr = E_FAIL;
	HANDLE pmem = NULL;
	char *pdata = NULL;
	IStream* pIStream;
	ULARGE_INTEGER psize;
	IPersistStreamInit* pIPersistStreamInit;

	if (iparams == NULL)
	{
		AfxMessageBox(_T("ParamsToFile : NULL AGCGameParametersPtr"));
		return;
	}
	m_res = "AGCGameParametersPtr (ok)";
	UpdateData(FALSE);
    hr = iparams->QueryInterface(IID_IPersistStreamInit, (void **)&pIPersistStreamInit);
    if (SUCCEEDED(hr))
	{
		m_res = "IPSI got (ok)";
		UpdateData(FALSE);
		pmem = GlobalAlloc(GHND,4096);
		if ((hr = CreateStreamOnHGlobal(pmem,FALSE,&pIStream)) == S_OK)
		{
			CFile fout(sFilePath,CFile::modeCreate | CFile::modeReadWrite);

			hr = pIPersistStreamInit->Save(pIStream,TRUE);
			pIStream->Release();

			pIPersistStreamInit->GetSizeMax(&psize);
			fout.Write(GlobalLock(pmem),psize.LowPart);
			fout.Close();
			m_res.FormatMessage("size written = %1!d!",psize.LowPart);
			UpdateData(FALSE);
			GlobalUnlock(pmem);

		}
		else
		{
			m_res.FormatMessage("hr = %1!x!",hr);
			UpdateData(FALSE);
		}
		pIPersistStreamInit->Release();
	}
	if (pmem) GlobalFree(pmem);
}

void CAGMDlg::ReleaseSvr(void)
{
	if (igpp != NULL) igpp = NULL;
}

// PutGP : store local game parameters to a AGCGameParameters object
#define fixBOOL(x) ((x)?-1:0)
void CAGMDlg::PutGP(IAGCGameParametersPtr iparams)
{
	short i;
	// get the values from the UI
	UpdateData(TRUE);
	// store them in the AGCGameParameters object
	iparams->PutGameName((LPCTSTR)gp_sGameName); // _bstr_t
	iparams->PutLockGameOpen(fixBOOL(gp_bLockGameOpen));				// BOOL
	iparams->PutInitialMinersPerTeam(atoi(gp_uInitialMinersPerTeam)); //unsigned char
	iparams->PutMaxMinersPerTeam(atoi(gp_uMaxMinersPerTeam));	//unsigned char
	gp_sStoryText.Replace("\r\n","\n");
	iparams->PutStoryText((LPCTSTR)gp_sStoryText);	// _bstr_t & h0Dh0A -> h0A
	gp_sStoryText.Replace("\n","\r\n");
	iparams->PutAllowSupremacyPath(fixBOOL(gp_bAllowSupremacyPath));	// BOOL
	iparams->PutAllowTacticalPath(fixBOOL(gp_bAllowTacticalPath));	// BOOL
	iparams->PutAllowExpansionPath(fixBOOL(gp_bAllowExpansionPath));	// BOOL
	iparams->PutAllowShipyardPath(fixBOOL(gp_bAllowShipyardPath));	// BOOL
	//iparams->PutIGCStaticFile((LPCTSTR)gp_sStaticFile);
	iparams->PutIsGoalConquest(fixBOOL(gp_bIsGoalConquest));
	iparams->PutIsGoalArtifacts(fixBOOL(gp_bIsGoalArtifacts));
	iparams->PutIsGoalTeamMoney(fixBOOL(gp_bIsGoalTeamMoney));
	iparams->PutGameLength(gp_fGameLength*60.0);
	if (gp_bIsGoalTeamMoney)
		iparams->PutGoalTeamMoney(gp_lGoalTeamMoney);
	else
	   //72000;144000;216000;288000;360000;432000;504000;576000;648000
		iparams->PutGoalTeamMoney(0);

	iparams->PutIsGoalTeamKills(fixBOOL(gp_bIsGoalTeamKills));
	iparams->PutAllowDevelopments(fixBOOL(TRUE));
	iparams->PutEjectPods(fixBOOL(gp_bEjectPods));
	if (gp_bIsGoalTeamKills)
	{
		iparams->PutGoalTeamKills(atoi(gp_wGoalTeamKills));
		if (!gp_bIsGoalConquest && !gp_bIsGoalTeamMoney)
			iparams->PutAllowDevelopments(fixBOOL(FALSE));
	}
	else
	{
		iparams->PutGoalTeamKills(0);
	}
	//iparams->PutIsGoalFlags(fixBOOL(gp_bIsGoalFlags));
	iparams->PutAllowFriendlyFire(fixBOOL(gp_bFF));
	short lives;
	if (gp_wLives == "Unlimited") lives = 32767; else lives = atoi(gp_wLives);
	iparams->PutLives(lives);
	//iparams->PutStations(
	//iparams->PutGoalArtifactsCount
	//iparams->PutGoalFlagsCount(gp_wGoalFlagsCount);
	//iparams->PutOverriddenTechBit (team, short iBitID, VARIANT_BOOL pVal )
	/*
	iparams->PutSetOverriddenTechBitRange (0,  89,  89, -1);
	iparams->PutSetOverriddenTechBitRange (1,  89,  89, -1);
	for (int j=89;j<89;j++)
	{
		iparams->PutOverriddenTechBit (0, j, -1 );
		iparams->PutOverriddenTechBit (1, j, -1 );
	}
	*/
	/*for (int j=0x20;j<0x22;j++)
	{
		bool alt = true;
		alt = !alt;
		iparams->PutOverriddenTechBit (0, j,alt);
	}*/
	//iparams->PutOverriddenTechBit (0, 33,TRUE);
	//iparams->PutOverriddenTechBit (0, 34,TRUE);
	//iparams->PutOverriddenTechBit (0, 35,TRUE);
	//iparams->PutSetOverriddenTechBitRange (team, short iBitID_First, short iBitID_Last, VARIANT_BOOL _arg4 )
	iparams->PutMapType(10); // set to Star whatever occurs later
	//iparams->PutMapSize(0);
	short mt = GetMapType(gp_sMap,gp_sCustomMap);
	if (mt == -1)
		iparams->PutCustomMap((LPCTSTR)gp_sCustomMap);
	else
	{
		iparams->PutMapType(mt);
		iparams->PutCustomMap("");
		iparams->PutMapSize(atoi(gp_sMapSize));
	}
	iparams->PutShowMap(fixBOOL(gp_bShowMap));
	iparams->PutDrones(fixBOOL(gp_bDrones));
	int lgp_wTeams = atoi(gp_wTeams);
	iparams->PutTeams(lgp_wTeams); // 2-6
	//iparams->PutScoresCount(-1);
	//iparams->PutDefaultCountdown(5);
	//iparams->PutDefaultCountdown(gp_wDefaultCountdown);		// seconds		
	//iparams->PutRestartCountdown(gp_wRestartCountdown);		// seconds

	iparams->PutMinPlayers(atoi(gp_wMinPlayers));    // unsigned char
	//iparams->PutMaxPlayers(atoi(gp_wMaxPlayers));    // unsigned char
	iparams->put_ScoresCount(fixBOOL(gp_bStatsCount));
	iparams->put_SquadGame(fixBOOL(gp_bSquadGame));
	iparams->PutIGCStaticFile((LPCTSTR)gp_sStaticFile);
	iparams->PutMaxPlayers(atoi(gp_wTotalMaxPlayers)/lgp_wTeams/*gp_uMaxPlayers*/);		// unsigned char
	iparams->PutTotalMaxPlayers(atoi(gp_wTotalMaxPlayers)); // 200
	iparams->PutLockTeamSettings(fixBOOL(gp_bLockTeamSettings));
	for (i=0;i<lgp_wTeams;i++)
	{
		iparams->PutTeamName(i,(LPCTSTR)(gp_sTeamName[i]));
		iparams->PutCivIDs(i,EncodeCivIDs(gp_wCivIDs[i]));
	}
	iparams->PutAllowEmptyTeams(fixBOOL(gp_bAllowEmptyTeams));
	iparams->PutMaxImbalance(gp_wMaxImbalance);

	iparams->PutStartingMoney(gp_fStartingMoney);
	iparams->PutHe3Density(gp_fHe3Density); 
	iparams->PutNeutralSectorSpecialAsteroids(atoi(gp_wNeutralSectorSpecialAsteroids)); //0-9
	iparams->PutPlayerSectorSpecialAsteroids(atoi(gp_wPlayerSectorSpecialAsteroids));  //0-9
	iparams->PutNeutralSectorMineableAsteroids(atoi(gp_wNeutralSectorMineableAsteroids));//0-9
	iparams->PutPlayerSectorMineableAsteroids(atoi(gp_wPlayerSectorMineableAsteroids)); //0-9
	iparams->PutNeutralSectorAsteroids(atoi(gp_wNeutralSectorAsteroids)); //0-39
	iparams->PutPlayerSectorAsteroids(atoi(gp_wPlayerSectorAsteroids)); // 0-39
}

// GetGP : set local game parameters from a AGCGameParameters object
#define FixBool(x) ((x)?TRUE:FALSE)
void CAGMDlg::GetGP(IAGCGameParametersPtr iparams)
{
	short i;
	char sbufconv[50];
	// store them in the AGCGameParameters object
	gp_sGameName = (char *)iparams->GetGameName(); // _bstr_t
	gp_bLockGameOpen = FixBool(iparams->GetLockGameOpen());				// BOOL
	gp_wDefaultCountdown = 500;//iparams->GetDefaultCountdown();		// seconds		
	gp_wRestartCountdown = 500;//iparams->GetRestartCountdown();		// seconds
	gp_uInitialMinersPerTeam = itoa(iparams->GetInitialMinersPerTeam(),sbufconv,10); //unsigned char
	gp_uMaxMinersPerTeam = itoa(iparams->GetMaxMinersPerTeam(),sbufconv,10);			//unsigned char
	//gp_bRandomWormholes = iparams->GetRandomWormholes();		// BOOL
	gp_sStoryText = (LPTSTR)iparams->GetStoryText();	// _bstr_t & h0A->h0Dh0A
	gp_sStoryText.Replace("\n","\r\n");
	gp_bAllowSupremacyPath= FixBool(iparams->GetAllowSupremacyPath());	// BOOL
	gp_bAllowTacticalPath= FixBool(iparams->GetAllowTacticalPath());	// BOOL
	gp_bAllowExpansionPath= FixBool(iparams->GetAllowExpansionPath());	// BOOL
	gp_bAllowShipyardPath= FixBool(iparams->GetAllowShipyardPath());	// BOOL
	gp_bEjectPods = FixBool(iparams->GetEjectPods());					// BOOL
	
	//gp_sStaticFile= (LPTSTR)iparams->GetIGCStaticFile();
	gp_bIsGoalConquest= FixBool(iparams->GetIsGoalConquest());
	gp_bIsGoalArtifacts= FALSE; //iparams->GetIsGoalArtifacts();
	gp_bIsGoalTeamMoney= FixBool(iparams->GetIsGoalTeamMoney());
	if (gp_bIsGoalTeamMoney)
		gp_lGoalTeamMoney = iparams->GetGoalTeamMoney();

	gp_bIsGoalTeamKills= FixBool(iparams->GetIsGoalTeamKills());
	gp_bIsGoalFlags= FALSE; //iparams->GetIsGoalFlags();
	gp_wGoalTeamKills = itoa(iparams->GetGoalTeamKills(),sbufconv,10);
	gp_bFF = FixBool(iparams->GetAllowFriendlyFire());
	gp_wLives = itoa(iparams->GetLives(),sbufconv,10);
	if (gp_wLives == "32767") gp_wLives = "Unlimited";

	//gp_wGoalFlagsCount= iparams->GetGoalFlagsCount();
	//iparams->GetOverriddenTechBit
	//iparams->GetSetOverriddenTechBitRange
	//iparams->GetAlephsPerSector();
	gp_fGameLength = iparams->GetGameLength()/60.0;
	//iparams->GetRandomEncounters();
	//iparams->GetNeutralSectors();
	//iparams->GetAlephPositioning();
	gp_sMap     = IGCMapTypeNames[iparams->GetMapType()];
	gp_sMapSize = itoa(iparams->GetMapSize(),sbufconv,10);
	gp_sCustomMap= (LPTSTR)iparams->GetCustomMap();
	if (gp_sCustomMap != "")
	{
		gp_sMap = IGCMapTypeNames[IGCMAXMAPS]; // set to custom
	}
	gp_bShowMap= FixBool(iparams->GetShowMap());
	gp_bDrones= FixBool(iparams->GetDrones());
	int lgp_wTeams = iparams->GetTeams();
	gp_wTeams = itoa(lgp_wTeams,sbufconv,10); // 2-6
	for (i=0;i<lgp_wTeams;i++)
	{
		gp_sTeamName[i]= (LPTSTR)(iparams->GetTeamName(i));
		gp_wCivIDs[i]= DecodeCivIDs(iparams->GetCivIDs(i));
	}
	gp_wTotalMaxPlayers= itoa(iparams->GetTotalMaxPlayers(),sbufconv,10);
	gp_wMinPlayers= itoa(iparams->GetMinPlayers(),sbufconv,10);
	gp_wMaxPlayers= itoa(iparams->GetTotalMaxPlayers()/lgp_wTeams,sbufconv,10);//iparams->GetMaxPlayers();		unsigned char
	gp_bStatsCount = FixBool(iparams->GetScoresCount());
	gp_bSquadGame = FixBool(iparams->GetSquadGame());
	gp_sStaticFile = (LPCTSTR)iparams->GetIGCStaticFile();

	gp_bLockTeamSettings= FixBool(iparams->GetLockTeamSettings());

	gp_bAllowEmptyTeams= FixBool(iparams->GetAllowEmptyTeams());
	gp_wMaxImbalance= iparams->GetMaxImbalance();

	gp_fStartingMoney= iparams->GetStartingMoney();
	gp_fHe3Density= iparams->GetHe3Density();
	gp_wNeutralSectorSpecialAsteroids= itoa(iparams->GetNeutralSectorSpecialAsteroids(),sbufconv,10); //0-9
	gp_wPlayerSectorSpecialAsteroids= itoa(iparams->GetPlayerSectorSpecialAsteroids(),sbufconv,10);  //0-9
	gp_wNeutralSectorMineableAsteroids= itoa(iparams->GetNeutralSectorMineableAsteroids(),sbufconv,10);//0-9
	gp_wPlayerSectorMineableAsteroids= itoa(iparams->GetPlayerSectorMineableAsteroids(),sbufconv,10); //0-9
	gp_wNeutralSectorAsteroids= itoa(iparams->GetNeutralSectorAsteroids(),sbufconv,10); //0-39
	gp_wPlayerSectorAsteroids= itoa(iparams->GetPlayerSectorAsteroids(),sbufconv,10); // 0-39

	// update the UI
	UpdateData(FALSE);
}

void CAGMDlg::OnClickedButLoadreg(void)
{
	// TODO: Add your control notification handler code here
	/*m_svrrunning = FixBool(iashp->GetIsAllSrvRunning());
	if (m_svrrunning)
	{
		AfxMessageBox("WARNING: Server is running");
	}*/
	IAGCGameParametersPtr ligp = NULL;
	if (bModeCreate)
		ligp = ParamsFromReg();
	else
	{
		if (igame)
			ligp = igame->GameParameters;
		else
			ligp = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
		//igame->get_GameParameters(&ligp);
	}
	if (ligp !=NULL)
		GetGP(ligp);
	ligp = NULL;
}

void CAGMDlg::OnClickedButSavereg(void)
{
	/*m_svrrunning = FixBool(iashp->GetIsAllSrvRunning());
	if (m_svrrunning)
	{
		AfxMessageBox("ERROR: Server is running. Cant save parameters. Shut down the server and retry.");
		return;
	}*/

	//IAGCGameParametersPtr ligp = ParamsFromReg();
	IAGCGameParametersPtr ligp = NULL;
	if (igame)
		ligp = igame->GameParameters;
	else
		ligp = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
    if (ligp != NULL)
	{
		PutGP(ligp);
		IAdminGamesPtr igames = iserver->GetGames();
		iserver->PutPublicLobby(gp_bPublicGame);
		HRESULT hr = igames->Add(ligp);
		igames = NULL;
		ParamsToReg(ligp);
		EndDialog(IDOK);
	}
	else
			AfxMessageBox(_T("Cant read game parameters"));
	ligp = NULL;
	// AfxMessageBox("Parameters saved. You can now start the game.");
}

void CAGMDlg::OnClickedButLoadfile(void)
{
	CString startpath = "*.agm";

	CFileDialog cfd(TRUE,"agm",startpath,OFN_FILEMUSTEXIST|OFN_NOCHANGEDIR|OFN_NONETWORKBUTTON,"AGM file|*.agm|",this,OPENFILENAME_SIZE_VERSION_400);
	
	if (cfd.DoModal() == IDOK)
	{
		IAGCGameParametersPtr ligp = ParamsFromFile(cfd.GetPathName());
		if (ligp)
			GetGP(ligp);
		ligp = NULL;
	}
}

void CAGMDlg::OnClickedButSavefile(void)
{
	CString startpath = "*.agm";
	CFileDialog cfd(FALSE,"agm",startpath,OFN_NOCHANGEDIR|OFN_NONETWORKBUTTON|OFN_OVERWRITEPROMPT,"AGM file|*.agm|",this,OPENFILENAME_SIZE_VERSION_400);
	if (cfd.DoModal() == IDOK)
	{
		IAGCGameParametersPtr ligp = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
		if (ligp != NULL)
		{
			PutGP(ligp);
			ParamsToFile(ligp,cfd.GetPathName());
		}
		else
				AfxMessageBox(_T("Cant save to file !!!"));
		ligp = NULL;
		}
}

//void CAGMDlg::OnClickedButAbout(void)
//{
//	CAboutDlg dlgAbout;
//	dlgAbout.DoModal();
//}


/*  rix   = 201 belt  = 101 bios  = 35 ic    = 25 giga  = 18 */

void CAGMDlg::InitCivIDs(void)
{
	int i;
	CComboBox *clb;

	// put cslval in the .Data of the CB CivIDs*
	for (i=0;i<GP_MAXTEAMS;i++)
	{
		// CAUTION: asumes that IDC_TeamName1,IDC_TeamName2,... are contigus values
		// as well as IDC_CivIDs1,IDC_CivIDs2,...
		clb = (CComboBox *) CWnd::GetDlgItem(IDC_CivIDs1+i);
		clb->ResetContent();
		clb->AddString(DecodeCivIDs(-1));
		for (int j=0;j<pigccore->cl_Civs.GetSize();j++)
		{
			PtrCoreCiv pciv = pigccore->cl_Civs.GetAt(j);
			int idx = clb->AddString(pciv->name);
			clb->SetItemData(idx,pciv->uid);
		}
	}
	// fill in the prosperity values
	clb = (CComboBox *) CWnd::GetDlgItem(IDC_GoalMoney);
	clb->ResetContent();
	float pval = pigccore->pConstants->constants[IGCCPROSPERITY];
	for (int i=1;i<=9;i++)
	{
		CString s;
		s.Format("%g",i*pval);
		clb->AddString(s);
	}
}
#define sTCivNone "-selectable-"
short CAGMDlg::EncodeCivIDs(CString& csCiv)
{
	if (csCiv == sTCivNone) return -1;
	for (int j=0;j<pigccore->cl_Civs.GetSize();j++)
	{
		PtrCoreCiv pciv = pigccore->cl_Civs.GetAt(j);
		if (csCiv == pciv->name)
			return pciv->uid;
	}
	AfxMessageBox(_T("Bad faction name"));
	return 0;
}
LPCTSTR CAGMDlg::DecodeCivIDs(short civ)
{
	if (civ==-1) return sTCivNone;
	for (int j=0;j<pigccore->cl_Civs.GetSize();j++)
	{
		PtrCoreCiv pciv = pigccore->cl_Civs.GetAt(j);
		if (civ == pciv->uid)
			return pciv->name;
	}
	AfxMessageBox(_T("Bad faction id"));
	return NULL;
}


//void CAGMDlg::OnClickedBut2h(void)
//{
//	float f;
//	unsigned char *pf;
//	pf = (unsigned char *)&f;
//	UpdateData(TRUE);
//	f = (float)atof(gp_sGameName);
//	m_res.FormatMessage("%1!02X!-%1!02X!-%3!02X!-%4!02X!",(int)pf[0],(int)pf[1],(int)pf[2],(int)pf[3]);
//	UpdateData(FALSE);
//}

//void CAGMDlg::OnClickedBut2f(void)
//{
//	float f;
//	unsigned char *pf;
//	unsigned int b1,b2,b3,b4;
//	pf = (unsigned char *)&f;
//	UpdateData(TRUE);
//	sscanf(gp_sGameName,"%x-%x-%x-%x",&b1,&b2,&b3,&b4);
//	pf[0] = b1;
//	pf[1] = b2;
//	pf[2] = b3;
//	pf[3] = b4;
//	m_res.FormatMessage("%1!d!.%2!d!",(int)floor(f),(int)(((double)f-floor(f))*1000.0));
//	UpdateData(FALSE);
//}

void CAGMDlg::OnClickedButMap(void)
{
	CString startpath = cArtPath + "\\*.igc";

	CFileDialog cfd(TRUE,"igc",startpath,OFN_FILEMUSTEXIST|OFN_NOCHANGEDIR|OFN_NONETWORKBUTTON,"Allegiance Map|*.igc|",this,OPENFILENAME_SIZE_VERSION_400);
	//cfd.Set
	if (cfd.DoModal() == IDOK)
	{
		CString pathName = cfd.GetPathName();
		CString fileTitle = cfd.GetFileTitle();
		if ((fileTitle == "static_core") ||
			(fileTitle == "zone_core") ||
			(fileTitle == "training_1") ||
			(fileTitle == "training_3") ||
			(fileTitle == "training_5"))
		{
			CString mes;
			if ((fileTitle[0] != 't'))
				mes.Format("%s is not an Allegiance map",fileTitle);
			else
				mes.Format("%s is a map used by the training missions in Allegiance. Make a copy of it if you want to use it",fileTitle);

			AfxMessageBox(_T(mes));
		}
		else
		{
			if (strlen(fileTitle) >12)
			{
				AfxMessageBox(_T("Map name is too long (max is 12 characters)"));
			}
			else
			{
				CEdit * cemap = (CEdit *)CWnd::GetDlgItem(IDC_CustomMap);
				cemap->SetSel(0,-1);
				cemap->ReplaceSel(fileTitle);
			}
		}
	}
}
// launch the map editor
//void CAGMDlg::OnClickedMapedit(void)
//{
//	CMAPDlg mdlg;
//	mdlg.cArtPath = cArtPath;
//	mdlg.sCorename = gp_sStaticFile + ".igc";
//	mdlg.pcore = pigccore;
//	mdlg.DoModal();
//}

// map handling
short CAGMDlg::GetMapType(CString mapname, CString cmap)
{
	if (mapname == IGCMapTypeNames[IGCMAXMAPS]) // custom
	{
		if (cmap == "")
		{
			AfxMessageBox(_T("Error: map set to CUSTOM and no custom map\nReseting to 'Star'"));
			CComboBox *cbm = (CComboBox *)CWnd::GetDlgItem(IDC_MapType);
			cbm->SetCurSel(10); // Star
			UpdateData(TRUE); // update the screen (pig way)
			return 10; //star
		}
		return -1; // Custom
	}
	else
	{
		for (int i=0;i<IGCMAXMAPS;i++)
			if (mapname == IGCMapTypeNames[i])
				return i;
	}
	return -1; //should not be reached
}


void CAGMDlg::OnSelchangeMaptype(void)
{
	// TODO: Add your control notification handler code here
	CComboBox *cbm = (CComboBox *)CWnd::GetDlgItem(IDC_MapType);
	if (cbm->GetCurSel() != IGCMAXMAPS)
	{
		// allow custommap controls
		CWnd::GetDlgItem(IDC_CustomMap)->ShowWindow(SW_HIDE);
		CWnd::GetDlgItem(IDC_S_CUSTMAP)->ShowWindow(SW_HIDE);
		CWnd::GetDlgItem(IDC_BUT_MAP)->ShowWindow(SW_HIDE);

	}
	else
	{
		// hide customap controls
		CWnd::GetDlgItem(IDC_CustomMap)->ShowWindow(SW_SHOWNA);
		CWnd::GetDlgItem(IDC_S_CUSTMAP)->ShowWindow(SW_SHOWNA);
		CWnd::GetDlgItem(IDC_BUT_MAP)->ShowWindow(SW_SHOWNA);
	}

}

void CAGMDlg::OnSelchangeTeams(void)
{
	// TODO: Add your control notification handler code here
	CComboBox * cbteams = (CComboBox *)CWnd::GetDlgItem(IDC_Teams);
	CComboBox * cbtmp = (CComboBox *)CWnd::GetDlgItem(IDC_TotalMaxPlayers);
	int idx = cbtmp->GetCurSel();
	cbtmp->ResetContent();
	int nbteams = cbteams->GetCurSel(); // its #teams -1 in fact
	if (nbteams == CB_ERR) nbteams = 1; // assume init
	for (int i=0;i<TotalMaxPlayersEntries[nbteams];i++)
		cbtmp->AddString(TotalMaxPlayersLists[nbteams][i]);

	cbtmp->SetCurSel(TotalMaxPlayersEntries[nbteams]-1); // set to max

	// teams (crappy)
	CComboBox * cbcivs[4];
	CEdit     * cbtname[4];
	CWnd      * cblname[4];
	cbcivs[0]  = (CComboBox *)CWnd::GetDlgItem(IDC_CivIDs3);
	cbtname[0] = (CEdit *)CWnd::GetDlgItem(IDC_TeamName3);	
	cblname[0] = GetDlgItem(IDC_STATIC_TEAM3);
	cbcivs[1]  = (CComboBox *)CWnd::GetDlgItem(IDC_CivIDs4);
	cbtname[1] = (CEdit *)CWnd::GetDlgItem(IDC_TeamName4);	
	cblname[1] = GetDlgItem(IDC_STATIC_TEAM4);
	cbcivs[2]  = (CComboBox *)CWnd::GetDlgItem(IDC_CivIDs5);
	cbtname[2] = (CEdit *)CWnd::GetDlgItem(IDC_TeamName5);	
	cblname[2] = GetDlgItem(IDC_STATIC_TEAM5);
	cbcivs[3]  = (CComboBox *)CWnd::GetDlgItem(IDC_CivIDs6);
	cbtname[3] = (CEdit *)CWnd::GetDlgItem(IDC_TeamName6);	
	cblname[3] = GetDlgItem(IDC_STATIC_TEAM6);

	for (i=0;i<4;i++)
	{
		if (i > nbteams-1)
		{
			cbcivs[i]->ShowWindow(SW_HIDE);
			cbtname[i]->ShowWindow(SW_HIDE);
			cblname[i]->ShowWindow(SW_HIDE);
		}
		else
		{
			CString s;
			cbcivs[i]->ShowWindow(SW_SHOWNA);
			cbtname[i]->ShowWindow(SW_SHOWNA);
			cblname[i]->ShowWindow(SW_SHOWNA);
			if (cbcivs[i]->GetCurSel() == CB_ERR)
				cbcivs[i]->SetCurSel(0);
			cbtname[i]->GetWindowText(s);
			if (s=="")
			{
				s.Format("Team %d",i+3);
				cbtname[i]->SetWindowText(s);
			}

		}
	}
}

void CAGMDlg::OnClickedButReset(void)
{
	IAGCGameParametersPtr ligp = IAGCGameParametersPtr(__uuidof(AGCGameParameters));
	if (ligp)
			GetGP(ligp);
	ligp = NULL;
}

void CAGMDlg::OnCancel(void)
{
	// trap escape

	//CDialog::OnCancel();
}

void CAGMDlg::OnOK(void)
{
	// trap return

	//CDialog::OnOK();
}

void CAGMDlg::OnClickedOk(void)
{
	EndDialog(IDOK);
}

void CAGMDlg::OnClose(void)
{
	// 
	EndDialog(IDOK);
	//CDialog::OnClose();
}

void CAGMDlg::OnBnClickedIsdm()
{
	CButton *iscq = (CButton *)GetDlgItem(IDC_IsConquest);
	CButton *isdm = (CButton *)GetDlgItem(IDC_IsDM);
	CButton *ism = (CButton *)GetDlgItem(IDC_IsMoney);
	CComboBox *dmkills = (CComboBox *)GetDlgItem(IDC_DMKills);
	if (isdm->GetCheck() == BST_CHECKED)
	{
		dmkills->ShowWindow(SW_SHOWNA);
		if (dmkills->GetCurSel() == CB_ERR)
			dmkills->SetCurSel(0);
	}
	else
	{
		dmkills->ShowWindow(SW_HIDE);
		if ((iscq->GetCheck() != BST_CHECKED) && (ism->GetCheck() != BST_CHECKED))
		{
			iscq->SetCheck(BST_CHECKED);
		}
	}
}

void CAGMDlg::OnBnClickedIsconquest()
{
	CButton *iscq = (CButton *)GetDlgItem(IDC_IsConquest);
	CButton *isdm = (CButton *)GetDlgItem(IDC_IsDM);
	CButton *ism = (CButton *)GetDlgItem(IDC_IsMoney);

	if (iscq->GetCheck() != BST_CHECKED)
	{
		if ((isdm->GetCheck() != BST_CHECKED) && (ism->GetCheck() != BST_CHECKED))
		{
			iscq->SetCheck(BST_CHECKED);
		}
	}
}

void CAGMDlg::OnBnClickedIsmoney()
{
	CButton *iscq = (CButton *)GetDlgItem(IDC_IsConquest);
	CButton *isdm = (CButton *)GetDlgItem(IDC_IsDM);
	CButton *ism = (CButton *)GetDlgItem(IDC_IsMoney);
	CComboBox *gm = (CComboBox *)GetDlgItem(IDC_GoalMoney);
	if (ism->GetCheck() != BST_CHECKED)
	{
		gm->ShowWindow(SW_HIDE);

		if ((isdm->GetCheck() != BST_CHECKED) && (iscq->GetCheck() != BST_CHECKED))
			iscq->SetCheck(BST_CHECKED);
	}
	else
	{
		gm->ShowWindow(SW_SHOW);	
		if (gm->GetCurSel() == CB_ERR)
			gm->SetCurSel(0);
	}
}

void CAGMDlg::OnBnClickedButCore()
{
	CString oldcore = gp_sStaticFile;
	UpdateData(TRUE);
	if (oldcore == gp_sStaticFile) return;
	IAdminSessionHelperPtr iashp = IAdminSessionHelperPtr(__uuidof(AdminSessionHelper));
	m_svrrunning = FixBool(iashp->GetIsAllSrvRunning());
	iashp = NULL;
	if (m_svrrunning)
	{
		AfxMessageBox("ERROR: Server is running, cant continue");
		gp_sStaticFile = oldcore;
		UpdateData(FALSE);
		return;
	}
	if (AfxMessageBox(_T("WARNING: POSSIBLE VIOLATION OF MICROSOFT EULA\r\n\r\nAGM is going to modify a file that is protected by the End Use Licence Agreement of Allegiance.\r\nBy clicking 'Yes' you and you only take the full responsability of this modification.\r\nIn any way, the author of AGM can be involved in this violation.\r\n"),MB_YESNO|MB_DEFBUTTON2) == IDNO)
	{
		gp_sStaticFile = oldcore;
		UpdateData(FALSE);
		return;
	}
	ServerCore(TRUE);
}

void CAGMDlg::ServerCore(bool DoPatch)
{

	CString allegname = cServerPath;
	allegname += "\\AllSrv32.exe";
	CFile allegserver;
	CFileException e;

	DWORD dummy;
	DWORD infosize;
	infosize = GetFileVersionInfoSize(allegname.GetBuffer(),&dummy);
	if (!infosize)
	{
		AfxMessageBox(_T("FATAL ERROR getting AllSrv32.exe version size"));
		return;
	}
	BYTE *verbuff = new BYTE[infosize];

	if (!GetFileVersionInfo(allegname.GetBuffer(), dummy, infosize, verbuff ))
	{
		AfxMessageBox(_T("FATAL ERROR reading AllSrv32.exe version"));
		return;
	}
	VS_FIXEDFILEINFO *fileinfo;
	UINT fileinfosize;
	if(! VerQueryValue(
			verbuff, // buffer for version resource
			TEXT("\\"),   // value to retrieve
			(LPVOID *)&fileinfo,  // buffer for version value pointer
			&fileinfosize         // version length
		))
	{
		AfxMessageBox(_T("FATAL ERROR reading AllSrv32.exe version block info"));
		return;
	}
	DWORD lover = fileinfo->dwFileVersionLS;
	DWORD hiver = fileinfo->dwFileVersionMS;

	if ((hiver != 65536) && ((lover != 4) || (lover != 3004)))
	{
		AfxMessageBox(_T("FATAL ERROR: this version of AGM only works with Allegiance Server version 1.0.0.4 or 1.0.0.3004\\n"));
		return;
	}
	delete verbuff;

	CFileStatus status;
	bool basok = CFile::GetStatus( allegname, status ); 
	CTime ctime = status.m_ctime;
	CTime mtime = status.m_mtime;
	if (DoPatch)
		basok = basok && allegserver.Open(allegname,CFile::modeReadWrite | CFile::shareExclusive,&e);
	else
		basok = basok && allegserver.Open(allegname,CFile::modeRead | CFile::shareDenyNone,&e);
	
	if (!basok)
	{
		if (DoPatch) {
			AfxMessageBox(_T("FATAL ERROR opening AllSrv32.exe (make sure no process use this file)"));
			ServerCore(false); // revert
			return;
		}
		else
		{
			AfxMessageBox(_T("FATAL ERROR opening AllSrv32.exe"));
			#ifdef _DEBUG
				afxDump << "File could not be opened " << e.m_cause << "\n";
			#endif
			EndDialog(IDCANCEL);
			return;
		}
	}
	ULONGLONG corepos = 417504;
	if (lover == 4)
		corepos = 417512;
	// allegserver.Seek(417504,CFile::begin); // position for version 1.0.0.3004
	// allegserver.Seek(417512,CFile::begin); // position for version 1.0.0.4
	allegserver.Seek(corepos,CFile::begin); 
	char buff[12+4];
	allegserver.Read(buff,12); // allsrv32.exe, offset 417504 size=12
	if (!DoPatch)
		gp_sStaticFile = buff;

	PtrCore oldcore = pigccore;
	pigccore = new CIGCCore;
	if (!pigccore->ReadFromFile(cArtPath + "\\" + gp_sStaticFile + ".igc"))
	{
		CString errmsg;
		errmsg = "FATAL ERROR: can not load or bad server IGC core ("+gp_sStaticFile+".igc)";
		errmsg += "\nMake sure you're using version 1.0.0.4 or 1.0.0.3004 of the server";
		AfxMessageBox(errmsg);
		delete pigccore;
		pigccore = oldcore; // revert the loaded core
		oldcore = NULL;
		gp_sStaticFile = buff;
		DoPatch = false; // bad core file, abort pending patch (if any)
		if (!pigccore) 
		{
			allegserver.Close();
			return;
		}
	}

	if (DoPatch) // patch the server
	{
		allegserver.Seek(corepos,CFile::begin);
		char buff[12+4];
		for (int i=0;i<12+4;i++) buff[i] = 0;
		strcpy(buff,gp_sStaticFile);
		allegserver.Write(buff,12); // allsrv32.exe, offset corepos, size=12
		
		AfxMessageBox("New core is now active");
	}
	if (oldcore) delete oldcore; // discard old loaded core
	allegserver.Close();
	if (DoPatch)
	{
		basok = CFile::GetStatus( allegname, status ); 
		if (basok)
		{
			status.m_ctime = ctime;
			status.m_mtime = mtime;
			CFile::SetStatus(allegname,status);
		}
		else
			AfxMessageBox("Warning: couldnt set the server date/time");
	}
	InitCivIDs();
	OnClickedButLoadreg();
}


void CAGMDlg::OnCbnSelchangeGoalmoney()
{
	// TODO: Add your control notification handler code here
}

