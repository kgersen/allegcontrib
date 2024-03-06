using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace ICE
{
	/// <summary>
	/// Summary description for Projectiles.
	/// </summary>
	public class Projectiles : System.Windows.Forms.Form
	{
		private ICE.feddts objfeddts;
		private System.Windows.Forms.Button btnLoad;
		private System.Windows.Forms.Button btnUpdate;
		private System.Windows.Forms.Button btnCancelAll;
		private System.Windows.Forms.Label lblProjectileID;
		private System.Windows.Forms.Label lblTimeDuration;
		private System.Windows.Forms.Label lblHitPointsInflict;
		private System.Windows.Forms.Label lblDamageType;
		private System.Windows.Forms.Label lblFileModel;
		private System.Windows.Forms.Label lblFileTexture;
		private System.Windows.Forms.Label lblSpeedMax;
		private System.Windows.Forms.Label lblAcceleration;
		private System.Windows.Forms.Label lblSize_cm;
		private System.Windows.Forms.Label lblRadiusBlast_m;
		private System.Windows.Forms.Label lblpercentPenetration;
		private System.Windows.Forms.Label lblRateRotation;
		private System.Windows.Forms.Label lblIsAbsoluteSpeed;
		private System.Windows.Forms.TextBox editProjectileID;
		private System.Windows.Forms.TextBox editTimeDuration;
		private System.Windows.Forms.TextBox editHitPointsInflict;
		private System.Windows.Forms.TextBox editDamageType;
		private System.Windows.Forms.TextBox editFileModel;
		private System.Windows.Forms.TextBox editFileTexture;
		private System.Windows.Forms.TextBox editSpeedMax;
		private System.Windows.Forms.TextBox editAcceleration;
		private System.Windows.Forms.TextBox editSize_cm;
		private System.Windows.Forms.TextBox editRadiusBlast_m;
		private System.Windows.Forms.TextBox editpercentPenetration;
		private System.Windows.Forms.TextBox editRateRotation;
		private System.Windows.Forms.CheckBox editIsAbsoluteSpeed;
		private System.Windows.Forms.Label lblIsDirectional;
		private System.Windows.Forms.Label lblIsExplodeOnExpire;
		private System.Windows.Forms.Label lblIsProximityFuse;
		private System.Windows.Forms.Label lblpercentRed;
		private System.Windows.Forms.Label lblpercentGreen;
		private System.Windows.Forms.Label lblpercentBlue;
		private System.Windows.Forms.Label lblpercentAlpha;
		private System.Windows.Forms.Label lblBlastPower;
		private System.Windows.Forms.Label lblBlastRadius;
		private System.Windows.Forms.Label lblWidthOverHeight;
		private System.Windows.Forms.Label lblPRIcon;
		private System.Windows.Forms.Label lblAmbientSound;
		private System.Windows.Forms.CheckBox editIsDirectional;
		private System.Windows.Forms.CheckBox editIsExplodeOnExpire;
		private System.Windows.Forms.CheckBox editIsProximityFuse;
		private System.Windows.Forms.TextBox editpercentRed;
		private System.Windows.Forms.TextBox editpercentGreen;
		private System.Windows.Forms.TextBox editpercentBlue;
		private System.Windows.Forms.TextBox editpercentAlpha;
		private System.Windows.Forms.TextBox editBlastPower;
		private System.Windows.Forms.TextBox editBlastRadius;
		private System.Windows.Forms.TextBox editWidthOverHeight;
		private System.Windows.Forms.TextBox editPRIcon;
		private System.Windows.Forms.TextBox editAmbientSound;
		private System.Windows.Forms.Button btnNavFirst;
		private System.Windows.Forms.Button btnNavPrev;
		private System.Windows.Forms.Label lblNavLocation;
		private System.Windows.Forms.Button btnNavNext;
		private System.Windows.Forms.Button btnLast;
		private System.Windows.Forms.Button btnAdd;
		private System.Windows.Forms.Button btnDelete;
		private System.Windows.Forms.Button btnCancel;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Projectiles()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
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
			this.objfeddts = new ICE.feddts();
			this.btnLoad = new System.Windows.Forms.Button();
			this.btnUpdate = new System.Windows.Forms.Button();
			this.btnCancelAll = new System.Windows.Forms.Button();
			this.lblProjectileID = new System.Windows.Forms.Label();
			this.lblTimeDuration = new System.Windows.Forms.Label();
			this.lblHitPointsInflict = new System.Windows.Forms.Label();
			this.lblDamageType = new System.Windows.Forms.Label();
			this.lblFileModel = new System.Windows.Forms.Label();
			this.lblFileTexture = new System.Windows.Forms.Label();
			this.lblSpeedMax = new System.Windows.Forms.Label();
			this.lblAcceleration = new System.Windows.Forms.Label();
			this.lblSize_cm = new System.Windows.Forms.Label();
			this.lblRadiusBlast_m = new System.Windows.Forms.Label();
			this.lblpercentPenetration = new System.Windows.Forms.Label();
			this.lblRateRotation = new System.Windows.Forms.Label();
			this.lblIsAbsoluteSpeed = new System.Windows.Forms.Label();
			this.editProjectileID = new System.Windows.Forms.TextBox();
			this.editTimeDuration = new System.Windows.Forms.TextBox();
			this.editHitPointsInflict = new System.Windows.Forms.TextBox();
			this.editDamageType = new System.Windows.Forms.TextBox();
			this.editFileModel = new System.Windows.Forms.TextBox();
			this.editFileTexture = new System.Windows.Forms.TextBox();
			this.editSpeedMax = new System.Windows.Forms.TextBox();
			this.editAcceleration = new System.Windows.Forms.TextBox();
			this.editSize_cm = new System.Windows.Forms.TextBox();
			this.editRadiusBlast_m = new System.Windows.Forms.TextBox();
			this.editpercentPenetration = new System.Windows.Forms.TextBox();
			this.editRateRotation = new System.Windows.Forms.TextBox();
			this.editIsAbsoluteSpeed = new System.Windows.Forms.CheckBox();
			this.lblIsDirectional = new System.Windows.Forms.Label();
			this.lblIsExplodeOnExpire = new System.Windows.Forms.Label();
			this.lblIsProximityFuse = new System.Windows.Forms.Label();
			this.lblpercentRed = new System.Windows.Forms.Label();
			this.lblpercentGreen = new System.Windows.Forms.Label();
			this.lblpercentBlue = new System.Windows.Forms.Label();
			this.lblpercentAlpha = new System.Windows.Forms.Label();
			this.lblBlastPower = new System.Windows.Forms.Label();
			this.lblBlastRadius = new System.Windows.Forms.Label();
			this.lblWidthOverHeight = new System.Windows.Forms.Label();
			this.lblPRIcon = new System.Windows.Forms.Label();
			this.lblAmbientSound = new System.Windows.Forms.Label();
			this.editIsDirectional = new System.Windows.Forms.CheckBox();
			this.editIsExplodeOnExpire = new System.Windows.Forms.CheckBox();
			this.editIsProximityFuse = new System.Windows.Forms.CheckBox();
			this.editpercentRed = new System.Windows.Forms.TextBox();
			this.editpercentGreen = new System.Windows.Forms.TextBox();
			this.editpercentBlue = new System.Windows.Forms.TextBox();
			this.editpercentAlpha = new System.Windows.Forms.TextBox();
			this.editBlastPower = new System.Windows.Forms.TextBox();
			this.editBlastRadius = new System.Windows.Forms.TextBox();
			this.editWidthOverHeight = new System.Windows.Forms.TextBox();
			this.editPRIcon = new System.Windows.Forms.TextBox();
			this.editAmbientSound = new System.Windows.Forms.TextBox();
			this.btnNavFirst = new System.Windows.Forms.Button();
			this.btnNavPrev = new System.Windows.Forms.Button();
			this.lblNavLocation = new System.Windows.Forms.Label();
			this.btnNavNext = new System.Windows.Forms.Button();
			this.btnLast = new System.Windows.Forms.Button();
			this.btnAdd = new System.Windows.Forms.Button();
			this.btnDelete = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.objfeddts)).BeginInit();
			this.SuspendLayout();
			// 
			// objfeddts
			// 
			this.objfeddts.DataSetName = "feddts";
			this.objfeddts.Locale = new System.Globalization.CultureInfo("fr-FR");
			this.objfeddts.Namespace = "http://www.tempuri.org/feddts.xsd";
			// 
			// btnLoad
			// 
			this.btnLoad.Location = new System.Drawing.Point(10, 10);
			this.btnLoad.Name = "btnLoad";
			this.btnLoad.TabIndex = 0;
			this.btnLoad.Text = "&Load";
			// 
			// btnUpdate
			// 
			this.btnUpdate.Location = new System.Drawing.Point(365, 10);
			this.btnUpdate.Name = "btnUpdate";
			this.btnUpdate.TabIndex = 1;
			this.btnUpdate.Text = "&Update";
			// 
			// btnCancelAll
			// 
			this.btnCancelAll.Location = new System.Drawing.Point(365, 43);
			this.btnCancelAll.Name = "btnCancelAll";
			this.btnCancelAll.TabIndex = 2;
			this.btnCancelAll.Text = "Ca&ncel All";
			this.btnCancelAll.Click += new System.EventHandler(this.btnCancelAll_Click);
			// 
			// lblProjectileID
			// 
			this.lblProjectileID.Location = new System.Drawing.Point(10, 76);
			this.lblProjectileID.Name = "lblProjectileID";
			this.lblProjectileID.TabIndex = 3;
			this.lblProjectileID.Text = "ProjectileID";
			// 
			// lblTimeDuration
			// 
			this.lblTimeDuration.Location = new System.Drawing.Point(10, 109);
			this.lblTimeDuration.Name = "lblTimeDuration";
			this.lblTimeDuration.TabIndex = 4;
			this.lblTimeDuration.Text = "TimeDuration";
			// 
			// lblHitPointsInflict
			// 
			this.lblHitPointsInflict.Location = new System.Drawing.Point(10, 142);
			this.lblHitPointsInflict.Name = "lblHitPointsInflict";
			this.lblHitPointsInflict.TabIndex = 5;
			this.lblHitPointsInflict.Text = "HitPointsInflict";
			// 
			// lblDamageType
			// 
			this.lblDamageType.Location = new System.Drawing.Point(10, 175);
			this.lblDamageType.Name = "lblDamageType";
			this.lblDamageType.TabIndex = 6;
			this.lblDamageType.Text = "DamageType";
			// 
			// lblFileModel
			// 
			this.lblFileModel.Location = new System.Drawing.Point(10, 208);
			this.lblFileModel.Name = "lblFileModel";
			this.lblFileModel.TabIndex = 7;
			this.lblFileModel.Text = "FileModel";
			// 
			// lblFileTexture
			// 
			this.lblFileTexture.Location = new System.Drawing.Point(10, 241);
			this.lblFileTexture.Name = "lblFileTexture";
			this.lblFileTexture.TabIndex = 8;
			this.lblFileTexture.Text = "FileTexture";
			// 
			// lblSpeedMax
			// 
			this.lblSpeedMax.Location = new System.Drawing.Point(10, 274);
			this.lblSpeedMax.Name = "lblSpeedMax";
			this.lblSpeedMax.TabIndex = 9;
			this.lblSpeedMax.Text = "SpeedMax";
			// 
			// lblAcceleration
			// 
			this.lblAcceleration.Location = new System.Drawing.Point(10, 307);
			this.lblAcceleration.Name = "lblAcceleration";
			this.lblAcceleration.TabIndex = 10;
			this.lblAcceleration.Text = "Acceleration";
			// 
			// lblSize_cm
			// 
			this.lblSize_cm.Location = new System.Drawing.Point(10, 340);
			this.lblSize_cm.Name = "lblSize_cm";
			this.lblSize_cm.TabIndex = 11;
			this.lblSize_cm.Text = "Size_cm";
			// 
			// lblRadiusBlast_m
			// 
			this.lblRadiusBlast_m.Location = new System.Drawing.Point(10, 373);
			this.lblRadiusBlast_m.Name = "lblRadiusBlast_m";
			this.lblRadiusBlast_m.TabIndex = 12;
			this.lblRadiusBlast_m.Text = "RadiusBlast_m";
			// 
			// lblpercentPenetration
			// 
			this.lblpercentPenetration.Location = new System.Drawing.Point(10, 406);
			this.lblpercentPenetration.Name = "lblpercentPenetration";
			this.lblpercentPenetration.TabIndex = 13;
			this.lblpercentPenetration.Text = "percentPenetration";
			// 
			// lblRateRotation
			// 
			this.lblRateRotation.Location = new System.Drawing.Point(10, 439);
			this.lblRateRotation.Name = "lblRateRotation";
			this.lblRateRotation.TabIndex = 14;
			this.lblRateRotation.Text = "RateRotation";
			// 
			// lblIsAbsoluteSpeed
			// 
			this.lblIsAbsoluteSpeed.Location = new System.Drawing.Point(10, 472);
			this.lblIsAbsoluteSpeed.Name = "lblIsAbsoluteSpeed";
			this.lblIsAbsoluteSpeed.TabIndex = 15;
			this.lblIsAbsoluteSpeed.Text = "IsAbsoluteSpeed";
			// 
			// editProjectileID
			// 
			this.editProjectileID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.ProjectileID"));
			this.editProjectileID.Location = new System.Drawing.Point(120, 76);
			this.editProjectileID.Name = "editProjectileID";
			this.editProjectileID.TabIndex = 16;
			this.editProjectileID.Text = "";
			// 
			// editTimeDuration
			// 
			this.editTimeDuration.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.TimeDuration"));
			this.editTimeDuration.Location = new System.Drawing.Point(120, 109);
			this.editTimeDuration.Name = "editTimeDuration";
			this.editTimeDuration.TabIndex = 17;
			this.editTimeDuration.Text = "";
			// 
			// editHitPointsInflict
			// 
			this.editHitPointsInflict.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.HitPointsInflict"));
			this.editHitPointsInflict.Location = new System.Drawing.Point(120, 142);
			this.editHitPointsInflict.Name = "editHitPointsInflict";
			this.editHitPointsInflict.TabIndex = 18;
			this.editHitPointsInflict.Text = "";
			// 
			// editDamageType
			// 
			this.editDamageType.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.DamageType"));
			this.editDamageType.Location = new System.Drawing.Point(120, 175);
			this.editDamageType.Name = "editDamageType";
			this.editDamageType.TabIndex = 19;
			this.editDamageType.Text = "";
			// 
			// editFileModel
			// 
			this.editFileModel.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.FileModel"));
			this.editFileModel.Location = new System.Drawing.Point(120, 208);
			this.editFileModel.Name = "editFileModel";
			this.editFileModel.TabIndex = 20;
			this.editFileModel.Text = "";
			// 
			// editFileTexture
			// 
			this.editFileTexture.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.FileTexture"));
			this.editFileTexture.Location = new System.Drawing.Point(120, 241);
			this.editFileTexture.Name = "editFileTexture";
			this.editFileTexture.TabIndex = 21;
			this.editFileTexture.Text = "";
			// 
			// editSpeedMax
			// 
			this.editSpeedMax.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.SpeedMax"));
			this.editSpeedMax.Location = new System.Drawing.Point(120, 274);
			this.editSpeedMax.Name = "editSpeedMax";
			this.editSpeedMax.TabIndex = 22;
			this.editSpeedMax.Text = "";
			// 
			// editAcceleration
			// 
			this.editAcceleration.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.Acceleration"));
			this.editAcceleration.Location = new System.Drawing.Point(120, 307);
			this.editAcceleration.Name = "editAcceleration";
			this.editAcceleration.TabIndex = 23;
			this.editAcceleration.Text = "";
			// 
			// editSize_cm
			// 
			this.editSize_cm.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.Size_cm"));
			this.editSize_cm.Location = new System.Drawing.Point(120, 340);
			this.editSize_cm.Name = "editSize_cm";
			this.editSize_cm.TabIndex = 24;
			this.editSize_cm.Text = "";
			// 
			// editRadiusBlast_m
			// 
			this.editRadiusBlast_m.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.RadiusBlast_m"));
			this.editRadiusBlast_m.Location = new System.Drawing.Point(120, 373);
			this.editRadiusBlast_m.Name = "editRadiusBlast_m";
			this.editRadiusBlast_m.TabIndex = 25;
			this.editRadiusBlast_m.Text = "";
			// 
			// editpercentPenetration
			// 
			this.editpercentPenetration.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.percentPenetration"));
			this.editpercentPenetration.Location = new System.Drawing.Point(120, 406);
			this.editpercentPenetration.Name = "editpercentPenetration";
			this.editpercentPenetration.TabIndex = 26;
			this.editpercentPenetration.Text = "";
			// 
			// editRateRotation
			// 
			this.editRateRotation.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.RateRotation"));
			this.editRateRotation.Location = new System.Drawing.Point(120, 439);
			this.editRateRotation.Name = "editRateRotation";
			this.editRateRotation.TabIndex = 27;
			this.editRateRotation.Text = "";
			// 
			// editIsAbsoluteSpeed
			// 
			this.editIsAbsoluteSpeed.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.objfeddts, "Projectiles.IsAbsoluteSpeed"));
			this.editIsAbsoluteSpeed.Location = new System.Drawing.Point(120, 472);
			this.editIsAbsoluteSpeed.Name = "editIsAbsoluteSpeed";
			this.editIsAbsoluteSpeed.Size = new System.Drawing.Size(100, 24);
			this.editIsAbsoluteSpeed.TabIndex = 28;
			// 
			// lblIsDirectional
			// 
			this.lblIsDirectional.Location = new System.Drawing.Point(230, 76);
			this.lblIsDirectional.Name = "lblIsDirectional";
			this.lblIsDirectional.TabIndex = 29;
			this.lblIsDirectional.Text = "IsDirectional";
			// 
			// lblIsExplodeOnExpire
			// 
			this.lblIsExplodeOnExpire.Location = new System.Drawing.Point(230, 109);
			this.lblIsExplodeOnExpire.Name = "lblIsExplodeOnExpire";
			this.lblIsExplodeOnExpire.TabIndex = 30;
			this.lblIsExplodeOnExpire.Text = "IsExplodeOnExpire";
			// 
			// lblIsProximityFuse
			// 
			this.lblIsProximityFuse.Location = new System.Drawing.Point(230, 142);
			this.lblIsProximityFuse.Name = "lblIsProximityFuse";
			this.lblIsProximityFuse.TabIndex = 31;
			this.lblIsProximityFuse.Text = "IsProximityFuse";
			// 
			// lblpercentRed
			// 
			this.lblpercentRed.Location = new System.Drawing.Point(230, 175);
			this.lblpercentRed.Name = "lblpercentRed";
			this.lblpercentRed.TabIndex = 32;
			this.lblpercentRed.Text = "percentRed";
			// 
			// lblpercentGreen
			// 
			this.lblpercentGreen.Location = new System.Drawing.Point(230, 208);
			this.lblpercentGreen.Name = "lblpercentGreen";
			this.lblpercentGreen.TabIndex = 33;
			this.lblpercentGreen.Text = "percentGreen";
			// 
			// lblpercentBlue
			// 
			this.lblpercentBlue.Location = new System.Drawing.Point(230, 241);
			this.lblpercentBlue.Name = "lblpercentBlue";
			this.lblpercentBlue.TabIndex = 34;
			this.lblpercentBlue.Text = "percentBlue";
			// 
			// lblpercentAlpha
			// 
			this.lblpercentAlpha.Location = new System.Drawing.Point(230, 274);
			this.lblpercentAlpha.Name = "lblpercentAlpha";
			this.lblpercentAlpha.TabIndex = 35;
			this.lblpercentAlpha.Text = "percentAlpha";
			// 
			// lblBlastPower
			// 
			this.lblBlastPower.Location = new System.Drawing.Point(230, 307);
			this.lblBlastPower.Name = "lblBlastPower";
			this.lblBlastPower.TabIndex = 36;
			this.lblBlastPower.Text = "BlastPower";
			// 
			// lblBlastRadius
			// 
			this.lblBlastRadius.Location = new System.Drawing.Point(230, 340);
			this.lblBlastRadius.Name = "lblBlastRadius";
			this.lblBlastRadius.TabIndex = 37;
			this.lblBlastRadius.Text = "BlastRadius";
			// 
			// lblWidthOverHeight
			// 
			this.lblWidthOverHeight.Location = new System.Drawing.Point(230, 373);
			this.lblWidthOverHeight.Name = "lblWidthOverHeight";
			this.lblWidthOverHeight.TabIndex = 38;
			this.lblWidthOverHeight.Text = "WidthOverHeight";
			// 
			// lblPRIcon
			// 
			this.lblPRIcon.Location = new System.Drawing.Point(230, 406);
			this.lblPRIcon.Name = "lblPRIcon";
			this.lblPRIcon.TabIndex = 39;
			this.lblPRIcon.Text = "PRIcon";
			// 
			// lblAmbientSound
			// 
			this.lblAmbientSound.Location = new System.Drawing.Point(230, 439);
			this.lblAmbientSound.Name = "lblAmbientSound";
			this.lblAmbientSound.TabIndex = 40;
			this.lblAmbientSound.Text = "AmbientSound";
			// 
			// editIsDirectional
			// 
			this.editIsDirectional.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.objfeddts, "Projectiles.IsDirectional"));
			this.editIsDirectional.Location = new System.Drawing.Point(340, 76);
			this.editIsDirectional.Name = "editIsDirectional";
			this.editIsDirectional.Size = new System.Drawing.Size(100, 24);
			this.editIsDirectional.TabIndex = 41;
			// 
			// editIsExplodeOnExpire
			// 
			this.editIsExplodeOnExpire.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.objfeddts, "Projectiles.IsExplodeOnExpire"));
			this.editIsExplodeOnExpire.Location = new System.Drawing.Point(340, 109);
			this.editIsExplodeOnExpire.Name = "editIsExplodeOnExpire";
			this.editIsExplodeOnExpire.Size = new System.Drawing.Size(100, 24);
			this.editIsExplodeOnExpire.TabIndex = 42;
			// 
			// editIsProximityFuse
			// 
			this.editIsProximityFuse.DataBindings.Add(new System.Windows.Forms.Binding("Checked", this.objfeddts, "Projectiles.IsProximityFuse"));
			this.editIsProximityFuse.Location = new System.Drawing.Point(340, 142);
			this.editIsProximityFuse.Name = "editIsProximityFuse";
			this.editIsProximityFuse.Size = new System.Drawing.Size(100, 24);
			this.editIsProximityFuse.TabIndex = 43;
			// 
			// editpercentRed
			// 
			this.editpercentRed.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.percentRed"));
			this.editpercentRed.Location = new System.Drawing.Point(340, 175);
			this.editpercentRed.Name = "editpercentRed";
			this.editpercentRed.TabIndex = 44;
			this.editpercentRed.Text = "";
			// 
			// editpercentGreen
			// 
			this.editpercentGreen.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.percentGreen"));
			this.editpercentGreen.Location = new System.Drawing.Point(340, 208);
			this.editpercentGreen.Name = "editpercentGreen";
			this.editpercentGreen.TabIndex = 45;
			this.editpercentGreen.Text = "";
			// 
			// editpercentBlue
			// 
			this.editpercentBlue.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.percentBlue"));
			this.editpercentBlue.Location = new System.Drawing.Point(340, 241);
			this.editpercentBlue.Name = "editpercentBlue";
			this.editpercentBlue.TabIndex = 46;
			this.editpercentBlue.Text = "";
			// 
			// editpercentAlpha
			// 
			this.editpercentAlpha.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.percentAlpha"));
			this.editpercentAlpha.Location = new System.Drawing.Point(340, 274);
			this.editpercentAlpha.Name = "editpercentAlpha";
			this.editpercentAlpha.TabIndex = 47;
			this.editpercentAlpha.Text = "";
			// 
			// editBlastPower
			// 
			this.editBlastPower.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.BlastPower"));
			this.editBlastPower.Location = new System.Drawing.Point(340, 307);
			this.editBlastPower.Name = "editBlastPower";
			this.editBlastPower.TabIndex = 48;
			this.editBlastPower.Text = "";
			// 
			// editBlastRadius
			// 
			this.editBlastRadius.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.BlastRadius"));
			this.editBlastRadius.Location = new System.Drawing.Point(340, 340);
			this.editBlastRadius.Name = "editBlastRadius";
			this.editBlastRadius.TabIndex = 49;
			this.editBlastRadius.Text = "";
			// 
			// editWidthOverHeight
			// 
			this.editWidthOverHeight.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.WidthOverHeight"));
			this.editWidthOverHeight.Location = new System.Drawing.Point(340, 373);
			this.editWidthOverHeight.Name = "editWidthOverHeight";
			this.editWidthOverHeight.TabIndex = 50;
			this.editWidthOverHeight.Text = "";
			// 
			// editPRIcon
			// 
			this.editPRIcon.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.PRIcon"));
			this.editPRIcon.Location = new System.Drawing.Point(340, 406);
			this.editPRIcon.Name = "editPRIcon";
			this.editPRIcon.TabIndex = 51;
			this.editPRIcon.Text = "";
			// 
			// editAmbientSound
			// 
			this.editAmbientSound.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Projectiles.AmbientSound"));
			this.editAmbientSound.Location = new System.Drawing.Point(340, 439);
			this.editAmbientSound.Name = "editAmbientSound";
			this.editAmbientSound.TabIndex = 52;
			this.editAmbientSound.Text = "";
			// 
			// btnNavFirst
			// 
			this.btnNavFirst.Location = new System.Drawing.Point(195, 505);
			this.btnNavFirst.Name = "btnNavFirst";
			this.btnNavFirst.Size = new System.Drawing.Size(40, 23);
			this.btnNavFirst.TabIndex = 53;
			this.btnNavFirst.Text = "<<";
			this.btnNavFirst.Click += new System.EventHandler(this.btnNavFirst_Click);
			// 
			// btnNavPrev
			// 
			this.btnNavPrev.Location = new System.Drawing.Point(235, 505);
			this.btnNavPrev.Name = "btnNavPrev";
			this.btnNavPrev.Size = new System.Drawing.Size(35, 23);
			this.btnNavPrev.TabIndex = 54;
			this.btnNavPrev.Text = "<";
			this.btnNavPrev.Click += new System.EventHandler(this.btnNavPrev_Click);
			// 
			// lblNavLocation
			// 
			this.lblNavLocation.BackColor = System.Drawing.Color.White;
			this.lblNavLocation.Location = new System.Drawing.Point(270, 505);
			this.lblNavLocation.Name = "lblNavLocation";
			this.lblNavLocation.Size = new System.Drawing.Size(95, 23);
			this.lblNavLocation.TabIndex = 55;
			this.lblNavLocation.Text = "No Records";
			this.lblNavLocation.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// btnNavNext
			// 
			this.btnNavNext.Location = new System.Drawing.Point(365, 505);
			this.btnNavNext.Name = "btnNavNext";
			this.btnNavNext.Size = new System.Drawing.Size(35, 23);
			this.btnNavNext.TabIndex = 56;
			this.btnNavNext.Text = ">";
			this.btnNavNext.Click += new System.EventHandler(this.btnNavNext_Click);
			// 
			// btnLast
			// 
			this.btnLast.Location = new System.Drawing.Point(400, 505);
			this.btnLast.Name = "btnLast";
			this.btnLast.Size = new System.Drawing.Size(40, 23);
			this.btnLast.TabIndex = 57;
			this.btnLast.Text = ">>";
			this.btnLast.Click += new System.EventHandler(this.btnLast_Click);
			// 
			// btnAdd
			// 
			this.btnAdd.Location = new System.Drawing.Point(195, 538);
			this.btnAdd.Name = "btnAdd";
			this.btnAdd.TabIndex = 58;
			this.btnAdd.Text = "&Add";
			this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
			// 
			// btnDelete
			// 
			this.btnDelete.Location = new System.Drawing.Point(280, 538);
			this.btnDelete.Name = "btnDelete";
			this.btnDelete.TabIndex = 59;
			this.btnDelete.Text = "&Delete";
			this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
			// 
			// btnCancel
			// 
			this.btnCancel.Location = new System.Drawing.Point(365, 538);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.TabIndex = 60;
			this.btnCancel.Text = "&Cancel";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
			// 
			// Projectiles
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(442, 586);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.btnLoad,
																		  this.btnUpdate,
																		  this.btnCancelAll,
																		  this.lblProjectileID,
																		  this.lblTimeDuration,
																		  this.lblHitPointsInflict,
																		  this.lblDamageType,
																		  this.lblFileModel,
																		  this.lblFileTexture,
																		  this.lblSpeedMax,
																		  this.lblAcceleration,
																		  this.lblSize_cm,
																		  this.lblRadiusBlast_m,
																		  this.lblpercentPenetration,
																		  this.lblRateRotation,
																		  this.lblIsAbsoluteSpeed,
																		  this.editProjectileID,
																		  this.editTimeDuration,
																		  this.editHitPointsInflict,
																		  this.editDamageType,
																		  this.editFileModel,
																		  this.editFileTexture,
																		  this.editSpeedMax,
																		  this.editAcceleration,
																		  this.editSize_cm,
																		  this.editRadiusBlast_m,
																		  this.editpercentPenetration,
																		  this.editRateRotation,
																		  this.editIsAbsoluteSpeed,
																		  this.lblIsDirectional,
																		  this.lblIsExplodeOnExpire,
																		  this.lblIsProximityFuse,
																		  this.lblpercentRed,
																		  this.lblpercentGreen,
																		  this.lblpercentBlue,
																		  this.lblpercentAlpha,
																		  this.lblBlastPower,
																		  this.lblBlastRadius,
																		  this.lblWidthOverHeight,
																		  this.lblPRIcon,
																		  this.lblAmbientSound,
																		  this.editIsDirectional,
																		  this.editIsExplodeOnExpire,
																		  this.editIsProximityFuse,
																		  this.editpercentRed,
																		  this.editpercentGreen,
																		  this.editpercentBlue,
																		  this.editpercentAlpha,
																		  this.editBlastPower,
																		  this.editBlastRadius,
																		  this.editWidthOverHeight,
																		  this.editPRIcon,
																		  this.editAmbientSound,
																		  this.btnNavFirst,
																		  this.btnNavPrev,
																		  this.lblNavLocation,
																		  this.btnNavNext,
																		  this.btnLast,
																		  this.btnAdd,
																		  this.btnDelete,
																		  this.btnCancel});
			this.Name = "Projectiles";
			this.Text = "Projectiles";
			((System.ComponentModel.ISupportInitialize)(this.objfeddts)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		private void btnCancelAll_Click(object sender, System.EventArgs e)
		{
			this.objfeddts.RejectChanges();

		}

		private void objfeddts_PositionChanged()
		{
			this.lblNavLocation.Text = ((((this.BindingContext[objfeddts,"Projectiles"].Position + 1)).ToString() + " of  ") 
				+ this.BindingContext[objfeddts,"Projectiles"].Count.ToString());

		}

		private void btnNavNext_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Projectiles"].Position = (this.BindingContext[objfeddts,"Projectiles"].Position + 1);
			this.objfeddts_PositionChanged();

		}

		private void btnNavPrev_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Projectiles"].Position = (this.BindingContext[objfeddts,"Projectiles"].Position - 1);
			this.objfeddts_PositionChanged();

		}

		private void btnLast_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Projectiles"].Position = (this.objfeddts.Tables["Projectiles"].Rows.Count - 1);
			this.objfeddts_PositionChanged();

		}

		private void btnNavFirst_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Projectiles"].Position = 0;
			this.objfeddts_PositionChanged();

		}

		private void btnAdd_Click(object sender, System.EventArgs e)
		{
			try 
			{
				// Clear out the current edits
				this.BindingContext[objfeddts,"Projectiles"].EndCurrentEdit();
				this.BindingContext[objfeddts,"Projectiles"].AddNew();
			}
			catch (System.Exception eEndEdit) 
			{
				System.Windows.Forms.MessageBox.Show(eEndEdit.Message);
			}
			this.objfeddts_PositionChanged();

		}

		private void btnDelete_Click(object sender, System.EventArgs e)
		{
			if ((this.BindingContext[objfeddts,"Projectiles"].Count > 0)) 
			{
				this.BindingContext[objfeddts,"Projectiles"].RemoveAt(this.BindingContext[objfeddts,"Projectiles"].Position);
				this.objfeddts_PositionChanged();
			}

		}

		private void btnCancel_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Projectiles"].CancelCurrentEdit();
			this.objfeddts_PositionChanged();

		}
	}
}
