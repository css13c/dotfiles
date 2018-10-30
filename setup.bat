@echo off
:: Get current directory and make backup directory
set currentDir=%CD%
set backupDir=%HOME%\dotfileBackups
if not exist %backupDir% (
	mkdir %backupDir%
)
@echo %currentDir%
pause

:: Check for files we will be linking
if exist %HOME%\vimfiles (
	move /-y %HOME%\vimfiles\ %backupDir%
)
if exist %HOME%\_vimrc (
	move /-y %HOME%\_vimrc %backupDir%
)
if exist %HOME%\_gvimrc (
	move /-y %HOME%\_gvimrc %backupDir%
)
if exist %HOME%\_vsvimrc (
	move /-y %HOME%\_vsvimrc %backupDir%
)
if exist %HOME%\.gitconfig (
	move /-y %HOME%\.gitconfig %backupDir%
)

:: Make symbolic links
mklink /D %HOME%\vimfiles %currentDir%\vimfiles
mklink %HOME%\_vimrc %currentDir%\_vimrc
mklink %HOME%\_gvimrc %currentDir%\_gvimrc
mklink %HOME%\_vsvimrc %currentDir%\_vsvimrc
mklink %HOME%\.gitconfig %currentDir%\.gitconfig
