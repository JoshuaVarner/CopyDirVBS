' Set source and destination directory paths
strSourceDir = "C:\Source\"
strDestDir = "C:\Destination\"

' Create FileSystemObject
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Get source directory object
Set objSourceDir = objFSO.GetFolder(strSourceDir)

' Copy source directory and all its contents to destination directory
objSourceDir.Copy strDestDir, True

' Clean up
Set objFSO = Nothing
Set objSourceDir = Nothing
