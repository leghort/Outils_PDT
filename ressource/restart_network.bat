NET LOCALGROUP administrateurs utilisateurs /add networkservice localservice
CLS
COLOR 0b
ECHO �������������������������������������������������������������
ECHO /!\ Attention c'ette action va red�marrer l'ordinateur /!\
ECHO �������������������������������������������������������������
SET /p question=Souhaitez vous continuez [O/N]?
IF /i NOT "%question%"=="O" GOTO :RETOUR
SHUTDOWN -r -t 5
GOTO :FIN

:FIN
	ENDLOCAL
	EXIT