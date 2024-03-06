using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using AGCLib;
using ALLEGIANCESERVERLib;

namespace AGMTest
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class AGMUI : System.Windows.Forms.Form, IAdminSessionEvents
	{
        [DllImport(@"C:\dev\alleg\contrib\vs2005\AGMLib\Debug\AGMLib.dll")] 
		private static extern int GetAdminSession(out IAdminSession pout);
		protected IAdminSession ias;
		protected IAdminServer iserver;
		protected IAdminGame igame;
		//protected UCOMIConnectionPoint icp;
        protected IConnectionPoint icp;
		protected int myCookie;
		private System.Windows.Forms.TabControl tcMain;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.TabPage tabPage3;
		private System.Windows.Forms.ListBox lbGames;
		private System.Windows.Forms.Button btAddGame;
		private System.Windows.Forms.Button btKillGame;
		private System.Windows.Forms.Button btGameStart;
		private System.Windows.Forms.ListView lvPlayers;
        private System.Windows.Forms.Button btRefreshGames;
		private System.Windows.Forms.Button btRefreshPlayersList;
		private System.Windows.Forms.ColumnHeader lvpPiWing;
		private System.Windows.Forms.ColumnHeader lvPiTeam;
		private System.Windows.Forms.ColumnHeader lvPiName;
		private System.Windows.Forms.ColumnHeader lvPiID;
		private System.Windows.Forms.ColumnHeader lvPiShip;
		private System.Windows.Forms.ColumnHeader lvPiSector;
        private TabPage tabPage4;
        private Button btClearLog;
        private TextBox tbEvents;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public AGMUI()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
			int hr = GetAdminSession(out ias);
			tbEvents.Text += "GetSession = " + hr.ToString() +"\r\n";
			if (hr!=0) return;
			iserver = ias.Server;
			btRefreshGames_Click(null,null);

			//UCOMIConnectionPointContainer icpc = (UCOMIConnectionPointContainer)ias;
            IConnectionPointContainer icpc = (IConnectionPointContainer)ias;
			Guid riid = new Guid("DE3ED156-76A0-4A8E-8CFE-9ED26C3B0A5E");
			icpc.FindConnectionPoint(ref riid,out icp);
			myCookie = 0;
			icp.Advise((IAdminSessionEvents)this,out myCookie);
			ias.ActivateAllEvents();
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
				if (myCookie != 0)
				{
					ias.DeactivateAllEvents();
					icp.Unadvise(myCookie);
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AGMUI));
            this.tcMain = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.btRefreshPlayersList = new System.Windows.Forms.Button();
            this.btRefreshGames = new System.Windows.Forms.Button();
            this.lvPlayers = new System.Windows.Forms.ListView();
            this.lvPiID = new System.Windows.Forms.ColumnHeader();
            this.lvPiName = new System.Windows.Forms.ColumnHeader();
            this.lvPiTeam = new System.Windows.Forms.ColumnHeader();
            this.lvpPiWing = new System.Windows.Forms.ColumnHeader();
            this.lvPiShip = new System.Windows.Forms.ColumnHeader();
            this.lvPiSector = new System.Windows.Forms.ColumnHeader();
            this.btGameStart = new System.Windows.Forms.Button();
            this.btKillGame = new System.Windows.Forms.Button();
            this.btAddGame = new System.Windows.Forms.Button();
            this.lbGames = new System.Windows.Forms.ListBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.tbEvents = new System.Windows.Forms.TextBox();
            this.btClearLog = new System.Windows.Forms.Button();
            this.tcMain.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.SuspendLayout();
            // 
            // tcMain
            // 
            this.tcMain.Controls.Add(this.tabPage1);
            this.tcMain.Controls.Add(this.tabPage2);
            this.tcMain.Controls.Add(this.tabPage3);
            this.tcMain.Controls.Add(this.tabPage4);
            this.tcMain.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tcMain.Location = new System.Drawing.Point(8, 24);
            this.tcMain.Name = "tcMain";
            this.tcMain.SelectedIndex = 0;
            this.tcMain.Size = new System.Drawing.Size(848, 504);
            this.tcMain.TabIndex = 1;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.btRefreshPlayersList);
            this.tabPage1.Controls.Add(this.btRefreshGames);
            this.tabPage1.Controls.Add(this.lvPlayers);
            this.tabPage1.Controls.Add(this.btGameStart);
            this.tabPage1.Controls.Add(this.btKillGame);
            this.tabPage1.Controls.Add(this.btAddGame);
            this.tabPage1.Controls.Add(this.lbGames);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Size = new System.Drawing.Size(840, 478);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Games";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // btRefreshPlayersList
            // 
            this.btRefreshPlayersList.Location = new System.Drawing.Point(190, 16);
            this.btRefreshPlayersList.Name = "btRefreshPlayersList";
            this.btRefreshPlayersList.Size = new System.Drawing.Size(642, 23);
            this.btRefreshPlayersList.TabIndex = 8;
            this.btRefreshPlayersList.Text = "refresh players list";
            this.btRefreshPlayersList.Click += new System.EventHandler(this.btRefreshPlayersList_Click);
            // 
            // btRefreshGames
            // 
            this.btRefreshGames.Location = new System.Drawing.Point(8, 16);
            this.btRefreshGames.Name = "btRefreshGames";
            this.btRefreshGames.Size = new System.Drawing.Size(176, 23);
            this.btRefreshGames.TabIndex = 6;
            this.btRefreshGames.Text = "refresh games list";
            this.btRefreshGames.Click += new System.EventHandler(this.btRefreshGames_Click);
            // 
            // lvPlayers
            // 
            this.lvPlayers.AllowColumnReorder = true;
            this.lvPlayers.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.lvPiID,
            this.lvPiName,
            this.lvPiTeam,
            this.lvpPiWing,
            this.lvPiShip,
            this.lvPiSector});
            this.lvPlayers.FullRowSelect = true;
            this.lvPlayers.GridLines = true;
            this.lvPlayers.Location = new System.Drawing.Point(190, 40);
            this.lvPlayers.Name = "lvPlayers";
            this.lvPlayers.Size = new System.Drawing.Size(642, 435);
            this.lvPlayers.TabIndex = 5;
            this.lvPlayers.UseCompatibleStateImageBehavior = false;
            this.lvPlayers.View = System.Windows.Forms.View.Details;
            this.lvPlayers.SelectedIndexChanged += new System.EventHandler(this.lvPlayers_SelectedIndexChanged);
            // 
            // lvPiID
            // 
            this.lvPiID.Text = "ID";
            this.lvPiID.Width = 35;
            // 
            // lvPiName
            // 
            this.lvPiName.Text = "Name";
            this.lvPiName.Width = 116;
            // 
            // lvPiTeam
            // 
            this.lvPiTeam.Text = "Team";
            this.lvPiTeam.Width = 65;
            // 
            // lvpPiWing
            // 
            this.lvpPiWing.Text = "Wing";
            this.lvpPiWing.Width = 81;
            // 
            // lvPiShip
            // 
            this.lvPiShip.Text = "Ship";
            this.lvPiShip.Width = 112;
            // 
            // lvPiSector
            // 
            this.lvPiSector.Text = "Sector";
            this.lvPiSector.Width = 118;
            // 
            // btGameStart
            // 
            this.btGameStart.Location = new System.Drawing.Point(8, 181);
            this.btGameStart.Name = "btGameStart";
            this.btGameStart.Size = new System.Drawing.Size(75, 23);
            this.btGameStart.TabIndex = 4;
            this.btGameStart.Text = "Force start";
            this.btGameStart.Click += new System.EventHandler(this.btGameStart_Click);
            // 
            // btKillGame
            // 
            this.btKillGame.Location = new System.Drawing.Point(96, 152);
            this.btKillGame.Name = "btKillGame";
            this.btKillGame.Size = new System.Drawing.Size(88, 23);
            this.btKillGame.TabIndex = 3;
            this.btKillGame.Text = "Delete game";
            this.btKillGame.Click += new System.EventHandler(this.btKillGame_Click);
            // 
            // btAddGame
            // 
            this.btAddGame.Location = new System.Drawing.Point(8, 152);
            this.btAddGame.Name = "btAddGame";
            this.btAddGame.Size = new System.Drawing.Size(75, 23);
            this.btAddGame.TabIndex = 2;
            this.btAddGame.Text = "Add game";
            this.btAddGame.Click += new System.EventHandler(this.btAddGame_Click);
            // 
            // lbGames
            // 
            this.lbGames.Location = new System.Drawing.Point(8, 40);
            this.lbGames.Name = "lbGames";
            this.lbGames.Size = new System.Drawing.Size(176, 108);
            this.lbGames.TabIndex = 1;
            this.lbGames.SelectedIndexChanged += new System.EventHandler(this.lbGames_SelectedIndexChanged);
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Size = new System.Drawing.Size(840, 478);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Players";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tabPage3
            // 
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(840, 478);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Chat";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.btClearLog);
            this.tabPage4.Controls.Add(this.tbEvents);
            this.tabPage4.Location = new System.Drawing.Point(4, 22);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(840, 478);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "Log";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // tbEvents
            // 
            this.tbEvents.Location = new System.Drawing.Point(8, 6);
            this.tbEvents.Multiline = true;
            this.tbEvents.Name = "tbEvents";
            this.tbEvents.Size = new System.Drawing.Size(824, 439);
            this.tbEvents.TabIndex = 1;
            // 
            // btClearLog
            // 
            this.btClearLog.Location = new System.Drawing.Point(8, 449);
            this.btClearLog.Name = "btClearLog";
            this.btClearLog.Size = new System.Drawing.Size(75, 23);
            this.btClearLog.TabIndex = 8;
            this.btClearLog.Text = "Clear log";
            // 
            // AGMUI
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.BackColor = System.Drawing.Color.RosyBrown;
            this.ClientSize = new System.Drawing.Size(864, 541);
            this.Controls.Add(this.tcMain);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "AGMUI";
            this.Text = "AGM.Net";
            this.tcMain.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new AGMUI());
		}
		public void OnEvent(AGCLib.IAGCEvent iev)
		{
			tbEvents.Text += iev.Description + "\r\n";
		}

		private void btAddGame_Click(object sender, System.EventArgs e)
		{
			AGCLib.AGCGameParametersClass igp = new AGCLib.AGCGameParametersClass();
            igp.IGCStaticFile = "testcore";
			igp.AllowEmptyTeams = true;
            igp.ShowMap = true;
            igp.StartingMoney = 9;
            //igp.CustomMap = "hugesect";
			igp.NeutralSectorAsteroids = 39;
			igp.PlayerSectorAsteroids = 39;
//			igp.NeutralSectorSpecialAsteroids = 20;
//			igp.PlayerSectorSpecialAsteroids = 20;
			igp.GameName = "test";
			igp.Validate();
            iserver.PublicLobby = true;
			iserver.Games.Add(igp);
			btRefreshGames_Click(sender,e);
		}

		private void btKillGame_Click(object sender, System.EventArgs e)
		{
			if (igame != null)
			{
				igame.Kill();
				igame = null;
				btRefreshGames_Click(sender,e);
			}
		}

		private void btGameStart_Click(object sender, System.EventArgs e)
		{
			if (igame != null) igame.StartGame();
		}

		private void lbGames_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			IAdminGames igames = iserver.Games;
			object oidx = lbGames.SelectedIndex;
			igame = igames.get_Item(ref oidx);
			tbEvents.Text += "selected game = "+ igame.Name + "\r\n";
		}

		private void lvPlayers_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

		private void btRefreshGames_Click(object sender, System.EventArgs e)
		{
			IAdminGames igames = iserver.Games;
			lbGames.Items.Clear();
			for (int i=0;i<igames.Count;i++)
			{
				object oi = i;
				IAdminGame igame = igames.get_Item(ref oi);
				lbGames.Items.Add(igame.Name);
			}

		}

		private void btClearLog_Click(object sender, System.EventArgs e)
		{
			tbEvents.Text = "";
		}

		private void btRefreshPlayersList_Click(object sender, System.EventArgs e)
		{
			lvPlayers.Items.Clear();
			if (igame == null) return;
			IAGCTeams iteams = igame.Teams;
			IEnumerator ienumteams = iteams.GetEnumerator();
			int teamnum = 0;
			while (ienumteams.MoveNext())
			{
				teamnum++; tbEvents.Text += "team "+teamnum+"\r\n";
				IAGCTeam iteam = (IAGCTeam)ienumteams.Current;
				IAGCShips iships = iteam.Ships;
				IEnumerator ienumships = iships.GetEnumerator();
				while (ienumships.MoveNext())
				{
					IAGCShip iship = (IAGCShip)ienumships.Current;
					tbEvents.Text += "  ship "+iship.Name+"\r\n";
					ListViewItem item = new ListViewItem(iship.UniqueID.ToString());
					item.SubItems.Add(iship.Name);
					item.SubItems.Add("Team "+teamnum.ToString()+"("+iteam.Name+")");
					item.SubItems.Add(iship.WingID.ToString());
					if (iship.BaseHullType != null)
						item.SubItems.Add(iship.BaseHullType.Name);
					if (iship.Sector != null)
						item.SubItems.Add(iship.Sector.Name);
					lvPlayers.Items.Add(item);
				}
			}
//			IAdminUsers iusers = igame.Users;
//			IEnumerator ienum = iusers.GetEnumerator();
//			while (ienum.MoveNext())
//			{
//				IAdminUser iuser = (IAdminUser) ienum.Current;
//				ListViewItem item = new ListViewItem(iuser.UniqueID.ToString());
//				item.Tag = iuser;
//				IAdminShip iship = iuser.Ship;
//				IAGCTeam iteam = iship.Team;
//				item.SubItems.Add(iuser.Name);
//				item.SubItems.Add(iteam.UniqueID.ToString());
//				item.SubItems.Add(iship.WingID.ToString());
//				lvPlayers.Items.Add(item);				
//			}
		}
	}
}
