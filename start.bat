@ECHO OFF&PUSHD %~DP0 &TITLE �ܵ��ȼ���+�������������빤��
mode con cols=70 lines=30
color A
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

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
@ echo.
@ echo.����������         �� �� ѡ ��
@ echo.
@ echo.   A.       ����ȫ��Ŀ¼��excel���ݡ� ������1
@ echo.
@ echo.   B.       ����ȫ��Ŀ¼��excel���ݡ� ������2
@ echo. 
@ echo.   C.       �ָ����ݿ�����ʷ�汾�����ݡ� ������3
@ echo.  
@ echo.            PS:Ŀ¼��������Ӧ��excel�ļ��������뷢������ʱ���ɱ��á�
@ echo.
set /p xj=     �������ְ��س���
if /i "%xj%"=="1" Goto All
if /i "%xj%"=="2" Goto ContinueAll
if /i "%xj%"=="3" Goto recover 

:All
@ echo.
ECHO ������warning:�����ǲ�������python�ű�..������������н����˳��󷽿��˳�..
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
ECHO ������ִ��֧�����ӱ���� ���ݻ�ﵽ������ ..�����ĵȴ�..
python "cqs_branch_connect.py"
ECHO �����������ǲ�������python�ű�..������������н����˳��󷽿��˳�..
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
