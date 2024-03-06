#pragma once


// CAMTDlg dialog

class CAMTDlg : public CDialog
{
	DECLARE_DYNAMIC(CAMTDlg)

public:
	CAMTDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CAMTDlg();
// Dialog Data
	enum { IDD = IDD_AMTDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	msModel *pModel;
protected:
	void RefreshLists();
	CListBox *clMDL;
	CListBox *clCVH;
	CListBox *clGROUPS;
	CListBox *clJOINTS;
	CListBox *clPOS;
	CListBox *clFRAMES;
	CListBox *clLIGHTS;
	CTabCtrl *ctFL;
	void LBtoLB(CListBox *lbFrom, CListBox *lbTo, CString sTag, bool AddTag);
	void GroupsShow(CString,bool);
public:
	afx_msg void OnBnClickedBtmdltoobj();
	afx_msg void OnBnClickedBtobjtomdl();
	afx_msg void OnBnClickedBtcvhtoobj();
	afx_msg void OnBnClickedBtobjtocvh();
	afx_msg void OnTcnSelchangeTabfl(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnLbnDblclkLlights();
	afx_msg void OnBnClickedBtjtopos();
	afx_msg void OnBnClickedBtpostoj();
	afx_msg void OnBnClickedBtlftoj();
	afx_msg void OnBnClickedBtjtolf();
	afx_msg void OnLbnDblclkLcvh();
	afx_msg void OnBnClickedBthidemdl();
	afx_msg void OnBnClickedBthidegroup();
	afx_msg void OnBnClickedBthidecvh();
	afx_msg void OnBnClickedBtaddpos();
	afx_msg void OnBnClickedBtshowmdl();
	afx_msg void OnBnClickedBtshowgroup();
	afx_msg void OnBnClickedBtshowcvh();
};
