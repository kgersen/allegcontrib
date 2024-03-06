// AMTDlg.cpp : implementation file
//

#include "stdafx.h"
#include "msAllegTool.h"
#include "AMTDlg.h"
#include "msLib.h"
#include <MDLFile.h>
#include <CVHFile.h>
#include "ColorButton.h"
#include "DlgLight.h"


// CAMTDlg dialog

IMPLEMENT_DYNAMIC(CAMTDlg, CDialog)
CAMTDlg::CAMTDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAMTDlg::IDD, pParent)
{
	pModel = NULL;
}

CAMTDlg::~CAMTDlg()
{
}

void CAMTDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CAMTDlg, CDialog)
	ON_BN_CLICKED(IDC_BTMDLTOOBJ, OnBnClickedBtmdltoobj)
	ON_BN_CLICKED(IDC_BTOBJTOMDL, OnBnClickedBtobjtomdl)
	ON_BN_CLICKED(IDC_BTCVHTOOBJ, OnBnClickedBtcvhtoobj)
	ON_BN_CLICKED(IDC_BTOBJTOCVH, OnBnClickedBtobjtocvh)
	ON_NOTIFY(TCN_SELCHANGE, IDC_TABFL, OnTcnSelchangeTabfl)
	ON_LBN_DBLCLK(IDC_LLIGHTS, OnLbnDblclkLlights)
	ON_BN_CLICKED(IDC_BTJTOPOS, OnBnClickedBtjtopos)
	ON_BN_CLICKED(IDC_BTPOSTOJ, OnBnClickedBtpostoj)
	ON_BN_CLICKED(IDC_BTLFTOJ, OnBnClickedBtlftoj)
	ON_BN_CLICKED(IDC_BTJTOLF, OnBnClickedBtjtolf)
	ON_LBN_DBLCLK(IDC_LCVH, OnLbnDblclkLcvh)
	ON_BN_CLICKED(IDC_BTHIDEMDL, OnBnClickedBthidemdl)
	ON_BN_CLICKED(IDC_BTHIDEGROUP, OnBnClickedBthidegroup)
	ON_BN_CLICKED(IDC_BTHIDECVH, OnBnClickedBthidecvh)
	ON_BN_CLICKED(IDC_BTADDPOS, OnBnClickedBtaddpos)
	ON_BN_CLICKED(IDC_BTSHOWMDL, OnBnClickedBtshowmdl)
	ON_BN_CLICKED(IDC_BTSHOWGROUP, OnBnClickedBtshowgroup)
	ON_BN_CLICKED(IDC_BTSHOWCVH, OnBnClickedBtshowcvh)
END_MESSAGE_MAP()


// CAMTDlg message handlers

BOOL CAMTDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

/* controls ID
	IDC_LGROUPS
	IDC_LCVH
	IDC_LMDL
	IDC_BTMDLTOOBJ
	IDC_BTOBJTOMDL
	IDC_BTCVHTOOBJ
	IDC_BTOBJTOCVH
	IDC_LJOINTS
	IDC_LPOS
	IDC_LLIGHTS
	IDC_LFRAMES
	IDC_TABFL
*/

	clMDL = (CListBox *) GetDlgItem(IDC_LMDL);
	clCVH = (CListBox *) GetDlgItem(IDC_LCVH);
	clGROUPS = (CListBox *) GetDlgItem(IDC_LGROUPS);
	clJOINTS = (CListBox *) GetDlgItem(IDC_LJOINTS);
	clPOS = (CListBox *) GetDlgItem(IDC_LPOS);
	clFRAMES = (CListBox *) GetDlgItem(IDC_LFRAMES);
	clLIGHTS = (CListBox *) GetDlgItem(IDC_LLIGHTS);
	ctFL = (CTabCtrl *) GetDlgItem(IDC_TABFL);

	ctFL->InsertItem(0,"Effects");
	ctFL->InsertItem(1,"Lights");
	clFRAMES->ShowWindow(SW_SHOWNA);
	clLIGHTS->ShowWindow(SW_HIDE);

	RefreshLists();

	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}
