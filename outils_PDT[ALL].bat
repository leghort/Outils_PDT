@ECHO off
SETLOCAL
CHCP 437 > nul
MODE con cols=100 lines=40
TITLE Boite A Outils Technicien Poste De Travail                                                  By M.Cossu

REM D�finir les chemin d'acces relative des dossier
SET MAIN_FOLDER=%~dp0
SET RESS_FOLDER=%~dp0ressource\
SET TEMP_FOLDER=%TMP%\Outils_PDT.tmp\

IF NOT EXIST "%RESS_FOLDER%" (
	GOTO :RESS_ERROR
)
IF NOT EXIST %TMP% (
	 MKDIR %TMP%
)
IF NOT EXIST %TEMP_FOLDER% (
	MKDIR %TEMP_FOLDER%
) ELSE DEL /S /Q %TEMP_FOLDER%

CLS
SYSTEMINFO | FINDSTR /B /C:"Domain">%TEMP_FOLDER%domaine_name
ECHO %MAIN_FOLDER%>%TEMP_FOLDER%main_folder
ECHO %RESS_FOLDER%>%TEMP_FOLDER%res_folder
SET /p RESS_FOLDER_TMP=<%TEMP_FOLDER%res_folder
SET /p DOMAINE_NAME=<%TEMP_FOLDER%domaine_name

:CHECK_ADMIN
	CLS
	ATTRIB %WINDIR%\system32 -h | FINDSTR /I "system32" >nul
	IF %ERRORLEVEL% NEQ 1 (
	COLOR 0C
	ECHO ����������������������������������������������������������������
	ECHO. /!\ Ce script doit etre Ex�cuter en tant qu'Administrateur /!\
	ECHO ����������������������������������������������������������������
	PAUSE
	GOTO :FIN
    )

:MAIN_MENU
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 ����ۻ �����ۻ ��ۻ   ��ۻ�ۻ��ۻ   �ۻ
	ECHO                                ������ۻ������ۻ���ۻ ���ۺ�ۺ���ۻ  �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ���������ۺ�ۺ����ۻ �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ�ۺ���ɼ�ۺ�ۺ�ۺ��ۻ�ۺ
	ECHO                                �ۺ  �ۺ������ɼ�ۺ �ͼ �ۺ�ۺ�ۺ ����ۺ
	ECHO                                �ͼ  �ͼ�����ͼ �ͼ     �ͼ�ͼ�ͼ  ���ͼ
	ECHO                                                Page (1/2)
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : 1.1.6
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ���������������������������������������
	IF EXIST "%RESS_FOLDER%autologon.bat" (
		ECHO  [OK]  1: G�rer l'Autologon
	) ELSE ECHO [FAIL] 1: G�rer l'Autologon
	ECHO ���������������������������������������
	IF EXIST "%RESS_FOLDER%restart_network.bat" (
		ECHO  [OK]  2: R�parer le services r�seau HS
	) ELSE ECHO [FAIL] 2: R�parer le services r�seau HS
	ECHO ���������������������������������������
	IF EXIST "%RESS_FOLDER%num_lock.bat" (
		ECHO  [OK]  3: Pav� num�rique au d�marrage
	) ELSE ECHO [FAIL] 3: Pav� num�rique au d�marrage
	ECHO ���������������������������������������
	ECHO  O: Options
	ECHO ���������������������������������������
	ECHO  Q: Quitter
	ECHO ���������������������������������������
	ECHO Quel programme voulez-vous ex�cuter ?
	SET MAIN_CHOIX=
	SET /p MAIN_CHOIX=
	IF /i "%MAIN_CHOIX%" == "1" GOTO :BATCH_1
	IF /i "%MAIN_CHOIX%" == "2" GOTO :BATCH_2
	IF /i "%MAIN_CHOIX%" == "3" GOTO :BATCH_3
	IF /i "%MAIN_CHOIX%" == "o" GOTO :OPTION
	IF /i "%MAIN_CHOIX%" == "O" GOTO :OPTION
	IF /i "%MAIN_CHOIX%" == "q" GOTO :FIN
	IF /i "%MAIN_CHOIX%" == "Q" GOTO :FIN
	IF /i "%MAIN_CHOIX%" == "" GOTO :MAIN_MENU
	GOTO :MAIN_MENU

