Imports System.Runtime.InteropServices
Imports AGCLib
Imports ALLEGIANCESERVERLib

Public Class Form1
    Inherits System.Windows.Forms.Form
    ' to receive server events, implement the IAdminSessionEvents interface
    Implements IAdminSessionEvents

    Private ias As IAdminSession
    Private evCookie As Int32
    Private icp As UCOMIConnectionPoint
    ' adjust the path or no path if in same directory (recommended)
    Declare Auto Function GetAdminSession Lib "S:\alleg\src\AGMLib\Release\AGMLib.dll" (ByRef ias As IAdminSession) As Integer

    ' implementation of OnEvent to receive server events
    Public Overridable Sub OnEvent(ByVal pEvent As AGCLib.IAGCEvent) Implements IAdminSessionEvents.OnEvent
        tbMessages.Text = tbMessages.Text + "event received: id= " + pEvent.ID.ToString() + " desc = " + pEvent.Description + vbCrLf
    End Sub
#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

        ' get the AdminSession interface thru the AGMLib.dll
        Dim hr As Integer
        hr = GetAdminSession(ias)
        ' error if hr <> 0 
        ' error handling here

        ' assume hr was 0

        Dim icpc As UCOMIConnectionPointContainer = ias
        Dim riid As Guid = New Guid("DE3ED156-76A0-4A8E-8CFE-9ED26C3B0A5E")
        icpc.FindConnectionPoint(riid, icp)
        evCookie = 0
        icp.Advise(Me, evCookie)
        ias.ActivateAllEvents()

    End Sub


    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If (evCookie <> 0) Then
                ias.DeactivateAllEvents()
                icp.Unadvise(evCookie)
            End If
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents tbMessages As System.Windows.Forms.TextBox
    Friend WithEvents btGames As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.tbMessages = New System.Windows.Forms.TextBox
        Me.btGames = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'tbMessages
        '
        Me.tbMessages.Location = New System.Drawing.Point(16, 16)
        Me.tbMessages.Multiline = True
        Me.tbMessages.Name = "tbMessages"
        Me.tbMessages.Size = New System.Drawing.Size(752, 448)
        Me.tbMessages.TabIndex = 0
        Me.tbMessages.Text = ""
        '
        'btGames
        '
        Me.btGames.Location = New System.Drawing.Point(16, 472)
        Me.btGames.Name = "btGames"
        Me.btGames.TabIndex = 1
        Me.btGames.Text = "Games list"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(792, 525)
        Me.Controls.Add(Me.btGames)
        Me.Controls.Add(Me.tbMessages)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub btGames_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btGames.Click
        ' sample to retrieve active game(s)
        ' iserver = server interface
        Dim iserver As IAdminServer = ias.Server
        ' igames = games interface (a collection)
        Dim igames As IAdminGames = iserver.Games
        tbMessages.Text = tbMessages.Text + "number of games = " + igames.Count.ToString() + vbCrLf
        ' loop thru game(s) 
        For i As Integer = 1 To igames.Count
            Dim oi As Object = i - 1
            Dim igame As IAdminGame = igames(oi) ' index must be an object not a plain integer, base is from 0 (hence the oi = i-1)
            tbMessages.Text = tbMessages.Text + "  game %" + i.ToString() + " = " + igame.Name + vbCrLf
        Next i
    End Sub
End Class
