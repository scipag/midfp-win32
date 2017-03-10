VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "About midfp"
   ClientHeight    =   2190
   ClientLeft      =   30
   ClientTop       =   285
   ClientWidth     =   4950
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   4950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOkay 
      Cancel          =   -1  'True
      Caption         =   "&Okay"
      Height          =   372
      Left            =   1920
      TabIndex        =   1
      Top             =   1680
      Width           =   1092
   End
   Begin VB.Frame Frame1 
      Height          =   1332
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4695
      Begin VB.Label lblProjectWebsite 
         AutoSize        =   -1  'True
         Caption         =   "http://www.computec.ch"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   1080
         MouseIcon       =   "frmAbout.frx":0CCA
         MousePointer    =   99  'Custom
         TabIndex        =   4
         ToolTipText     =   "Visit web site"
         Top             =   840
         Width           =   3495
      End
      Begin VB.Label lblDeveloperName 
         Caption         =   "(c) 2009-2010 by Marc Ruef"
         Height          =   255
         Left            =   1080
         TabIndex        =   3
         Top             =   600
         Width           =   3495
      End
      Begin VB.Label lblApplicationName 
         Caption         =   "midfp"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   2
         Top             =   360
         Width           =   3495
      End
      Begin VB.Image imgLogo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   510
         Left            =   240
         MouseIcon       =   "frmAbout.frx":0FD4
         MousePointer    =   99  'Custom
         Picture         =   "frmAbout.frx":12DE
         ToolTipText     =   "Web Server Fingerprinting"
         Top             =   360
         Width           =   510
      End
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOkay_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Me.Caption = "About " & APP_NAME
    lblApplicationName.Caption = APP_NAME
    lblProjectWebsite.Caption = APP_WEBSITE_URL
End Sub

Private Sub imgLogo_Click()
    Call OpenProjectWebsite
End Sub

Private Sub lblProjectWebsite_Click()
    Call OpenProjectWebsite
End Sub

