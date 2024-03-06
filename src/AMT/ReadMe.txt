========================================================================
    CONSOLE APPLICATION : CVHConvert Project Overview
========================================================================
////////////////////////////////////////////////////////////////////////////////
take 1
////////////////////////////////////////////////////////////////////////////////
	for (int i=0;i<header.nb_tags;i++)
	{
		CString tag = ParseString(&cf);
		res.AppendFormat("[header]%s - ",tag);
	}
	CString s = ParseString(&cf); // skip 0000
	bool bOut = false;
	for (int i=0;i<header.l2;i++)
	{
		CString tag = ParseString(&cf);
		if(	(tag=="ModifiableNumber") ||
			(tag=="GroupGeo") ||
			(tag=="MeshGeo") ||
			(tag=="LODGeo") ||
			(tag=="TextureGeo")||
			(tag=="LightsGeo") ||
			(tag=="FrameData") ||
			(tag=="time") 
			)
		{
			ULONG uk1;
			cf.Read(&uk1,sizeof(uk1));
			res.AppendFormat("(%d)",uk1);
			//if ((uk1 < 0)||(uk1 >2)) bOut = true;
			if (tag=="TextureGeo")
			{
				CString bmpfile = ParseString(&cf);
				res.AppendFormat("[%s]",bmpfile);
				i++;
			}
		}
		res.AppendFormat("[l2]%s - ",tag);
	}
