//-----------------------------------------------------------------------------
// File: EnhancedMesh.cs
//
// Desc: Sample showing enhanced meshes in D3D
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//-----------------------------------------------------------------------------
using System;
using System.Windows.Forms;
using System.IO;
using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;
using Direct3D = Microsoft.DirectX.Direct3D;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections;
using MDL;
using System.Diagnostics;

namespace MDLView
{
	/// <summary>
	/// Application class. The base class (GraphicsSample) provides the generic 
	/// functionality needed in all Direct3D samples. MyGraphicsSample adds 
	/// functionality specific to this sample program.
	/// </summary>
	public class MyGraphicsSample : GraphicsSample
	{
		// Menu items specific for this application
		private MenuItem mnuOpenMesh = null;
		private MenuItem mnuMeshBreak = null;

		private GraphicsFont drawingFont = null;                 // Font for drawing text
		string initialDirectory = null;
		string meshFilename = "acs01.mdl"; // Filename of mesh
		
		Mesh systemMemoryMesh = null; // system memory version of mesh, lives through resize's
		//Mesh enhancedMesh = null; // vid mem version of mesh that is enhanced
		int numberSegments; // number of segments per edge (tesselation level)
		Direct3D.Material[] meshMaterials = null; // array of materials
		Texture[] meshTextures = null;        // Array of textures, entries are NULL if no texture specified

		GraphicsArcBall arcBall = null;              // Mouse rotation utility
		Vector3 objectCenter;        // Center of bounding sphere of object
		float objectRadius = 0.0f;        // Radius of bounding sphere of object
        float mdlRadius = 0.0f; // origine centered radius as computed by Allegiance engine for scaling purpose
		//GraphicsStream adjacency = null; // Contains the adjacency info loaded with the mesh
		bool isUsingHardwareNPatches;
		private System.Windows.Forms.PictureBox target;
		private Microsoft.VisualBasic.Compatibility.VB6.DirListBox dirListBox1;
		private Microsoft.VisualBasic.Compatibility.VB6.FileListBox fileListBox1;
		private Microsoft.VisualBasic.Compatibility.VB6.DriveListBox driveListBox1;
		private System.Windows.Forms.Button BTSolidWire;
		private System.Windows.Forms.ComboBox CBLOD;
		bool isWireframe = false;
		private System.Windows.Forms.Label label1;

