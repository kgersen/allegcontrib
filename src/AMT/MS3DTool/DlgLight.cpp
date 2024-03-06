// DlgLight.cpp : implementation file
//

#include "stdafx.h"
#include "msAllegTool.h"
#include "ColorButton.h"
#include "DlgLight.h"

// CDlgLight dialog

IMPLEMENT_DYNAMIC(CDlgLight, CDialog)
CDlgLight::CDlgLight(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgLight::IDD, pParent)
	, lSpeed(0)
{
	red =0;
	green=0;
	blue=0;
}

CDlgLight::~CDlgLight()
{
}

void CDlgLight::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CDlgLight, CDialog)
	ON_BN_CLICKED(IDOK, OnBnClickedOk)
	ON_BN_CLICKED(IDC_BTCOLOR, OnBnClickedBtcolor)
END_MESSAGE_MAP()


// CDlgLight message handlers

BOOL CDlgLight::OnInitDialog()
{
	CDialog::OnInitDialog();


	VERIFY(cbcol.SubclassDlgItem(IDC_BTCOLOR, this));
	cbcol.ChangeColor((BYTE)red, (BYTE)green, (BYTE)blue);
	CSliderCtrl  *cs = (CSliderCtrl  *)GetDlgItem(IDC_SLSPEED);
	cs->SetRange(1,255);
	cs->SetPos(lSpeed);

	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgLight::OnBnClickedOk()
{
	CSliderCtrl  *cs = (CSliderCtrl  *)GetDlgItem(IDC_SLSPEED);
	lSpeed = cs->GetPos();

	red = GetRValue(cbcol.color);
	green = GetGValue(cbcol.color);
	blue = GetBValue(cbcol.color);
	OnOK();
}

void CDlgLight::OnBnClickedBtcolor()
{
	cbcol.ChangeColor();
}
