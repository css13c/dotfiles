#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, C:\  ; Ensures a consistent starting directory.
#SingleInstance force

GetWindow(programName, programPath)
{
	SetTitleMatchMode, 2 ; approximate match
	IfWinExist, %programName%
	{
		IfWinNotActive, %programName%
		{
			WinGet, winState, MinMax, %programName%
			If (winState = -1)
			{
				WinRestore, %programName%
			}
			WinActivate, %programName%
			WinWaitActive, %programName%, , 3
		}
	}
	else
	{
		Run, %programPath%
		WinActivate, %programName%
		WinWaitActive, %programName%, , 3
	}
}

OpenVS(programName, programPath)
{
	SetTitleMatchMode, 2 ; approximate match
	IfWinExist, %programName%
	{
		IfWinNotActive, %programName%
		{
			WinGet, winState, MinMax, %programName%
			If (winState = -1)
			{
				PostMessage, 0x112, 0xF120,,, %programName%
			}
			WinActivate, %programName%
			WinWaitActive, %programName%, , 3
		}
	}
	else
	{
		Run, %programPath%
		WinActivate, %programName%
		WinWaitActive, %programName%, , 3
	}
}

OpenSpotify(programName, programPath)
{
	SetTitleMatchMode, 2 ; approximate match
	IfWinExist, %programName%
	{
		IfWinNotActive, %programName%
		{
			WinGet, winState, MinMax, %programName%
			If (winState = -1)
			{
				PostMessage, 0x112, 0xF120,,, %programName%
			}
			WinActivate, %programName%
			WinWaitActive, %programName%, , 3
		}
	}
	else
	{
		Run, %programPath%
		WinActivate, %programName%
		WinWaitActive, %programName%, , 3
	}
}

!c:: ; Opens cmd to Desktop
GetWindow("cmd.exe", "cmd.exe")
return

!g:: ; Opens Git Bash
GetWindow("MINGW", "C:\Program Files\Git\git-bash.exe")
return

!v:: ; Opens Gvim
GetWindow("GVIM", "C:\Vim\vim81\gvim.exe")
return

!e:: ; Opens VisualStudio
OpenVS("Visual Studio", "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe")
return

!h:: ; Opens HeidiSQL
GetWindow("HeidiSQL", "C:\Program Files\HeidiSQL\heidisql.exe")
return

!a:: ; Opens Chrome
GetWindow("Chrome", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

!m:: ; Opens Spotify
GetWindow("C:\Users\csmith\AppData\Roaming\Spotify\Spotify.exe", "C:\Users\csmith\AppData\Roaming\Spotify\Spotify.exe")
return

!t:: ; Opens Teams
GetWindow("Microsoft Teams", "C:\ProgramData\csmith\Microsoft\Teams\Update.exe --processStart 'Teams.exe'")

!1:: ; Reloads script
Reload
return
