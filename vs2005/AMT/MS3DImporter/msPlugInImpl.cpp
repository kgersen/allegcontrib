#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "msPlugInImpl.h"
#include "msLib.h"
#include "DlgOptions.h"
#include "CVHFile.h"
#include "MDLFile.h"
#include <math.h>

#define MAX_VERTICES	8192
#define MAX_TRIANGLES	16384



#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif



/////////////////////////////////////////////////////////////////////////////
// CMsPlugInApp

BEGIN_MESSAGE_MAP(CMsPlugInApp, CWinApp)
	//{{AFX_MSG_MAP(CMsPlugInApp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
//

CMsPlugInApp::CMsPlugInApp()
{
}

/////////////////////////////////////////////////////////////////////////////
//

CMsPlugInApp theApp;



cMsPlugIn*
CreatePlugIn ()
{
    return new cPlugIn ();
}



cPlugIn::cPlugIn ()
{
	strcpy (szTitle, "AMT: Allegiance MDL...");
}



cPlugIn::~cPlugIn ()
{
}



int
cPlugIn::GetType ()
{
    return cMsPlugIn::eTypeImport;
}



const char*
cPlugIn::GetTitle ()
{
    return szTitle;
}


int 
cPlugIn::PrintError ()
{
	return (int) 0;
}
void DelBones(msModel *pModel)
{
	//
    // destroy the bones
    //
    if (pModel->pBones)
    {
        free (pModel->pBones);
        pModel->pBones = 0;
        pModel->nNumBones = 0;
        pModel->nNumAllocedBones = 0;
    }
    int i, j;
    // detach the vertices from the bones
    for (i = 0; i < msModel_GetMeshCount (pModel); i++)
    {
        msMesh *pMesh = msModel_GetMeshAt (pModel, i);
        for (j = 0; j < msMesh_GetVertexCount (pMesh); j++)
        {
            msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
            msVertex_SetBoneIndex (pVertex, -1);
        }
    }
}
int nOptionFlags = 0;
int TexturesIdx[250];

