// ConstantsDlg.cpp : implementation file
//

#include "stdafx.h"
#include "ICE.h"
#include "corestruct.h"
#include "ConstantsDlg.h"


// CConstantsDlg dialog

IMPLEMENT_DYNAMIC(CConstantsDlg, CDialog)
CConstantsDlg::CConstantsDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CConstantsDlg::IDD, pParent)
{
	pconst = NULL;
	pcore = NULL;
	bIniChanged = true;
}

CConstantsDlg::~CConstantsDlg()
{
}

void CConstantsDlg::DoDataExchange(CDataExchange* pDX)
{
	if (pconst == NULL) return;
	if (pcore == NULL) return;
	CComboBox *cbdm = (CComboBox *)GetDlgItem(IDC_DM);
	int idx = cbdm->GetCurSel();
	if (!pDX->m_bSaveAndValidate) // data to dialog
	{
		CString usedby;
		usedby = "Used by:\r\n";
		if (idx == 0)
			usedby.AppendFormat("Collisions\r\n");
		
		for (int i=0;i<pcore->cl_Projectiles.GetCount();i++)
		{
				PtrCoreProjectile pproj = pcore->cl_Projectiles.GetAt(i);
				if (pproj->DM  == idx)
				{
					// usedby.AppendFormat("Projectile - p #%d ",pproj->uid);

					// display weapon that use this projectil
					for (int j=0;j<pcore->cl_Parts.GetSize();j++)
					{
						PtrCorePart ppart = pcore->cl_Parts.GetAt(j);
						if ((ppart->type == AGCEquipmentType_Weapon) && (!ppart->isspec))
						{
							if (ppart->specs.wep.wep_projectile_uid == pproj->uid)
								usedby.AppendFormat("Weapon - %s (%d) (projectile - p #%d)\r\n",ppart->name,ppart->uid,pproj->uid);
						}
					}
					for (int j=0;j<pcore->cl_Probes.GetSize();j++)
					{
						PtrCoreProbe pprobe = pcore->cl_Probes.GetAt(j);
						if (pprobe->stats_projectile == pproj->uid)
								usedby.AppendFormat("%s (%d) (projectile - p #%d)\r\n",pprobe->name,pprobe->uid,pproj->uid);
					}
				}
		}
		for (int i=0;i<pcore->cl_Mines.GetCount();i++)
		{
			PtrCoreMine pmine = pcore->cl_Mines.GetAt(i);
			if (pmine->DM == idx)
				usedby.AppendFormat("Mine - %s (%d)\r\n",pmine->name,pmine->uid);
		}
		for (int i=0;i<pcore->cl_Missiles.GetCount();i++)
		{
			PtrCoreMissile pmis = pcore->cl_Missiles.GetAt(i);
			if (pmis->DM == idx)
				usedby.AppendFormat("Missile - %s (%d)\r\n",pmis->name,pmis->uid);
		}

		DDX_Text(pDX, IDC_DMUSAGE, usedby);
	}
	int i = 0;
	if (idx != CB_ERR)
	{
		DDX_Text(pDX, IDC_S1, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S2, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S3, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S4, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S5, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S6, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S7, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S8, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S9, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S10, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S11, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S12, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S13, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S14, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S15, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S16, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S17, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S18, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S19, pconst->damages[idx][i++]);
		DDX_Text(pDX, IDC_S20, pconst->damages[idx][i++]);
	}
	if (pDX->m_bSaveAndValidate) // dialog to data
	{
		CListBox *cbglobals = (CListBox *)GetDlgItem(IDC_GLOBALLIST);
		int idx = cbglobals->GetCurSel();
		if (idx != CB_ERR)
		{
			DDX_Text(pDX, IDC_GLOBALVAL, pcore->pConstants->constants[idx]);
			CString lab;
			GetDlgItemText(IDC_GLOBALLAB,lab);
			if (lab != ConstLabs[idx])
			{
				ConstLabs[idx] = lab;
				BuildConstList(idx);
				bIniChanged = true;
			}
		}
	}
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CConstantsDlg, CDialog)
//	ON_CBN_SELCHANGE(IDC_AC, OnCbnSelchangeAc)
ON_CBN_SELCHANGE(IDC_DM, OnCbnSelchangeDm)
ON_BN_CLICKED(IDOK, OnBnClickedOk)
ON_BN_CLICKED(IDCANCEL, OnBnClickedCancel)
ON_LBN_SELCHANGE(IDC_GLOBALLIST, OnLbnSelchangeGloballist)
ON_BN_CLICKED(IDC_GLOBALSET, OnBnClickedGlobalset)
END_MESSAGE_MAP()


// CConstantsDlg message handlers


void CConstantsDlg::OnCbnSelchangeDm()
{
	UpdateData(FALSE);
}

BOOL CConstantsDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	for (int i=0;i<IGCACMAX;i++)
	{
		SetDlgItemText(i+IDC_ACL1,IGCArmorClasses[i]);
	}
	CComboBox *cbdm = (CComboBox *)GetDlgItem(IDC_DM);
	cbdm->ResetContent();
	for (int i=0;i<IGCDMMAX;i++)
	{
		CString s;
		s.Format("DM%02d",i);
		cbdm->AddString(s);
	}
	CStdioFile cf;
	if (cf.Open("ice.ini",CFile::modeRead))
	{
		for (int i=0;i<IGCNUMC;i++)
			cf.ReadString(ConstLabs[i]);
		bIniChanged = false;
		cf.Close();
	}
	BuildConstList(0);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}

void CConstantsDlg::OnBnClickedOk()
{
	if (bIniChanged)
	{
		CStdioFile cf;
		CFileException e;
		if (cf.Open("ice.ini",CFile::modeCreate|CFile::modeWrite,&e))
		{
			for (int i=0;i<IGCNUMC;i++)
			{
				cf.WriteString(ConstLabs[i]);
				cf.WriteString("\n");
			}
			bIniChanged = false;
			cf.Close();
		}
		else
		{
			CString err;    
			err.Format("Error: cant open ice.ini for writing !!! (%d)",e.m_cause);
			AfxMessageBox(err);
		}
	}
	UpdateData(TRUE);
	UpdateData(FALSE);
}

void CConstantsDlg::OnBnClickedCancel()
{
	UpdateData(FALSE);
}

void CConstantsDlg::OnLbnSelchangeGloballist()
{
	CListBox *cbglobals = (CListBox *)GetDlgItem(IDC_GLOBALLIST);
	int idx = cbglobals->GetCurSel();
	if (idx == CB_ERR) return;
	if (pcore == NULL) return;
	CString val;
	val.Format("%g",pcore->pConstants->constants[idx]);
	SetDlgItemText(IDC_GLOBALVAL,val);
	SetDlgItemText(IDC_GLOBALLAB,ConstLabs[idx]);
}

void CConstantsDlg::OnBnClickedGlobalset()
{
	UpdateData(TRUE);
}
void CConstantsDlg::BuildConstList(int idx)
{
	CListBox *cbglobals = (CListBox *)GetDlgItem(IDC_GLOBALLIST);
	cbglobals->ResetContent();
	for (int i=0;i<40;i++)
	{
		CString s;
		s.Format("%02d/%02X - %s",i,i,ConstLabs[i]);
		cbglobals->AddString(s);
	}
	cbglobals->SetCurSel(idx);
}