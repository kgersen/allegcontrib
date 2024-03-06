// SvrUI.cpp : implementation file
//

#include "stdafx.h"
#include "AGM.h"
#include "..\ICE\corestruct.h"
#include "AGMEventsHandler.h"
#include "ServerCtrl.h"
#include "AGMDlg.h"
#include "SvrUI.h"
#include <math.h>

#include <comutil.h>

// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Implementation
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()

// CSvrUI dialog

IMPLEMENT_DYNAMIC(CSvrUI, CDialog)
CSvrUI::CSvrUI(CWnd* pParent /*=NULL*/)
	: CDialog(CSvrUI::IDD, pParent)
{
	iselgame = NULL;
}

CSvrUI::~CSvrUI()
{
}

void CSvrUI::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	if (!pDX->m_bSaveAndValidate) // data to dialog
	{
	}
	//switch(iCurTab)
	//{
	//	case 0:
	//		IDC_SVRBTPARAMS
	//		IDC_SVRBTCHANGE
	//		break;
	//	case 1:
	//		IDC_SVRLOG
	//		IDC_SVRCHAT
	//		IDC_SVRBTCHAT
	//	case 2:
	//		IDC_PLAYERSLIST
	//		IDC_BOOTPLAYER
	//		break;
	//}
}


BEGIN_MESSAGE_MAP(CSvrUI, CDialog)
	ON_BN_CLICKED(IDC_SVRBTPARAMS, OnBnClickedSvrbtparams)
	ON_BN_CLICKED(IDC_SVRBTCHANGE, OnBnClickedSvrbtchange)
	ON_BN_CLICKED(IDC_CHANGECORE, OnBnClickedChangecore)
	ON_LBN_SELCHANGE(IDC_GAMESLIST, OnLbnSelchangeGameslist)
	ON_BN_CLICKED(IDC_GAMEKILL, OnBnClickedGamekill)
	ON_BN_CLICKED(IDC_REFRESHGL, OnBnClickedRefreshgl)
	ON_LBN_SELCHANGE(IDC_PLAYERSLIST, OnLbnSelchangePlayerlist)
	ON_BN_CLICKED(IDC_REFRESHPL, OnBnClickedRefreshpl)
	ON_BN_CLICKED(IDC_CLEARLOG, OnBnClickedClearlog)
	ON_LBN_DBLCLK(IDC_GAMESLIST, OnLbnDblclkGameslist)
	ON_BN_CLICKED(IDC_BUTTON1, OnBnClickedButton1)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_LISTPLAYERS, OnLvnItemchangedListplayers)
END_MESSAGE_MAP()


// CSvrUI message handlers

BOOL CSvrUI::OnInitDialog()
{
	CDialog::OnInitDialog();

	dlg.cArtPath = cArtPath;
	dlg.cServerPath = cServerPath;
	psctrl->SetEventsHook(this);
	CListCtrl *clplayers = (CListCtrl *)GetDlgItem(IDC_LISTPLAYERS);
	clplayers->InsertColumn(0,"Name",0,100,LPCOLNAME);
	clplayers->InsertColumn(1,"Team",0,50,LPCOLTEAM);
	clplayers->InsertColumn(2,"Ship",0,50,LPCOLSHIP);
	clplayers->InsertColumn(3,"Wing",0,80,LPCOLWING);
	clplayers->InsertColumn(4,"Sector",0,50,LPCOLSECTOR);
	clplayers->InsertColumn(5,"State",0,50,LPCOLSTATE);
	clplayers->InsertColumn(6,"Role",0,50,LPCOLROLE);
	OnBnClickedRefreshgl();
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}