float ImportMDLObject(msModel *pModel,PtrMDLObject po, CString level)
{
	float maxc = 0;
	if(po->type == mdl_mesh)
	{
		//MESH: po->mesh->nvertex,po->mesh->nfaces
		int nMesh = msModel_AddMesh (pModel);
        msMesh *pMesh = msModel_GetMeshAt (pModel, nMesh);

		CString szName;
		if (po->lodval)
			szName.Format("mdl%s(LOD=%f)",level,*(po->lodval));
		else
			szName.Format("mdl_%s",level);
        msMesh_SetName (pMesh, szName);
        msMesh_SetFlags (pMesh, 1);
		if (po->textidx != -1)
		{
		    msMesh_SetMaterialIndex (pMesh, TexturesIdx[po->textidx]);
		}
		else
			msMesh_SetMaterialIndex (pMesh, -1);
        //
        // vertices & normals
        //
		int *vertidx = new int[po->mesh->nvertex];
		int *normidx = new int[po->mesh->nvertex];
        for (int j = 0; j < po->mesh->nvertex; j++)
        {
            msVec3 Vertex;
			Vertex[0] = po->mesh->vertices[j].x;
			Vertex[1] = po->mesh->vertices[j].y;
			Vertex[2] = po->mesh->vertices[j].z;
			maxc = max(maxc,max(fabsf(Vertex[0]),max(fabsf(Vertex[1]),fabsf(Vertex[2]))));
            int nVertex = msMesh_AddVertex (pMesh);
			vertidx[j] = nVertex;

            msVertex *pVertex = msMesh_GetVertexAt (pMesh, nVertex);
            msVertex_SetVertex (pVertex, Vertex);
			msVertex_SetBoneIndex (pVertex, -1);

            msVec3 Normal;
			Normal[0] = po->mesh->vertices[j].nx;
			Normal[1] = po->mesh->vertices[j].ny;
			Normal[2] = po->mesh->vertices[j].nz;
			int nNormal = msMesh_AddVertexNormal (pMesh);
			normidx[j] = nNormal;
            msMesh_SetVertexNormalAt (pMesh, nNormal, Normal);
			
            msVec2 uv;
			/*
			float cosu = cos(po->mesh->vertices[j].mx);
			float sinu = sin(po->mesh->vertices[j].mx);
			float cosv = cos(po->mesh->vertices[j].mx);
			float sinv = sin(po->mesh->vertices[j].my);
			uv[0] = 1.0f-sinv*cosu;
			uv[1] = 1.0f-sinv;
			*/
			uv[0] = po->mesh->vertices[j].mx;
			uv[1] = po->mesh->vertices[j].my;
            msVertex_SetTexCoords (pVertex, uv);

        }
		// triangles
        for (int j = 0; j < po->mesh->nfaces; j+=3)
        {
			word nIndices[3];
			word nNormalIndices[3];
			nIndices[0] = vertidx[po->mesh->faces[j]];
			nIndices[1] = vertidx[po->mesh->faces[j+2]]; // REVERSE ORDER !!
			nIndices[2] = vertidx[po->mesh->faces[j+1]];
			nNormalIndices[0] = normidx[po->mesh->faces[j]];
			nNormalIndices[1] = normidx[po->mesh->faces[j+2]];
			nNormalIndices[2] = normidx[po->mesh->faces[j+1]];
			int nTriangle = msMesh_AddTriangle (pMesh);
			msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, nTriangle);
			msTriangle_SetFlags (pTriangle, 1);
			msTriangle_SetVertexIndices (pTriangle, nIndices);
			msTriangle_SetNormalIndices (pTriangle, nNormalIndices);
			msTriangle_SetSmoothingGroup (pTriangle, nMesh);
		}
		delete vertidx;
		delete normidx;
	} // mdl_mesh
	if ((po->type == mdl_group) || (po->type == mdl_lod))
	{
		for (int n=0;n<po->nchildren;n++)
		{
			CString l = level;
			CString l1 = "l";
			if (po->type==mdl_group)
			{
				if (po->lodval)
					l1.Format("g(%f)",*(po->lodval));
				else
					l1 = "g";
			}
			l.AppendFormat("-%s-%d",l1,n);
			float maxo = ImportMDLObject(pModel,po->childrens[n],l);
			maxc = MAX(maxc,maxo);
		}
	}
	return maxc;
}
int ImportCVH(msModel *pModel,CString sPath);
int ImportMDL(msModel *pModel,CString sPath)
{
	CMDLFile mdlfile;
	if (!mdlfile.ReadFromFile(sPath))
		return 10;
	if (!mdlfile.RootObject)
	{
		AfxMessageBox("Error: not a binary mdl file");
		return 10;
	}
	if (mdlfile.RootObject->type == mdl_image)
	{
		AfxMessageBox("Error: cant import mdl bitmap directly");
		return 10;
	}
	if (mdlfile.RootObject->type == mdl_empty)
	{
		AfxMessageBox("Error: empty mdl file");
		return 10;
	}

	DelBones(pModel);
	if (nOptionFlags & eCVHToo)
	{
		CString sPathCVH = sPath;
		sPathCVH.Replace(".mdl",".cvh");
		CFileStatus cvhstatus;
		if (CFile::GetStatus(sPathCVH,cvhstatus))
		{
			ImportCVH(pModel,sPathCVH);
			// file exist, skip
		}
		else
		{
			AfxMessageBox("Warning corresponding CVH file not found !");
		}

	}
	for (int n=0;n<mdlfile.NumTextures;n++)
	{
		// textures
        int nMaterial = msModel_AddMaterial (pModel);
        msMaterial *pMaterial = msModel_GetMaterialAt (pModel, nMaterial);
		TexturesIdx[n] = nMaterial;
		CString szName = mdlfile.Textures[n];
		msMaterial_SetName (pMaterial, szName);
		CString szBmp = szName + ".bmp";
        msVec4 FullWhite;
		FullWhite[0] = 0.99f;
		FullWhite[1] = 0.99f;
		FullWhite[2] = 0.99f;
		FullWhite[3] = 1.0f;
        msMaterial_SetAmbient (pMaterial, FullWhite);
		msMaterial_SetDiffuse (pMaterial, FullWhite);
		msMaterial_SetEmissive (pMaterial, FullWhite);
		msMaterial_SetDiffuseTexture (pMaterial, szBmp);

		CMDLFile bmpmdl;
		bmpmdl.ReadFromFile(szName+".mdl");
		/*
		CFileStatus bmpstatus;
		if (CFile::GetStatus(szBmp,bmpstatus))
		{
			// file exist, skip
		}
		else*/ if (!bmpmdl.SaveToBMP(szBmp))
		{
			CString err;
			err.Format("Warning: couldnt convert bitmap texture file '%s'",szName+".mdl");
			AfxMessageBox(err);
		}
	}
#ifdef _DEBUG
	mdlfile.SaveToXFile(sPath+".x");
#endif

	float maxcoord = ImportMDLObject(pModel,mdlfile.RootObject,"R");
	if (maxcoord ==0)
	{
		AfxMessageBox("Warning invalid max coord value !");
	}
	// Lights
	for (int i=0;i<mdlfile.NumLights;i++)
	{
		MDLLight *lite = &(mdlfile.Lights[i]);
		int nBone = msModel_AddBone (pModel);
        msBone *pBone = msModel_GetBoneAt (pModel, nBone);

		CString szName;
		szName.Format("light-%03d-%03d-%03d-%03d",
			(int)(lite->red*255.0),
			(int)(lite->green*255.0),
			(int)(lite->blue*255.0),
			(int)(lite->speed*255.0));
        msBone_SetName (pBone, szName);
		msBone_SetParentName (pBone, "");

		msVec3 Position, Rotation;
		Position[0] = lite->posx;
		Position[1] = lite->posy;
		Position[2] = lite->posz;
		Rotation[0] = 0;
		Rotation[1] = 0;
		Rotation[2] = 0;

		int nFlags = 8;
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);
	}
	// FrameDatas
	for (int i=0;i<mdlfile.NumFrameDatas;i++)
	{
		MDLFrameData *data = &(mdlfile.FrameDatas[i]);
		// from bone
		int nBone = msModel_AddBone (pModel);
        msBone *pBone = msModel_GetBoneAt (pModel, nBone);

		CString szName;
		szName.Format("mdl_%s_from",data->name);
        msBone_SetName (pBone, szName);
		msBone_SetParentName (pBone, "");

		msVec3 Position, Rotation;
		Position[0] = data->posx;
		Position[1] = data->posy;
		Position[2] = data->posz;
		Rotation[0] = 0;
		Rotation[1] = 0;
		Rotation[2] = 0;

		int nFlags = 8;
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);

		// to bone
		nBone = msModel_AddBone (pModel);
		pBone = msModel_GetBoneAt (pModel, nBone);
		msBone_SetParentName (pBone, szName);
		CString szToName;
		szToName.Format("mdl_%s_to",data->name);
        msBone_SetName (pBone, szToName);
		Position[0] = -data->nx*maxcoord; 
		Position[1] = -data->ny*maxcoord;
		Position[2] = -data->nz*maxcoord; 
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);

		// to bone
		nBone = msModel_AddBone (pModel);
		pBone = msModel_GetBoneAt (pModel, nBone);
		msBone_SetParentName (pBone, szName);
		szToName.Format("mdl_%s_zn",data->name);
        msBone_SetName (pBone, szToName);
		Position[0] = -data->px*maxcoord; 
		Position[1] = -data->py*maxcoord;
		Position[2] = -data->pz*maxcoord; 
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);

	}
	return 0;
}
int ImportCVH(msModel *pModel,CString sPath)
{
	CCVHFile cvhfile;
	if (!cvhfile.ReadFromFile(sPath))
		return 10;
	DelBones(pModel);
	//////////////////////////////////////////////////////////////////////////////////
    int nNumMeshes = cvhfile.nbobjects;
    if (nNumMeshes)
    {
        for (int i = 0; i < nNumMeshes ; i++)
        {
            int nMesh = msModel_AddMesh (pModel);
            msMesh *pMesh = msModel_GetMeshAt (pModel, nMesh);

			CString szName;
			szName.Format("cvh_%d",i);
            msMesh_SetName (pMesh, szName);
            msMesh_SetFlags (pMesh, 1);
            msMesh_SetMaterialIndex (pMesh, -1);

            //
            // vertices
            //
			PtrObject po = cvhfile.Objects.GetAt(i);
            int nNumVertices = po->points;

            for (int j = 0; j < nNumVertices; j++)
            {
                msVec3 Vertex;
				PtrPoint p = po->Points.GetAt(j);
				Vertex[0] = p->x;
				Vertex[1] = p->y;
				Vertex[2] = -p->z;
                int nVertex = msMesh_AddVertex (pMesh);
                msVertex *pVertex = msMesh_GetVertexAt (pMesh, nVertex);
                msVertex_SetVertex (pVertex, Vertex);
				msVertex_SetBoneIndex (pVertex, -1);
            }

            msVec3 Normal;
			Normal[0] = 1;
			Normal[1] = 0;
			Normal[2] = 0;
			int nNormal = msMesh_AddVertexNormal (pMesh);
            msMesh_SetVertexNormalAt (pMesh, nNormal, Normal);

            //
            // triangles
            //
			for (int p=0;p<po->points;p++)
			{
				PtrPoint pp = po->Points.GetAt(p);
				for (int cp = 0;cp<pp->nb_connected_points;cp++)
				{
					int np = pp->connected_points[cp];
					for (int h=cp+1;h<pp->nb_connected_points;h++)
					{
						int tp = pp->connected_points[h];
						word nIndices[3];
						word nNormalIndices[3];
						nIndices[0] = p;
						nIndices[1] = np;
						nIndices[2] = tp;
						nNormalIndices[0] = 0;
						nNormalIndices[1] = 0;
						nNormalIndices[2] = 0;
						int nTriangle = msMesh_AddTriangle (pMesh);
						msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, nTriangle);
						msTriangle_SetFlags (pTriangle, 1);
						msTriangle_SetVertexIndices (pTriangle, nIndices);
					    msTriangle_SetNormalIndices (pTriangle, nNormalIndices);
					    msTriangle_SetSmoothingGroup (pTriangle, i);

					}
				}
			}
			/*
			for (int p=0;p<po->points;p++)
			{
				PtrPoint pp = po->Points.GetAt(p);
				for (int cp = 0;cp<pp->nb_connected_points;cp++)
				{
					int np = pp->connected_points[cp];
					int tp = -1;
					for (int op=0;op<po->points;op++)
					{
						if ((op!=p) && (op!= np))
						{
							PtrPoint opp = po->Points.GetAt(op);
							for (int h=0;h<opp->nb_connected_points;h++)
								if (p == opp->connected_points[h])
								{
									word nIndices[3];
									word nNormalIndices[3];
									nIndices[0] = p;
									nIndices[1] = np;
									nIndices[2] = op;
									nNormalIndices[0] = 0;
									nNormalIndices[1] = 0;
									nNormalIndices[2] = 0;
									int nTriangle = msMesh_AddTriangle (pMesh);
									msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, nTriangle);
									msTriangle_SetFlags (pTriangle, 1);
									msTriangle_SetVertexIndices (pTriangle, nIndices);
					                msTriangle_SetNormalIndices (pTriangle, nNormalIndices);
					                msTriangle_SetSmoothingGroup (pTriangle, i);
								}
						} // if
					} // op
				} // cp
			} // p
			*/
		} // i
	} // if nummesh

	// named points
	for (int i=0;i<cvhfile.NamedPoints.GetCount();i++)
	{
		PtrNamedPoint pn = cvhfile.NamedPoints.GetAt(i);
        int nBone = msModel_AddBone (pModel);
        nBone = msModel_AddBone (pModel);

        msBone *pBone = msModel_GetBoneAt (pModel, i*2);

		CString szName;
		szName.Format("cvh_%s_from",pn->name);
        msBone_SetName (pBone, szName);
		msBone_SetParentName (pBone, "");

		msVec3 Position, Rotation;
		Position[0] = pn->x1;
		Position[1] = pn->y1;
		Position[2] = -pn->z1; // cvh Z coords are inverted
		Rotation[0] = 0;
		Rotation[1] = 0;
		Rotation[2] = 0;

		int nFlags = 8;
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);

		pBone = msModel_GetBoneAt (pModel, i*2+1);
		msBone_SetParentName (pBone, szName);
		szName.Format("cvh_%s_to",pn->name);
        msBone_SetName (pBone, szName);
		Position[0] = -pn->x2*cvhfile.header.biggest; // should be scaled to boundind box
		Position[1] = -pn->y2*cvhfile.header.biggest;
		Position[2] = pn->z2*cvhfile.header.biggest;
        msBone_SetFlags (pBone, nFlags);
        msBone_SetPosition (pBone, Position);
	    msBone_SetRotation (pBone, Rotation);
	}