		MDLFile mdlfile;
		MDLObject rootmdl;
		Mesh[] Meshes;
		bool[] MeshesEnable;
		private System.Windows.Forms.TabControl tabControl1;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private System.Windows.Forms.TreeView tvObj;
		private System.Windows.Forms.ColorDialog cdBack;
		private System.Windows.Forms.Button btBackColor;
		private System.Windows.Forms.Button btSave;
		private System.Windows.Forms.SaveFileDialog saveFileDialog1;
		int[] MeshesTex;
		/// <summary>
		/// Application constructor. Sets attributes for the app.
		/// </summary>
		public MyGraphicsSample()
		{
            Debug.WriteLine("PositionColored = " + CustomVertex.PositionColored.StrideSize.ToString());
            Debug.WriteLine("PositionColoredTextured = " + CustomVertex.PositionColoredTextured.StrideSize.ToString());
            Debug.WriteLine("PositionNormal = " + CustomVertex.PositionNormal.StrideSize.ToString());
            Debug.WriteLine("PositionNormalColored = " + CustomVertex.PositionNormalColored.StrideSize.ToString());
            Debug.WriteLine("PositionNormalTextured = " + CustomVertex.PositionNormalTextured.StrideSize.ToString());
            Debug.WriteLine("PositionOnly = " + CustomVertex.PositionOnly.StrideSize.ToString());
            Debug.WriteLine("PositionTextured = " + CustomVertex.PositionTextured.StrideSize.ToString());
            Debug.WriteLine("Transformed = " + CustomVertex.Transformed.StrideSize.ToString());
            Debug.WriteLine("TransformedColored = " + CustomVertex.TransformedColored.StrideSize.ToString());
            Debug.WriteLine("TransformedColoredTextured = " + CustomVertex.TransformedColoredTextured.StrideSize.ToString());
            Debug.WriteLine("TransformedTextured = " + CustomVertex.TransformedTextured.StrideSize.ToString());

			// Add our new menu options
			this.mnuOpenMesh = new MenuItem();
			this.mnuMeshBreak = new MenuItem();

			// Add the Open File menu to the file menu
			this.mnuFile.MenuItems.Add(0, this.mnuMeshBreak);
			this.mnuMeshBreak.Text = "-";
			this.mnuFile.MenuItems.Add(0, this.mnuOpenMesh);
			this.mnuOpenMesh.Text = "Open File...";
			this.mnuOpenMesh.Shortcut = System.Windows.Forms.Shortcut.CtrlO;
			this.mnuOpenMesh.ShowShortcut = true;
			this.mnuOpenMesh.Click += new System.EventHandler(this.OpenMesh);

			InitializeComponent();
			this.RenderTarget = target;

			// Set the window text
			this.Text = "Allegiance MDL Viewer";
            try
            {
                // Load the icon from our resources
                System.Resources.ResourceManager resources = new System.Resources.ResourceManager(this.GetType());
                this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            }
            catch
            {
                // It's no big deal if we can't load our icons, but try to load the embedded one
                try { this.Icon = new System.Drawing.Icon(this.GetType(), "directx.ico"); } 
                catch {}
            }

			arcBall = new GraphicsArcBall(this.target);
			initialDirectory = DXUtil.SdkMediaPath;
			driveListBox1.Drive = System.IO.Path.GetPathRoot(initialDirectory);
			dirListBox1.Path = initialDirectory;
			fileListBox1.Path = initialDirectory;

			drawingFont = new GraphicsFont("Arial", System.Drawing.FontStyle.Bold);
			enumerationSettings.AppUsesDepthBuffer = true;
			numberSegments = 2;

			// Set up our event handlers
			//this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.OnPrivateKeyDown);
		}





        /// <summary>
        /// The window has been created, but the device has not been created yet.  
        /// Here you can perform application-related initialization and cleanup that 
        /// does not depend on a device.
        /// </summary>
        protected override void OneTimeSceneInitialization()
		{
			// Set cursor to indicate that user can move the object with the mouse
			this.target.Cursor = System.Windows.Forms.Cursors.SizeAll;
		}




		/// <summary>
		/// Called once per frame, the call is the entry point for animating the scene.
		/// </summary>
		protected override void FrameMove()
		{
			// Setup world matrix
			Matrix matWorld = Matrix.Translation(-objectCenter.X,
				-objectCenter.Y,
				-objectCenter.Z);
			matWorld.Multiply(arcBall.RotationMatrix);
			matWorld.Multiply(arcBall.TranslationMatrix);
			device.Transform.World = matWorld;

			// Set up view matrix
			Vector3 vFrom= new Vector3(0, 0,-3*objectRadius);
			Vector3 vAt = new Vector3(0, 0, 0);
			Vector3 vUp = new Vector3(0, 1, 0);
			device.Transform.View = Matrix.LookAtLH(vFrom, vAt, vUp);
		}