////////////////////////////////////////////////////////////////////////////////
take 2
////////////////////////////////////////////////////////////////////////////////
bool CMDLFile::ReadFromFile(CString sFileName,bool dump)
{
	CFile cf;
	if (!cf.Open(sFileName,CFile::modeRead))
	{
		AfxMessageBox("cant open file");
		return false;
	}
	ULONG cookie;
	cf.Read(&cookie,4);
	CString sf = cf.GetFileName();
	if (cookie != MDLCOOKIE)
	{
		AfxMessageBox("bad header");
		cf.Close();
		return false;
	}
	MDLHeader header;
	cf.Read(&header,sizeof(MDLHeader));
	CString res;
	res.Format("%s:\n",sf);
	res.AppendFormat("tags=%04X l2=%04X l3=%04X l4=%04X\n",header.nb_tags,header.l2,header.l3,header.l4);
	for (int i=0;i<header.nb_tags;i++)
	{
		CString tag = ParseString(&cf);
		res.AppendFormat("tags(%d)=%s\n",i,tag);
		header.TagsNames[i] = tag;
	}
	for (int i=0;i<header.l2;i++)
	{
		long uk1;
		cf.Read(&uk1,sizeof(uk1));
		CString tag = ParseString(&cf);
		header.L2Vals[i].name = tag;
		header.L2Vals[i].value = uk1;
		res.AppendFormat("L2(%d)=[%d]%s\n",i,uk1,tag);
	}
	for (int i=0;i<header.l3;i++)
	{
		CString tag = ParseString(&cf);
		header.l3names[i] = tag;
		res.AppendFormat("L3(%d)=%s\n",i,tag);
	}
	res.AppendFormat("end of header for file %s -\n",sf);
	if (!dump) 
		res.Replace('\n','£');
	if (dump)
	{
		printf(res);
		UCHAR data[5];
		while (cf.Read(data,4) == 4)
		{
			float *f = (float *)data;
			int *d = (int *)data;
			printf("%02X%02X%02X%02X - %f - %d\n",
				data[0],data[1],data[2],data[3],
				*f,*d);
		}
	}
	else
	{
		long data;
		for (int i=0;i<12;i++)
		{
			if (i==2)
			{
				float f;
				cf.Read(&f,4);
				printf("%f£",f);
			}
			else
			{
				cf.Read(&data,4);
				printf("%d£",data);
			}
		}
		cf.SeekToEnd();
		cf.Seek(-4*4,CFile::end);
		for (int i=0;i<4;i++)
		{
			cf.Read(&data,4);
			printf("%d£",data);
		}
		printf(res);
	}
	printf("\n");
	cf.Close();
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////
FULL READ & DUMP:
bool CMDLFile::ReadFromFile(CString sFileName,bool dump)
{
	CFile cf;
	if (!cf.Open(sFileName,CFile::modeRead))
	{
		AfxMessageBox("cant open file");
		return false;
	}
	ULONG cookie;
	cf.Read(&cookie,4);
	CString sf = cf.GetFileName();
	if (cookie != MDLCOOKIE)
	{
		AfxMessageBox("bad header");
		cf.Close();
		return false;
	}
	MDLHeader header;
	cf.Read(&header,MDLHEADERSIZE);
	CString res;
	res.Format("%s:\n",sf);
	res.AppendFormat("tags=%04X l2=%04X l3=%04X l4=%04X\n",header.nb_tags,header.l2,header.l3,header.l4);
	for (int i=0;i<header.nb_tags;i++)
	{
		CString tag = ParseString(&cf);
		res.AppendFormat("tags(%d)=%s\n",i,tag);
		header.TagsNames[i] = tag;
	}
	for (int i=0;i<header.l2;i++)
	{
		long uk1;
		cf.Read(&uk1,sizeof(uk1));
		CString tag = ParseString(&cf);
		header.L2Vals[i].name = tag;
		header.L2Vals[i].value = uk1;
		res.AppendFormat("L2(%d)=[%d]%s\n",i,uk1,tag);
	}
	for (int i=0;i<header.l3;i++)
	{
		CString tag = ParseString(&cf);
		header.l3names[i] = tag;
		res.AppendFormat("L3(%d)=%s\n",i,tag);
	}
	res.AppendFormat("end of header for file %s -\n",sf);
	if (!dump) {
		res.Replace('\n','£');
	}
	else
		printf("%s\n",res);
	// LOOP LEVEL 3
	for (int L3=0;L3<header.l3;L3++)
	{
		long l3val;
		cf.Read(&l3val,sizeof(l3val));
		printf("l3(%d) = %d\n",L3,l3val);
		
		bool cont = true;
		stackpos = -1;
		// LOOL LEVEL 2
		while (cont)
		{
			long token;
			cf.Read(&token,sizeof(token));
			switch(token)
			{
			case 5:
				{
					// start of group
					// push # val
					long nentry;
					ParseVal(cf,nentry);
					DumpOut();printf ("start group %d entry, stackpos = %d\n",nentry,stackpos+1);
					stack[++stackpos] = nentry;
					break;
				}
			case 9:
				{
					long l2idx;
					cf.Read(&l2idx,sizeof(l2idx));
					if ((l2idx<0) || (l2idx>header.l2))
					{
						DumpOut();printf("l2idx bad val\n");
						cont = false;
						break;
					}
					else
					{
						CString l2type = header.L2Vals[l2idx].name;
						bool matched = false;
						if (l2type == "MeshGeo")
						{
							matched = true;
							long datatype;
							cf.Read(&datatype,sizeof(datatype));
							if (datatype != 7)
							{
								DumpOut();printf("MeshGeo bad type\n");
								cont = false;
								break;
							}
							MDLMesh *mesh = new(MDLMesh);
							cf.Read(&(mesh->nvertex),sizeof(long));
							cf.Read(&(mesh->nfaces),sizeof(long));
							mesh->vertices = new MDLVertice[mesh->nvertex];
							for (int n=0;n<mesh->nvertex;n++)
							{
								// read vertice
								MDLVertice vert;
								ParseVal(cf,vert.x);
								ParseVal(cf,vert.y);
								ParseVal(cf,vert.z);
								ParseVal(cf,vert.nx);
								ParseVal(cf,vert.ny);
								ParseVal(cf,vert.nz);
								ParseVal(cf,vert.mx);
								ParseVal(cf,vert.my);
								mesh->vertices[n] = vert;
							}
							mesh->faces = new WORD[mesh->nfaces];
							for (int n=0;n<mesh->nfaces;n++)
							{
								WORD f;
								ParseVal(cf,f);
								mesh->faces[n] = f;
							}
							DumpOut();printf("MeshGeo (%d,%d)\n",mesh->nvertex,mesh->nfaces);
							//DumpMesh(mesh);
						}
						if (l2type == "ModifiableNumber")
						{
							long six;
							ParseVal(cf,six);
							DumpOut();printf("ModifiableNumber - %d\n",six);
							matched = true;
						}
						if (l2type == "LightsGeo")
						{
							matched = true;
							long datatype;
							cf.Read(&datatype,sizeof(datatype));
							if (datatype != 7)
							{
								DumpOut();printf("LightsGeo bad type\n");
								cont = false;
								break;
							}
							long nlite;
							ParseVal(cf,nlite);
							for (int n=0;n<nlite;n++)
							{
								MDLLight lite;
								ParseVal(cf,lite);
							}
							DumpOut();printf("LightGeo = %d lights\n",nlite);
						}
						if (l2type == "FrameData")
						{
							matched = true;
							long datatype;
							cf.Read(&datatype,sizeof(datatype));
							if (datatype != 7)
							{
								DumpOut();printf("FrameData bad type\n");
								cont = false;
								break;
							}
							long ndata;
							ParseVal(cf,ndata);
							for (int n=0;n<ndata;n++)
							{
								MDLFrameData data;
								data.name = ParseString(&cf);
								cf.Read(&(data.posx),sizeof(MDLFrameData)-4);
							}
							DumpOut();printf("FrameData = %d datas\n",ndata);
						}
						if (l2type == "TextureGeo")
						{
							matched = true;
							long six;
							ParseVal(cf,six);
							DumpOut();printf("TextureGeo - %d\n",six);
						}
						if (l2type == "LODGeo")
						{
							matched = true;
							long six;
							ParseVal(cf,six);
							// popout
							stackpos--;
							DumpOut();printf("popping out: %d %d\n",stack[stackpos+1],stackpos+1);
							DumpOut();printf("LODGeo - %d\n",six);
						}
						if (l2type == "GroupGeo")
						{
							matched = true;
							long six;
							ParseVal(cf,six);
							stackpos--;
							DumpOut();printf("popping out: %d %d\n",stack[stackpos+1],stackpos+1);
							DumpOut();printf("GroupGeo - %d\n",six);
						}
						if (l2type == "time")
						{
							matched = true;
							DumpOut();printf("!!!! time !!!!\n");

						}
						if (!matched)
						{
							for (int n=0;n<header.nb_tags;n++)
								if (l2type == header.TagsNames[n])
								{
									matched = true;
									DumpOut();printf ("Text = %s\n",l2type);
								}	
						}
						if (!matched)
						{
							DumpOut();printf("error: unmatched l2type = %s\n",l2type);
							cont = false;
							break;
						}
					}
					break;
				}
			case 1:
				{
					float val;
					cf.Read(&val,sizeof(val));
					DumpOut();printf("[1] - val = %f\n",val);
					break;
				}
			case 10:
				{
					DumpOut();printf("[10]\n");
					break;
				}
			case 0:
				{
					if (stackpos>=0)
						stack[stackpos] -=1;
					else
						cont = false;
					break;
				}
			default:
				DumpOut();printf("ERROR: unknow token = %d\n",token);
				cont = false;
				break;
			} // switch
		} // while(cont)
	} // L3
	cf.Close();
	return true;
}