#ifdef _DEBUG
	for (int i = 0; i < cvhfile.nbobjects; i++)
	{
		PtrObject po = cvhfile.Objects.GetAt(i);
        int nBone = msModel_AddBone (pModel);

        msBone *pBone = msModel_GetBoneAt (pModel, nBone);

		CString szName;
		szName.Format("cvh_%d_center",i);
        msBone_SetName (pBone, szName);
		msBone_SetParentName (pBone, "");
		msVec3 Position;
		Position[0] = po->cx;
		Position[1] = po->cy;
		Position[2] = -po->cz; // cvh Z coords are inverted
        msBone_SetPosition (pBone, Position);
	}

    int nMesh = msModel_AddMesh (pModel);
    msMesh *pMesh = msModel_GetMeshAt (pModel, nMesh);

	CString szName;
	szName.Format("cvh_BB");
    msMesh_SetName (pMesh, szName);
    msMesh_SetFlags (pMesh, 1);
    msMesh_SetMaterialIndex (pMesh, -1);

	int Cube_Vertex[8][3] = {         
		{-1,1,1},
		{-1,-1,1},
		{1,1,1},
		{1,-1,1},
		{1,1,-1},
		{1,-1,-1},
		{-1,1,-1},
		{-1,-1,-1}};
          
	for (int t=0;t<8;t++)
	{
        msVec3 Vertex;
		Vertex[0] = Cube_Vertex[t][0]*cvhfile.header.max_x;
		Vertex[1] = Cube_Vertex[t][1]*cvhfile.header.max_y;
		Vertex[2] = Cube_Vertex[t][2]*cvhfile.header.max_z;
        int nVertex = msMesh_AddVertex (pMesh);
        msVertex *pVertex = msMesh_GetVertexAt (pMesh, nVertex);
        msVertex_SetVertex (pVertex, Vertex);
		msVertex_SetBoneIndex (pVertex, -1);
	}
    msVec3 Normal;
	Normal[0] = 1;
	Normal[1] = 0;
	Normal[2] = 0;
	int nNormal = msMesh_AddVertexNormal (pMesh);
    msMesh_SetVertexNormalAt (pMesh, nNormal, Normal);

	int Cube_faces[12][3] ={        
			{0,1,2},
			{1,3,2},
			{2,3,4},
			{3,5,4},
			{4,5,6},
			{5,7,6},
			{6,7,0},
			{7,1,0},
			{6,0,4},
			{0,2,4},
			{1,7,3},
			{7,5,3}};
	for (int t=0;t<12;t++)
	{
		word nIndices[3];
		word nNormalIndices[3];
		nIndices[0] = Cube_faces[t][0];
		nIndices[1] = Cube_faces[t][1];
		nIndices[2] = Cube_faces[t][2];
		nNormalIndices[0] = 0;
		nNormalIndices[1] = 0;
		nNormalIndices[2] = 0;
		int nTriangle = msMesh_AddTriangle (pMesh);
		msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, nTriangle);
		msTriangle_SetFlags (pTriangle, 1);
		msTriangle_SetVertexIndices (pTriangle, nIndices);
		msTriangle_SetNormalIndices (pTriangle, nNormalIndices);
	}

	cvhfile.ComputeCenters();
    nMesh = msModel_AddMesh (pModel);
    pMesh = msModel_GetMeshAt (pModel, nMesh);

	szName.Format("cvh_BB_Computed");
    msMesh_SetName (pMesh, szName);
    msMesh_SetFlags (pMesh, 1);
    msMesh_SetMaterialIndex (pMesh, -1);

	for (int t=0;t<8;t++)
	{
        msVec3 Vertex;
		Vertex[0] = Cube_Vertex[t][0]*cvhfile.header.max_x;
		Vertex[1] = Cube_Vertex[t][1]*cvhfile.header.max_y;
		Vertex[2] = Cube_Vertex[t][2]*cvhfile.header.max_z;
        int nVertex = msMesh_AddVertex (pMesh);
        msVertex *pVertex = msMesh_GetVertexAt (pMesh, nVertex);
        msVertex_SetVertex (pVertex, Vertex);
		msVertex_SetBoneIndex (pVertex, -1);
	}
	Normal[0] = 1;
	Normal[1] = 0;
	Normal[2] = 0;
	nNormal = msMesh_AddVertexNormal (pMesh);
    msMesh_SetVertexNormalAt (pMesh, nNormal, Normal);

	for (int t=0;t<12;t++)
	{
		word nIndices[3];
		word nNormalIndices[3];
		nIndices[0] = Cube_faces[t][0];
		nIndices[1] = Cube_faces[t][1];
		nIndices[2] = Cube_faces[t][2];
		nNormalIndices[0] = 0;
		nNormalIndices[1] = 0;
		nNormalIndices[2] = 0;
		int nTriangle = msMesh_AddTriangle (pMesh);
		msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, nTriangle);
		msTriangle_SetFlags (pTriangle, 1);
		msTriangle_SetVertexIndices (pTriangle, nIndices);
		msTriangle_SetNormalIndices (pTriangle, nNormalIndices);
	}

#endif
	return 0;
}
int
cPlugIn::Execute (msModel *pModel)
{
    if (!pModel)
        return -1;

    //
    // switch the module state for MFC Dlls
    //
    AFX_MANAGE_STATE(AfxGetStaticModuleState());

    //
    // ask for deletion
    //
    if (msModel_GetBoneCount (pModel) > 0)
    {
        int RC = ::AfxMessageBox (IDS_WARNING_MODEL_DELETE, MB_YESNOCANCEL);
        if (RC != IDYES)
            return 0;
    }
    //
    // options dialog
    //
    cDlgOptions dlgOptions (NULL);
    if (dlgOptions.DoModal () != IDOK)
        return 0;

    CString sPath = dlgOptions.GetPathName ();
    if (sPath.IsEmpty ())
        return 0;

    nOptionFlags = dlgOptions.GetOptionFlags ();

	if (sPath.Right(4) == ".mdl")
	{
		ImportMDL(pModel,sPath);
	}
	if (sPath.Right(4) == ".cvh")
	{
		ImportCVH(pModel,sPath);
	}
    return 0;
}