void CSvrUI::OnAGCEvent(IAGCEvent* pEvent)
{
	// handle events received from server
	AGCEventID pVal;
	HRESULT hr = pEvent->get_ID(&pVal);
	CString ss;
	GetDlgItemText(IDC_SVRLOG	,ss);
	ss.AppendFormat("event %d = ",pVal);
	BSTR bst = new WCHAR[200];
	hr = pEvent->raw_SaveToString(&bst);
	ss.AppendFormat("  %S\r\n",bst);


	switch (pVal)
	{
		case EventID_AdminPage:
		case EventID_ChatMessage:
		case EventID_AdminChat:
		{
			long pcount;
			pEvent->get_PropertyCount(&pcount);
			ss.AppendFormat("%d props - %C subjectid\r\n",pcount,pEvent->GetSubjectName());
			_variant_t key;
			key.SetString("GameID");
			_variant_t prop = pEvent->GetProperty(&key);
			AGCGameID gameID = prop.lVal;
			AGCUniqueID subID = pEvent->GetSubjectID();
			key.SetString("Message");
			prop = pEvent->GetProperty(&key);
			BSTR sst = prop.bstrVal;
            ss.AppendFormat("  message = %S \r\n",sst);
			//_bstr_t sub = pEvent->GetSubjectName();
			//ss.AppendFormat("  SubjectName = %S \r\n",sub.GetBSTR());
			hr = pEvent->get_Description(&bst);
			ss.AppendFormat("  %S\r\n",bst);
			if (pVal == EventID_AdminPage)
			{
				IAdminGame *igame = GetGame(psctrl->iserver,gameID);
				IAdminUser *iuser = GetUser(igame,subID);
				if (wcscmp(L"forcestart",sst)==0)
				{
					// force start game
					ss.AppendFormat("FORCE START THE GAME\r\n");
					if (igame)
					{
						if (iuser == igame->GetGameOwnerUser())
						{
							igame->SendChat(L"FORCE START by game owner",-1);
							igame->StartGame();
						}
						else
							iuser->SendMsg(L"only game owner can forcestart the game");
					}
				}
				if (wcscmp(L"mystats",sst)==0)
				{
					if (igame)
					if (iuser)
					{
						if (igame->GetGameStage() == AGCGameStage_Started)
						{
							IAGCEvent *iev = NULL;
							HRESULT hr = iuser->get_PlayerStats(&iev);
							_variant_t key;
							key.SetString("Kills");
							_variant_t prop = iev->GetProperty(&key);
							CString stat;
							stat.Format("Kills = %d ",prop.iVal);
							key.SetString("CombatRating");
							prop = iev->GetProperty(&key);
							stat.AppendFormat("CR =%f ",prop.fltVal);
							key.SetString("BaseKills");
							prop = iev->GetProperty(&key);
							stat.AppendFormat("BaseKills =%d",prop.iVal);
							iuser->SendMsg((_bstr_t)stat);
						}
						else
							iuser->SendMsg(L"no live stats - game is not running");
					}
				}
				iuser = NULL;
				igame = NULL;
			}
		}
		break;
		case EventID_LoginGame:
		case EventID_LogoutGame:
		case EventID_JoinTeam:
		case EventID_LeaveTeam:
			OnBnClickedRefreshpl();
			break;
		case EventID_GameCreated:
		case EventID_GameDestroyed:
		case EventID_GameStateChange:
			OnBnClickedRefreshgl();
			break;
		case AllsrvEventID_GameEnded:
		{
			// game end, store the stats
			ss.AppendFormat("Game ended %d - %S -%S\r\n",
				pEvent->GetPropertyCount(),
				pEvent->GetDescription().GetBSTR(),
				pEvent->GetContext().GetBSTR());
			_variant_t gkey(2); 
			_variant_t gprop = pEvent->GetProperty(&gkey);

			//hr = pEvent->raw_SaveToString(&bst);
		}
		break;
		default:
			break;
	}
	SetDlgItemText(IDC_SVRLOG,ss);
	CEdit *celog  = (CEdit *)GetDlgItem(IDC_SVRLOG);
	celog->LineScroll(celog->GetLineCount());
}

void CSvrUI::OnBnClickedSvrbtparams()
{
	IAdminGamesPtr igames = NULL;
	HRESULT hr = psctrl->iserver->get_Games(&igames);
	IAdminGamePtr igame;
	VARIANT pvi;
	pvi.vt = VT_I4;
	pvi.lVal = 0;
	hr = igames->get_Item(&pvi,&igame);

	dlg.igame = igame;
	dlg.iserver = psctrl->iserver;
	dlg.bModeCreate = true;
	dlg.DoModal();
	dlg.igame = NULL;
	dlg.iserver = NULL;
	igame = NULL;
	igames = NULL;
}

void CSvrUI::OnBnClickedSvrbtchange()
{
	//
	IAdminGamesPtr igames = NULL;
	HRESULT hr = psctrl->iserver->get_Games(&igames);
	IAdminGamePtr igame;
	VARIANT pvi;
	pvi.vt = VT_I4;
	pvi.lVal = 0;
	hr = igames->get_Item(&pvi,&igame);
	igame->StartGame();
	igame = NULL;
	igames = NULL;
}

