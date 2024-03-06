/*
	MDLFile.cs - Allegiance MDL files API 
	Copyright (C) Kirth Gersen, 2001-2003.  All rights reserved.
	v 0.95 
	SaveTofile limitation:
		- LOD not supported
		- single group mdl only
		- no 'real' error handling (BinaryWriter exceptions arent handled)
*/

using System;
using System.IO;

namespace MDL
{
	struct MDLL2
	{
		public string Name;
		public int Value;
	}
	struct MDLHeader
	{
		public short s1;
		public short s2;
		public int nb_tags;
		public int l2;
		public int l3;
		public int l4;
		public string[] TagsNames;
		public MDLL2[] L2Vals;
		public string[] l3names;
		public bool ReadHeader(BinaryReader br)
		{
			s1 = br.ReadInt16();
			s2 = br.ReadInt16();
			nb_tags = br.ReadInt32();
			l2 = br.ReadInt32();
			l3 = br.ReadInt32();
			l4 = br.ReadInt32();
			TagsNames = new string[nb_tags];
			L2Vals = new MDLL2[l2];
			l3names = new string[l3];
			return true;
		}
		public void WriteHeader(BinaryWriter bw)
		{
			bw.Write(s1);
			bw.Write(s2);
			bw.Write(nb_tags);
			bw.Write(l2);
			bw.Write(l3);
			bw.Write(l4);
		}
	}
	public struct MDLLight //size = 12 float
	{
		public float red;
		public float green;
		public float blue;
		public float speed; // or time factor
		public float posx;
		public float posy;
		public float posz;
		public float todo1; // 1.25 (0 = crash !)
		public float todo2; // 0
		public float todo3; // 0.1
		public float todo4; // 0
		public float todo5; // 0.05
		public bool Read(BinaryReader br)
		{
			red = br.ReadSingle();
			green = br.ReadSingle();
			blue = br.ReadSingle();
			speed = br.ReadSingle();
			posx = br.ReadSingle();
			posy = br.ReadSingle();
			posz = br.ReadSingle();
			todo1 = br.ReadSingle();
			todo2 = br.ReadSingle();
			todo3 = br.ReadSingle();
			todo4 = br.ReadSingle();
			todo5 = br.ReadSingle();
			return true;
		}
		public void Write(BinaryWriter bw)
		{
			bw.Write(red);
			bw.Write(green);
			bw.Write(blue);
			bw.Write(speed);
			bw.Write(posx);
			bw.Write(posy);
			bw.Write(posz);
			bw.Write(todo1);
			bw.Write(todo2);
			bw.Write(todo3);
			bw.Write(todo4);
			bw.Write(todo5);
		}
	} 
	public struct MDLFrameData // size = name + 9 float
	{
		public string name;
		public float posx;
		public float posy;
		public float posz;
		public float nx;
		public float ny;
		public float nz;
		public float px;
		public float py;
		public float pz;
		public bool Read(BinaryReader br)
		{
			posx = br.ReadSingle();
			posy = br.ReadSingle();
			posz = br.ReadSingle();
			nx = br.ReadSingle();
			ny = br.ReadSingle();
			nz = br.ReadSingle();
			px = br.ReadSingle();
			py = br.ReadSingle();
			pz = br.ReadSingle();
			return true;
		}
		public void Write(BinaryWriter bw)
		{
			bw.Write(posx);
			bw.Write(posy);
			bw.Write(posz);
			bw.Write(nx);
			bw.Write(ny);
			bw.Write(nz);
			bw.Write(px);
			bw.Write(py);
			bw.Write(pz);
		}
	}
	public struct MDLVertice
	{
		public float x;
		public float y;
		public float z;
		public float mx;
		public float my;
		public float nx; 
		public float ny;
		public float nz;
	}
	public struct MDLMesh
	{
		public int nvertex;
		public int nfaces;
		public MDLVertice[] vertices;
		public ushort[] faces;
	}
	//#define MDLImageInitSize 20
	public struct MDLImage
	{
		public int w;
		public int h;
		public int bw;
		public int bh;
		public byte []undecoded;// 00 F8 00 00 E0 07 00 00 1F 00 00 00 00 00 00 00 00 CC CC CC
		public byte []bitmap;

