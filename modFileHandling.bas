Attribute VB_Name = "modFileHandling"
Option Explicit

Public Function ReadFile(ByRef sFileName As String) As String
    Dim sFileContent As String
    
    If (Dir$(sFileName, 16) <> "") Then
        Open sFileName For Input As #1
            sFileContent = Input(LOF(1), #1)
        Close
    End If
    
    ReadFile = sFileContent
End Function
