@ECHO OFF

if Not Exist "C:\Source\CP\$UserName" GOTO DeleteSelf

if "%USERNAME%" == $capitalizedString GOTO GetProfile
IF "%USERNAME%" == $UserName GOTO GetProfile
Exit

:GetProfile
ECHO.
ECHO Configuring your profile...Please wait
ECHO.
ECHO               ### IMPORTANT! ### DO NOT CLOSE THIS WINDOW!
ECHO.
REM ---- Restore User Profile ----
ECHO Restoring User Profile...
ECHO.
ECHO Stage 1...
RoboCopy "C:\Source\CP\$UserName\CustomDic" "%USERPROFILE%\Application Data\Microsoft\Proof" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 2...
ECHO Stage 3...
RoboCopy "C:\Source\CP\$UserName\Documents" "%USERPROFILE%\Documents" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 4...
RoboCopy "C:\Source\CP\$UserName\Favorites" "%USERPROFILE%\Favorites" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 5...
ECHO Stage 6...
ECHO Stage 7...
RoboCopy "C:\Source\CP\$UserName\ChromeBookmarks" "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 8...
RoboCopy "C:\Source\CP\$UserName\Signatures" "%USERPROFILE%\AppData\Roaming\Microsoft\Signatures" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 9...
RoboCopy "C:\Source\CP\$UserName\Templates" "%USERPROFILE%\AppData\Roaming\Microsoft\Templates" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 10...
RoboCopy "C:\Source\CP\$UserName\Music" "%USERPROFILE%\Music" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 11...
ECHO Stage 12...
RoboCopy "C:\Source\CP\$UserName\Videos" "%USERPROFILE%\Videos" "*.*" /S /E /Z /XO /R:1 /W:1 /NP /DST>NUL
ECHO Stage 13...
VER | Find "Windows [Version 6.">NUL
if Not Errorlevel 1 Goto Win7

VER | Find "Windows [Version 10.">NUL
if Not Errorlevel 1 Goto Win10
Goto Next

:Win7
Start StikyNot.exe>NUL
Ping -n 2 127.0.0.1>NUL
Taskkill /IM StikyNot.exe>NUL
Ping -n 2 127.0.0.1>NUL
RoboCopy "C:\Source\CP\$UserName\StickyNotes" "%USERPROFILE%\AppData\Roaming\Microsoft\Sticky Notes" "*.*" /S /E /Z /R:1 /W:1 /NP /DST>NUL
Goto Next

:Win10
explorer shell:AppsFolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App>NUL
Ping -n 3 127.0.0.1>NUL
Taskkill /T /F /IM Microsoft.StickyNotes.exe>NUL
Ping -n 3 127.0.0.1>NUL
RoboCopy "C:\Source\CP\$UserName\StickyNotes" "%USERPROFILE%\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState" "plum.sqlite" /S /E /Z /R:1 /W:1 /NP /DST>NUL
if Exist "C:\Source\CP\$UserName\StickyNotes\StickyNotes.snt" MD "%USERPROFILE%\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy">NUL
if Exist "C:\Source\CP\$UserName\StickyNotes\StickyNotes.snt" COPY "C:\Source\CP\$UserName\StickyNotes\StickyNotes.snt" " % USERPROFILE %\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\Legacy\ThresholdNotes.snt" > NUL
Goto Next

:Next

ECHO Finishing up...

REM ---- Delete the profile backup ----
RD /S /Q "C:\Source\CP\$UserName">NUL

:DeleteSelf
REM ---- Delete this file when done ----
DEL /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\$UserName-Config.cmd">NUL

Timeout /T 5
