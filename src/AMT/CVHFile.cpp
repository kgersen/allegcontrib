/*
	CVHFile.cpp - Allegiance cvh files API 
	requires <afxtempl.h> for CArray
	Copyright (C) Kirth Gersen, 2001-2002.  All rights reserved.
	v 0.94
*/
#include "StdAfx.h"
#include "cvhfile.h"
#include <math.h>

CCVHFile::CCVHFile(void)
{
	nbobjects = 0;
}

CCVHFile::~CCVHFile(void)
{
}

bool CCVHFile::ReadFromFile(CString sFileName)
{
	CStdioFile cf;
	cf.Open(sFileName,CFile::modeRead);
	CString s;
	cf.ReadString(s);
	sscanf(s,"%f %f %f %f %f",&header.biggest,&header.max_x,&header.max_y,&header.max_z,&header.scale);
	cf.ReadString(s);
	sscanf(s,"%d",&nbobjects);
	for (int i=0;i<nbobjects;i++)
	{
		PtrObject po = new CVHObject;
		cf.ReadString(s);
		sscanf(s,"%d %d %f %f %f",&po->points,&po->vertices,&po->cx,&po->cy,&po->cz);
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = new CVHPoint;
			cf.ReadString(s);
			sscanf(s,"%f %f %f %d",&pp->x,&pp->y,&pp->z,&pp->nb_connected_points);
			//read pp->nb_connected_points in s
			for (int c=0;c<pp->nb_connected_points;c++)
			{
				fscanf(cf.m_pStream,"%d",&pp->connected_points[c]);
			}
			cf.ReadString(s);
			po->Points.Add(pp);
		}
		Objects.Add(po);
	}
	while (cf.ReadString(s))
	{
		PtrNamedPoint pn = new CVHNamedPoint;
		pn->name = s;
		cf.ReadString(s);
		sscanf(s,"%f %f %f",&pn->x1,&pn->y1,&pn->z1);
		cf.ReadString(s);
		sscanf(s,"%f %f %f",&pn->x2,&pn->y2,&pn->z2);
		NamedPoints.Add(pn);
	}
	cf.Close();
	return true;
}

