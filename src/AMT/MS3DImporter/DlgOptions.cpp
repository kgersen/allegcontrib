#include "stdafx.h"
#include "resource.h"
#include "DlgOptions.h"



#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif



//======================================================================
// constructor
//======================================================================
cDlgOptions::cDlgOptions(CWnd* pParent /*=NULL*/)
	: CDialog(IDD_OPTIONS, pParent)
{
	//{{AFX_DATA_INIT(cDlgOptions)
	//}}AFX_DATA_INIT
}

//======================================================================
// DoDataExchange
//======================================================================
void cDlgOptions::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(cDlgOptions)
	//}}AFX_DATA_MAP
}



//======================================================================
// Message Map
//======================================================================
BEGIN_MESSAGE_MAP(cDlgOptions, CDialog)
	//{{AFX_MSG_MAP(cDlgOptions)
    ON_BN_CLICKED(IDC_BTBROWSE,     OnBrowse)
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()



//======================================================================
// OnInitDialog
//======================================================================
BOOL cDlgOptions::OnInitDialog() 
{
	CDialog::OnInitDialog();
    CDialog::CenterWindow();

    m_nFlags = eCVHToo ;
    m_sPathName.Empty();

    CheckDlgButton (IDC_CVHTOO, TRUE);
	
	CString sabout = "AMT Beta 0.94\r\nBugs report www.alleg.net/AMT.htm\r\nKGJV - kgersen@hotmail.com";
	SetDlgItemText(IDC_MSGBOX,sabout);
	return TRUE;
}

//======================================================================
// OnClose
//======================================================================
void cDlgOptions::OnClose() 
{
	OnCancel ();
}

//======================================================================
// OnCancel
//======================================================================
void cDlgOptions::OnCancel() 
{
	CDialog::OnCancel();
}

//======================================================================
// OnOK
//======================================================================
void cDlgOptions::OnOK() 
{
    GetDlgItemText (IDC_FILENAME, m_sPathName);

    m_nFlags = 0;
    if (IsDlgButtonChecked (IDC_CVHTOO))
        m_nFlags |= eCVHToo;

	CDialog::OnOK();
}

//======================================================================
// OnBrowse
//======================================================================
void cDlgOptions::OnBrowse() 
{
    //
    // choose filename
    //
    CFileDialog fileDlg (TRUE, "cvh", NULL, OFN_HIDEREADONLY | OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST,
                         "Allegiance MDL Files (*.mdl)|*.mdl|Allegiance CVH Files (*.cvh)|*.cvh|All Files (*.*)|*.*||", this, OPENFILENAME_SIZE_VERSION_400);
    if (!fileDlg.DoModal ())
        m_sPathName.Empty ();
    else
        m_sPathName = fileDlg.GetPathName ();

    SetDlgItemText (IDC_FILENAME, m_sPathName);
	    CButton *cb = (CButton *)GetDlgItem(IDC_CVHTOO);
	if (m_sPathName.Right(3) != "mdl")
	{
		cb->ShowWindow(SW_HIDE);
	}
	else
	{
		cb->ShowWindow(SW_SHOWNA);
	}

}

//======================================================================
// GetPathName
//======================================================================
CString cDlgOptions::GetPathName() 
{
    return m_sPathName;
}

//======================================================================
// GetPathName
//======================================================================
int cDlgOptions::GetOptionFlags() 
{
    return m_nFlags;
}
