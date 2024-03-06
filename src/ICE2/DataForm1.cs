using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace ICE
{
	/// <summary>
	/// Summary description for DataForm1.
	/// </summary>
	public class DataForm1 : System.Windows.Forms.Form
	{
		private ICE.feddts objfeddts;
		private System.Windows.Forms.Button btnLoad;
		private System.Windows.Forms.Button btnUpdate;
		private System.Windows.Forms.Button btnCancelAll;
		private System.Windows.Forms.Label lblPrice;
		private System.Windows.Forms.Label lblLoadoutBitmap;
		private System.Windows.Forms.Label lblName;
		private System.Windows.Forms.Label lblDescription;
		private System.Windows.Forms.Label lblTechBitsRequired;
		private System.Windows.Forms.Label lblTechBitsEffect;
		private System.Windows.Forms.Label lblDevelopmentID;
		private System.Windows.Forms.TextBox editPrice;
		private System.Windows.Forms.TextBox editLoadoutBitmap;
		private System.Windows.Forms.TextBox editName;
		private System.Windows.Forms.TextBox editDescription;
		private System.Windows.Forms.TextBox editTechBitsRequired;
		private System.Windows.Forms.TextBox editTechBitsEffect;
		private System.Windows.Forms.TextBox editDevelopmentID;
		private System.Windows.Forms.Label lblSecondsToBuild;
		private System.Windows.Forms.Label lblGlobalAttributeID;
		private System.Windows.Forms.Label lblPRIcon;
		private System.Windows.Forms.Label lblGroupID;
		private System.Windows.Forms.Label lblSortOrder;
		private System.Windows.Forms.Label lblCompletedSound;
		private System.Windows.Forms.TextBox editSecondsToBuild;
		private System.Windows.Forms.TextBox editGlobalAttributeID;
		private System.Windows.Forms.TextBox editPRIcon;
		private System.Windows.Forms.TextBox editGroupID;
		private System.Windows.Forms.TextBox editSortOrder;
		private System.Windows.Forms.TextBox editCompletedSound;
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

		public DataForm1()
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
			this.lblPrice = new System.Windows.Forms.Label();
			this.lblLoadoutBitmap = new System.Windows.Forms.Label();
			this.lblName = new System.Windows.Forms.Label();
			this.lblDescription = new System.Windows.Forms.Label();
			this.lblTechBitsRequired = new System.Windows.Forms.Label();
			this.lblTechBitsEffect = new System.Windows.Forms.Label();
			this.lblDevelopmentID = new System.Windows.Forms.Label();
			this.editPrice = new System.Windows.Forms.TextBox();
			this.editLoadoutBitmap = new System.Windows.Forms.TextBox();
			this.editName = new System.Windows.Forms.TextBox();
			this.editDescription = new System.Windows.Forms.TextBox();
			this.editTechBitsRequired = new System.Windows.Forms.TextBox();
			this.editTechBitsEffect = new System.Windows.Forms.TextBox();
			this.editDevelopmentID = new System.Windows.Forms.TextBox();
			this.lblSecondsToBuild = new System.Windows.Forms.Label();
			this.lblGlobalAttributeID = new System.Windows.Forms.Label();
			this.lblPRIcon = new System.Windows.Forms.Label();
			this.lblGroupID = new System.Windows.Forms.Label();
			this.lblSortOrder = new System.Windows.Forms.Label();
			this.lblCompletedSound = new System.Windows.Forms.Label();
			this.editSecondsToBuild = new System.Windows.Forms.TextBox();
			this.editGlobalAttributeID = new System.Windows.Forms.TextBox();
			this.editPRIcon = new System.Windows.Forms.TextBox();
			this.editGroupID = new System.Windows.Forms.TextBox();
			this.editSortOrder = new System.Windows.Forms.TextBox();
			this.editCompletedSound = new System.Windows.Forms.TextBox();
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
			// 
			// btnLoad
			// 
			this.btnLoad.Location = new System.Drawing.Point(10, 10);
			this.btnLoad.Name = "btnLoad";
			this.btnLoad.TabIndex = 0;
			this.btnLoad.Text = "&Load";
			this.btnLoad.Click += new System.EventHandler(this.btnLoad_Click);
			// 
			// btnUpdate
			// 
			this.btnUpdate.Location = new System.Drawing.Point(365, 10);
			this.btnUpdate.Name = "btnUpdate";
			this.btnUpdate.TabIndex = 1;
			this.btnUpdate.Text = "&Update";
			this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
			// 
			// btnCancelAll
			// 
			this.btnCancelAll.Location = new System.Drawing.Point(365, 43);
			this.btnCancelAll.Name = "btnCancelAll";
			this.btnCancelAll.TabIndex = 2;
			this.btnCancelAll.Text = "Ca&ncel All";
			this.btnCancelAll.Click += new System.EventHandler(this.btnCancelAll_Click);
			// 
			// lblPrice
			// 
			this.lblPrice.Location = new System.Drawing.Point(10, 76);
			this.lblPrice.Name = "lblPrice";
			this.lblPrice.TabIndex = 3;
			this.lblPrice.Text = "Price";
			// 
			// lblLoadoutBitmap
			// 
			this.lblLoadoutBitmap.Location = new System.Drawing.Point(10, 109);
			this.lblLoadoutBitmap.Name = "lblLoadoutBitmap";
			this.lblLoadoutBitmap.TabIndex = 4;
			this.lblLoadoutBitmap.Text = "LoadoutBitmap";
			// 
			// lblName
			// 
			this.lblName.Location = new System.Drawing.Point(10, 142);
			this.lblName.Name = "lblName";
			this.lblName.TabIndex = 5;
			this.lblName.Text = "Name";
			// 
			// lblDescription
			// 
			this.lblDescription.Location = new System.Drawing.Point(10, 175);
			this.lblDescription.Name = "lblDescription";
			this.lblDescription.TabIndex = 6;
			this.lblDescription.Text = "Description";
			// 
			// lblTechBitsRequired
			// 
			this.lblTechBitsRequired.Location = new System.Drawing.Point(10, 208);
			this.lblTechBitsRequired.Name = "lblTechBitsRequired";
			this.lblTechBitsRequired.TabIndex = 7;
			this.lblTechBitsRequired.Text = "TechBitsRequired";
			// 
			// lblTechBitsEffect
			// 
			this.lblTechBitsEffect.Location = new System.Drawing.Point(10, 241);
			this.lblTechBitsEffect.Name = "lblTechBitsEffect";
			this.lblTechBitsEffect.TabIndex = 8;
			this.lblTechBitsEffect.Text = "TechBitsEffect";
			// 
			// lblDevelopmentID
			// 
			this.lblDevelopmentID.Location = new System.Drawing.Point(10, 274);
			this.lblDevelopmentID.Name = "lblDevelopmentID";
			this.lblDevelopmentID.TabIndex = 9;
			this.lblDevelopmentID.Text = "DevelopmentID";
			// 
			// editPrice
			// 
			this.editPrice.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.Price"));
			this.editPrice.Location = new System.Drawing.Point(120, 76);
			this.editPrice.Name = "editPrice";
			this.editPrice.TabIndex = 10;
			this.editPrice.Text = "";
			// 
			// editLoadoutBitmap
			// 
			this.editLoadoutBitmap.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.LoadoutBitmap"));
			this.editLoadoutBitmap.Location = new System.Drawing.Point(120, 109);
			this.editLoadoutBitmap.Name = "editLoadoutBitmap";
			this.editLoadoutBitmap.TabIndex = 11;
			this.editLoadoutBitmap.Text = "";
			// 
			// editName
			// 
			this.editName.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.Name"));
			this.editName.Location = new System.Drawing.Point(120, 142);
			this.editName.Name = "editName";
			this.editName.TabIndex = 12;
			this.editName.Text = "";
			// 
			// editDescription
			// 
			this.editDescription.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.Description"));
			this.editDescription.Location = new System.Drawing.Point(120, 175);
			this.editDescription.Name = "editDescription";
			this.editDescription.TabIndex = 13;
			this.editDescription.Text = "";
			// 
			// editTechBitsRequired
			// 
			this.editTechBitsRequired.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.TechBitsRequired"));
			this.editTechBitsRequired.Location = new System.Drawing.Point(120, 208);
			this.editTechBitsRequired.Name = "editTechBitsRequired";
			this.editTechBitsRequired.TabIndex = 14;
			this.editTechBitsRequired.Text = "";
			// 
			// editTechBitsEffect
			// 
			this.editTechBitsEffect.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.TechBitsEffect"));
			this.editTechBitsEffect.Location = new System.Drawing.Point(120, 241);
			this.editTechBitsEffect.Name = "editTechBitsEffect";
			this.editTechBitsEffect.TabIndex = 15;
			this.editTechBitsEffect.Text = "";
			// 
			// editDevelopmentID
			// 
			this.editDevelopmentID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.DevelopmentID"));
			this.editDevelopmentID.Location = new System.Drawing.Point(120, 274);
			this.editDevelopmentID.Name = "editDevelopmentID";
			this.editDevelopmentID.TabIndex = 16;
			this.editDevelopmentID.Text = "";
			// 
			// lblSecondsToBuild
			// 
			this.lblSecondsToBuild.Location = new System.Drawing.Point(230, 76);
			this.lblSecondsToBuild.Name = "lblSecondsToBuild";
			this.lblSecondsToBuild.TabIndex = 17;
			this.lblSecondsToBuild.Text = "SecondsToBuild";
			// 
			// lblGlobalAttributeID
			// 
			this.lblGlobalAttributeID.Location = new System.Drawing.Point(230, 109);
			this.lblGlobalAttributeID.Name = "lblGlobalAttributeID";
			this.lblGlobalAttributeID.TabIndex = 18;
			this.lblGlobalAttributeID.Text = "GlobalAttributeID";
			// 
			// lblPRIcon
			// 
			this.lblPRIcon.Location = new System.Drawing.Point(230, 142);
			this.lblPRIcon.Name = "lblPRIcon";
			this.lblPRIcon.TabIndex = 19;
			this.lblPRIcon.Text = "PRIcon";
			// 
			// lblGroupID
			// 
			this.lblGroupID.Location = new System.Drawing.Point(230, 175);
			this.lblGroupID.Name = "lblGroupID";
			this.lblGroupID.TabIndex = 20;
			this.lblGroupID.Text = "GroupID";
			// 
			// lblSortOrder
			// 
			this.lblSortOrder.Location = new System.Drawing.Point(230, 208);
			this.lblSortOrder.Name = "lblSortOrder";
			this.lblSortOrder.TabIndex = 21;
			this.lblSortOrder.Text = "SortOrder";
			// 
			// lblCompletedSound
			// 
			this.lblCompletedSound.Location = new System.Drawing.Point(230, 241);
			this.lblCompletedSound.Name = "lblCompletedSound";
			this.lblCompletedSound.TabIndex = 22;
			this.lblCompletedSound.Text = "CompletedSound";
			// 
			// editSecondsToBuild
			// 
			this.editSecondsToBuild.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.SecondsToBuild"));
			this.editSecondsToBuild.Location = new System.Drawing.Point(340, 76);
			this.editSecondsToBuild.Name = "editSecondsToBuild";
			this.editSecondsToBuild.TabIndex = 23;
			this.editSecondsToBuild.Text = "";
			// 
			// editGlobalAttributeID
			// 
			this.editGlobalAttributeID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.GlobalAttributeID"));
			this.editGlobalAttributeID.Location = new System.Drawing.Point(340, 109);
			this.editGlobalAttributeID.Name = "editGlobalAttributeID";
			this.editGlobalAttributeID.TabIndex = 24;
			this.editGlobalAttributeID.Text = "";
			// 
			// editPRIcon
			// 
			this.editPRIcon.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.PRIcon"));
			this.editPRIcon.Location = new System.Drawing.Point(340, 142);
			this.editPRIcon.Name = "editPRIcon";
			this.editPRIcon.TabIndex = 25;
			this.editPRIcon.Text = "";
			// 
			// editGroupID
			// 
			this.editGroupID.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.GroupID"));
			this.editGroupID.Location = new System.Drawing.Point(340, 175);
			this.editGroupID.Name = "editGroupID";
			this.editGroupID.TabIndex = 26;
			this.editGroupID.Text = "";
			// 
			// editSortOrder
			// 
			this.editSortOrder.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.SortOrder"));
			this.editSortOrder.Location = new System.Drawing.Point(340, 208);
			this.editSortOrder.Name = "editSortOrder";
			this.editSortOrder.TabIndex = 27;
			this.editSortOrder.Text = "";
			// 
			// editCompletedSound
			// 
			this.editCompletedSound.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.objfeddts, "Developments.CompletedSound"));
			this.editCompletedSound.Location = new System.Drawing.Point(340, 241);
			this.editCompletedSound.Name = "editCompletedSound";
			this.editCompletedSound.TabIndex = 28;
			this.editCompletedSound.Text = "";
			// 
			// btnNavFirst
			// 
			this.btnNavFirst.Location = new System.Drawing.Point(195, 307);
			this.btnNavFirst.Name = "btnNavFirst";
			this.btnNavFirst.Size = new System.Drawing.Size(40, 23);
			this.btnNavFirst.TabIndex = 29;
			this.btnNavFirst.Text = "<<";
			this.btnNavFirst.Click += new System.EventHandler(this.btnNavFirst_Click);
			// 
			// btnNavPrev
			// 
			this.btnNavPrev.Location = new System.Drawing.Point(235, 307);
			this.btnNavPrev.Name = "btnNavPrev";
			this.btnNavPrev.Size = new System.Drawing.Size(35, 23);
			this.btnNavPrev.TabIndex = 30;
			this.btnNavPrev.Text = "<";
			this.btnNavPrev.Click += new System.EventHandler(this.btnNavPrev_Click);
			// 
			// lblNavLocation
			// 
			this.lblNavLocation.BackColor = System.Drawing.Color.White;
			this.lblNavLocation.Location = new System.Drawing.Point(270, 307);
			this.lblNavLocation.Name = "lblNavLocation";
			this.lblNavLocation.Size = new System.Drawing.Size(95, 23);
			this.lblNavLocation.TabIndex = 31;
			this.lblNavLocation.Text = "No Records";
			this.lblNavLocation.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// btnNavNext
			// 
			this.btnNavNext.Location = new System.Drawing.Point(365, 307);
			this.btnNavNext.Name = "btnNavNext";
			this.btnNavNext.Size = new System.Drawing.Size(35, 23);
			this.btnNavNext.TabIndex = 32;
			this.btnNavNext.Text = ">";
			this.btnNavNext.Click += new System.EventHandler(this.btnNavNext_Click);
			// 
			// btnLast
			// 
			this.btnLast.Location = new System.Drawing.Point(400, 307);
			this.btnLast.Name = "btnLast";
			this.btnLast.Size = new System.Drawing.Size(40, 23);
			this.btnLast.TabIndex = 33;
			this.btnLast.Text = ">>";
			this.btnLast.Click += new System.EventHandler(this.btnLast_Click);
			// 
			// btnAdd
			// 
			this.btnAdd.Location = new System.Drawing.Point(195, 340);
			this.btnAdd.Name = "btnAdd";
			this.btnAdd.TabIndex = 34;
			this.btnAdd.Text = "&Add";
			this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
			// 
			// btnDelete
			// 
			this.btnDelete.Location = new System.Drawing.Point(280, 340);
			this.btnDelete.Name = "btnDelete";
			this.btnDelete.TabIndex = 35;
			this.btnDelete.Text = "&Delete";
			this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
			// 
			// btnCancel
			// 
			this.btnCancel.Location = new System.Drawing.Point(365, 340);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.TabIndex = 36;
			this.btnCancel.Text = "&Cancel";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
			// 
			// DataForm1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(448, 373);
			this.Controls.Add(this.btnLoad);
			this.Controls.Add(this.btnUpdate);
			this.Controls.Add(this.btnCancelAll);
			this.Controls.Add(this.lblPrice);
			this.Controls.Add(this.lblLoadoutBitmap);
			this.Controls.Add(this.lblName);
			this.Controls.Add(this.lblDescription);
			this.Controls.Add(this.lblTechBitsRequired);
			this.Controls.Add(this.lblTechBitsEffect);
			this.Controls.Add(this.lblDevelopmentID);
			this.Controls.Add(this.editPrice);
			this.Controls.Add(this.editLoadoutBitmap);
			this.Controls.Add(this.editName);
			this.Controls.Add(this.editDescription);
			this.Controls.Add(this.editTechBitsRequired);
			this.Controls.Add(this.editTechBitsEffect);
			this.Controls.Add(this.editDevelopmentID);
			this.Controls.Add(this.lblSecondsToBuild);
			this.Controls.Add(this.lblGlobalAttributeID);
			this.Controls.Add(this.lblPRIcon);
			this.Controls.Add(this.lblGroupID);
			this.Controls.Add(this.lblSortOrder);
			this.Controls.Add(this.lblCompletedSound);
			this.Controls.Add(this.editSecondsToBuild);
			this.Controls.Add(this.editGlobalAttributeID);
			this.Controls.Add(this.editPRIcon);
			this.Controls.Add(this.editGroupID);
			this.Controls.Add(this.editSortOrder);
			this.Controls.Add(this.editCompletedSound);
			this.Controls.Add(this.btnNavFirst);
			this.Controls.Add(this.btnNavPrev);
			this.Controls.Add(this.lblNavLocation);
			this.Controls.Add(this.btnNavNext);
			this.Controls.Add(this.btnLast);
			this.Controls.Add(this.btnAdd);
			this.Controls.Add(this.btnDelete);
			this.Controls.Add(this.btnCancel);
			this.Name = "DataForm1";
			this.Text = "DataForm1";
			((System.ComponentModel.ISupportInitialize)(this.objfeddts)).EndInit();
			this.ResumeLayout(false);

		}
		#endregion

		public void LoadDataSet()
		{
			ICE.core objService;
			objService = new ICE.core();
			// Create a new dataset to hold the records returned from the call to FillDataSet.
			// A temporary dataset is used because filling the existing dataset would
			// require the databindings to be rebound.
			ICE.feddts objDataSetTemp;
			objDataSetTemp = new ICE.feddts();
			try 
			{
				// Attempt to fill the temporary dataset.
				objDataSetTemp = ((ICE.feddts)(objService.Clone()));
			}
			catch (System.Exception eFillDataSet) 
			{
				// Add your error handling code here.
				throw eFillDataSet;
			}
			try 
			{
				// Empty the old records from the dataset.
				objfeddts.Clear();
				// Merge the records into the main dataset.
				objfeddts.Merge(objDataSetTemp);
			}
			catch (System.Exception eLoadMerge) 
			{
				// Add your error handling code here.
				throw eLoadMerge;
			}

		}

		public void UpdateDataSet()
		{
			ICE.core objService;
			objService = new ICE.core();
			// Create a new dataset to hold the changes that have been made to the main dataset.
			ICE.feddts objDataSetChanges = new ICE.feddts();
			System.Data.DataSet objDataSetUpdated = new ICE.feddts();
			// Stop any current edits.
			this.BindingContext[objfeddts,"Developments"].EndCurrentEdit();
			// Get the changes that have been made to the main dataset.
			objDataSetChanges = ((ICE.feddts)(objfeddts.GetChanges()));
			// Check to see if any changes have been made.
			if ((objDataSetChanges != null)) 
			{
				try 
				{
					// There are changes that need to be made, so attempt to update the datasource by
					// calling the update method and passing the dataset and any parameters.
					objDataSetUpdated = objService.Clone();
				}
				catch (System.Exception eUpdate) 
				{
					// Add your error handling code here.
					throw eUpdate;
				}
				// Add your code to check the returned dataset for any errors that may have been
				// pushed into the row object's error.
				try 
				{
					objfeddts.Merge(objDataSetUpdated);
				}
				catch (System.Exception eUpdateMerge) 
				{
					// Add exception handling code here
					throw eUpdateMerge;
				}
				// Commit the changes that were just merged
				// This moves any rows marked as updated, inserted or changed to being marked as original values
				objfeddts.AcceptChanges();
			}

		}

		private void btnCancelAll_Click(object sender, System.EventArgs e)
		{
			this.objfeddts.RejectChanges();

		}

		private void objfeddts_PositionChanged()
		{
			this.lblNavLocation.Text = ((((this.BindingContext[objfeddts,"Developments"].Position + 1)).ToString() + " of  ") 
				+ this.BindingContext[objfeddts,"Developments"].Count.ToString());

		}

		private void btnNavNext_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Developments"].Position = (this.BindingContext[objfeddts,"Developments"].Position + 1);
			this.objfeddts_PositionChanged();

		}

		private void btnNavPrev_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Developments"].Position = (this.BindingContext[objfeddts,"Developments"].Position - 1);
			this.objfeddts_PositionChanged();

		}

		private void btnLast_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Developments"].Position = (this.objfeddts.Tables["Developments"].Rows.Count - 1);
			this.objfeddts_PositionChanged();

		}

		private void btnNavFirst_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Developments"].Position = 0;
			this.objfeddts_PositionChanged();

		}

		private void btnLoad_Click(object sender, System.EventArgs e)
		{
			try 
			{
				// Attempt to load the dataset.
				this.LoadDataSet();
			}
			catch (System.Exception eLoad) 
			{
				// Add your error handling code here.
				// Display error message, if any.
				System.Windows.Forms.MessageBox.Show(eLoad.Message);
			}
			this.objfeddts_PositionChanged();

		}

		private void btnUpdate_Click(object sender, System.EventArgs e)
		{
			try 
			{
				// Attempt to update the datasource.
				this.UpdateDataSet();
			}
			catch (System.Exception eUpdate) 
			{
				// Add your error handling code here.
				// Display error message, if any.
				System.Windows.Forms.MessageBox.Show(eUpdate.Message);
			}
			this.objfeddts_PositionChanged();

		}

		private void btnAdd_Click(object sender, System.EventArgs e)
		{
			try 
			{
				// Clear out the current edits
				this.BindingContext[objfeddts,"Developments"].EndCurrentEdit();
				this.BindingContext[objfeddts,"Developments"].AddNew();
			}
			catch (System.Exception eEndEdit) 
			{
				System.Windows.Forms.MessageBox.Show(eEndEdit.Message);
			}
			this.objfeddts_PositionChanged();

		}

		private void btnDelete_Click(object sender, System.EventArgs e)
		{
			if ((this.BindingContext[objfeddts,"Developments"].Count > 0)) 
			{
				this.BindingContext[objfeddts,"Developments"].RemoveAt(this.BindingContext[objfeddts,"Developments"].Position);
				this.objfeddts_PositionChanged();
			}

		}

		private void btnCancel_Click(object sender, System.EventArgs e)
		{
			this.BindingContext[objfeddts,"Developments"].CancelCurrentEdit();
			this.objfeddts_PositionChanged();

		}
	}
}
