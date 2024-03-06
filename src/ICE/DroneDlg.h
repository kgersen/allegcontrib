#pragma once


// CDroneDlg dialog

class CDroneDlg : public CDialog
{
	DECLARE_DYNAMIC(CDroneDlg)

public:
	CDroneDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CDroneDlg();
	PtrCoreDrone pdrone;
// Dialog Data
	enum { IDD = IDD_DRONEDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
	void OnClickedOk(void);
	void OnClickedCancel(void);
	virtual BOOL OnInitDialog();
};
