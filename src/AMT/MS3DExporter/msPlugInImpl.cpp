#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "msPlugInImpl.h"
#include "msLib.h"
#include "DlgAMT.h"
#include <MDLFile.h>
#include <CVHFile.h>
#include <math.h>
#include <freeimage.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


void AMT_GetInterpolatedVertexNormalAt (msMesh *pMesh, int nIndex, msVec3 Normal)
{
	Normal[0] = 0;
	Normal[1] = 0;
	Normal[2] = 0;
	int nfaces = 0;
    for (int j = 0; j < msMesh_GetTriangleCount (pMesh); j++)
    {
        msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, j);
        
        word nIndices[3];
        msTriangle_GetVertexIndices (pTriangle, nIndices);
		for (int i=0;i<3;i++)
			if (nIndex == nIndices[i])
				{
		            msVec3 FaceNormal;
		            msMesh_GetVertexNormalAt (pMesh, pTriangle->nNormalIndices[i], FaceNormal);
					nfaces++;
					Normal[0] += FaceNormal[0];
					Normal[1] += FaceNormal[1];
					Normal[2] += FaceNormal[2];
				}
    }
	if (nfaces>1)
	{
		float norm = sqrtf( Normal[0]*Normal[0] + Normal[1]*Normal[1] + Normal[2]*Normal[2]);
		if (norm != 0)
		{
			Normal[0] = Normal[0] / norm;
			Normal[1] = Normal[1] / norm;
			Normal[2] = Normal[2] / norm;
		}
	}
}
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
    return cMsPlugIn::eTypeExport;
}



const char*
cPlugIn::GetTitle ()
{
    return szTitle;
}



static void
MakeShortName (const char *szName, char *szOut, int nMaxLength)
{
	strncpy (szOut, szName, nMaxLength);

	if ((int) strlen (szOut) <= nMaxLength)
		return;

	szOut[nMaxLength] = '\0';
}



static void
MakeShortFileName (const char *szName, char *szOut)
{
	strcpy (szOut, szName);

	char *ptr = strrchr (szName, '\\');
	if (!ptr)
		ptr = strrchr (szName, '/');
	if (ptr)
		strcpy (szOut, ptr + 1);

	if ((int) strlen (szOut) <= 12)
		return;

	ptr = strrchr (szOut, '.');
	if (ptr)
	{
		memcpy (szOut + 8, ptr, 4);
		szOut[12] = '\0';
	}
	else
	{
		szOut[12] = '\0';
	}
}



int 
cPlugIn::PrintError ()
{
	if (1/*ftkerr3ds*/)
	{
		//const ErrRec3ds *pErr = ReturnErrorList3ds ();
		CString sErr;
		sErr.Format ("ERROR (%d): %s", 1, "error");
		::AfxMessageBox (sErr);
	}
	return (int) 1;//ftkerr3ds;
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

	if (msModel_GetMeshCount (pModel) == 0 &&
		msModel_GetMaterialCount (pModel) == 0)
	{
		::AfxMessageBox ("The model ist empty!  Nothing exported!");
		return -1;
	}

    //
    // options dialog
    //
    DlgAMT dlgAMT (NULL);
    if (dlgAMT.DoModal () != IDOK)
        return 0;

    CString sPath = dlgAMT.GetPathName ();
    if (sPath.IsEmpty ())
        return 0;

    nOptionFlags = dlgAMT.GetOptionFlags ();

	//
	//
	//
   
	if (sPath.Right(4) == ".cvh")
	{
		CCVHFile CVHFile;
		if (ConvertCVHFile(pModel,&CVHFile))
			CVHFile.SaveToFile(sPath);
		else
			AfxMessageBox("CVH Export: No cvh_* group(s) found !");
	}
	if (sPath.Right(4) == ".mdl")
	{
		CMDLFile MDLFile;
		if (ConvertMDLFile(pModel,&MDLFile))
			MDLFile.SaveToFile(sPath);
		else
			AfxMessageBox("MDL Export: No mdl_* group(s) found !");
	}
	//
	// Never forget to destroy the model, after an export!!
	//
	//msModel_Destroy (pModel); HELL NO IT CRASHES

    return 0;
}
bool cPlugIn::ComputeMDLBB(msModel *pModel,float *max_x,float *max_y, float *max_z)
{
	float maxx;
	float maxy;
	float maxz;
	maxx = maxy = maxz = 0;
	bool found = false;
    for (int i = 0; i < msModel_GetMeshCount (pModel); i++)
    {
	    char szName[MS_MAX_NAME];
        msMesh *pMesh = msModel_GetMeshAt (pModel, i);
        msMesh_GetName (pMesh, szName, MS_MAX_NAME);
		CString csName = szName;
		if (csName.Left(4) == "mdl_")
		{
			for (int j = 0; j < msMesh_GetVertexCount (pMesh); j++)
			{
				msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
				// vertex
				msVec3 Vertex;
				msVertex_GetVertex (pVertex, Vertex);
				maxx = max(maxx,fabsf(Vertex[0]));
				maxy = max(maxy,fabsf(Vertex[1]));
				maxz = max(maxz,fabsf(Vertex[2]));
				found = true;
			}
		}
	}
	*max_x = maxx;
	*max_y = maxy;
	*max_z = maxz;
	return found;
}

