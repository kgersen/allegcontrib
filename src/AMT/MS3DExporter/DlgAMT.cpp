// DlgAMT.cpp : implementation file
//

#include "stdafx.h"
#include "resource.h"
#include "msPlugIn.h"
#include "DlgAMT.h"
#include "About.h"


// DlgAMT dialog

IMPLEMENT_DYNAMIC(DlgAMT, CDialog)
DlgAMT::DlgAMT(CWnd* pParent /*=NULL*/)
	: CDialog(DlgAMT::IDD, pParent)
{
}

DlgAMT::~DlgAMT()
{
}

void DlgAMT::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(DlgAMT, CDialog)
	ON_BN_CLICKED(IDOK, OnBnClickedOk)
	ON_BN_CLICKED(IDCANCEL, OnBnClickedCancel)
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTBROWSE, OnBnClickedBtbrowse)
	ON_BN_CLICKED(IDC_ABOUT, OnBnClickedAbout)
	ON_BN_CLICKED(IDC_BTMATERIALS, OnBnClickedBtmaterials)
END_MESSAGE_MAP()


// DlgAMT message handlers

BOOL DlgAMT::OnInitDialog()
{
	CDialog::OnInitDialog();
    CDialog::CenterWindow();

    m_nFlags = eMeshes | eMaterials;
    m_sPathName.Empty();

    CheckDlgButton (IDC_BTMESHES, TRUE);
    CheckDlgButton (IDC_BTMATERIALS, TRUE);
	CheckDlgButton (IDC_OVERWRITEBMP, FALSE);

	return TRUE;
}

void DlgAMT::OnBnClickedOk()
{
    GetDlgItemText (IDC_FILENAME, m_sPathName);

    m_nFlags = 0;
    if (IsDlgButtonChecked (IDC_BTMESHES))
        m_nFlags |= eMeshes;
    if (IsDlgButtonChecked (IDC_BTMATERIALS))
        m_nFlags |= eMaterials;
    if (IsDlgButtonChecked (IDC_OVERWRITEBMP))
        m_nFlags |= eOverwriteBMP;

	CDialog::OnOK();
}

void DlgAMT::OnBnClickedCancel()
{
	OnCancel();
}

void DlgAMT::OnClose()
{
	OnCancel ();
}

void DlgAMT::OnBnClickedBtbrowse()
{
    //
    // choose filename
    //
    CFileDialog fileDlg (FALSE, "mdl", NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST,
                         "Allegianc MDL Files (*.mdl)|*.mdl|Allegianc CVH Files (*.cvh)|*.cvh|All Files (*.*)|*.*||",this,OPENFILENAME_SIZE_VERSION_400);
    if (!fileDlg.DoModal ())
        m_sPathName.Empty ();
    else
        m_sPathName = fileDlg.GetPathName ();

    SetDlgItemText (IDC_FILENAME, m_sPathName);
}
//======================================================================
// GetPathName
//======================================================================
CString DlgAMT::GetPathName() 
{
    return m_sPathName;
}

//======================================================================
// GetPathName
//======================================================================
int DlgAMT::GetOptionFlags() 
{
    return m_nFlags;
}


void DlgAMT::OnBnClickedAbout()
{
	CAbout dlg(this);
	dlg.DoModal();
}

void DlgAMT::OnBnClickedBtmaterials()
{
	CButton *cb = (CButton *) GetDlgItem(IDC_OVERWRITEBMP);
	if (IsDlgButtonChecked(IDC_BTMATERIALS))
		cb->ShowWindow(SW_SHOWNA);
	else
		cb->ShowWindow(SW_HIDE);
}
