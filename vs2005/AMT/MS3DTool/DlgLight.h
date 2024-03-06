#pragma once


// CDlgLight dialog

class CDlgLight : public CDialog
{
	DECLARE_DYNAMIC(CDlgLight)

public:
	CDlgLight(CWnd* pParent = NULL);   // standard constructor
	virtual ~CDlgLight();

// Dialog Data
	enum { IDD = IDD_DLGLIGHT };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	CColorButton cbcol;

	DECLARE_MESSAGE_MAP()
public:
	int lSpeed;
	int red;
	int green;
	int blue;
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedBtcolor();
};