bool CCVHFile::SaveToFile(CString sFileName)
{
	// asume all values (header & objects centers are computed)
	if (!nbobjects) return false;
	CStdioFile cf;
	if (!cf.Open(sFileName,CFile::modeCreate|CFile::modeWrite))
		return false;

	CString s;
	// header
	s.Format("    %.8f %.8f %.8f %.8f %.8f\n",header.biggest,header.max_x,header.max_y,header.max_z,header.scale);
	cf.WriteString(s);
	s.Format("%d\n",nbobjects);
	cf.WriteString(s);
	for (int i=0;i<nbobjects;i++) // ASSERT(nbojects ==  Objects.Count()); 
	{
		PtrObject po = Objects.GetAt(i);
		s.Format("    %d %d %.8f %.8f %.8f\n",po->points,po->vertices,po->cx,po->cy,po->cz);
		cf.WriteString(s);
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = po->Points.GetAt(p);
			s.Format("        %.8f %.8f %.8f %d\n",pp->x,pp->y,pp->z,pp->nb_connected_points);
			cf.WriteString(s);
			s="    ";
			for (int c=0;c<pp->nb_connected_points;c++)
			{
				s.AppendFormat("%d ",pp->connected_points[c]);
			}
			s.AppendFormat("\n");
			cf.WriteString(s);
		}
	}
	for (int i=0;i<NamedPoints.GetCount();i++)
	{
		PtrNamedPoint pn = NamedPoints.GetAt(i);
		s.Format("%s\n",pn->name);
		cf.WriteString(s);
		s.Format("       %.10f %.10f %.10f\n",pn->x1,pn->y1,pn->z1);
		cf.WriteString(s);
		s.Format("       %.10f %.10f %.10f\n",pn->x2,pn->y2,pn->z2);
		cf.WriteString(s);
	}

	cf.Close();
	return true;
}
bool CCVHFile::SaveToXFile(CString sFileName, CString sName)
{
	CStdioFile cf;
	cf.Open(sFileName,CFile::modeCreate|CFile::modeWrite);
	CString s;
	s.Format("xof 0302txt 0064\nHeader {\n 1;\n 0;\n 1;\n}\n");
	cf.WriteString(s);
	CString sName2;
	sName2 = cf.GetFileTitle();
	for (int o=0;o<nbobjects;o++)
	{
		PtrObject po = Objects.GetAt(o);
		s.Format("Frame cvh_%s_%d {\nMesh Object%d {\n",sName2,o,o);
		cf.WriteString(s);
		s.Format("%d;\n",po->points);
		cf.WriteString(s);
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = po->Points.GetAt(p);
			s.Format("%f;%f;%f;",pp->x,pp->y,pp->z);
			cf.WriteString(s);
			if (p==po->points-1)
				s.Format(";\n");
			else
				s.Format(",\n");
			cf.WriteString(s);
		}	
		/*
		s.Format("%d;\n",po->vertices);
		cf.WriteString(s);
		*/
		// vertex output
		/*
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = po->Points.GetAt(p);
			s.Format("%d;",pp->nb_connected_points+1);
			s.AppendFormat("%d,",p);
			for (int cp = 0;cp<pp->nb_connected_points;cp++)
			{
				s.AppendFormat("%d%c",pp->connected_points[cp],(cp==pp->nb_connected_points-1)?';':',');
			}
			if (p==po->points-1)
				s.AppendFormat(";\n");
			else
				s.AppendFormat(",\n");
			cf.WriteString(s);
		}*/
		/*
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = po->Points.GetAt(p);
			for (int cp = 0;cp<pp->nb_connected_points;cp++)
			{
				int fp = p;
				int dp;
				if (cp == pp->nb_connected_points-1)
					dp = p;
				else
				    dp = pp->connected_points[cp+1];
				if (cp != 0)
					fp = pp->connected_points[cp-1];

				s.Format("3;");
				s.AppendFormat("%d,",fp);
				s.AppendFormat("%d,%d;",pp->connected_points[cp],dp);
				if ((p==po->points-1) & (cp==pp->nb_connected_points-1))
					s.AppendFormat(";\n");
				else
					s.AppendFormat(",\n");
				cf.WriteString(s);
			}
		}
		*/
		int totalvert = 0;
		s = "";
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
								totalvert++;
								s.AppendFormat("3;%d,%d,%d;,\n",p,np,op);
							}
					}
				}
			}
		}
		s.SetAt(strlen(s)-2,';');
		CString res;
		res.Format("%d;\n%s",totalvert,s);
		cf.WriteString(res);
		s = "}\n}\n";
		cf.WriteString(s);
	}
	cf.Close();
	return false;
}
void CCVHFile::ComputeCenters(void)
{
	for (int i=0;i<Objects.GetCount();i++)
	{
		PtrObject po = Objects.GetAt(i);
		po->cx = 0;
		po->cy = 0;
		po->cz = 0;
		for (int p=0;p<po->points;p++)
		{
			float cx,cy,cz;
			PtrPoint pp = po->Points.GetAt(p);
			cx = pp->x;
			cy = pp->y;
			cz = pp->z;
			/*
			for (int c=0;c<pp->nb_connected_points;c++)
			{
				PtrPoint pc = po->Points.GetAt(c);
				cx += pc->x;
				cy += pc->y;
				cz += pc->z;

			}
			cx /= pp->nb_connected_points+1;
			cy /= pp->nb_connected_points+1;
			cz /= pp->nb_connected_points+1;
			*/
			po->cx += cx;
			po->cy += cy;
			po->cz += cz;
		}
		po->cx /= po->points;
		po->cy /= po->points;
		po->cz /= po->points;
	}
}

// obsolete, max_* must be computed from mdl meshes
void CCVHFile::ComputeHeader(void)
{
	header.max_x = 0;
	header.max_y = 0;
	header.max_z = 0;
	//float scale; // set to 1.0 when exporting :) 

	for (int i=0;i<Objects.GetCount();i++)
	{
		PtrObject po = Objects.GetAt(i);
		for (int p=0;p<po->points;p++)
		{
			PtrPoint pp = po->Points.GetAt(p);
			header.max_x = MAX(header.max_x,fabsf(pp->x));
			header.max_y = MAX(header.max_y,fabsf(pp->y));
			header.max_z = MAX(header.max_z,fabsf(pp->z));
		}
	}
	header.scale = 1.0;
	header.biggest = MAX(MAX(header.max_x,header.max_y),header.max_z);
}
void CCVHFile::ComputeHeader(float mx, float my, float mz)
{
	header.max_x = mx;
	header.max_y = my;
	header.max_z = mz;
	header.scale = 1.0;
	header.biggest = MAX(MAX(header.max_x,header.max_y),header.max_z);
}
void CCVHFile::AddConnectedPoints(PtrPoint pp,int i1, int i2)
{
		bool p1exist = false;
		bool p2exist = false;
	    for (int k=0;k<pp->nb_connected_points;k++)
		{
			if (pp->connected_points[k] == i1)
				p1exist = true;
			if (pp->connected_points[k] == i2)
				p2exist = true;
		}
		if (!p1exist)
			pp->connected_points[pp->nb_connected_points++] = i1;
		if (!p2exist)
			pp->connected_points[pp->nb_connected_points++] = i2;

}