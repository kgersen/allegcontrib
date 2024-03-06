#pragma once


// CAlephDlg dialog

class CAlephDlg : public CDialog
{
	DECLARE_DYNAMIC(CAlephDlg)

public:
	CAlephDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CAlephDlg();
public:
	CIGCAleph *curaleph;
	bool bTplMode;

// Dialog Data
	enum { IDD = IDD_ALEPHDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnInitDialog(void);
	void SetSpinCheck(void);
	void SetAutoCheck(void);
	DECLARE_MESSAGE_MAP()

	
public:
	void OnClickedDelete(void);
	void OnClickedApplytosect(void);
	void OnClickedApplytoall(void);
};