bool cPlugIn::ConvertMDLFile(msModel *pModel,CMDLFile *mdlfile)
{
	int nbo = 0;
	MDLObject **obs = new MDLObject* [msModel_GetMeshCount (pModel)];
	bool foundmdl = false;
    for (int i = 0; i < msModel_GetMeshCount (pModel); i++)
    {
	    char szName[MS_MAX_NAME];
        msMesh *pMesh = msModel_GetMeshAt (pModel, i);
        msMesh_GetName (pMesh, szName, MS_MAX_NAME);
		CString csName = szName;
		if (csName.Left(4) == "mdl_")
		{
			foundmdl = true;
			MDLObject *o = obs[nbo] = mdlfile->NewMDLObject();
			o->type = mdl_mesh;
			o->mesh = new MDLMesh;
			o->mesh->nvertex = msMesh_GetVertexCount (pMesh);
			o->mesh->vertices = new MDLVertice[o->mesh->nvertex];
			for (int j = 0; j < msMesh_GetVertexCount (pMesh); j++)
			{
				msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
				// vertex
				msVec3 Vertex;
				msVertex_GetVertex (pVertex, Vertex);
				o->mesh->vertices[j].x = Vertex[0];
				o->mesh->vertices[j].y = Vertex[1];
				o->mesh->vertices[j].z = Vertex[2];
				// UV
				msVec2 uv;
				msVertex_GetTexCoords (pVertex, uv);
				o->mesh->vertices[j].mx = uv[0];
				o->mesh->vertices[j].my = uv[1];
				// Normal
				msVec3 Normal;
				AMT_GetInterpolatedVertexNormalAt(pMesh,j,Normal);
				o->mesh->vertices[j].nx = Normal[0];
				o->mesh->vertices[j].ny = Normal[1];
				o->mesh->vertices[j].nz = Normal[2];
			}
			// faces
			o->mesh->nfaces = msMesh_GetTriangleCount(pMesh)*3;
			o->mesh->faces = new WORD[o->mesh->nfaces];
			for (j = 0; j < msMesh_GetTriangleCount (pMesh); j++)
			{
				msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, j);
		        
				word nIndices[3];
				msTriangle_GetVertexIndices (pTriangle, nIndices); 
				o->mesh->faces[j*3] = nIndices[0];
				o->mesh->faces[j*3+1] = nIndices[2]; // REVERSE ORDER !!!
				o->mesh->faces[j*3+2] = nIndices[1];
			}

			o->textidx = msMesh_GetMaterialIndex (pMesh);
			nbo++;
			o = NULL;
		}
	}
	if (nbo) // got at least 1 mesh
	{
		if (nbo==1) // 1 mesh -> 1 mesh
		{
			mdlfile->RootObject = obs[0];
		}
		else // >1 mesh -> 1 group of nbo mesh
		{
			MDLObject *o = mdlfile->NewMDLObject();
			o->type = mdl_group;
			o->nchildren = nbo;
			o->childrens = new MDLObject* [nbo];
			for (int n=0;n<nbo;n++)
			{
				o->childrens[n] = obs[n];
			}
			mdlfile->RootObject = o;
			o = NULL;
		}
		// textures
		mdlfile->Textures = new CString[msModel_GetMaterialCount (pModel)];
		// get all textidx val
		for (int n=0;n<nbo;n++)
		{
			if (obs[n]->textidx != -1)
			{
				msMaterial *pMaterial = msModel_GetMaterialAt (pModel, obs[n]->textidx);
				char szTexture[MS_MAX_PATH];
				msMaterial_GetDiffuseTexture (pMaterial, szTexture, MS_MAX_PATH);
				CString szText = szTexture;
				if (szText == "")
					obs[n]->textidx = -1;
				else
				{
					for (int t=0;t<mdlfile->NumTextures;t++) // check if texture exists
					{
						if (szText == mdlfile->Textures[t])
						{
							obs[n]->textidx = t;
							break;
						}
					}
					if (t==mdlfile->NumTextures) // new texture, add it
					{
						mdlfile->NumTextures++;
						mdlfile->Textures[t] = szText;
					}
				}
			}
		} // for n
		// end of textures
		// Lights & FrameDatas
		mdlfile->Lights = new MDLLight[msModel_GetBoneCount(pModel)];
		mdlfile->FrameDatas = new MDLFrameData[msModel_GetBoneCount(pModel)];
		for (int i = 0; i < msModel_GetBoneCount (pModel); i++)
		{
		    char szName[MS_MAX_NAME];
			CString sName,sParentName;
			msBone *pBone = msModel_GetBoneAt (pModel, i);
			msBone_GetName (pBone, szName, MS_MAX_NAME);
			sName = szName;
			msBone_GetParentName (pBone, szName, MS_MAX_NAME);
			sParentName = szName;
			msVec3 Position;
			msVec3 Rotation;
			msBone_GetPosition (pBone, Position);
			msBone_GetRotation (pBone, Rotation);
			if ((sParentName == "") && (sName.Left(6)=="light-"))
			{
				int r,g,b,s;
				sscanf(sName.Right(sName.GetLength()-6),"%d-%d-%d-%d",&r,&g,&b,&s);
				if ((r>=0) && (r<256) &&
					(g>=0) && (g<256) &&
					(b>=0) && (b<256) &&
					(s>=0) && (s<256) 
					)
				{
					mdlfile->NumLights++;
					mdlfile->Lights[mdlfile->NumLights-1] = mdlfile->NewMDLLight(r,g,b,s);
					mdlfile->Lights[mdlfile->NumLights-1].posx = Position[0];
					mdlfile->Lights[mdlfile->NumLights-1].posy = Position[1];
					mdlfile->Lights[mdlfile->NumLights-1].posz = Position[2];
				}
				else
				{
					CString errmsg;
					errmsg.Format("%s: invalid light detected, not converted",sName);
					AfxMessageBox(errmsg);
				}
			} // light-
			// FrameData- "from"
			if ((sParentName == "") && (sName.Left(4)=="mdl_") && (sName.Right(5)=="_from"))
			{
				MDLFrameData *fd = &(mdlfile->FrameDatas[mdlfile->NumFrameDatas]);
				mdlfile->NumFrameDatas++;
				fd->name = "XX"+sName.Mid(4,sName.GetLength()-9);
				fd->posx = Position[0]; fd->posy = Position[1]; fd->posz = Position[2];
				fd->nx = Rotation[0]; fd->ny = Rotation[1]; fd->nz = Rotation[2];
				fd->px = Rotation[0]; fd->py = Rotation[1]; fd->pz = Rotation[2];
			}
			if ((sParentName != "") && (sName.Left(4)=="mdl_") && (sName.Right(5)=="_from"))
			{
					CString errmsg;
					errmsg.Format("%s: invalid mdl data detected, not converted (this joint his 'from' but has a parent join)",sName);
					AfxMessageBox(errmsg);
			}
		} // for i
		// FrameData - "to" & "zn"
		for (int i = 0; i < msModel_GetBoneCount (pModel); i++)
		{
		    char szName[MS_MAX_NAME];
			CString sName,sParentName;
			msBone *pBone = msModel_GetBoneAt (pModel, i);
			msBone_GetName (pBone, szName, MS_MAX_NAME);
			sName = szName;
			msBone_GetParentName (pBone, szName, MS_MAX_NAME);
			sParentName = szName;
			msVec3 Position;
			msVec3 Rotation;
			msBone_GetPosition (pBone, Position);
			msBone_GetRotation (pBone, Rotation);
			if ((sParentName.Left(4) == "mdl_") &&
				(sParentName.Right(5) == "_from") &&
				(sName.Left(4 )== "mdl_"))
			{
				if ((sName.Right(3) == "_to") || (sName.Right(3) == "_zn"))
				{
					// find parent in mdlfile
					CString name = sName.Mid(4,sName.GetLength()-7);
					for (int n=0;n<mdlfile->NumFrameDatas;n++)
					{
						if ((sName.Right(3) == "_to") &&
							((mdlfile->FrameDatas[n].name == ("X"+name)) ||
							 (mdlfile->FrameDatas[n].name == ("XX"+name))
							))
						{
							Rotate(
								Position[0],
								Position[1],
								Position[2],
								&(mdlfile->FrameDatas[n].nx),
								&(mdlfile->FrameDatas[n].ny),
								&(mdlfile->FrameDatas[n].nz)
								);
							//remove 1 heading X
							mdlfile->FrameDatas[n].name = mdlfile->FrameDatas[n].name.Right(mdlfile->FrameDatas[n].name.GetLength()-1);
						}
						if ((sName.Right(3) == "_zn") &&
							((mdlfile->FrameDatas[n].name == ("X"+name)) ||
							 (mdlfile->FrameDatas[n].name == ("XX"+name))
							))
						{
							Rotate(
								Position[0],
								Position[1],
								Position[2],
								&(mdlfile->FrameDatas[n].px),
								&(mdlfile->FrameDatas[n].py),
								&(mdlfile->FrameDatas[n].pz)
								);
							//remove 1 heading X
							mdlfile->FrameDatas[n].name = mdlfile->FrameDatas[n].name.Right(mdlfile->FrameDatas[n].name.GetLength()-1);
						}
					} // for n
					if (n==mdlfile->NumFrameDatas)
					{
						// no parent
					}
				}
				else
				{
					CString errmsg;
					errmsg.Format("%s: invalid mdl data detected, not converted (invalide type (should be '_to' or '_zn')",sName);
					AfxMessageBox(errmsg);
				}
			}
		} // for i
		for (int n=0;n<mdlfile->NumFrameDatas;n++)
		{
			if (mdlfile->FrameDatas[n].name.Left(1) == "X")
			{
				for (int m=n+1;m<mdlfile->NumFrameDatas;m++)
				{
					mdlfile->FrameDatas[m-1] = mdlfile->FrameDatas[m];
				}
				mdlfile->NumFrameDatas--; 
			}
		}
		float *fv = new float;
		*fv = 61.0;
		mdlfile->FrameVal = fv;
		// Textures
		FreeImage_Initialise(); 
		for (int n=0;n<mdlfile->NumTextures;n++)
		{
			CString tex = mdlfile->Textures[n];
			int z;
			while ((z=tex.Find('\\'))!=-1)
			{
				tex = tex.Right(tex.GetLength()-z-1);
			}
			tex.Replace(".","");
			if (nOptionFlags & eMaterials)
			{
				CString texfn = tex+".mdl";
				CFileStatus status;
				BOOL bTexExist = CFile::GetStatus(tex+".mdl",status);
				if (!bTexExist || (bTexExist && (nOptionFlags & eOverwriteBMP)))
				{
					// convert bmp to bmp.mdl
					CMDLFile texfile;
					if (!texfile.FromBMP(mdlfile->Textures[n],tex))
					{
						CString errmsg;
						errmsg.Format("cant find or bad bitmap: %s",mdlfile->Textures[n]);
						AfxMessageBox(errmsg);
					}
					else
					{
						texfile.SaveToFile(texfn); // should check !
					}
				}
			}
			mdlfile->Textures[n] = tex;
		}
		FreeImage_DeInitialise(); 
		return true;
	}
	else
		return false;
}
bool cPlugIn::ConvertCVHFile(msModel *pModel,CCVHFile *cvhfile)
{
	bool foundcvh = false;
	cvhfile->nbobjects = 0;
    for (int i = 0; i < msModel_GetMeshCount (pModel); i++)
    {
	    char szName[MS_MAX_NAME];
        msMesh *pMesh = msModel_GetMeshAt (pModel, i);
        msMesh_GetName (pMesh, szName, MS_MAX_NAME);
		CString csName = szName;
		if (csName.Left(4) == "cvh_")
		{
			// this is a cvh meesh group
			PtrObject po = new CVHObject;
			po->points = msMesh_GetVertexCount (pMesh);
			int *WeldArray = new int[msMesh_GetVertexCount (pMesh)];
			WeldArray[0] = 0;
			for (int j = 0; j < msMesh_GetVertexCount (pMesh); j++)
			{
				msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
				msVec3 Vertex;
				msVertex_GetVertex (pVertex, Vertex);
				int maxp = po->Points.GetCount();
				WeldArray[j] = maxp;
				for (int t=0;t<maxp;t++)
				{
					PtrPoint prevp = po->Points.GetAt(t);
					if ((prevp->x == Vertex[0]) &&
						(prevp->y == Vertex[1]) &&
						(prevp->z == -Vertex[2]))
					{
						WeldArray[j] = t;
					}
				}
				if (WeldArray[j] == maxp)
				{
					PtrPoint pp = new CVHPoint;
					po->Points.Add(pp);
					pp->nb_connected_points = 0;
					pp->x = Vertex[0];
					pp->y = Vertex[1];
					pp->z = -Vertex[2];
				}
			}

			//
			// triangles
			//
			for (j = 0; j < msMesh_GetTriangleCount (pMesh); j++)
			{
				msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, j);
	            
				word nIndices[3];
				msTriangle_GetVertexIndices (pTriangle, nIndices);
				PtrPoint pp0 = po->Points.GetAt(WeldArray[nIndices[0]]);
				PtrPoint pp1 = po->Points.GetAt(WeldArray[nIndices[1]]);
				PtrPoint pp2 = po->Points.GetAt(WeldArray[nIndices[2]]);

				cvhfile->AddConnectedPoints(pp0,WeldArray[nIndices[1]],WeldArray[nIndices[2]]);
				cvhfile->AddConnectedPoints(pp1,WeldArray[nIndices[0]],WeldArray[nIndices[2]]);
				cvhfile->AddConnectedPoints(pp2,WeldArray[nIndices[0]],WeldArray[nIndices[1]]);
			}
			delete WeldArray;
			po->points = po->Points.GetCount();
			po->vertices = 0;
			bool Valid = true;
			for (j = 0; j < po->points; j++)
			{
				PtrPoint pp = po->Points.GetAt(j);
				po->vertices += pp->nb_connected_points;
				if (pp->nb_connected_points == 0)
					Valid = false;
			}
			if (Valid)
			{
				cvhfile->Objects.Add(po);
				cvhfile->nbobjects += 1;
				foundcvh = true;
			}
			else
			{
				CString errmsg;
				errmsg.Format("%s contains unconnected points when converted\nBe sure there is no points sharing the same position\n%s removed from conversion",csName,csName);
				AfxMessageBox(errmsg);
			}
		}
	}
	if (foundcvh)
	{
		cvhfile->ComputeCenters();
		/*float mx,my,mz;
		if (!ComputeMDLBB(pModel,&mx,&my,&mz))
		{
			AfxMessageBox("Warning: CVH header need the MDL part to be compute its bounding box.\nNo MDL groups found, defaulting to CVH bounding box. Use at your own risk !");
		}
		else
			cvhfile->ComputeHeader(mx,my,mz);
		*/
		cvhfile->ComputeHeader();
		// named position - 'to'
		for (i = 0; i < msModel_GetBoneCount (pModel); i++)
		{
		    char szName[MS_MAX_NAME];
			CString sName,sParentName;
			msBone *pBone = msModel_GetBoneAt (pModel, i);
			msBone_GetName (pBone, szName, MS_MAX_NAME);
			sName = szName;
			msBone_GetParentName (pBone, szName, MS_MAX_NAME);
			sParentName = szName;
			if ((sParentName == "") && (sName.Left(4)=="cvh_") && (sName.Right(5) == "_from"))
			{
				PtrNamedPoint np = new CVHNamedPoint;
				cvhfile->NamedPoints.Add(np);
				np->name = "X"+sName.Mid(4,sName.GetLength()-9);
				msVec3 Position;
				msVec3 Rotation;
				msBone_GetPosition (pBone, Position);
				msBone_GetRotation (pBone, Rotation);

				np->x1 = Position[0];
				np->y1 = Position[1];
				np->z1 = -Position[2];
				np->x2 = Rotation[0];
				np->y2 = Rotation[1];
				np->z2 = Rotation[2];
			}
		}
		// named position - 'from'
		for (i = 0; i < msModel_GetBoneCount (pModel); i++)
		{
		    char szName[MS_MAX_NAME];
			CString sName,sParentName;
			msBone *pBone = msModel_GetBoneAt (pModel, i);
			msBone_GetName (pBone, szName, MS_MAX_NAME);
			sName = szName;
			msBone_GetParentName (pBone, szName, MS_MAX_NAME);
			sParentName = szName;
			if ((sParentName.Left(4)== "cvh_") && 
				(sParentName.Right(5)== "_from") &&
				(sName.Left(4)=="cvh_") &&
				(sName.Right(3) == "_to"))
			{
				PtrNamedPoint np;
				CString name = sName.Mid(4,sName.GetLength()-7);
				for (int n=0;n<cvhfile->NamedPoints.GetCount();n++)
				{
					np = cvhfile->NamedPoints.GetAt(n);
					if (np->name == "X"+name)
					{
						msVec3 Position;
						msVec3 Rotation;
						msBone_GetPosition (pBone, Position);
						msBone_GetRotation (pBone, Rotation);
						float toRx = np->x2;
						float toRy = np->y2;
						float toRz = np->z2;
						float x = Position[0];
						float y = Position[1];
						float z = Position[2];
						//here boy, rotate along 3 angles
						/*
							ROTATION AROUND THE X AXIS :

									x' = x
									y' = y*cos(Ax) - z*sin(Ax)
									z' = y*sin(Ax) + z*cos(Ax)

							ROTATION AROUND THE Y AXIS :

									x' = x*cos(Ay) + z*sin(Ay)
									y' = y
									z' = -x*sin(Ay) + z*cos(Ay)

							ROTATION AROUND THE Z AXIS :

									x'= x*cos(Az) - y*sin(Az)
									y'= x*sin(Az) + y*cos(Az)
									z'= z
						*/
						// rotate aound X axis, angle = toRx
						np->x2 = x;
						np->y2 = y*cosf(toRx)-z*sinf(toRx);
						np->z2 = y*sinf(toRx)+z*cosf(toRx);
						x=np->x2; y=np->y2; z=np->z2;
						// rotate aound Y axis, angle = toRy
						np->x2 = x*cosf(toRy)+z*sinf(toRy);
						np->y2 = y;
						np->z2 = -x*sinf(toRy)+z*cosf(toRy);
						x=np->x2; y=np->y2; z=np->z2;
						// rotate aound Z axis, angle = toRz
						np->x2 = x*cosf(toRz)-y*sinf(toRz);
						np->y2 = x*sinf(toRz)+y*cosf(toRz);
						np->z2 = z;
						//x=np->x2; y=np->y2; z=np->z2;
						// normalize x2,y2,z2
						float norm = sqrtf( np->x2*np->x2 + np->y2*np->y2 +np->z2*np->z2);
						if (norm != 0)
						{
							np->x2 = -np->x2 / norm;
							np->y2 = -np->y2 / norm;
							np->z2 = np->z2 / norm;
						}
						else
						{
							np->x2 = np->y2 = np->z2 = 0;
						}
						np->name = np->name.Right(np->name.GetLength()-1); // remove heading 'X'

					}
					else
					{
						// should warn
					}
				}
			}
		}
		// removed unmatched 'from'
		for (int n=0;n<cvhfile->NamedPoints.GetCount();n++)
		{
			PtrNamedPoint np = cvhfile->NamedPoints.GetAt(n);
			if (np->name.Left(1) == "X")
			{
				cvhfile->NamedPoints.RemoveAt(n);
				n=0;
				// should warn
			}
		}
	}
	return foundcvh;
}

