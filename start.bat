@ECHO OFF&PUSHD %~DP0 &TITLE �ܵ��ȼ���+�������������빤��
mode con cols=70 lines=30
color A
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
cd bin
:Menu
Cls
@ echo.��
@ echo.            ##    ## ######## ########  #### ##    ## 
@ echo.            ###   ## ##       ##     ##  ##  ###   ## 
@ echo.            ####  ## ##       ##     ##  ##  ####  ## 
@ echo.            ## ## ## ######   ########   ##  ## ## ## 
@ echo.            ##  #### ##       ##   ##    ##  ##  #### 
@ echo.            ##   ### ##       ##    ##   ##  ##   ### 
@ echo.            ##    ## ######## ##     ## #### ##    ## 
@ echo.                                              ---NIMS
@ echo.
@ echo.����������           �� �� ѡ ��
@ echo.
@ echo.   A.       ����excel��ʽ��⣨����ؼ�飩�� ������1
@ echo.
@ echo.   B.       ����ȫ��Ŀ¼��excel���ݡ� ������2
@ echo.
@ echo.   C.       ����ȫ��Ŀ¼��excel���ݡ� ������3
@ echo. 
@ echo.   D.       �ָ����ݿ�����ʷ�汾�����ݡ� ������4
@ echo. 
@ echo.   E.       ɾ�����ݿ�����ʷ�汾�����ݡ� ������5
@ echo.  
@ echo.            PS:Ŀ¼��������Ӧ��excel�ļ��������뷢������ʱ���ɱ��á�
@ echo.
set /p xj=     �������ְ��س���
if /i "%xj%"=="1" Goto Check
if /i "%xj%"=="2" Goto All
if /i "%xj%"=="3" Goto ContinueAll
if /i "%xj%"=="4" Goto Recover 
if /i "%xj%"=="5" Goto Delete

:All
@ echo.
ECHO ������warning:��������python�ű�..������������н����˳��󷽿��˳�..
ECHO ������ִ�����������..���Ե�..
start python "/bin/cqs_index.py"
@ echo.
ECHO ������ִ��Ԫ�������..���Ե�..
start python "cqs_items.py"
@ echo.
ECHO ������ִ�бں�����..���Ե�..
start python "cqs_pipe_thickness.py"
@ echo.
ECHO ������ִ��ѹ���¶ȱ����..���Ե�..
start python "cqs_pt_rating.py"
@ echo.
ECHO ������ִ��ע�ͱ����..���Ե�..
start python "cqs_note.py"
@ echo.
ECHO ������ִ��֧�����ӱ���� ���ݻ�ﵽ������ ..�����ĵȴ�..
python "cqs_branch_connect.py"
@ echo.
ECHO �����������ϴ���FTP���ϴ������Ծɱ���Ŀ¼�µ�excel..���Ե�..
python "about_ftp.py"

ping -n 5 127.1>nul 
goto menu

:ContinueAll
@ echo.
ECHO ������ִ�����������..���Ե�..
start python "cqs_index.py"
@ echo.
ECHO ������ִ��Ԫ�������..���Ե�..
start python "cqs_items.py"
@ echo.
ECHO ������ִ�бں�����..���Ե�..
start python "cqs_pipe_thickness.py"
@ echo.
ECHO ������ִ��ѹ���¶ȱ����..���Ե�..
start python "cqs_pt_rating.py"
@ echo.
ECHO ������ִ��ע�ͱ����..���Ե�..
start python "cqs_note.py"
@ echo.
ECHO ������ִ��֧�����ӱ���� �������϶�..�����ĵȴ�..
python "cqs_branch_connect.py"
ECHO ����  warning����������python�ű�..������������н����˳��󷽿��˳�..
ping -n 5 127.1>nul
@ echo.
ECHO ������ִ�н��������������޸�..���Ե�..
python "continue_load.py"
@ echo.
ECHO �����������ϴ���FTP..���Ե�..
python "about_ftp.py"
goto menu

:Recover
@ echo.
ECHO ����������ִ����..���Ե�..
python recover_db.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Delete
@ echo.
ECHO ����������ִ����..���Ե�..
python delete_db.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Check
@ echo.
ECHO ����������ִ����..���Ե�..
python check_legal.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu
