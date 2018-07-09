:NUMLOCK_MENU
	CLS
	COLOR 0b
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                 ����ۻ �����ۻ ��ۻ   ��ۻ�ۻ��ۻ   �ۻ
	ECHO                                ������ۻ������ۻ���ۻ ���ۺ�ۺ���ۻ  �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ���������ۺ�ۺ����ۻ �ۺ
	ECHO                                ������ۺ�ۺ  �ۺ�ۺ���ɼ�ۺ�ۺ�ۺ��ۻ�ۺ
	ECHO                                �ۺ  �ۺ������ɼ�ۺ �ͼ �ۺ�ۺ�ۺ ����ۺ
	ECHO                                �ͼ  �ͼ�����ͼ �ͼ     �ͼ�ͼ�ͼ  ���ͼ
	ECHO                                       Pav� num�rique au d�marrage
	ECHO                                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	ECHO                                                         Version : 1.1.6
	ECHO.
	ECHO.
	ECHO Executer depuis : %~dp0
	ECHO ������������������������������������������
	ECHO  1: Activer pav� num�rique au d�marrage
	ECHO ������������������������������������������
	ECHO  2: D�sactiver pav� num�rique au d�marrage
	ECHO ������������������������������������������
	ECHO  R: Retour au menu principal
	ECHO ������������������������������������������
	ECHO  Q: Quitter
	ECHO ������������������������������������������
	ECHO Quel programme voulez-vous ex�cuter ?
	SET NUMLOCK_CHOIX=
	SET /p NUMLOCK_CHOIX= 
	IF /i "%NUMLOCK_CHOIX%" == "1" GOTO :NUMLOCK_ENABLE
	IF /i "%NUMLOCK_CHOIX%" == "2" GOTO :NUMLOCK_DISABLE
	IF /i "%NUMLOCK_CHOIX%" == "r" GOTO :RETOUR
	IF /i "%NUMLOCK_CHOIX%" == "R" GOTO :RETOUR
	IF /i "%NUMLOCK_CHOIX%" == "q" GOTO :FIN
	IF /i "%NUMLOCK_CHOIX%" == "Q" GOTO :FIN
	IF /i "%NUMLOCK_CHOIX%" == ""  GOTO :NUMLOCK_MENU
	GOTO :NUMLOCK_MENU

:NUMLOCK_ENABLE
	CLS
	REG add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2" /f /t REG_SZ
	REG QUERY "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	PAUSE
	GOTO :NUMLOCK_MENU

:NUMLOCK_DISABLE
	CLS
	REG add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators" /d "2147483648" /f /t REG_SZ
	REG QUERY "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialkeyboardIndicators"
	PAUSE
	GOTO :NUMLOCK_MENU

:RETOUR
	ENDLOCAL
	EXIT /b 0

:FIN
	ENDLOCAL
	EXIT