// About.cpp : implementation file
//
#include "stdafx.h"
#include "resource.h"
#include "msPlugIn.h"
#include "About.h"


// CAbout dialog

IMPLEMENT_DYNAMIC(CAbout, CDialog)
CAbout::CAbout(CWnd* pParent /*=NULL*/)
	: CDialog(CAbout::IDD, pParent)
{
}

CAbout::~CAbout()
{
}

void CAbout::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CAbout, CDialog)
END_MESSAGE_MAP()


// CAbout message handlers

BOOL CAbout::OnInitDialog()
{
	CDialog::OnInitDialog();

	CString s;
	s.Format("AMT 0.9 BETA");
	SetDlgItemText(IDC_ABOUT_CONTENT,s);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}