		public MDLImage(int w1, int h1)
		{
			w = w1;
			h = h1;
			bw = w1;
			bh = h1;
			bitmap = null;
			undecoded = new byte[20];
			//todo: undecoded = {0x00,0xF8,0x00,0x00,0xE0,0x07,0x00,0x00,0x1F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xCC,0xCC,0xCC};
		}
		public bool Read(BinaryReader br)
		{
			w = br.ReadInt32(); // width 
			h = br.ReadInt32(); // height
			bw = br.ReadInt32(); // scanwidth = width * 2 (rounded to upper long)
			bh = br.ReadInt32(); // bits per pixel
			undecoded = br.ReadBytes(20);
			int nbits = bw*h*bh/16;
			bitmap = br.ReadBytes(nbits);
			return true;
		}
		public void Write(BinaryWriter bwr)
		{
			bwr.Write(w);
			bwr.Write(h);
			bwr.Write(bw);
			bwr.Write(bh);
			bwr.Write(undecoded,0,20);
			int nbits = bw*h*bh/16;
			bwr.Write(bitmap,0,nbits);
		}
	}

	public struct MDLObject
	{
		public MDLType type;
		public int nchildren;
		public MDLObject[] childrens;
		public MDLMesh mesh;
		public float lodval;
		public int textidx;
		public MDLImage image;
	} 

	public enum MDLType {mdl_empty,mdl_mesh,mdl_group,mdl_lod,mdl_image};
	/// <summary>
	/// MDLFile : object reprensenting a MDL file in memory
	/// </summary>
	public class MDLFile
	{
		public int NumLights;
		public MDLLight[] Lights;
		public int NumFrameDatas;
		public MDLFrameData[] FrameDatas;
		public MDLObject RootObject;
		public string ReadError;
		public int NumTextures;
		public string[] Textures;
		public float FrameVal;

