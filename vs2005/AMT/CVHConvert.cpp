// CVHConvert.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "CVHConvert.h"
#include "CVHFile.h"
#include "MDLFile.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// The one and only application object

CWinApp theApp;

using namespace std;

int _tmain(int argc, TCHAR* argv[], TCHAR* envp[])
{
	int nRetCode = 0;

	// initialize MFC and print and error on failure
	if (!AfxWinInit(::GetModuleHandle(NULL), NULL, ::GetCommandLine(), 0))
	{
		// TODO: change error code to suit your needs
		_tprintf(_T("Fatal Error: MFC initialization failed\n"));
		nRetCode = 1;
	}
	else
	{
		// TODO: code your application's behavior here.
		if (argc == 3)
		{
			CString si = argv[1];
			CString so = argv[2];
			CFile cf;
			if (cf.Open(si,CFile::modeRead))
			{
				CString fn = cf.GetFileName();
				cf.Close();
				if (fn.Right(3) == "cvh")
				{
					CCVHFile cvh;
					if(cvh.ReadFromFile(si))
					{
						cvh.SaveToFile(so);
						cvh.ComputeCenters();
						cvh.SaveToFile(so+".txt");
					}
				}
				if (fn.Right(3) == "mdl")
				{
					CMDLFile mdl;
					if (mdl.ReadFromFile(si))
					{
						if (mdl.RootObject)
						{
							if(mdl.RootObject->type == mdl_image)
							{
								printf("%s = image: %d %d %d %d - \t",si,
									mdl.RootObject->image->header.m_size.x,
									mdl.RootObject->image->header.m_size.y,
									mdl.RootObject->image->header.m_pitch,
									mdl.RootObject->image->header.m_bitCount);
								//for (int n=0;n<sizeof(mdl.RootObject->image->header.);n++)
								//{
								//	printf("%02X ",mdl.RootObject->image->undecoded[n]);
								//}
								//printf("\n");
								mdl.SaveToBMP(so);
							}
							else
								mdl.SaveToXFile(so);
						}
					}
					else
						printf("error = %s\n",mdl.ReadError);
				}
			}
			else
			{
				printf("%s: cant open\n",si);
			}
		}
		else
		{
			printf("Error: Usage %s <mdl or cvh file> <x file>",argv[0]);
		}
	}

	return nRetCode;
}
