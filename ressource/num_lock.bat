rem Auteur : mederic@cossu.tech
endlocal
setlocal
@echo off
chcp437 > nul
@for %%n in (%0) do set fold=%%~dpn
title Boite A Outils Technicien Poste De Travail                                                  By M.Cossu
mode con cols=100 lines=40

:check_admin
	rem v�rifier ci le script est bien �xecuter en Administrateur
		attrib %windir%\system32 -h | findstr /I "system32" >nul
		IF %errorlevel% neq 1 (
		color 0C
		echo.
		echo. /!\ Ce script doit etre Ex�cuter en tant qu'Administrateur /!\
		echo.
		pause
		exit
       )

:menu_num
	color 0b
	cls
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo                                 ����ۻ �����ۻ ��ۻ   ��ۻ�ۻ��ۻ   �ۻ
	echo                                ������ۻ������ۻ���ۻ ���ۺ�ۺ���ۻ  �ۺ
	echo                                ������ۺ�ۺ  �ۺ���������ۺ�ۺ����ۻ �ۺ
	echo                                ������ۺ�ۺ  �ۺ�ۺ���ɼ�ۺ�ۺ�ۺ��ۻ�ۺ
	echo                                �ۺ  �ۺ������ɼ�ۺ �ͼ �ۺ�ۺ�ۺ ����ۺ
	echo                                �ͼ  �ͼ�����ͼ �ͼ     �ͼ�ͼ�ͼ  ���ͼ
	echo                                        Pav� num�rique au d�marrage
	echo                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo.
	echo.
	echo Executer depuis : %fold% 
	echo ������������������������������������������
	echo 1: Activer pav� num�rique au d�marrage
	echo ������������������������������������������
	echo 2: D�sactiver pav� num�rique au d�marrage
	echo ������������������������������������������
	echo R: Retour au menu principal
	echo ������������������������������������������
	echo Q: Quitter
	echo ������������������������������������������
	echo.
	echo.
	set _reponse=
	set /p _reponse="Quel programme voulez-vous executer ?"

	IF /i "%_reponse%" == "1" goto :batch1
	IF /i "%_reponse%" == "2" goto :batch2
	IF /i "%_reponse%" == "r" goto :retour
	IF /i "%_reponse%" == "R" goto :retour
	IF /i "%_reponse%" == "q" goto :fin
	IF /i "%_reponse%" == "Q" goto :fin
	IF /i "%_reponse%" == ""  goto :menu_num
	goto :menu_num

:batch1
	cls
	rem Activer pav� num�rique au d�marrage
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2" /f /t REG_SZ
	reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	pause
	cls
	goto :menu_num

:batch2
	cls
	rem D�sactiver pav� num�rique au d�marrage
	reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2147483648" /f /t REG_SZ
	reg query "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	pause
	cls
	goto :menu_num

:retour
	endlocal
	exit /b 0

:fin
	endlocal
	exit