void CAMTDlg::RefreshLists()
{
	if (!pModel)
		return;
	clMDL->ResetContent();
	clCVH->ResetContent();
	clGROUPS->ResetContent();

	for (int i = 0; i < msModel_GetMeshCount (pModel); i++)
	{
		char szName[MS_MAX_NAME];
		msMesh *pMesh = msModel_GetMeshAt (pModel, i);
		msMesh_GetName (pMesh, szName, MS_MAX_NAME);
		CString sName;
		sName = szName;
		CListBox *lb = clGROUPS;
		if (sName.Left(4) == "mdl_")
			lb = clMDL;
		else if (sName.Left(4) == "cvh_")
			lb = clCVH;
		int idx = lb->AddString(sName);
		lb->SetItemDataPtr(idx,pMesh);
	}

	clJOINTS->ResetContent();
	clPOS->ResetContent();
	clFRAMES->ResetContent();
	clLIGHTS->ResetContent();

    for (int i = 0; i < msModel_GetBoneCount (pModel); i++)
    {
		char szName[MS_MAX_NAME];
		char szPName[MS_MAX_NAME];
        msBone *pBone = msModel_GetBoneAt (pModel, i);
        msBone_GetName (pBone, szName, MS_MAX_NAME);
        msBone_GetParentName (pBone, szPName, MS_MAX_NAME);
		CString sName;
		CString sPName;
		sName = szName;
		sPName = szPName;
		if (sPName == "")
		{
			CListBox *lb = clJOINTS;
			if (sName.Left(4) == "mdl_")
			{
				lb = clFRAMES;
				sName = sName.Right(sName.GetLength()-4);
				sName = sName.Left(sName.GetLength()-5);
			}
			else if (sName.Left(4) == "cvh_")
			{
				lb = clPOS;
				sName = sName.Right(sName.GetLength()-4);
			}
			else if (sName.Left(6) == "light-")
			{
				lb = clLIGHTS;
				sName = sName.Right(sName.GetLength()-6);
			}
			int idx = lb->AddString(sName);
			lb->SetItemDataPtr(idx,pBone);
		}
	}
}
void CAMTDlg::LBtoLB(CListBox *lbFrom, CListBox *lbTo, CString sTag, bool AddTag)
{
	if (lbFrom->GetSelCount() == LB_ERR) // prevent using single sel listbox :)
		return;
	int nCount;
	while (nCount=lbFrom->GetSelCount())
	{
		CArray<int,int> aryListBoxSel;
		aryListBoxSel.SetSize(nCount);
		lbFrom->GetSelItems(nCount, aryListBoxSel.GetData()); 
		int idx = aryListBoxSel.GetAt(0);
		CString label;
		lbFrom->GetText(idx,label);
		msMesh *pMesh = (msMesh *)lbFrom->GetItemDataPtr(idx);
		if (AddTag)
			label = sTag + label;
		else
			label = label.Right(label.GetLength()-sTag.GetLength());
		int idxto = lbTo->AddString(label);
		msMesh_SetName(pMesh,label);
		lbTo->SetItemDataPtr(idxto,pMesh);
		lbFrom->SetItemDataPtr(idx,NULL);
		lbFrom->DeleteString(idx);
		UpdateWindow();
	}
}
void CAMTDlg::OnBnClickedBtmdltoobj()
{
	// MDL->GROUPS
	LBtoLB(clMDL,clGROUPS,"mdl_",false);
}

void CAMTDlg::OnBnClickedBtobjtomdl()
{
	// GROUPS->MDL
	LBtoLB(clGROUPS,clMDL,"mdl_",true);
}

void CAMTDlg::OnBnClickedBtcvhtoobj()
{
	// CVH->OBJ
	LBtoLB(clCVH,clGROUPS,"cvh_",false);
}

void CAMTDlg::OnBnClickedBtobjtocvh()
{
	// OBJ->CVH
	LBtoLB(clGROUPS,clCVH,"cvh_",true);
}

void CAMTDlg::OnTcnSelchangeTabfl(NMHDR *pNMHDR, LRESULT *pResult)
{
	if (ctFL->GetCurSel() == 0)
	{
		clFRAMES->ShowWindow(SW_SHOWNA);
		clLIGHTS->ShowWindow(SW_HIDE);
	}
	else
	{
		clFRAMES->ShowWindow(SW_HIDE);
		clLIGHTS->ShowWindow(SW_SHOWNA);
	}

	*pResult = 0;
}

