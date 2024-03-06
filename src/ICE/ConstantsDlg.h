#pragma once


// CConstantsDlg dialog

class CConstantsDlg : public CDialog
{
	DECLARE_DYNAMIC(CConstantsDlg)

public:
	CConstantsDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CConstantsDlg();
	PtrCoreConstants pconst;
	PtrCore pcore;
// Dialog Data
	enum { IDD = IDD_CONSTANTSDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnCbnSelchangeDm();
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedCancel();
	afx_msg void OnLbnSelchangeGloballist();
	afx_msg void OnBnClickedGlobalset();
protected:
	bool bIniChanged;
	void BuildConstList(int);
	CString ConstLabs[IGCNUMC];
};
