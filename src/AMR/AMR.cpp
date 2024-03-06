// AMR.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "AMR.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#include "BitmapGlue.h"

// The one and only application object

CWinApp theApp;

using namespace std;
int p1 = 5625;
int p2 = 4250;
int p3 = 1875;
float p4 = 0.25;
float p5 = 0.1;
bool bIgnore19 = false;
bool bIgnore42 = false;
bool bRename = false;
bool bSave = false;
bool bFixSize = false;

#define MAP2DWFB 20
#define MAP2DHFB 20
#define MAP2DSCALEX(x,scale) (MAP2DWFB + ((x) * (scale)))
#define MAP2DSCALEY(y,scale,h) ((h) - MAP2DHFB - ((y) * (scale)))

#define MAP2DUNSCALEX(x,scale) (Snap(((x) - MAP2DWFB)/(scale)))
#define MAP2DUNSCALEY(y,scale,h) (Snap(-(((y) - (h) + MAP2DHFB) /(scale))))

typedef struct SMapAleph
{
	CIGCSector *sect1;
	CIGCAleph  *aleph1;
	CIGCSector *sect2;
	CIGCAleph  *aleph2;
} MapAleph;
CList<SMapAleph,SMapAleph&> mapalephs;

bool KnownAleph(CIGCAleph * paleph)
{
	POSITION pos = mapalephs.GetHeadPosition();
	for (int i=0;i < mapalephs.GetCount();i++)
	{
		SMapAleph *mapa = &(mapalephs.GetNext(pos));
		if ((mapa->aleph1 == paleph) || (mapa->aleph2 == paleph))
			return true;
	}
	return false;
}
// find a sector given an aleph
CIGCSector *FindSector(CIGCMap *igcmap,CIGCAleph * paleph)
{
	POSITION pos = igcmap->cl_sectors.GetHeadPosition();
	for (int i=0;i < igcmap->cl_sectors.GetCount();i++)
	{
		CIGCSector *psector;
		psector = &(igcmap->cl_sectors.GetNext(pos));
		if (psector->igcsector.uid == paleph->igcaleph.sector_uid)
			return psector;
	}
	return NULL;
}
// find an aleph given an aleph
CIGCAleph *FindConnectingAleph(CIGCMap *igcmap,CIGCAleph * pigcaleph)
{
	POSITION pos = igcmap->cl_alephs.GetHeadPosition();
	for (int i=0;i < igcmap->cl_alephs.GetCount();i++)
	{
		CIGCAleph *paleph = &(igcmap->cl_alephs.GetNext(pos));
		if (paleph->igcaleph.connecting_aleph_uid == pigcaleph->igcaleph.uid)
			return paleph;
	}
	return NULL;
}