void CSvrUI::OnOK()
{
	// TODO: Add your specialized code here and/or call the base class
	int input = AfxMessageBox("Do you want to shutdown the Allegiance server as well ?",MB_YESNOCANCEL|MB_ICONSTOP);
	if (input == IDCANCEL)
		return;

	if (iselgame != NULL) iselgame = NULL;
	EndDialog(input);
	//CDialog::OnOK();
}

void CSvrUI::OnCancel()
{
	OnOK();
}

void CSvrUI::OnBnClickedChangecore()
{
	// TODO: Add your control notification handler code here
}

void CSvrUI::OnLbnSelchangeGameslist()
{
	CListBox *clgames = (CListBox *)GetDlgItem(IDC_GAMESLIST);
	if (clgames->GetCurSel() == LB_ERR)
	{
		SetDlgItemText(IDC_SVRBTCHANGE,"no game selected");
		GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(FALSE);
		GetDlgItem(IDC_GAMEKILL)->EnableWindow(FALSE);
		return;
	}
	GetDlgItem(IDC_GAMEKILL)->EnableWindow(TRUE);

	IAdminGamesPtr igames = NULL;
	HRESULT hr = psctrl->iserver->get_Games(&igames);
	VARIANT pvi;
	pvi.vt = VT_I4;
	pvi.lVal = clgames->GetCurSel();
	if (iselgame != NULL)
		iselgame = NULL;
	hr = igames->get_Item(&pvi,&iselgame);
	switch (iselgame->GetGameStage())
	{
		case AGCGameStage_NotStarted:
			SetDlgItemText(IDC_SVRBTCHANGE,"Force Start");
			GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(TRUE);
			break;
		case AGCGameStage_Starting:
			SetDlgItemText(IDC_SVRBTCHANGE,"Starting");
			GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(FALSE);
			break;
		case AGCGameStage_Started:
			SetDlgItemText(IDC_SVRBTCHANGE,"Running");
			GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(FALSE);
			break;
		case AGCGameStage_Over:
			SetDlgItemText(IDC_SVRBTCHANGE,"Over");
			GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(FALSE);
			break;
		case AGCGameStage_Terminate:
			SetDlgItemText(IDC_SVRBTCHANGE,"Terminate");
			GetDlgItem(IDC_SVRBTCHANGE)->EnableWindow(FALSE);
			break;
	}
	OnBnClickedRefreshpl();
	igames=NULL;
}

void CSvrUI::OnBnClickedGamekill()
{
	if (iselgame == NULL) return;
	iselgame->Kill();
	OnBnClickedRefreshgl();
}

void CSvrUI::OnBnClickedRefreshgl()
{
	// retrieve currents games
	CListBox *clgames = (CListBox *)GetDlgItem(IDC_GAMESLIST);
	clgames->ResetContent();
	IAdminGamesPtr igames = NULL;
	HRESULT hr = psctrl->iserver->get_Games(&igames);
	for (int g=0;g<igames->GetCount();g++)
	{
		VARIANT pvi;
		pvi.vt = VT_I4;
		pvi.lVal = g;
		IAdminGamePtr igame;
		hr = igames->get_Item(&pvi,&igame);
		CString sg;
		_bstr_t gn = igame->GetName();
		sg.Format("game %d : %S",igame->GetGameID(),gn.GetBSTR());
		clgames->AddString(sg);
		igame = NULL;
	}
	GetDlgItem(IDC_SVRBTPARAMS)->EnableWindow(igames->GetCount()>0?FALSE:TRUE);
	igames = NULL;
	OnLbnSelchangeGameslist();
}

void CSvrUI::OnLbnSelchangePlayerlist()
{
	CListBox *clplayers = (CListBox *)GetDlgItem(IDC_PLAYERSLIST);
	int idx = clplayers->GetCurSel();
	if (idx == LB_ERR) return;
	IAdminUser *iuser = (IAdminUser *)clplayers->GetItemDataPtr(idx);
	CString ss;
	GetDlgItemText(IDC_SVRLOG,ss);
	_bstr_t pn = iuser->GetName();
	ss.AppendFormat("selected player = %S (%x) - UDI = %x\r\n",pn.GetBSTR(),iuser,iuser->GetUniqueID());
	float *stats = GetPlayerStats(iuser);
	if (stats)
	{
		for (int p=0;p<AGM_MAX_STAT_KEYS;p++)
		{
			ss.AppendFormat("  %s = %f\r\n",StatKeys[p],stats[p]);
		}
		delete stats;
	}
	SetDlgItemText(IDC_SVRLOG,ss);
	CEdit *celog  = (CEdit *)GetDlgItem(IDC_SVRLOG);
	celog->LineScroll(celog->GetLineCount());

}

