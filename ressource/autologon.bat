:LOGON_MENU
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 ����ۻ �����ۻ ��ۻ   ��ۻ�ۻ��ۻ   �ۻ
	ECHO                                ������ۻ������ۻ���ۻ ���ۺ�ۺ���ۻ  �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ���������ۺ�ۺ����ۻ �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ�ۺ���ɼ�ۺ�ۺ�ۺ��ۻ�ۺ
	ECHO                                �ۺ  �ۺ������ɼ�ۺ �ͼ �ۺ�ۺ�ۺ ����ۺ
	ECHO                                �ͼ  �ͼ�����ͼ �ͼ     �ͼ�ͼ�ͼ  ���ͼ
	ECHO                                                Autologon               
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : 1.1.6
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ����������������������������
	ECHO  1: Activ�e Autologon
	ECHO ����������������������������
	ECHO  2: D�sactiver Autologon
	ECHO ����������������������������
	ECHO  R: Retour au menu principal
	ECHO ����������������������������
	ECHO  Q: Quitter
	ECHO ����������������������������
	ECHO Quel programme voulez-vous ex�cuter ?
	SET LOGON_CHOIX=
	SET /p LOGON_CHOIX=
	IF /i "%LOGON_CHOIX%" == "1" GOTO :LOGON_ENABLE
	IF /i "%LOGON_CHOIX%" == "2" GOTO :LOGON_DISABLE
	IF /i "%LOGON_CHOIX%" == "r" GOTO :RETOUR
	IF /i "%LOGON_CHOIX%" == "R" GOTO :RETOUR
	IF /i "%LOGON_CHOIX%" == "q" GOTO :FIN
	IF /i "%LOGON_CHOIX%" == "Q" GOTO :FIN
	IF /i "%LOGON_CHOIX%" == "" GOTO :LOGON_MENU
	GOTO :LOGON_MENU

:LOGON_ENABLE
	CLS
	ECHO %DOMAINE_NAME% 
	SET /p nom= Saisir le nom utilisateur de la session : 
	SET /p psw= Saisir le mot de passe de la session : 
	SET /p dmn= Saisire le nom de domaine : 
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "1" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /d "%NOM%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "%PSW%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName" /d "%DMN%" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "1" /f /t REG_SZ
	ECHO username = %NOM%
	ECHO password = %PSW%
	ECHO domaine = %DMN%
	PAUSE
	GOTO :LOGON_MENU

:LOGON_DISABLE
	CLS
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d "0" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "" /f /t REG_SZ
	REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "FORceAutoLogon" /d "0" /f /t REG_SZ
	PAUSE
	GOTO :LOGON_MENU

:RETOUR
	ENDLOCAL
	EXIT /b 0

:FIN
	ENDLOCAL
	EXIT