		/// <summary>
		/// Called once per frame, the call is the entry point for 3d rendering. This 
		/// function sets up render states, clears the viewport, and renders the scene.
		/// </summary>
		protected override void Render()
		{
			// Clear the viewport
			device.Clear(ClearFlags.Target | ClearFlags.ZBuffer , cdBack.Color, 1.0f, 0);

			device.BeginScene();
			if (isUsingHardwareNPatches)
			{
				float fNumSegs;

				fNumSegs = (float)numberSegments;
				device.NPatchMode = fNumSegs;
			}

			// set and draw each of the materials in the mesh
//			if (meshMaterials != null)
//			{
//				for (int i = 0; i < meshMaterials.Length; i++)
//				{
//					device.Material = meshMaterials[i];
//					device.SetTexture(0, meshTextures[i]);
//
//					enhancedMesh.DrawSubset(i);
//				}
//			}
//			else
//				enhancedMesh.DrawSubset(0);
			for (int i=0;i<Meshes.Length;i++)
			{
				if (MeshesEnable[i])
				{
					if (MeshesTex[i] != -1)
					{
						device.Material = meshMaterials[MeshesTex[i]];
						device.SetTexture(0, meshTextures[MeshesTex[i]]);
						Meshes[i].DrawSubset(0);
					}
					else
						Meshes[i].DrawSubset(0);
				}
			}

			if (isUsingHardwareNPatches)
			{
				device.NPatchMode = 0.0f;
			}

			// Output statistics
			drawingFont.DrawText(2,  1, System.Drawing.Color.Yellow, frameStats);

			// Display info on mesh
			drawingFont.DrawText(2, 20, System.Drawing.Color.Yellow, "File name: ");
			drawingFont.DrawText(150, 20, System.Drawing.Color.White, meshFilename);

            drawingFont.DrawText(2, 40, System.Drawing.Color.Yellow, "Radius : ");
            drawingFont.DrawText(150, 40, System.Drawing.Color.White, mdlRadius.ToString());

//			for (int i=0;i<Meshes.Length;i++)
//			{
//				drawingFont.DrawText(2, 40+i*40, System.Drawing.Color.Yellow, "Number Faces: ");
//				drawingFont.DrawText(150, 40+i*40, System.Drawing.Color.White, (Meshes[i] == null) ? "0" : Meshes[i].NumberFaces.ToString());
//
//				drawingFont.DrawText(2, 60+i*40, System.Drawing.Color.Yellow, "Number Vertices: ");
//				drawingFont.DrawText(150, 60+i*40, System.Drawing.Color.White, (Meshes[i] == null) ? "0" : Meshes[i].NumberVertices.ToString());
//			}

			device.EndScene();
		}