		public MDLFile()
		{
			NumLights = 0;
			NumFrameDatas = 0;
			NumTextures = 0;
			RootObject.type = MDLType.mdl_empty;
		}
		/// <summary>
		/// Read a binary MDL file
		/// a real mess !
		/// return true on success
		/// </summary>
		/// <param name="sFileName"></param>
		/// <returns></returns>
		public bool ReadFromFile(string sFileName)
		{
			FileStream cf;
			try 
			{
				cf = new FileStream(sFileName,FileMode.Open, FileAccess.Read, FileShare.Read);
			}
			catch
			{
				return false;
			}
			BinaryReader br = new BinaryReader(cf);
			uint cookie = br.ReadUInt32();
			if (cookie != 0xDEBADF00)
			{
				br.Close();
				cf.Close();
				return false;
			}
			MDLHeader header = new MDLHeader();
			if (!header.ReadHeader(br))
			{
				br.Close();
				cf.Close();
				return false;
			}
			NumTextures = 0;
			for (int i=0;i<header.nb_tags;i++)
			{
				string tag = ParseString(br);
				header.TagsNames[i] = tag;
				if ((tag != "model") && (tag != "effect"))
					NumTextures++;
			}
			int idx = 0;
			int[] TexturesIdx = new int[NumTextures];
			if (NumTextures != 0)
			{
				Textures = new string[NumTextures];
				for (int i=0;i<header.nb_tags;i++)
				{
					string tag = header.TagsNames[i];
					if ((tag != "model") && (tag != "effect"))
					{
						Textures[idx] = tag;
						TexturesIdx[idx] = i;
						idx++;
					}
				}
			}

			// ASSERT(idx==NumTextures);
			for (int i=0;i<header.l2;i++)
			{
				int uk1 = br.ReadInt32();
				string tag = ParseString(br);
				header.L2Vals[i].Name = tag;
				header.L2Vals[i].Value = uk1;
			}
			for (int i=0;i<header.l3;i++)
			{
				string tag = ParseString(br);
				header.l3names[i] = tag;
			}
			// LOOP LEVEL 3

			int lastText = -1;
			//MDLObject lastObject = new MDLObject();
			MDLObject []stackedObjects = new MDLObject[500];
			int[] stack = new int[200];
			int sopos = -1;
			for (int L3=0;L3<header.l3;L3++)
			{
				int l3val = br.ReadInt32();
				bool cont = true;
				int stackpos = -1;
				// LOOL LEVEL 2
				while (cont)
				{
					int token = br.ReadInt32();
					switch(token)
					{
						case 5:
						{
							// start of group
							// push # val
							int nentry = br.ReadInt32();
							stack[++stackpos] = nentry;
							break;
						}
						case 9:
						{
							int l2idx = br.ReadInt32();
							if ((l2idx<0) || (l2idx>header.l2))
							{
								//ReadError.Format("unmatched l2idx = %s",l2idx);
								cont = false;
								break;
							}
							else
							{
								string l2type = header.L2Vals[l2idx].Name;
								bool matched = false;
								if (l2type == "MeshGeo")
								{
									matched = true;
									int datatype = br.ReadInt32();
									if (datatype != 7)
									{
										cont = false;
										break;
									}
									MDLMesh mesh = new MDLMesh();
									mesh.nvertex = br.ReadInt32();
									mesh.nfaces = br.ReadInt32();
									mesh.vertices = new MDLVertice[mesh.nvertex];
									for (int n=0;n<mesh.nvertex;n++)
									{
										// read vertice
										MDLVertice vert = new MDLVertice();
										vert.x = br.ReadSingle();
										vert.y = br.ReadSingle();;
										vert.z = br.ReadSingle();;
										vert.mx = br.ReadSingle();;
										vert.my = br.ReadSingle();;
										vert.nx = br.ReadSingle();;
										vert.ny = br.ReadSingle();;
										vert.nz = br.ReadSingle();;
										mesh.vertices[n] = vert;
									}
									mesh.faces = new ushort[mesh.nfaces];
									for (int n=0;n<mesh.nfaces;n++)
										mesh.faces[n] = br.ReadUInt16();
									stackedObjects[++sopos] = NewMDLObject();
									stackedObjects[sopos].mesh = mesh;
									stackedObjects[sopos].type = MDLType.mdl_mesh; 
								}
								if (l2type == "ModifiableNumber")
								{
									int six = br.ReadInt32();
									matched = true;
								}
								if (l2type == "LightsGeo")
								{
									matched = true;
									int datatype = br.ReadInt32();
									if (datatype != 7)
									{
										// ReadError.Format("bad data %d in LightsGeo",datatype);
										cont = false;
										break;
									}
									if (NumLights != 0)
									{
										// ReadError.Format("double ligths!!!");
										cont = false;
										break;
									}
									int nlite = br.ReadInt32();
									NumLights = nlite;
									Lights = new MDLLight[nlite];
									for (int n=0;n<nlite;n++)
									{
										MDLLight lite = new MDLLight();
										lite.Read(br);
										Lights[n] = lite;
									}
								}
								if (l2type == "FrameData")
								{
									matched = true;
									int datatype = br.ReadInt32();
									if (datatype != 7)
									{
										//ReadError.Format("bad data %d in FrameData",datatype);
										cont = false;
										break;
									}
									if (NumFrameDatas != 0)
									{
										// ReadError.Format("double framedata!!!");
										cont = false;
										break;
									}
									int ndata = br.ReadInt32();
									NumFrameDatas = ndata;
									FrameDatas = new MDLFrameData[ndata];
									for (int n=0;n<ndata;n++)
									{
										MDLFrameData data = new MDLFrameData();
										data.name = ParseString(br);
										data.Read(br);
										FrameDatas[n] = data;
									}
								}
								if (l2type == "TextureGeo")
								{
									matched = true;
									int six = br.ReadInt32();
									// ASSERT(lastObject != NULL);
									stackedObjects[sopos].textidx = lastText;
								}
								if (l2type == "LODGeo")
								{
									matched = true;
									int six = br.ReadInt32();
									MDLObject lastObject = NewMDLObject();
									lastObject.type =  MDLType.mdl_lod;
									lastObject.nchildren = stack[stackpos]+1;
									lastObject.childrens = new MDLObject[lastObject.nchildren];
									for (int n=0;n<lastObject.nchildren;n++)
									{
										lastObject.childrens[n] = stackedObjects[sopos--];
									}
									stackedObjects[++sopos] = lastObject;
									stackpos--;
								}
								if (l2type == "GroupGeo")
								{
									matched = true;
									int six = br.ReadInt32();
									MDLObject lastObject = NewMDLObject();
									lastObject.type =  MDLType.mdl_group;
									lastObject.nchildren = stack[stackpos];
									lastObject.childrens = new MDLObject[lastObject.nchildren];
									for (int n=0;n<lastObject.nchildren;n++)
									{
										lastObject.childrens[n] = stackedObjects[sopos--];
									}
									stackedObjects[++sopos] = lastObject;
									stackpos--;
								}
								if (l2type == "time")
								{
									matched = true;
									//ReadError.Format("!!time!!"),
									cont = false;
									break;
								}
								if (l2type == "ImportImage")
								{
									matched = true;
									cont = false;
									int datatype = br.ReadInt32();
									if (datatype != 7)
									{
										// ReadError.Format("bad data %d in ImportImage",datatype);
										cont = false;
										break;
									}
									MDLImage img = new MDLImage(0,0);
									img.Read(br);
									stackedObjects[++sopos] = NewMDLObject();
									stackedObjects[sopos].image = img;
									stackedObjects[sopos].type =  MDLType.mdl_image;
									break;
								}
								if (!matched)
								{
									for (int n=0;n<header.nb_tags;n++)
									if (l2type == header.TagsNames[n])
									{
										matched = true;
										lastText = -1;
										for (int p=0;p<NumTextures;p++)
										{
											if (TexturesIdx[p] == header.L2Vals[l2idx].Value)
												lastText = p;
										}
										// ASSERT(lastText != -1);
									}	
								}
								if (!matched)
								{
									//ReadError.Format("unmatched l2type = %s\n",l2type);
									cont = false;
									break;
								}
							}
							break;
						}
						case 1:
						{
							float val = br.ReadSingle();
							if (header.l3names[L3] == "frame")
							{
								FrameVal = val;
							}
							else
							{
								// ASSERT(lastObject != NULL);
								stackedObjects[sopos].lodval = val;
							}
							break;
						}
						case 10:
						{
							// handle 10
							break;
						}
						case 0:
						{
							if (stackpos>=0)
							{//stack[stackpos] -=1;
							}
							else
								cont = false;
							break;
						}
						default:
							//ReadError.Format("unknow token = %d\n",token);
							cont = false;
						break;
					} // switch
				} // while(cont)
			} // l3
			RootObject = stackedObjects[sopos];
			br.Close();
			cf.Close();
			return true;
		}
		/// <summary>
		/// Parse a mdl string (could be optimized)
		/// </summary>
		/// <param name="br"></param>
		/// <returns></returns>
		string ParseString(BinaryReader br)
		{
			string res = "";
			char[] data = new char[5];
			data[4] = '\0';
			do
			{
				data = br.ReadChars(4);
				for (int i=0;i<4;i++)
				{
					if (data[i] != '\0')
						res += data[i];
				}
			} while (data[3]!='\0');
			return res;
		}
		/// <summary>
		/// Construct a new MDLObject
		/// </summary>
		/// <returns></returns>
		public MDLObject NewMDLObject()
		{
			MDLObject o = new MDLObject();
			o.nchildren = 0;
			o.childrens = null;
			o.lodval = 0;
			o.type =  MDLType.mdl_empty;
			o.textidx = -1;
			return o;
		}


