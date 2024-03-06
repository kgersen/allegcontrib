using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace ICE3
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button btLoad;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
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
				if (components != null) 
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
			this.btLoad = new System.Windows.Forms.Button();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.SuspendLayout();
			// 
			// btLoad
			// 
			this.btLoad.Location = new System.Drawing.Point(64, 64);
			this.btLoad.Name = "btLoad";
			this.btLoad.TabIndex = 0;
			this.btLoad.Text = "Load";
			this.btLoad.Click += new System.EventHandler(this.btLoad_Click);
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.Filter = "Allegiance Core|*.igc";
			this.openFileDialog1.Title = "Load a core file";
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(704, 565);
			this.Controls.Add(this.btLoad);
			this.Name = "Form1";
			this.Text = "Form1";
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void btLoad_Click(object sender, System.EventArgs e)
		{
			ICE.IGCCore core = new ICE.IGCCore();
			if (openFileDialog1.ShowDialog() == DialogResult.OK)
			{
				core.Read(openFileDialog1.FileName);
			}
		}
	}
}