int RenderMapToFile(CString fn_in, CString fnbmp, int MapW, int MapH)
{
	///////////////////////////////////////////////////////////////////////////////
	CIGCMap *amap = new CIGCMap();
	if (amap->ReadFromFile(fn_in) != TRUE)
	{
		printf("error: File %s is not an igc map (or file not found)\n",fn_in);
	}
	///////////////////////////////////////////////////////////////////////////////
	// Build aleph table
	SMapAleph *pmapaleph;
	POSITION pos = amap->cl_alephs.GetHeadPosition();
	for (int i=0;i < amap->cl_alephs.GetCount();i++)
	{
		CIGCAleph *paleph;
		paleph = &(amap->cl_alephs.GetNext(pos));
		if (!KnownAleph(paleph))
		{
			pmapaleph = new SMapAleph;
			pmapaleph->aleph1 = paleph;
			pmapaleph->sect1 = FindSector(amap,paleph);
			pmapaleph->aleph2 = FindConnectingAleph(amap,paleph);
			pmapaleph->sect2 = FindSector(amap,pmapaleph->aleph2);
			mapalephs.AddTail(*pmapaleph);
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	// compute scale (should use CDC mapping)
	float maxx = 0.5;
	float maxy = 0.5;
	pos = amap->cl_sectors.GetHeadPosition();
	for (int i=0;i < amap->cl_sectors.GetCount();i++)
	{
		CIGCSector *psector = &(amap->cl_sectors.GetNext(pos));
		if (psector->igcsector.posx > maxx)
			maxx = psector->igcsector.posx;
		if (psector->igcsector.posy > maxy)
			maxy = psector->igcsector.posy;
	}

	if (maxx>maxy)
		maxy = maxx;
	else
		maxx = maxy;
	float maxc = maxx;
	maxx = (MapW-MAP2DWFB*2)/maxx;
	maxy = (MapH-MAP2DWFB*2)/maxy;
	//make it prop

	pos = amap->cl_sectors.GetHeadPosition();
	for (i=0;i < amap->cl_sectors.GetCount();i++)
	{
		CIGCSector *psector = &(amap->cl_sectors.GetNext(pos));
		int x = MAP2DSCALEX(psector->igcsector.posx,maxx);
		int y = MAP2DSCALEY(psector->igcsector.posy,maxy,MapH);
		psector->pos2D.x = x;
		psector->pos2D.y = y;
	}
	/////////////////////////////////////////////////////////////////////////////
    CDC dcMemory;
    dcMemory.CreateCompatibleDC(NULL);
	CBitmap bmMemory;
//	bmMemory.CreateCompatibleBitmap(&dcMemory,MapW,MapH);
	//if (!bmMemory.CreateBitmap(MapW,MapH,1,8,NULL))
	//	printf("error creating bitmap\n");
	bmMemory.LoadBitmap(IDB_BITMAP1);

	CBitmap *oldbm = dcMemory.SelectObject(&bmMemory);

	////////////////////////////////////////////////////////////////////////////////

	CRect rect(0,0,MapW,MapH);
	CBrush brwhite(RGB(0xFF,0xFF,0xFF));
	CBrush brred(RGB(0xFF,0,0));
	CBrush brback(RGB(0,0,0));

	// black gd, red frame
	dcMemory.FillRect(rect, &brback);
	dcMemory.FrameRect(rect, &brred);

	dcMemory.SetBkColor(RGB(0,0,0));
	CPen redpen(PS_SOLID,1,RGB(0xFF,0,0)); // red
	CPen whitepen(PS_SOLID,1,RGB(0xFF,0xFF,0xFF)); // white
	CPen alephpen(PS_SOLID,2,RGB(0x00,0x00,0xFF)); // blue
	CPen *oldpen = NULL;
	CBrush whitebrush;
	whitebrush.CreateSolidBrush(RGB(0xFF,0xFF,0xFF));
	CBrush *oldbrush = NULL;
	
	oldpen = (CPen *)dcMemory.SelectObject(&whitepen);
	oldbrush = (CBrush *)dcMemory.SelectObject(&whitebrush);

	dcMemory.SetTextColor(RGB(0xFF,0xFF,0xFF));
	dcMemory.SetBkColor(RGB(0,0,0));

	dcMemory.SelectObject(&alephpen);
	pos = mapalephs.GetHeadPosition();
	for (int i=0;i < mapalephs.GetCount();i++)
	{
		SMapAleph *mapa = &(mapalephs.GetNext(pos));
		dcMemory.MoveTo(mapa->sect1->pos2D.x,mapa->sect1->pos2D.y);
		dcMemory.LineTo(mapa->sect2->pos2D.x,mapa->sect2->pos2D.y);
	}
	
	CBrush brushTeam1,brushTeam2,brushTeam3,brushTeam4,brushTeam5,brushTeam6;
	brushTeam1.CreateSolidBrush(IGCTEAM1COL);
	brushTeam2.CreateSolidBrush(IGCTEAM2COL);
	brushTeam3.CreateSolidBrush(IGCTEAM3COL);
	brushTeam4.CreateSolidBrush(IGCTEAM4COL);
	brushTeam5.CreateSolidBrush(IGCTEAM5COL);
	brushTeam6.CreateSolidBrush(IGCTEAM6COL);
	CBrush * brushbases[7] = {&whitebrush,&brushTeam1,&brushTeam2,&brushTeam3,&brushTeam4,&brushTeam5,&brushTeam6};

	//paint sectors
	pos = amap->cl_sectors.GetHeadPosition();
	for (int i=0;i < amap->cl_sectors.GetCount();i++)
	{
		CIGCSector *psector;
		psector = &(amap->cl_sectors.GetNext(pos));
		int x = psector->pos2D.x;
		int y = psector->pos2D.y;
		dcMemory.SelectObject(&whitepen);
		dcMemory.SelectObject(brushbases[psector->igcsector.team]);
		dcMemory.Ellipse(x-SDOTSECT/2,y-SDOTSECT/2,x+SDOTSECT/2,y+SDOTSECT/2);
	}
	dcMemory.SelectObject(oldpen);
	dcMemory.SelectObject(oldbrush);
	////////////////////////////////////////////////////////////////////////////////
	// save to file
	PBITMAPINFO pbi = CreateBitmapInfoStruct(bmMemory);
	CreateBMPFile(fnbmp, pbi,bmMemory, dcMemory);
	dcMemory.SelectObject(oldbm);
	bmMemory.DeleteObject();
	dcMemory.DeleteDC();
	return true;
}

void Usage(TCHAR *argv0)
{
	printf("AMR version 2.2 - (c) 2002-2004 Kirth Gersen\n");
	printf("usage:\n\t %s [options] <mapin.igc> <mapout.igc>\n",argv0);
	printf("\t %s [options] <mapin.igc> <mapout.igc> <p1> <p2> <p3> <p4> <p5>\n",argv0);
	printf("\t %s -s <mapin.igc> <bmp file name>\n",argv0);
	printf("\t <p1> = base radius for neutral sectors\n");
	printf("\t <p2> = base radius for home sectors\n");
	printf("\t <p3> = distance variation\n");
	printf("\t <p4> = angle variation\n");
	printf("\t <p5> = radius variation\n\n");
	printf("\t available options:\n");
	printf("\t\t -19 = do not randomize alephs with plnt19 render\n");
	printf("\t\t -42 = do not randomize alephs with plnt42 render\n");
	printf("\t\t -r <names database file> = rename sectors\n");
	printf("\t\t note: use all these options at the same time to rename sectors\n\t\t without randomizing alephs\n");
	printf("\t\t -f = fix all alephs size to default (100)\n");


}
int _tmain(int argc, TCHAR* argv[], TCHAR* envp[])
{
	int nRetCode = 0;

	// initialize MFC and print and error on failure
	if (!AfxWinInit(::GetModuleHandle(NULL), NULL, ::GetCommandLine(), 0))
	{
		// TODO: change error code to suit your needs
		_tprintf(_T("Fatal Error: MFC initialization failed\n"));
		nRetCode = 10;
	}
	else
	{
		int rargc = argc;
		int pargc = 0;
		CString fn_in;
		CString fn_out;
		CString fn_names = "";
		// 1. parse command line option
		CString csopt;
		bool bParse = rargc > 1;
		do
		{
			csopt = argv[pargc+1];
			if (csopt== "-19")
			{
				bIgnore19 = true;
				pargc++; rargc--;
			} else
			if (csopt == "-42")
			{
				bIgnore42 = true;
				pargc++; rargc--;
			} else
			if (csopt== "-f")
			{
				bFixSize = true;
				pargc++; rargc--;
			} else
			if (csopt == "-r")
			{
				if (rargc <2)
				{
					Usage(argv[0]);
					return 10;
				}
				fn_names = argv[pargc+2];
				bRename = true;
				pargc+=2; rargc -=2;
			} else
			if (csopt == "-s")
			{
				if (rargc <3)
				{
					Usage(argv[0]);
					return 10;
				}
				return RenderMapToFile(argv[pargc+2],argv[pargc+3],250,150);
			} else
				bParse = false;

		} while (bParse);
		if ((rargc == 3) || (rargc == 8))
		{
			fn_in = argv[pargc+1];
			fn_out = argv[pargc+2];
			if (rargc == 8)
			{
				sscanf(argv[pargc+3],"%d",&p1);
				sscanf(argv[pargc+4],"%d",&p2);
				sscanf(argv[pargc+5],"%d",&p3);
				sscanf(argv[pargc+6],"%f",&p4);
				sscanf(argv[pargc+7],"%f",&p5);
			}
		}
		else
		{
			Usage(argv[0]);
			return 10;
		}
		// 2. performe
		printf("randomizing %s to %s\n",fn_in,fn_out);
		printf("algo parameters = %d %d %d %g %g\n",p1,p2,p3,p4,p5);
		CString sOpts = "none";
		if (bRename)
			sOpts.Format("on (%s)",fn_names);
		printf("options: -19 = %s, -42 = %s, - r = %s\n",
			bIgnore19?"on":"off",
			bIgnore42?"on":"off",
			sOpts
			);

		CIGCMap *amap = new CIGCMap();
		srand( (unsigned)time( NULL ) );
		if (amap->ReadFromFile(fn_in) == TRUE)
		{
			if (bFixSize)
			{
				amap->SetAlephsSize(100);
			}
			else if (bIgnore19 && bIgnore42)
				printf("alephs not randomized\n");
			else
				amap->RandomizeAlephs(p1,p2,p3,p4,p5,bIgnore19,bIgnore42);
			if (bRename)
			{
				// rename sectors
				printf("renaming sectors with database %s ...\n",fn_names);
				switch(amap->RenameSectors(fn_names))
				{
					case 1:
						printf("error: can not open %s file for reading\n",fn_names);
						nRetCode = 10;
						break;
					case 2:
						printf("error: too few names in database for this map\n",fn_names);
						nRetCode = 10;
						break;
				}
			}
			if (nRetCode == 0)
				if (amap->SaveToFile(fn_out) != TRUE)
				{
					printf("error: Couldnt write out file %s\n",fn_out);
					nRetCode = 10;
				}
		}
		else
		{
			printf("error: File %s is not an igc map (or file not found)\n",fn_in);
			nRetCode = 10;
		}
		// 2. perform taks
	}

	return nRetCode;
}