		// save to .mdl binary format
		public bool SaveToFile(string sFileName)
		{
			// Compute header but assume FrameVal is valid (no check)

			if (RootObject.type == MDLType.mdl_empty)
				return false;
			// open file
			FileStream cf;
			try 
			{
				cf = new FileStream(sFileName,FileMode.OpenOrCreate, FileAccess.Write, FileShare.Write);
			}
			catch
			{
				return false;
			}
			BinaryWriter bw = new BinaryWriter(cf);

			// compute header
			bool bIsNotImage = (RootObject.type != MDLType.mdl_image);
			MDLHeader hdr;
			hdr.s1 = 0;
			hdr.s2 = 1;
			hdr.nb_tags = 1; // model + [effect = lights or datas] + [textures]
			int TexturePos = 1;
			if ((NumLights >0) || (NumFrameDatas>0))
			{
				TexturePos = 2;
				hdr.nb_tags++;
			}
			for (int t=0;t<NumTextures;t++)
				hdr.nb_tags++;
			hdr.TagsNames = new string[hdr.nb_tags];
			int tnpos = 0;
			hdr.TagsNames[tnpos++] = "model";
			if ((NumLights >0) || (NumFrameDatas>0))
				hdr.TagsNames[tnpos++] = "effect";
			for (int t=0;t<NumTextures;t++)
				hdr.TagsNames[tnpos++] = Textures[t];
			// ------------------------------- L2 -----------------------------------
			hdr.l2 = 0;
			hdr.L2Vals = new MDLL2[50]; // not clean, should compute hdr.l2 then alloc (2 passes)
			if (bIsNotImage)
			{
				hdr.l2 = 1; // ModifiableNumber,LightsGeo, time, FrameData then Texture & Group
				hdr.L2Vals[0].Name = "ModifiableNumber";
				hdr.L2Vals[0].Value = 0;
			}
			int LightsPos = -1;
			if (NumLights >0)
			{
				hdr.L2Vals[hdr.l2].Name = "LightsGeo";
				hdr.L2Vals[hdr.l2].Value = 1; //should be idx of "effect" in TagNames
				LightsPos = hdr.l2;
				hdr.l2++;
				hdr.L2Vals[hdr.l2].Name = "time";
				hdr.L2Vals[hdr.l2].Value = 0; 
				hdr.l2++;
			}
			int FramesPos = -1;
			if (NumFrameDatas >0)
			{
				hdr.L2Vals[hdr.l2].Name = "FrameData";
				hdr.L2Vals[hdr.l2].Value = 1; //should be idx of "effect" in TagNames
				FramesPos = hdr.l2;
				hdr.l2++;
			}
			int GroupPos = -1;
			if (RootObject.type == MDLType.mdl_group)
			{
				hdr.L2Vals[hdr.l2].Name = "GroupGeo";
				hdr.L2Vals[hdr.l2].Value = 0;
				GroupPos = hdr.l2;
				hdr.l2++;
			}
			int MeshPos = -1;
			if (bIsNotImage)
			{
				hdr.L2Vals[hdr.l2].Name = "MeshGeo";
				hdr.L2Vals[hdr.l2].Value = 0;
				MeshPos = hdr.l2;
				hdr.l2++;
			}
			int TextPos = -1;
			int TextGeoPos = -1;
			for (int t=0;t<NumTextures;t++)
			{
				if (t==0)
				{
					TextGeoPos = hdr.l2;
					hdr.L2Vals[hdr.l2].Name = "TextureGeo";
					hdr.L2Vals[hdr.l2].Value = 0;
					hdr.l2++;
					TextPos = hdr.l2;
				}
				hdr.L2Vals[hdr.l2].Name = hdr.TagsNames[TexturePos+t];
				hdr.L2Vals[hdr.l2].Value = TexturePos+t;
				hdr.l2++;
			}
			int ImagePos = -1;
			if (!bIsNotImage)
			{
				ImagePos = hdr.l2;
				hdr.L2Vals[hdr.l2].Name = "ImportImage";
				hdr.L2Vals[hdr.l2].Value = 0;
				hdr.l2++;
			}
			// ------------------------------- L3 -----------------------------------
			hdr.l3names = new string[4];
			if (bIsNotImage)
			{
				hdr.l3 = 2; // frame,[lights],[frames],object
				hdr.l3names[0] = "frame";
				if (NumLights >0)
				{
					hdr.l3names[hdr.l3-1] = "lights";
					hdr.l3++;
				}
				if (NumFrameDatas >0)
				{
					hdr.l3names[hdr.l3-1] = "frames";
					hdr.l3++;
				}
				hdr.l3names[hdr.l3-1] = "object";
			}
			else // image
			{
				hdr.l3 = 1;
				hdr.l3names[hdr.l3-1] = Textures[0];
			}
			// ------------------------------- L4 -----------------------------------
			hdr.l4 = 0;
			// ------------------------------- end of header-------------------------

			// write cookie & fixed size header
			uint cookie = 0xDEBADF00;
			bw.Write(cookie);
			hdr.WriteHeader(bw);

			// write TagsNames
			for (int t=0;t<hdr.nb_tags;t++)
			{
				SaveString(bw,hdr.TagsNames[t]);
			}
			// Write L2 entries
			for (int t=0;t<hdr.l2;t++)
			{
				bw.Write(hdr.L2Vals[t].Value);
				SaveString(bw,hdr.L2Vals[t].Name);
			}

			// Write L3 levels name
			for (int t=0;t<hdr.l3;t++)
			{
				SaveString(bw,hdr.l3names[t]);
			}

			// write body
			// Main L3 save loop
			for (int t=0;t<hdr.l3;t++)
			{
				bw.Write(t);
				if (hdr.l3names[t] == "frame")
				{
					bw.Write((int)1);
					bw.Write(FrameVal);
					bw.Write((int)9);
					bw.Write((int)0);
					bw.Write((int)6);
				}
				if (hdr.l3names[t] == "lights")
				{
					bw.Write((int)9);
					bw.Write(LightsPos);
					bw.Write((int)7);
					bw.Write(NumLights);
					for (int l=0;l<NumLights;l++)
					{
						Lights[l].Write(bw);
					}
				}
				if (hdr.l3names[t] == "frames")
				{
					bw.Write((int)9);
					bw.Write(FramesPos);
					bw.Write((int)7);
					bw.Write(NumFrameDatas);
					for (int l=0;l<NumFrameDatas;l++)
					{
						SaveString(bw,FrameDatas[l].name);
						FrameDatas[l].Write(bw);
					}
				}
				if (hdr.l3names[t] == "object")
				{
					SaveObject(RootObject,bw,GroupPos,MeshPos,TextPos,TextGeoPos);
				}
				if (!bIsNotImage)
				{
					bw.Write((int)9);
					bw.Write(ImagePos);
					bw.Write((int)7);
					// save the image 
					RootObject.image.Write(bw);
				}
				bw.Write((int)0);
			}
			bw.Close();
			cf.Close();
			return true;
		}