		/// <summary>
        /// The device has been created.  Resources that are not lost on
        /// Reset() can be created here -- resources in Pool.Managed,
        /// Pool.Scratch, or Pool.SystemMemory.  Image surfaces created via
        /// CreateImageSurface are never lost and can be created here.  Vertex
        /// shaders and pixel shaders can also be created here as they are not
        /// lost on Reset().
		/// </summary>
		protected override void InitializeDeviceObjects()
		{
			// Initialize the drawingFont's internal textures
			drawingFont.InitializeDeviceObjects(device);

			//ExtendedMaterial[] mtrl = null;
			mdlfile = new MDLFile();
			string path = DXUtil.FindMediaFile(initialDirectory, meshFilename);
			try
			{
				//systemMemoryMesh = Mesh.FromFile(path, MeshFlags.SystemMemory, device, out adjacency, out mtrl);
				if (!mdlfile.ReadFromFile(initialDirectory+ "\\"+meshFilename))
					throw new FileLoadException("not a valide MDL file.", meshFilename);
				MDLObject obj = mdlfile.RootObject;
				rootmdl = obj;

				CBLOD.Items.Clear();
				if (obj.type == MDLType.mdl_lod)
				{
					CBLOD.Enabled = true;
					for (int i=0;i<obj.nchildren;i++)
					{					  
						CBLOD.Items.Add(obj.childrens[i].lodval);
					}
					obj = obj.childrens[0];
					CBLOD.SelectedIndex = 0;
				}
				else
				{
					CBLOD.Enabled = false;
				}

				//				while (obj.type != MDLType.mdl_mesh)
				//				{
				//					if (obj.childrens[0].type == MDLType.mdl_empty)
				//						obj = obj.childrens[1];
				//					else
				//						obj = obj.childrens[0];
				//
				//				}
				// process textures
				if (mdlfile.NumTextures >0)
				{

					meshMaterials = new Material[mdlfile.NumTextures];
					meshTextures = new Texture[mdlfile.NumTextures];
					for (int i = 0; i< mdlfile.NumTextures; i++)
					{
						meshMaterials[i] = new Direct3D.Material();
						meshMaterials[i].Ambient = Color.White;
						meshMaterials[i].Diffuse = Color.White;

						MDLFile mdlbmp = new MDLFile();
						if (mdlbmp.ReadFromFile(initialDirectory+ "\\"+mdlfile.Textures[i]+".mdl"))
						{
							if (mdlbmp.RootObject.type == MDLType.mdl_image)
							{
								MDLImage mdlimg = mdlbmp.RootObject.image;
								MemoryStream memstream = new MemoryStream(mdlimg.bitmap);
								try
								{
									//meshTextures[i] = TextureLoader.FromStream(device,memstream,mdlimg.bitmap.Length,mdlimg.w,mdlimg.h,0,0,Format.R5G6B5,Pool.Managed,Filter.Linear,Filter.Linear,0);
									//meshTextures[i] = TextureLoader.FromStream(device,memstream,mdlimg.w,mdlimg.h,0,0,Format.R5G6B5,Pool.SystemMemory,Filter.Linear,Filter.Linear,1);
									Bitmap bitmap = new Bitmap(mdlimg.w,mdlimg.h,PixelFormat.Format16bppRgb565);
									Rectangle rect = new Rectangle(0,0,mdlimg.w,mdlimg.h);
									BitmapData bmdata = bitmap.LockBits(rect,ImageLockMode.WriteOnly,PixelFormat.Format16bppRgb565);
									IntPtr pixels = bmdata.Scan0;
									unsafe
									{
										byte *pBits = (byte *) pixels.ToPointer();
										for (int p=0;p<mdlimg.bitmap.Length;p++)
											pBits[p] = mdlimg.bitmap[p];
									}
									bitmap.UnlockBits(bmdata);
									//bitmap.RotateFlip(RotateFlipType.RotateNoneFlipX);
									meshTextures[i] = Texture.FromBitmap(device,bitmap,Usage.AutoGenerateMipMap, Pool.Managed);
								}
								catch (Exception e)
								{
									string mess = e.Message;
									MessageBox.Show("error loading texture '"+mdlfile.Textures[i]+".mdl'. "+e.Message);
								}
							}
						}
					}
				}

				ArrayList objs = FlattenChildren(obj);

				Meshes = new Mesh[objs.Count];
				MeshesEnable = new bool[objs.Count];
				MeshesTex = new int[objs.Count];
				objectRadius = 0;
                mdlRadius = 0;
				tvObj.Nodes.Clear();

				for (int oi=0;oi<objs.Count;oi++)
				{
					obj = (MDLObject)objs[oi];

					
					TreeNode tn = new TreeNode("part "+oi.ToString());
					tn.Tag = oi;
					tn.Checked = true;
					tn.Nodes.Add("# vertices = "+obj.mesh.nvertex.ToString());
					tn.Nodes.Add("# faces = "+(obj.mesh.nfaces/3).ToString());
					if (obj.textidx == -1)
					{
						tn.Nodes.Add("no texture");
					}
					else
					{
						tn.Nodes.Add("texture = "+mdlfile.Textures[obj.textidx]);
					}
					tvObj.Nodes.Add(tn);
					
					// process mesh
					systemMemoryMesh = new Mesh(obj.mesh.nfaces/3,obj.mesh.nvertex,MeshFlags.SystemMemory,VertexFormats.Position |  VertexFormats.Normal | VertexFormats.Texture1,device);

					//systemMemoryMesh = Mesh.Box(device,12,15,2);
					VertexBuffer pVB = systemMemoryMesh.VertexBuffer;
					int dwNumVertices = systemMemoryMesh.NumberVertices;
					
					CustomVertex.PositionNormalTextured [] dest =
						(CustomVertex.PositionNormalTextured [])pVB.Lock(0,
						typeof(CustomVertex.PositionNormalTextured), 0, dwNumVertices);
				
					for(int i = 0; i < dest.Length; i++)
					{
                        Vector3 v = new Vector3(obj.mesh.vertices[i].x,obj.mesh.vertices[i].y,obj.mesh.vertices[i].z);
                        mdlRadius = Math.Max(mdlRadius, v.Length());

						dest[i].X = obj.mesh.vertices[i].x;
						dest[i].Y = obj.mesh.vertices[i].y;
						dest[i].Z = obj.mesh.vertices[i].z;

						dest[i].Nx = obj.mesh.vertices[i].nx;
						dest[i].Ny = obj.mesh.vertices[i].ny;
						dest[i].Nz = obj.mesh.vertices[i].nz;
						
						dest[i].Tu = obj.mesh.vertices[i].mx;
						dest[i].Tv = obj.mesh.vertices[i].my;
					}

					pVB.Unlock();

					int dwNumFaces = systemMemoryMesh.NumberFaces*3;
					ushort[] idxs = (ushort[])systemMemoryMesh.LockIndexBuffer(typeof(ushort),0,dwNumFaces);
					
					for (int i=0;i<dwNumFaces;i+=3)
					{
						idxs[i] = obj.mesh.faces[i];
						idxs[i+1] = obj.mesh.faces[i+2];
						idxs[i+2] = obj.mesh.faces[i+1];
					}
					systemMemoryMesh.UnlockIndexBuffer();
					//systemMemoryMesh.SetIndexBufferData(obj.mesh.faces,LockFlags.None);
					// Lock the vertex buffer, to generate a simple bounding sphere
					VertexBuffer vb = null;
					try
					{
						vb = systemMemoryMesh.VertexBuffer;
						GraphicsStream vbStream = vb.Lock(0, 0, 0);
						objectRadius = Math.Max(objectRadius,Geometry.ComputeBoundingSphere(vbStream, systemMemoryMesh.NumberVertices, systemMemoryMesh.VertexFormat, out objectCenter));
					}
					finally
					{
						// Make sure we unlock the buffer if we fail
						if (vb != null)
							vb.Unlock();
					}
					// Make sure there are normals, which are required for the tesselation
					// enhancement
					if ((systemMemoryMesh.VertexFormat & VertexFormats.Normal) != VertexFormats.Normal)
					{
						Mesh tempMesh = systemMemoryMesh.Clone(systemMemoryMesh.Options.Value, systemMemoryMesh.VertexFormat | VertexFormats.Normal, device);

						tempMesh.ComputeNormals();
						systemMemoryMesh.Dispose();
						systemMemoryMesh = tempMesh;
					}
					Meshes[oi] = systemMemoryMesh;
					MeshesEnable[oi] = true;
					MeshesTex[oi] = obj.textidx;
				} // oi loop
				tvObj.ExpandAll();
				objectCenter = new Vector3(0,0,0);
			} // try
			catch
			{
				// Hide the error so we display a blue screen
				return;
			}
		}
		protected ArrayList FlattenChildren(MDLObject obj)
		{
			ArrayList ares = new ArrayList(0);
			if (obj.type == MDLType.mdl_group)
			{
				MDLMesh[] childmeshes = new MDLMesh[obj.nchildren];
				for(int i=0;i<obj.nchildren;i++)
				{
					ares.AddRange(FlattenChildren(obj.childrens[i]));
				}
			}
			if (obj.type == MDLType.mdl_mesh)
			{
				ares.Add(obj);
			}
			return ares;
		}

