#pragma once

#define LPCOLNAME 0
#define LPCOLTEAM 1
#define LPCOLSHIP 2
#define LPCOLWING 3
#define LPCOLSECTOR 4
#define LPCOLSTATE 5
#define LPCOLROLE 6

// CSvrUI dialog

class CSvrUI : public CDialog, public AGMEventsHandler
{
	DECLARE_DYNAMIC(CSvrUI)

public:
	CSvrUI(CWnd* pParent = NULL);   // standard constructor
	virtual ~CSvrUI();
	void OnAGCEvent(IAGCEvent*pEvent);
// Dialog Data
	enum { IDD = IDD_SVRUI };

protected:

	CAGMDlg dlg;
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	CString cArtPath;
	CString cServerPath;
	CServerCtrl *psctrl;
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedSvrbtparams();
	afx_msg void OnBnClickedSvrbtchange();
	afx_msg void OnTcnSelchangeTabmain(NMHDR *pNMHDR, LRESULT *pResult);
protected:
	int iCurTab;
	IAdminGamePtr iselgame;

protected:
	virtual void OnOK();
	virtual void OnCancel();
public:
	afx_msg void OnBnClickedChangecore();
	afx_msg void OnLbnSelchangeGameslist();
	afx_msg void OnBnClickedGamekill();
	afx_msg void OnBnClickedRefreshgl();
	afx_msg void OnLbnSelchangePlayerlist();
	afx_msg void OnBnClickedRefreshpl();
	afx_msg void OnBnClickedClearlog();
	afx_msg void OnLbnDblclkGameslist();
	afx_msg void OnBnClickedButton1();
	afx_msg void OnLvnItemchangedListplayers(NMHDR *pNMHDR, LRESULT *pResult);
};
