#pragma once

enum {
    eMeshes         = 1,
    eMaterials      = 2,
	eOverwriteBMP	= 4
};

// DlgAMT dialog

class DlgAMT : public CDialog
{
	DECLARE_DYNAMIC(DlgAMT)

public:
	DlgAMT(CWnd* pParent = NULL);   // standard constructor
	virtual ~DlgAMT();

// Dialog Data
	enum { IDD = IDD_OPTIONS };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
public:
    CString GetPathName ();
    int GetOptionFlags ();

private:
    int     m_nFlags;
    CString m_sPathName;
public:
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedCancel();
	afx_msg void OnClose();
	afx_msg void OnBnClickedBtbrowse();
	afx_msg void OnBnClickedAbout();
	afx_msg void OnBnClickedBtmaterials();
};