		/// <summary>
        /// The device exists, but may have just been Reset().  Resources in
        /// Pool.Default and any other device state that persists during
        /// rendering should be set here.  Render states, matrices, textures,
        /// etc., that don't change during rendering can be set once here to
        /// avoid redundant state setting during Render() or FrameMove().
		/// </summary>
		protected override void RestoreDeviceObjects(System.Object sender, System.EventArgs e)
		{

			isUsingHardwareNPatches = Caps.DeviceCaps.SupportsNPatches; // Do we have hardware support?

			//enhancedMesh = systemMemoryMesh;

			// Setup render state
			renderState.Lighting = true;
			renderState.DitherEnable = true;
			renderState.ZBufferEnable = true;
			renderState.Ambient = System.Drawing.Color.FromArgb(0x33333333);
			sampleState.MagFilter = TextureFilter.Linear;
			sampleState.MinFilter = TextureFilter.Linear;

			// Setup the light
			GraphicsUtility.InitLight(device.Lights[0], LightType.Directional, 0.0f, -1.0f, 1.0f);
			device.Lights[0].Update();
			device.Lights[0].Enabled = true;

			GraphicsUtility.InitLight(device.Lights[1], LightType.Directional, 1.0f, 1.0f, 1.0f);
			device.Lights[1].Update();
			device.Lights[1].Enabled = true;

			// Set the arcball parameters
			arcBall.SetWindow(device.PresentationParameters.BackBufferWidth, device.PresentationParameters.BackBufferHeight, 0.85f);
			arcBall.Radius = 1.0f;

			// Set the projection matrix
			float fAspect = device.PresentationParameters.BackBufferWidth / (float)device.PresentationParameters.BackBufferHeight;
			device.Transform.Projection = Matrix.PerspectiveFovLH((float)Math.PI/4, fAspect, objectRadius/64.0f,objectRadius*200.0f);

			if (isWireframe)
				device.RenderState.FillMode = FillMode.WireFrame;
			else
				device.RenderState.FillMode = FillMode.Solid;
		}


		
		
