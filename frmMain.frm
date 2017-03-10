VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "midfp"
   ClientHeight    =   4170
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7455
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4170
   ScaleWidth      =   7455
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Results"
      Height          =   2895
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   7215
      Begin VB.TextBox txtResults 
         Appearance      =   0  'Flat
         BackColor       =   &H80000000&
         BorderStyle     =   0  'None
         Height          =   2415
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   2
         Text            =   "frmMain.frx":0CCA
         Top             =   360
         Width           =   6975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Message-ID"
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   240
      Width           =   7215
      Begin VB.TextBox txtMessageId 
         Height          =   285
         Left            =   120
         MaxLength       =   512
         TabIndex        =   0
         Top             =   360
         Width           =   4575
      End
      Begin VB.CommandButton cmdAnalyze 
         Caption         =   "&Analyze"
         Default         =   -1  'True
         Height          =   375
         Left            =   6000
         TabIndex        =   1
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNewItem 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExitItem 
         Caption         =   "E&xit"
         Shortcut        =   ^Q
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpAboutItem 
         Caption         =   "&About"
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAnalyze_Click()
    txtResults = midfp(txtMessageId.Text)
End Sub

Private Function midfp(ByRef sMid As String, Optional ByRef sDatabase As String)
    Dim sFingerprintDb() As String
    Dim iFingerprintDbCount As Integer
    Dim i As Integer
    Dim sResults As String

    Dim myRegExp As RegExp
    Dim myMatches As MatchCollection
    Dim myMatch As Match
    Dim sFingerprintDbEntry() As String

    If (LenB(sDatabase) = 0) Then
        sDatabase = "fingerprints.db"
    End If
    
    sFingerprintDb = Split(ReadFile(App.Path & "/" & sDatabase), vbLf, , vbBinaryCompare)
    iFingerprintDbCount = UBound(sFingerprintDb)
    
    Set myRegExp = New RegExp
    myRegExp.IgnoreCase = False
    myRegExp.Global = True
    
    For i = 0 To iFingerprintDbCount
        If (InStrB(1, sFingerprintDb(i), ";", vbBinaryCompare)) Then
            sFingerprintDbEntry = Split(sFingerprintDb(i), ";", , vbBinaryCompare)
            myRegExp.Pattern = Mid(sFingerprintDbEntry(1), 2, Len(sFingerprintDbEntry(1)) - 2)
             
            If (myRegExp.Test(sMid) = True) Then
                sResults = sResults & "* " & sFingerprintDbEntry(0) & vbCrLf
            End If
        End If
    Next i
    
    If (LenB(sResults) = 0) Then
        sResults = "Unknown implementation."
    End If
    
    midfp = sResults
End Function

Private Sub Form_Load()
    Me.Caption = APP_NAME
End Sub

Private Sub mnuFileExitItem_Click()
    Unload Me
End Sub

Private Sub mnuFileNewItem_Click()
    Me.txtMessageId.Text = vbNullString
    Me.txtResults.Text = vbNullString
End Sub

Private Sub mnuHelpAboutItem_Click()
    frmAbout.Show vbModal, frmMain
End Sub
