#include "StdAfx.h"
#include "AGMEventsHandler.h"

AGMEventsHandler::AGMEventsHandler(void)
{
}

AGMEventsHandler::~AGMEventsHandler(void)
{
}

IAdminUser * AGMEventsHandler::GetUser(IAdminGame *igame, AGCUniqueID userID)
{
	IAdminUser *ruser = NULL;
	IAdminUsersPtr iusers = igame->GetUsers();
	LPUNKNOWN iuk;
	HRESULT hr = iusers->get__NewEnum(&iuk);
	LPENUMVARIANT iev = NULL;
	hr = iuk->QueryInterface(IID_IEnumVARIANT,(LPVOID *)&iev);
	ULONG nbres = 0;
	VARIANT rgVar[1];
	do
	{
		hr = iev->Next(1,rgVar,&nbres);
		if (nbres)
		{
			IAdminUserPtr iuser = (IAdminUserPtr)rgVar[0].pdispVal;
			if (iuser->GetUniqueID() == userID)
				ruser = iuser;
			iuser = NULL;
		}
	} while (nbres == 1);

	iev->Release();
	iuk->Release();
	iusers=NULL;
	return ruser;
}




IAdminGame * AGMEventsHandler::GetGame(IAdminServer *iserver, AGCGameID gameid)
{
	if (!iserver) return NULL;
	IAdminGamesPtr igames = NULL;
	HRESULT hr = iserver->get_Games(&igames);
	if (hr!=S_OK) return NULL;
	IAdminGame * rgame = NULL;
	for (int g=0;g<igames->GetCount();g++)
	{
		VARIANT pvi;
		pvi.vt = VT_I4;
		pvi.lVal = g;
		IAdminGame *igame;
		hr = igames->get_Item(&pvi,&igame);
		if (hr == S_OK)
			if (igame->GetGameID() == gameid)
				rgame = igame;
	}
	igames = NULL;
	return rgame;
}
float * AGMEventsHandler::GetPlayerStats(IAdminUser *iuser)
{
	if (iuser == NULL) return NULL;
	IAGCEvent *iev = NULL;
	HRESULT hr = iuser->get_PlayerStats(&iev);
	if (iev)
	{
			float *stats = new float[AGM_MAX_STAT_KEYS];
			AGCEventID pVal;
			HRESULT hr = iev->get_ID(&pVal);
			long pcount = 0;
			hr = iev->get_PropertyCount(&pcount);
			//ss.AppendFormat("  event %d = %d\r\n",pVal,pcount);
			//BSTR bst = new WCHAR[200];
			//hr = iev->raw_SaveToString(&bst);
			//Debug("  %S\r\n",bst);
			for (int p=0;p<AGM_MAX_STAT_KEYS;p++)
			{
					_variant_t key;
					key.SetString(StatKeys[p]);
					_variant_t prop = iev->GetProperty(&key);
					switch (prop.vt)
					{
						case VT_I2:
							stats[p]=(float)prop.iVal;
							break;
						case VT_R4:
							stats[p]=prop.fltVal;
							break;
						default:
							//
							break;
					}

            }
			return stats;
	}
	return NULL;
}