		/// <summary>
		/// Event Handler for windows messages
		/// not used anymore
		/// </summary>
		private void OnPrivateKeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
		{
			if (e.KeyCode == System.Windows.Forms.Keys.W)
			{
				device.RenderState.FillMode = FillMode.WireFrame;
				isWireframe = true;
			}
			if (e.KeyCode == System.Windows.Forms.Keys.S)
			{
				device.RenderState.FillMode = FillMode.Solid;
				isWireframe = false;
			}
		}




		/// <summary>
		/// Fired when a new mesh needs to be opened
		/// </summary>
		private void OpenMesh(object sender, EventArgs e)
		{
			// Display the OpenFileName dialog. Then, try to load the specified file
			System.Windows.Forms.OpenFileDialog ofn = new OpenFileDialog();
			ofn.Filter = "Allegiance MDL Files (*.mdl)|*.mdl";
			ofn.FileName = meshFilename;
			ofn.InitialDirectory = initialDirectory;
			ofn.Title = "Open MDL File";
			ofn.CheckFileExists = true;
			ofn.Multiselect = false;
			ofn.ShowReadOnly = false;
			ofn.ShowDialog();
			System.IO.FileInfo fo = new System.IO.FileInfo(ofn.FileName);
			meshFilename = fo.Name;
			System.IO.Directory.SetCurrentDirectory(fo.DirectoryName);
			initialDirectory = fo.DirectoryName;
			// Destroy and recreate everything
			InvalidateDeviceObjects(null, null);
			DeleteDeviceObjects(null, null);
			try
			{
				InitializeDeviceObjects();
				RestoreDeviceObjects(null, null);
			}
			catch
			{
				MessageBox.Show("Error loading mesh: mesh may not\n" +
					"be valid. See debug output for\n" +
					"more information.\n\nPlease select " +
					"a different .x file.","MDLView", MessageBoxButtons.OK, MessageBoxIcon.Error);

			}
		}




        /// <summary>
        /// Called during device initialization, this code checks the device for 
        /// some minimum set of capabilities
        /// </summary>
		protected override bool ConfirmDevice(Caps caps, VertexProcessingType vertexProcessingType, 
			Format adapterFormat, Format backBufferFormat)
		{
			if ((vertexProcessingType == VertexProcessingType.PureHardware) && 
			    (!caps.DeviceCaps.SupportsNPatches) && (caps.DeviceCaps.SupportsRtPatches))
				return false;

			return true;
		}