:test
echo test
goto :MAIN_MENU

:BATCH_1
	IF EXIST "%RESS_FOLDER_TMP%autologon.bat" (
		CALL "%RESS_FOLDER%autologon.bat"
	) ELSE GOTO :ERREUR_BATCH_1
	GOTO :MAIN_MENU

:BATCH_2
	IF EXIST "%RESS_FOLDER%restart_network.bat" (
		CALL "%RESS_FOLDER%restart_network.bat"
	) ELSE GOTO :ERREUR_BATCH_2
	GOTO :MAIN_MENU

:BATCH_3
	IF EXIST "%RESS_FOLDER%num_lock.bat" (
		CALL "%RESS_FOLDER%num_lock.bat"
	) ELSE GOTO :ERREUR_BATCH_3
	GOTO :MAIN_MENU

:OPTION
	IF EXIST "%RESS_FOLDER%my_OPTION.bat" (
		CALL "%RESS_FOLDER%my_OPTION.bat"
	) ELSE GOTO :ERREUR_OPTION
	GOTO :MAIN_MENU

:RESS_ERROR
	CLS
	COLOR 0C
	ECHO ����������������������������������������������������������������������������������������������������
	ECHO  Le Dossier "%RESS_FOLDER%" n'a pu �tre trouv�e!
	ECHO  Merci de v�rifier que le Dossier "%RESS_FOLDER%"est bien pr�sent
	ECHO  Ce Dossier contien tout les fonctionnalit� vous pouvais le t�l�chager sur :
	ECHO.
	ECHO source : https://github.com/leghort/Outils_PDT
	ECHO ����������������������������������������������������������������������������������������������������
	PAUSE
	GOTO :FIN

:ERREUR_BATCH_1
	CLS
	COLOR 0C
	ECHO ����������������������������������������������������������������������������������������������������
	ECHO  Le fichier "%RESS_FOLDER%autologon.bat" n'a pu �tre trouv�e!
	ECHO  Merci de v�rifier que le fichier "autologon.bat"
	ECHO  est bien pr�sent dans "%RESS_FOLDER%"
	ECHO  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	ECHO.
	ECHO source : https://github.com/leghort/Outils_PDT
	ECHO ����������������������������������������������������������������������������������������������������
	PAUSE
	GOTO :MAIN_MENU

:ERREUR_BATCH_2
	CLS
	COLOR 0C
	ECHO ����������������������������������������������������������������������������������������������������
	ECHO  Le fichier "%RESS_FOLDER%num_lock.bat" n'a pu �tre trouv�e!
	ECHO  Merci de v�rifier que le fichier "num_lock.bat"
	ECHO  est bien pr�sent dans "%RESS_FOLDER%"
	ECHO  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	ECHO.
	ECHO source : https://github.com/leghort/Outils_PDT
	ECHO ����������������������������������������������������������������������������������������������������
	PAUSE
	GOTO :MAIN_MENU

:ERREUR_BATCH_3
	CLS
	COLOR 0C
	ECHO ����������������������������������������������������������������������������������������������������
	ECHO  Le fichier "%RESS_FOLDER%restart_network.bat" n'a pu �tre trouv�e!
	ECHO  Merci de v�rifier que le fichier "restart_network.bat"
	ECHO  est bien pr�sent dans "%RESS_FOLDER%"
	ECHO  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	ECHO.
	ECHO source : https://github.com/leghort/Outils_PDT
	ECHO ����������������������������������������������������������������������������������������������������
	PAUSE
	GOTO :MAIN_MENU

:ERREUR_OPTION
	CLS
	COLOR 0C
	ECHO ����������������������������������������������������������������������������������������������������
	ECHO  Le fichier "%RESS_FOLDER%my_OPTION.bat" n'a pu �tre trouv�e!
	ECHO  Merci de v�rifier que le fichier "my_OPTION.bat"
	ECHO  est bien pr�sent dans "%RESS_FOLDER%"
	ECHO  (cette fontionnalit�e ne sera pas disponible tant que le probl�me ne sera pas r�solut)
	ECHO.
	ECHO source : https://github.com/leghort/Outils_PDT
	ECHO ����������������������������������������������������������������������������������������������������
	PAUSE
	GOTO :MAIN_MENU

:FIN
	ENDLOCAL
	EXIT