void CAMTDlg::OnLbnDblclkLlights()
{
	int idx = clLIGHTS->GetCurSel();
	if (idx == LB_ERR) return;
	msBone *pBone = (msBone *)clLIGHTS->GetItemDataPtr(idx);

	char szName[MS_MAX_NAME];
    msBone_GetName (pBone, szName, MS_MAX_NAME);
	CString sName(szName);
	
	CDlgLight dlg;
	sscanf(sName.Right(sName.GetLength()-6),"%d-%d-%d-%d",
		&dlg.red,
		&dlg.green,
		&dlg.blue,
		&dlg.lSpeed);

	if (dlg.DoModal()==IDOK)
	{

		sName.Format("%03d-%03d-%03d-%03d",
			dlg.red,
			dlg.green,
			dlg.blue,
			dlg.lSpeed);
		clLIGHTS->DeleteString(idx);
		idx = clLIGHTS->InsertString(idx,sName);
		clLIGHTS->SetItemDataPtr(idx,pBone);
		sName = "light-" + sName;
		msBone_SetName(pBone,sName);
		UpdateWindow();
	}
}


void CAMTDlg::OnBnClickedBtjtopos()
{
	// TODO: Add your control notification handler code here
}

void CAMTDlg::OnBnClickedBtpostoj()
{
	// TODO: Add your control notification handler code here
}

void CAMTDlg::OnBnClickedBtlftoj()
{
	// TODO: Add your control notification handler code here
}

void CAMTDlg::OnBnClickedBtjtolf()
{
	int idx = clJOINTS->GetCurSel();
	if (idx == LB_ERR)
		return;
	if (ctFL->GetCurSel() == 0) // effects
	{
		return;
	}
	else // ligths
	{
		msBone *pBone = (msBone *)clJOINTS->GetItemDataPtr(idx);
		if (pBone) // just in case
		{
			// should check that this bone has no children
			CString lname;
			lname.Format("light-128-128-128-128");
			msBone_SetName(pBone,lname);
			clJOINTS->DeleteString(idx);
			idx = clLIGHTS->AddString(lname);
			clLIGHTS->SetItemDataPtr(idx,pBone);
		}
	}
}

void CAMTDlg::OnLbnDblclkLcvh()
{
	// TODO
}

void CAMTDlg::OnBnClickedBthidemdl()
{
	GroupsShow("mdl_",true);
}

void CAMTDlg::OnBnClickedBthidegroup()
{
	GroupsShow("",true);
}

void CAMTDlg::OnBnClickedBthidecvh()
{
	GroupsShow("cvh_",true);
}

void CAMTDlg::OnBnClickedBtshowmdl()
{
	GroupsShow("mdl_",false);
}
void CAMTDlg::OnBnClickedBtshowgroup()
{
	GroupsShow("",false);
}

void CAMTDlg::OnBnClickedBtshowcvh()
{
	GroupsShow("cvh_",false);
}

void CAMTDlg::GroupsShow(CString gp,bool hide)
{
	if (!pModel) return;
	for (int i = 0; i < msModel_GetMeshCount (pModel); i++)
	{
		char szName[MS_MAX_NAME];
		msMesh *pMesh = msModel_GetMeshAt (pModel, i);
		msMesh_GetName (pMesh, szName, MS_MAX_NAME);
		CString sName;
		sName = szName;
		CListBox *lb = clGROUPS;
		bool match = (gp==""?((sName.Left(4) != "cvh_")||(sName.Left(4) != "mdl_")):(sName.Left(4) == gp));
		if (match)
		{
			BYTE flags =  msMesh_GetFlags (pMesh);
			if (hide)
				flags = flags | eHidden;
			else
			{
				flags = flags & (!eHidden);
				flags = flags | eSelected2;
			}
			msMesh_SetFlags (pMesh,flags);
			/*
			for (int j = 0; j < msMesh_GetVertexCount (pMesh); j++)
			{
				msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
				msVertex_SetFlags (pVertex, flags);
			}
			for (int j = 0; j < msMesh_GetTriangleCount (pMesh); j++)
			{
				msTriangle *pFace = msMesh_GetTriangleAt (pMesh, j);
				msTriangle_SetFlags (pFace, flags);
			}*/
		}
	}
}
void CAMTDlg::OnBnClickedBtaddpos()
{
	// TODO: Add your control notification handler code here
}