		private void InitializeComponent()
		{
			this.driveListBox1 = new Microsoft.VisualBasic.Compatibility.VB6.DriveListBox();
			this.fileListBox1 = new Microsoft.VisualBasic.Compatibility.VB6.FileListBox();
			this.dirListBox1 = new Microsoft.VisualBasic.Compatibility.VB6.DirListBox();
			this.target = new System.Windows.Forms.PictureBox();
			this.BTSolidWire = new System.Windows.Forms.Button();
			this.CBLOD = new System.Windows.Forms.ComboBox();
			this.label1 = new System.Windows.Forms.Label();
			this.tabControl1 = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.btSave = new System.Windows.Forms.Button();
			this.tvObj = new System.Windows.Forms.TreeView();
			this.cdBack = new System.Windows.Forms.ColorDialog();
			this.btBackColor = new System.Windows.Forms.Button();
			this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
			this.tabControl1.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.tabPage2.SuspendLayout();
			this.SuspendLayout();
			// 
			// driveListBox1
			// 
			this.driveListBox1.Location = new System.Drawing.Point(8, 16);
			this.driveListBox1.Name = "driveListBox1";
			this.driveListBox1.Size = new System.Drawing.Size(192, 21);
			this.driveListBox1.TabIndex = 2;
			this.driveListBox1.SelectedIndexChanged += new System.EventHandler(this.driveListBox1_SelectedIndexChanged);
			// 
			// fileListBox1
			// 
			this.fileListBox1.Location = new System.Drawing.Point(8, 152);
			this.fileListBox1.Name = "fileListBox1";
			this.fileListBox1.Pattern = "*.mdl";
			this.fileListBox1.Size = new System.Drawing.Size(192, 277);
			this.fileListBox1.TabIndex = 1;
			this.fileListBox1.SelectedIndexChanged += new System.EventHandler(this.fileListBox1_SelectedIndexChanged);
			// 
			// dirListBox1
			// 
			this.dirListBox1.IntegralHeight = false;
			this.dirListBox1.Location = new System.Drawing.Point(8, 40);
			this.dirListBox1.Name = "dirListBox1";
			this.dirListBox1.Size = new System.Drawing.Size(192, 112);
			this.dirListBox1.TabIndex = 0;
			this.dirListBox1.SelectedIndexChanged += new System.EventHandler(this.dirListBox1_SelectedIndexChanged);
			// 
			// target
			// 
			this.target.Anchor = (((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
				| System.Windows.Forms.AnchorStyles.Left) 
				| System.Windows.Forms.AnchorStyles.Right);
			this.target.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.target.Location = new System.Drawing.Point(224, 56);
			this.target.Name = "target";
			this.target.Size = new System.Drawing.Size(472, 416);
			this.target.TabIndex = 1;
			this.target.TabStop = false;
			// 
			// BTSolidWire
			// 
			this.BTSolidWire.Location = new System.Drawing.Point(224, 24);
			this.BTSolidWire.Name = "BTSolidWire";
			this.BTSolidWire.TabIndex = 2;
			this.BTSolidWire.Text = "Wireframe";
			this.BTSolidWire.Click += new System.EventHandler(this.BTSolidWire_Click);
			// 
			// CBLOD
			// 
			this.CBLOD.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.CBLOD.Enabled = false;
			this.CBLOD.Location = new System.Drawing.Point(648, 24);
			this.CBLOD.Name = "CBLOD";
			this.CBLOD.Size = new System.Drawing.Size(48, 21);
			this.CBLOD.TabIndex = 3;
			// 
			// label1
			// 
			this.label1.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.label1.Location = new System.Drawing.Point(560, 24);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(80, 23);
			this.label1.TabIndex = 4;
			this.label1.Text = "Level of detail";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			// 
			// tabControl1
			// 
			this.tabControl1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					  this.tabPage1,
																					  this.tabPage2});
			this.tabControl1.Location = new System.Drawing.Point(0, 8);
			this.tabControl1.Name = "tabControl1";
			this.tabControl1.SelectedIndex = 0;
			this.tabControl1.Size = new System.Drawing.Size(216, 464);
			this.tabControl1.TabIndex = 5;
			// 
			// tabPage1
			// 
			this.tabPage1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.driveListBox1,
																				   this.dirListBox1,
																				   this.fileListBox1});
			this.tabPage1.Location = new System.Drawing.Point(4, 22);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Size = new System.Drawing.Size(208, 438);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "Browse";
			// 
			// tabPage2
			// 
			this.tabPage2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				   this.btSave,
																				   this.tvObj});
			this.tabPage2.Location = new System.Drawing.Point(4, 22);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Size = new System.Drawing.Size(208, 438);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "View";
			// 
			// btSave
			// 
			this.btSave.Location = new System.Drawing.Point(16, 408);
			this.btSave.Name = "btSave";
			this.btSave.TabIndex = 1;
			this.btSave.Text = "Save (test)";
			this.btSave.Visible = false;
			this.btSave.Click += new System.EventHandler(this.btSave_Click);
			// 
			// tvObj
			// 
			this.tvObj.CheckBoxes = true;
			this.tvObj.ImageIndex = -1;
			this.tvObj.Location = new System.Drawing.Point(8, 8);
			this.tvObj.Name = "tvObj";
			this.tvObj.SelectedImageIndex = -1;
			this.tvObj.Size = new System.Drawing.Size(192, 392);
			this.tvObj.TabIndex = 0;
			this.tvObj.AfterCheck += new System.Windows.Forms.TreeViewEventHandler(this.tvObj_AfterCheck);
			this.tvObj.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.tvObj_AfterSelect);
			// 
			// btBackColor
			// 
			this.btBackColor.Location = new System.Drawing.Point(312, 24);
			this.btBackColor.Name = "btBackColor";
			this.btBackColor.Size = new System.Drawing.Size(112, 23);
			this.btBackColor.TabIndex = 6;
			this.btBackColor.Text = "Background color";
			this.btBackColor.Click += new System.EventHandler(this.btBackColor_Click);
			// 
			// saveFileDialog1
			// 
			this.saveFileDialog1.FileName = "doc1";
			// 
			// ourRenderTarget
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(712, 477);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.btBackColor,
																		  this.tabControl1,
																		  this.label1,
																		  this.CBLOD,
																		  this.BTSolidWire,
																		  this.target});
			this.MinimumSize = new System.Drawing.Size(720, 488);
			this.Name = "ourRenderTarget";
			this.Text = "MDLView";
			this.tabControl1.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.tabPage2.ResumeLayout(false);
			this.ResumeLayout(false);

		}




        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main() 
        {
            using (MyGraphicsSample d3dApp = new MyGraphicsSample())
            {                                 
                if (d3dApp.CreateGraphicsSample())
                    d3dApp.Run();
            }
        }

		private void driveListBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			//MessageBox.Show(driveListBox1.SelectedItem.ToString());
			dirListBox1.Path = driveListBox1.Drive;
		}

		private void dirListBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			fileListBox1.Path = dirListBox1.Path;
		}

		private void fileListBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			//MessageBox.Show(fileListBox1.FileName);
			meshFilename = fileListBox1.FileName;
			System.IO.Directory.SetCurrentDirectory(fileListBox1.Path);
			initialDirectory = fileListBox1.Path;

			
			InvalidateDeviceObjects(null, null);
			DeleteDeviceObjects(null, null);
			try
			{
				InitializeDeviceObjects();
				RestoreDeviceObjects(null, null);
			}
			catch
			{
				MessageBox.Show("Error loading model: model may not\n" +
					"be valid. See debug output for\n" +
					"more information.\n\nPlease select " +
					"a different .mdl file.","MDLView", MessageBoxButtons.OK, MessageBoxIcon.Error);

			}
		}

		private void BTSolidWire_Click(object sender, System.EventArgs e)
		{
			if (BTSolidWire.Text == "Wireframe")
			{
				device.RenderState.FillMode = FillMode.WireFrame;
				isWireframe = true;
				BTSolidWire.Text = "Solid";
				return;
			}
			if (BTSolidWire.Text == "Solid")
			{
				device.RenderState.FillMode = FillMode.Solid;
				isWireframe = false;
				BTSolidWire.Text = "Wireframe";
				return;
			}
		}

		private void tvObj_AfterSelect(object sender, System.Windows.Forms.TreeViewEventArgs e)
		{
			//MessageBox.Show(tvObj.SelectedNode.Text);
		}

		private void tvObj_AfterCheck(object sender, System.Windows.Forms.TreeViewEventArgs e)
		{
			TreeNode tn = e.Node;
			if (tn == null) return;
			if (tn.Parent != null)
			{
				if (tn.Checked)
					tn.Checked = false;
			}
			else
			{
				if (!tn.Checked)
					tn.Collapse();
				else
					tn.Expand();
				MeshesEnable[(int)tn.Tag] = tn.Checked;
			}
		}

		private void btBackColor_Click(object sender, System.EventArgs e)
		{
			cdBack.ShowDialog();
		}

		private void btSave_Click(object sender, System.EventArgs e)
		{
			if (saveFileDialog1.ShowDialog() == DialogResult.OK)
			{
				mdlfile.SaveToFile(saveFileDialog1.FileName);
			}
		}
	}
}
