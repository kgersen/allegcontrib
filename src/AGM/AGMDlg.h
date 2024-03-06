// AGMDlg.h : header file
//

#pragma once

#define GP_MAXTEAMS (6)
const int TotalMaxPlayersEntries[GP_MAXTEAMS-1] = {11,10,9,8,7};
const CString TotalMaxPlayersLists[GP_MAXTEAMS-1][13] =
{
	{"2","4","8","12","16","20","24","30","32","58","200","200"}, //2
	{"3","6","9","12","15","18","24","30","57","63","126"},      //3
	{"4","8","12","16","20","24","32","56","64","128"},          //4
	{"5","10","15","20","25","30","55","60","125"},              //5
	{"6","12","18","24","30","54","60","120"}                    //6
};
// CAGMDlg dialog
class CAGMDlg : public CDialog
{
// Construction
public:
	CAGMDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_AGM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
	BOOL m_svrrunning;
	IAGCGameParametersPtr igpp;
	//IAdminSessionPtr ias;
	//------------------------------------------------------------------------
	CString gp_sGameName; // 28 chars max
	BOOL gp_bLockGameOpen;
	short gp_wDefaultCountdown;
	short gp_wRestartCountdown;
	CString gp_uInitialMinersPerTeam;
	CString gp_uMaxMinersPerTeam;
	bool gp_bRandomWormholes;
	CString gp_sStoryText;
	BOOL gp_bAllowSupremacyPath;
	BOOL gp_bAllowTacticalPath;
	BOOL gp_bAllowExpansionPath;
	BOOL gp_bAllowShipyardPath;
	BOOL gp_bEjectPods;
	CString gp_sStaticFile; // zone_core or static_core
	BOOL gp_bIsGoalConquest;
	BOOL gp_bIsGoalArtifacts;
	BOOL gp_bIsGoalTeamMoney;
	BOOL gp_bIsGoalTeamKills;
	BOOL gp_bIsGoalFlags;
	float gp_fGameLength;
	short gp_wGoalFlagsCount;
	CString gp_wGoalTeamKills;
	AGCMoney gp_lGoalTeamMoney;
	BOOL gp_bFF; // new in 1.0 final
	CString gp_wLives;
	CString gp_fProperity;
	CString gp_wArtifacts;
	CString gp_wFlags;
	CString gp_wTerritory;
	BOOL gp_bStatsCount;
	BOOL gp_bSquadGame;
	CString gp_wMinPlayers;
	CString gp_wMaxPlayers;
	CString gp_wTotalMaxPlayers;
	BOOL gp_bLockTeamSettings;
	CString gp_sCustomMap;  // custom map filename without the ".igc"
	BOOL gp_bShowMap;
	BOOL gp_bDrones;
	CString gp_wTeams;
	CString gp_sTeamName[GP_MAXTEAMS]; // 24 chars max
	CString gp_wCivIDs[GP_MAXTEAMS];   /* rix= 201,belt=101,bios=35,ic=25,giga=18 */
	BOOL gp_bAllowEmptyTeams;
	short gp_wMaxImbalance;
	float gp_fStartingMoney;
	float gp_fHe3Density;
	CString gp_wNeutralSectorSpecialAsteroids;
	CString gp_wPlayerSectorSpecialAsteroids;
	CString gp_wNeutralSectorMineableAsteroids;
	CString gp_wPlayerSectorMineableAsteroids;
	CString gp_wNeutralSectorAsteroids;
	CString gp_wPlayerSectorAsteroids;
	BOOL gp_bPublicGame;
// ------------------------------------------------------------------------------
public:
	//void OnClickedButton1(void);
	void ParamsToReg(IAGCGameParametersPtr);
	IAGCGameParametersPtr ParamsFromReg(void);
	void ParamsToFile(IAGCGameParametersPtr,CString);
	IAGCGameParametersPtr ParamsFromFile(CString);
	void ReleaseSvr(void);
protected:
	CString m_res;
	void PutGP(IAGCGameParametersPtr);
	void GetGP(IAGCGameParametersPtr);
public:
	void OnClickedButLoadreg(void);
	void OnClickedButSavereg(void);
	void OnClickedButLoadfile(void);
	void OnClickedButSavefile(void);
//	void OnClickedButAbout(void);
protected:
	void InitCivIDs(void);
	short EncodeCivIDs(CString&);
	LPCTSTR DecodeCivIDs(short);
public:
	//void OnClickedBut2h(void);
	//void OnClickedBut2f(void);
	void OnClickedButMap(void);
protected:
	CString gp_sMap;
public:
	CString gp_sMapSize;
protected:
	short GetMapType(CString,CString);
public:
	void OnSelchangeMaptype(void);
//	void OnClickedMapedit(void);
	CString cArtPath;
	CString cServerPath;
	CIGCCore *pigccore;
	void OnSelchangeTeams(void);
	void OnClickedButReset(void);
	IAdminGamePtr igame;
	IAdminServerPtr iserver;
protected:
	void OnCancel(void);
	void OnOK(void);
public:
	void OnClickedOk(void);
	afx_msg void OnClose(void);
	afx_msg void OnBnClickedIsdm();
	afx_msg void OnBnClickedIsconquest();
	afx_msg void OnBnClickedButCore();
	void ServerCore(bool);
	afx_msg void OnBnClickedIsmoney();
	afx_msg void OnCbnSelchangeGoalmoney();
public:
	bool bModeCreate;
};