void CSvrUI::OnBnClickedRefreshpl()
{
	CListBox *clplayers = (CListBox *)GetDlgItem(IDC_PLAYERSLIST);
	CListCtrl *listplayers = (CListCtrl *)GetDlgItem(IDC_LISTPLAYERS);
	clplayers->ResetContent();
	listplayers->DeleteAllItems();

	if (iselgame == NULL) return;
	IAdminUsersPtr iusers = iselgame->GetUsers();
	if (iusers == NULL) return;
	HRESULT hr;
	IAdminUserPtr iowner;
	hr = iselgame->get_GameOwnerUser(&iowner);

	LPUNKNOWN iuk;
	hr = iusers->get__NewEnum(&iuk);
	LPENUMVARIANT iev = NULL;
	hr = iuk->QueryInterface(IID_IEnumVARIANT,(LPVOID *)&iev);
	ULONG nbres = 0;
	VARIANT rgVar[1];
	int itemidx=0;
	do
	{
		hr = iev->Next(1,rgVar,&nbres);
		if (nbres)
		{
			IAdminUserPtr iuser = (IAdminUserPtr)rgVar[0].pdispVal;
			CString s;
			CString scol;
			_bstr_t pn = iuser->GetName();
			s.Format("%S",pn.GetBSTR());
			listplayers->InsertItem(itemidx,s);
			IAdminShipPtr iship = iuser->GetShip();
			IAGCTeamPtr iteam = iship->GetTeam();
			s.AppendFormat(" shipid=%x wing=%x",iship->GetObjectID(),iship->GetWingID());
			// speed=scol.Format("%f",sqrtf(iship->GetVelocity()->GetLengthSquared()));
			//AGCObjectType shipid = iship->GetType();
			scol.Format("%S",iship->GetName().GetBSTR());
			listplayers->SetItemText(itemidx,LPCOLSHIP,scol);
			listplayers->SetItemText(itemidx,LPCOLWING,WingsNames[iship->GetWingID()]);
			listplayers->SetItemText(itemidx,LPCOLSTATE,iuser->GetisReady()==0?"AFK":"Ready");
			IAGCSectorPtr isector = iship->GetSector();
			if (isector)
			{
				CString ssect;
				ssect.AppendFormat("%S",isector->GetName().GetBSTR());
				s.AppendFormat(" sector=%s",ssect);
				listplayers->SetItemText(itemidx,LPCOLSECTOR,ssect);
				isector = NULL;
			}
			if (iteam)
			{
				CString steam;
				steam.Format("%S",iteam->GetName().GetBSTR());
				s.AppendFormat(" team=%s (civ=%S)",steam,iteam->GetCiv().GetBSTR());
				listplayers->SetItemText(itemidx,LPCOLTEAM,steam);
				iteam = NULL;
			}
			iship = NULL;

			if (iuser == iowner)
			{
				s.AppendFormat("(OWNER)");
				listplayers->SetItemText(itemidx,LPCOLROLE,"Owner");
			}

			int idx = clplayers->AddString(s);
			clplayers->SetItemDataPtr(idx,iuser);
			iuser = NULL;
		}
	} while (nbres == 1);

	iev = NULL;
	iuk = NULL;
	iowner = NULL;
	iusers=NULL;
}

void CSvrUI::OnBnClickedClearlog()
{
	SetDlgItemText(IDC_SVRLOG,"");
}

void CSvrUI::OnLbnDblclkGameslist()
{
	if (iselgame == NULL)
		return;
	dlg.igame = iselgame;
	dlg.iserver = psctrl->iserver;
	dlg.bModeCreate = false;
	dlg.DoModal();
}

void CSvrUI::OnBnClickedButton1()
{
	CAboutDlg ca;
	ca.DoModal();
}

void CSvrUI::OnLvnItemchangedListplayers(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMLISTVIEW pNMLV = reinterpret_cast<LPNMLISTVIEW>(pNMHDR);
	// TODO: Add your control notification handler code here
	*pResult = 0;
}