		// SaveToFile sub part - save a child object
		void SaveObject(MDLObject po,BinaryWriter bw, int GroupPos, int MeshPos, int TextPos, int TextGeoPos)
		{
			if (po.type == MDLType.mdl_group)
			{
				bw.Write((int)5);
				bw.Write(po.nchildren);
				for (int n=0;n<po.nchildren;n++)
				{
					SaveObject(po.childrens[n],bw,GroupPos,MeshPos,TextPos,TextGeoPos);
					bw.Write((int)0);
				}
				bw.Write((int)9);
				bw.Write(GroupPos);
				bw.Write((int)6);
			}
			if (po.type == MDLType.mdl_lod)
			{
				bw.Write((int)5);
				bw.Write(po.nchildren);
				for (int n=0;n<po.nchildren;n++)
				{
					SaveObject(po.childrens[n],bw,GroupPos,MeshPos,TextPos,TextGeoPos);
					if (po.childrens[n].lodval != 0)
					{
						bw.Write((int)1);
						bw.Write(po.childrens[n].lodval);
						bw.Write((int)10);
					}
					bw.Write((int)0);
				}
				bw.Write((int)9);
				bw.Write(GroupPos);
				bw.Write((int)6);
			}
			if (po.type == MDLType.mdl_mesh)
			{
				if (po.textidx != -1)
				{
					bw.Write((int)9);
					bw.Write(TextPos+po.textidx);
				}
				// save mesh
				bw.Write((int)9);
				bw.Write(MeshPos);
				bw.Write((int)7);
				bw.Write((int)po.mesh.nvertex);
				bw.Write((int)po.mesh.nfaces);
				for (int v=0;v<po.mesh.nvertex;v++)
				{
					bw.Write(po.mesh.vertices[v].x);
					bw.Write(po.mesh.vertices[v].y);
					bw.Write(po.mesh.vertices[v].z);
					bw.Write(po.mesh.vertices[v].mx);
					bw.Write(po.mesh.vertices[v].my);
					bw.Write(po.mesh.vertices[v].nx);
					bw.Write(po.mesh.vertices[v].ny);
					bw.Write(po.mesh.vertices[v].nz);
				}
				for (int v=0;v<po.mesh.nfaces;v++)
				{
					bw.Write(po.mesh.faces[v]);
				}
				if (po.textidx != -1)
				{
					bw.Write((int)9);
					bw.Write(TextGeoPos);
					bw.Write((int)6);
				}
			}
		}
		// string write
		void SaveString(BinaryWriter bw,string s)
		{
			for (int i=0;i<s.Length;i++)
				bw.Write(s[i]);
			// complete with trailing 0
			char buf = '\0';
			int l = s.Length;
			l = l / 4;
			l = l * 4;
			l = s.Length-l;
			l=4-l;
			for (int p=0;p<l;p++)
				bw.Write(buf);
		}
	}
	
}
