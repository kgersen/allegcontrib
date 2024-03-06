// DroneDlg.cpp : implementation file
//

#include "stdafx.h"
#include "ICE.h"
#include "corestruct.h"
#include "DroneDlg.h"
#include ".\dronedlg.h"


// CDroneDlg dialog

IMPLEMENT_DYNAMIC(CDroneDlg, CDialog)
CDroneDlg::CDroneDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDroneDlg::IDD, pParent)
{
	pdrone = NULL;
}

CDroneDlg::~CDroneDlg()
{
}

void CDroneDlg::DoDataExchange(CDataExchange* pDX)
{
	CString name,model,description;
	int shipuid,ss1,partuid;
	if (!pdrone) return;

	int uid = pdrone->uid;
	if (!pDX->m_bSaveAndValidate) // data to dialog
	{
		name = pdrone->name;
		model = pdrone->model;
		description = pdrone->description;
		shipuid = pdrone->ship_uid;
		ss1 = pdrone->ss1;
		partuid = pdrone->part_uid;
	}
	DDX_Text(pDX, IDC_COST, pdrone->cost);
	DDX_Text(pDX, IDC_RTIME, pdrone->research_time);

	DDX_Text(pDX, IDC_S1, pdrone->f1);
	DDX_Text(pDX, IDC_S2, pdrone->f2);
	DDX_Text(pDX, IDC_S3, pdrone->f3);

	DDX_Text(pDX, IDC_UID, uid);
	DDX_Text(pDX, IDC_NAME, name);
	DDX_Text(pDX, IDC_MODEL, model);
	DDX_Text(pDX, IDC_DESCRIPTION, description);
	DDX_Text(pDX, IDC_SHIPUID, shipuid);
	DDX_Text(pDX, IDC_BUILDUID, partuid);
	DDX_Text(pDX, IDC_SS1, ss1);

	if (pDX->m_bSaveAndValidate) // dialog to data
	{
		strcpy(pdrone->name,name);
		strcpy(pdrone->model,model);
		strncpy(pdrone->description,description,IGC_DESCRIPTIONMAX);
		pdrone->ship_uid = shipuid;
		pdrone->ss1 = ss1;
		pdrone->part_uid = partuid;
	}
	CDialog::DoDataExchange(pDX);
}

void CDroneDlg::OnClickedOk(void)
{
	CString oldname = pdrone->name;
	UpdateData(TRUE);
	CString newname = pdrone->name;
	if (oldname != newname)
		GetParent()->UpdateData(TRUE);
	UpdateData(FALSE);
}

void CDroneDlg::OnClickedCancel(void)
{
	UpdateData(FALSE);
}


BEGIN_MESSAGE_MAP(CDroneDlg, CDialog)
	ON_BN_CLICKED(IDOK, OnClickedOk)
	ON_BN_CLICKED(IDCANCEL, OnClickedCancel)
END_MESSAGE_MAP()


// CDroneDlg message handlers

BOOL CDroneDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	((CEdit *)GetDlgItem(IDC_DESCRIPTION))->SetLimitText(IGC_DESCRIPTIONMAX);
	((CEdit *)GetDlgItem(IDC_NAME))->SetLimitText(IGC_NAMEMAX);

	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}