bool cPlugIn::DumpToText(msModel *pModel,CString sPath)
{
	// open file
    FILE *file = fopen (sPath, "wt");
    if (!file)
        return false;

    int i, j;
    char szName[MS_MAX_NAME];

    fprintf (file, "Frames: %d\n", msModel_GetTotalFrames (pModel));
    fprintf (file, "Frame: %d\n\n", msModel_GetFrame (pModel));
    fprintf (file, "Meshes: %d\n", msModel_GetMeshCount (pModel));

	msMesh *pMainMesh = NULL;
    for (i = 0; i < msModel_GetMeshCount (pModel); i++)
    {
        msMesh *pMesh = msModel_GetMeshAt (pModel, i);
		if (!pMainMesh) 
			pMainMesh = pMesh;

        msMesh_GetName (pMesh, szName, MS_MAX_NAME);

		fprintf (file, "meesh: \"%s\" %d %d\n", szName, msMesh_GetFlags (pMesh), msMesh_GetMaterialIndex (pMesh));

        //
        // vertices
        //
        fprintf (file, "%d\n", msMesh_GetVertexCount (pMesh));
        for (j = 0; j < msMesh_GetVertexCount (pMesh); j++)
        {
            msVertex *pVertex = msMesh_GetVertexAt (pMesh, j);
            msVec3 Vertex;
            msVec2 uv;

            msVertex_GetVertex (pVertex, Vertex);
            msVertex_GetTexCoords (pVertex, uv);

			fprintf (file, "vertices: %d %f %f %f %f %f %d\n",
                msVertex_GetFlags (pVertex),
                Vertex[0], Vertex[1], Vertex[2],
                uv[0], uv[1],
                msVertex_GetBoneIndex (pVertex)
                );
        }

        //
        // vertex normals
        //
        fprintf (file, "%d\n", msMesh_GetVertexNormalCount (pMesh));
        for (j = 0; j < msMesh_GetVertexNormalCount (pMesh); j++)
        {
            msVec3 Normal;
            msMesh_GetVertexNormalAt (pMesh, j, Normal);
			fprintf (file, "normals: %f %f %f\n", Normal[0], Normal[1], Normal[2]);
        }

        //
        // triangles
        //
        fprintf (file, "%d\n", msMesh_GetTriangleCount (pMesh));
        for (j = 0; j < msMesh_GetTriangleCount (pMesh); j++)
        {
            msTriangle *pTriangle = msMesh_GetTriangleAt (pMesh, j);
            
            word nIndices[3];
            msTriangle_GetVertexIndices (pTriangle, nIndices);
            
			fprintf (file, "triangle: f=%d (%d,%d,%d) (%d,%d,%d) g=%d\n",
                msTriangle_GetFlags (pTriangle),
                nIndices[0], nIndices[1], nIndices[2],
                pTriangle->nNormalIndices[0], pTriangle->nNormalIndices[1], pTriangle->nNormalIndices[2],
                msTriangle_GetSmoothingGroup (pTriangle)
                );
        }
    }

    //
    // materials
    //
    fprintf (file, "\nMaterials: %d\n", msModel_GetMaterialCount (pModel));
    for (i = 0; i < msModel_GetMaterialCount (pModel); i++)
    {
        msMaterial *pMaterial = msModel_GetMaterialAt (pModel, i);
        msMaterial_GetName (pMaterial, szName, MS_MAX_NAME);
		fprintf (file, "material: \"%s\"\n", szName);

        msVec4 vec4;
        msMaterial_GetAmbient (pMaterial, vec4);
		fprintf (file, "ambiant: %f %f %f %f\n", vec4[0], vec4[1], vec4[2], vec4[3]);
        msMaterial_GetDiffuse (pMaterial, vec4);
		fprintf (file, "diffuse: %f %f %f %f\n", vec4[0], vec4[1], vec4[2], vec4[3]);
        msMaterial_GetSpecular (pMaterial, vec4);
		fprintf (file, "specular: %f %f %f %f\n", vec4[0], vec4[1], vec4[2], vec4[3]);
        msMaterial_GetEmissive (pMaterial, vec4);
		fprintf (file, "Emissive: %f %f %f %f\n", vec4[0], vec4[1], vec4[2], vec4[3]);
		fprintf (file, "Shininess: %f\n", msMaterial_GetShininess (pMaterial));
		fprintf (file, "Transparency: %f\n", msMaterial_GetTransparency (pMaterial));

        char szTexture[MS_MAX_PATH];
        msMaterial_GetDiffuseTexture (pMaterial, szTexture, MS_MAX_PATH);
		fprintf (file, "Diffuse texture: \"%s\"\n", szTexture);
        msMaterial_GetAlphaTexture (pMaterial, szTexture, MS_MAX_PATH);
		fprintf (file, "Alpha texture: \"%s\"\n", szTexture);
    }

    //
    // bones
    //
    fprintf (file, "\nBones: %d\n", msModel_GetBoneCount (pModel));
    for (i = 0; i < msModel_GetBoneCount (pModel); i++)
    {
        msBone *pBone = msModel_GetBoneAt (pModel, i);
        msBone_GetName (pBone, szName, MS_MAX_NAME);
        fprintf (file, "\"%s\"\n", szName);
        msBone_GetParentName (pBone, szName, MS_MAX_NAME);
        fprintf (file, "\"%s\"\n", szName);
        msVec3 Position, Rotation;
        msBone_GetPosition (pBone, Position);
        msBone_GetRotation (pBone, Rotation);
        fprintf (file, "%d %f %f %f %f %f %f\n",
            msBone_GetFlags (pBone),
            Position[0], Position[1], Position[2],
            Rotation[0], Rotation[1], Rotation[2]
            );

        fprintf (file, "%d\n", msBone_GetPositionKeyCount (pBone));
        for (j = 0; j < msBone_GetPositionKeyCount (pBone); j++)
        {
            msPositionKey *pKey = msBone_GetPositionKeyAt (pBone, j);
            //fprintf (file, "Time: %f, Position Key: %f %f %f\n",
            fprintf (file, "%f %f %f %f\n",
                pKey->fTime, pKey->Position[0], pKey->Position[1], pKey->Position[2]
                );
        }

        fprintf (file, "%d\n", msBone_GetRotationKeyCount (pBone));
        for (j = 0; j < msBone_GetRotationKeyCount (pBone); j++)
        {
            msRotationKey *pKey = msBone_GetRotationKeyAt (pBone, j);
            //fprintf (file, "Time: %f, Rotation Key: %f %f %f\n",
            fprintf (file, "%f %f %f %f\n",
                pKey->fTime, pKey->Rotation[0], pKey->Rotation[1], pKey->Rotation[2]
                );
        }
    }
	return true;
}
void cPlugIn::Rotate(float x, float y,float z,float *rx,float *ry, float *rz)
{
	float toRx = *rx;
	float toRy = *ry;
	float toRz = *rz;
	float x2,y2,z2;
	// rotate aound X axis, angle = toRx
	x2 = x;
	y2 = y*cosf(toRx)-z*sinf(toRx);
	z2 = y*sinf(toRx)+z*cosf(toRx);
	x=x2; y=y2; z=z2;
	// rotate aound Y axis, angle = toRy
	x2 = x*cosf(toRy)+z*sinf(toRy);
	y2 = y;
	z2 = -x*sinf(toRy)+z*cosf(toRy);
	x=x2; y=y2; z=z2;
	// rotate aound Z axis, angle = toRz
	x2 = x*cosf(toRz)-y*sinf(toRz);
	y2 = x*sinf(toRz)+y*cosf(toRz);
	z2 = z;
	float norm = sqrtf(x2*x2+y2*y2+z2*z2);
	if (!norm)
		norm = 1;
	*rx = x2 / norm;
	*ry = y2 / norm;
	*rz = z2 / norm;
}