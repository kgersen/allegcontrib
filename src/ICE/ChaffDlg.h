#pragma once


// CChaffDlg dialog

class CChaffDlg : public CDialog
{
	DECLARE_DYNAMIC(CChaffDlg)

public:
	CChaffDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CChaffDlg();
	PtrCoreCounter pcounter;
	PtrCore pcore;
// Dialog Data
	enum { IDD = IDD_CHAFFDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	void OnClickedDecodesel(void);
	void OnClickedDecodeh(void);
	void OnClickedOk(void);
	void OnClickedCancel(void);
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedUsem0();
};
