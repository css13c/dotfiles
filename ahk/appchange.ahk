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

OpenCmd(programName, programPath)
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
		RunAs, %programPath%, Administrator
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
OpenCmd("Command Prompt", "cmd.exe")
return

!g:: ; Opens Git Bash
GetWindow("MINGW", "C:\Program Files\Git\git-bash.exe")
return

!v:: ; Opens Gvim
GetWindow("GVIM", "C:\Vim\vim81\gvim.exe")
return

!e:: ; Opens VisualStudio
OpenVS("Microsoft Visual Studio", "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe")
return

!a:: ; Opens Chrome
GetWindow("Chrome", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return

!m:: ; Opens MySql
GetWindow("MySQL Workbench", "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\MySQLWorkbench.exe")
return

!t:: ; Opens Teams
GetWindow("Microsoft Teams", "C:\ProgramData\csmith\Microsoft\Teams\Update.exe --processStart 'Teams.exe'")
return

!o:: ; Opens Outlook
GetWindow("Outlook", "C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE")
return

!s:: ; Opens Slack
GetWindow("Slack", "C:\Users\csmith\AppData\Local\slack\slack.exe")
return

!p:: ; Opens Spotify
GetWindow("Spotify", "C:\Users\csmith\AppData\Roaming\Spotify\Spotify.exe")
return

!1:: ; Reloads script
Reload
return
