@ECHO OFF&PUSHD %~DP0 &TITLE �ܵ��ȼ���+�������������빤��
mode con cols=70 lines=30
color A
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo ��ʹ���Ҽ�����Ա������У�&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion

:Menu
Cls
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
@ echo.   A.       ���������� �� ������1
@ echo.
@ echo.   B.       ����ȼ����Ԫ���� �� ������2
@ echo.
@ echo.            ����ȼ���Ĺܵ��ں��� ������3
@ echo. 
@ echo.            ����ȼ���Ĺܵ��¶�ѹ����� �� ������4
@ echo.
@ echo.            ����ȼ����֧�����ӱ� �� ������5
@ echo. 
@ echo.   C.       ����ȫ��Ŀ¼��excel���ݡ� ������9
@ echo.  
@ echo.            PS:Ŀ¼��������Ӧ��excel�ļ������뷢������ʱ���ɱ��á�
set /p xj=     �������ְ��س���
if /i "%xj%"=="1" Goto Index
if /i "%xj%"=="2" Goto Item
if /i "%xj%"=="3" Goto Thickness
if /i "%xj%"=="4" Goto Rating
if /i "%xj%"=="5" Goto Connect
if /i "%xj%"=="9" Goto All

@ echo.
echo      ѡ����Ч������������
ping -n 2 127.1>nul 
goto menu
:Index
@ echo.
ECHO ����������ִ����..���Ե�..
python cqs_index.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Item
@ echo.
ECHO ����������ִ����..���Ե�..
python cqs_items.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Thickness
@ echo.
ECHO ����������ִ����..���Ե�..
python cqs_pipe_thickness.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Rating
@ echo.
ECHO ����������ִ����..���Ե�..
python cqs_pt_rating.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:Connect
@ echo.
ECHO ����������ִ����..���Ե�..
python cqs_branch_connect.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu

:All
@ echo.
ECHO ������ִ�����������..���Ե�..
python cqs_index.py
@ echo.
ECHO ������ִ��Ԫ�������..���Ե�..
python cqs_items.py
@ echo.
ECHO ������ִ�бں�����..���Ե�..
python cqs_pipe_thickness.py
@ echo.
ECHO ������ִ��ѹ���¶ȱ����..���Ե�..
python cqs_pt_rating.py
@ echo.
ECHO ������ִ��֧�����ӱ���� ���ݻ�ﵽ������ ..�����ĵȴ�..
python cqs_branch_connect.py
ECHO �������Ѿ�ִ��������ڷ��ز˵�..���Ե�..
ping -n 3 127.1>nul 
goto menu