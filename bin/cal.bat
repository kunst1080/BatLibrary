@echo off
setlocal

rem /*
rem  *           cal.bat
rem  * 
rem  * カレンダーを表示するコマンド
rem  * 　(UNIXのcalコマンドのクローン)
rem  */


rem 
rem ========== ヘルプの表示 ==========
if "%1"=="-h" goto Help
if "%1"=="--help" goto Help
if "%1"=="/?" goto Help
goto noHelp
rem ---------------------
:Help
echo  ============ コマンドラインオプション ============
echo 　-h, --help, /?　……　ヘルプの表示
echo.
echo 　[-Opt] [[Month] Year]
echo 　　-3　……　３ヶ月カレンダーの表示(前月、当月、来月｣)
echo 　　-y　……　１年カレンダーの表示
echo 　　Month　月を英語で入力(例：April)
echo 　　Year 　年を４桁で入力(yyyy)
echo 　　　　　　　　　　　1752年以前は表示されません
echo.
echo  オプション無しで実行すると、今年･今月のカレンダーを表示します
goto :EOF
rem ---------------------
:noHelp


rem ============ 日付の設定 ============
rem 日付データの抽出
 rem Mn…今月
set /a thisMn=%date:~5,2%
 rem Yr…今年
set /a thisYr=%date:~0,4%

rem 引数のシフトなど
set Opt=0
if "%1"=="-3" set Opt=-3
if "%1"=="-y" set Opt=-y
:hikisu
 rem 月名の入力
 if /i "%1"=="January" set Mn=1
 if /i "%1"=="February" set Mn=2
 if /i "%1"=="March" set Mn=3
 if /i "%1"=="April" set Mn=4
 if /i "%1"=="May" set Mn=5
 if /i "%1"=="June" set Mn=6
 if /i "%1"=="July" set Mn=7
 if /i "%1"=="August" set Mn=8
 if /i "%1"=="September" set Mn=9
 if /i "%1"=="October" set Mn=10
 if /i "%1"=="November" set Mn=11
 if /i "%1"=="December" set Mn=12
 rem 年の入力
 set /a Yr=%1+0
 shift
if not "%1"=="" goto hikisu

rem 値の調整
if %Yr% LEQ 1752 set /a Yr=thisYr

rem ---引数に日付が含まれないとき
if not defined Yr set Yr=%thisYr%
if not defined Mn set Mn=%thisMn%



rem ========== メインの処理 ========
rem 1年オプション
if %Opt%==-y goto 1nen

rem 3ヶ月オプション
if %Opt%==-3 (
	rem 先月
	set /a Yr1=Yr
	set /a Mn1=Mn-1
	rem 今月
	set /a Yr2=Yr
	set /a Mn2=Mn
	rem 来月
	set /a Yr3=Yr
	set /a Mn3=Mn+1
	rem ----------
	goto 3kagetu
)

rem 1ヶ月オプション
goto 1kagetu



rem ========== オプション別の動作 ==========
rem -----1年カレンダーの表示
:1nen
echo                                 %Yr%
echo.
set Mn=0

:1nenCal
 set /a Mn=%Mn%+1
 set /a Mn1=%Mn%
 set /a Mn2=%Mn%+1
 set /a Mn3=%Mn%+2
 call :subDate %Yr% %Mn1% 1
 call :subDate %Yr% %Mn2% 2
 call :subDate %Yr% %Mn3% 3
 rem 描画
 echo       %Month1%              %Month2%              %Month3%
 call :sub3calender
 echo.
 rem --------
if %Mn% LSS 12 goto 1nenCal

rem ---終了
goto :EOF



rem -----3ヶ月カレンダーの表示
:3kagetu
 rem 年越しの処理
if %Mn1%==0 (
	set /a Yr1=%Yr1%-1
	set Mn1=12
)
if %Mn3%==13 (
	set /a Yr3=%Yr3%+1
	set Mn3=1
)
call :subDate %Yr1% %Mn1% 1
call :subDate %Yr2% %Mn2% 2
call :subDate %Yr3% %Mn3% 3

rem 3か月表示の準備
echo    %Month1% %Yr1%         %Month2% %Yr2%         %Month3% %Yr3%
rem 描画
call :sub3calender

rem ---終了
goto :EOF



rem -----1ヶ月カレンダーの表示
:1kagetu
call :subDate %Yr% %Mn%
call :sub1calender
rem ---終了
goto :EOF



rem ===========================================================================
rem =======================                          ==========================
rem =======================       サブルーチン       ==========================
rem ======================= ↓↓↓↓↓↓↓↓↓↓↓↓ ==========================


rem ===========================================================================
rem ================== 描画のための日付データの設定 ===========================
:subDate
rem ===========================================================================
rem 引数の受け取り
set Yr=%1
set Mn=%2
 rem 3ヶ月表示の際に利用
 set Number=%3

rem 月の名前の表示について(いったんMonthに格納)
if %Mn%==1 set Month= January 
if %Mn%==2 set Month=February 
if %Mn%==3 set Month=  March  
if %Mn%==4 set Month=  April  
if %Mn%==5 set Month=   May   
if %Mn%==6 set Month=  June   
if %Mn%==7 set Month=  July   
if %Mn%==8 set Month= August  
if %Mn%==9 set Month=September
if %Mn%==10 set Month= October 
if %Mn%==11 set Month=Noveember
if %Mn%==12 set Month=December 


rem =========== 月末日を求める ============
if %Mn%==1 set Getumatu=31

rem 2月計算の準備(ifの外に書かないとエラーになる)
 set Urr=Yes
 set /a UrrAmari = %Yr% %%4
 set /a UrrAmari2 = %Yr% %%400
if %Mn%==2 (
	rem 年が4で割り切れると、うるう年。
	if %UrrAmari% NEQ 0 set Urr=No
	rem 年が100で割り切れて、かつ400で割り切れないと、うるう年ではない。
	if %Yr:~-2%==00 (
		if %UrrAmari2% NEQ 0 set Urr=No
	)
)
if %Mn%==2 (
	if %Urr%==Yes set Getumatu=29
	if %Urr%==No set Getumatu=28
)
if %Mn%==3 set Getumatu=31
if %Mn%==4 set Getumatu=30
if %Mn%==5 set Getumatu=31
if %Mn%==6 set Getumatu=30
if %Mn%==7 set Getumatu=31
if %Mn%==8 set Getumatu=31
if %Mn%==9 set Getumatu=30
if %Mn%==10 set Getumatu=31
if %Mn%==11 set Getumatu=30
if %Mn%==12 set Getumatu=31

rem =========== 1日目の曜日を判定 ===========
rem 1月と2月は、それぞれ13、14で計算する
set Yr1=%Yr%
if %Mn%==1 (
	set M=13
	set /a Yr1=Yr-1
) else if %Mn%==2 (
	set /a Yr1=Yr-1
	set M=14
) else (
	set M=%Mn%
)
rem C=年の上2桁、Y=年の下2桁
set /a C=%Yr1:~0,2%
set /a Y=%Yr1% - C*100

rem 曜日の計算式(Zellerの公式を利用)
set /a Wk= (( 21 * %C% / 4 ) + ( 5 * %Y% / 4 ) + ( 26 * ( %M% + 1 ) / 10 )) %%7 + 1



if not defined Number exit /b
  rem ========== 戻り値の設定 ==========
  set Month%Number%=%Month%
  set Wk%Number%=%Wk%
  set Getumatu%Number%=%Getumatu%
  
  

rem ===== 戻る
exit /b



rem ===========================================================================
rem ====================== 1ヶ月描画のサブルーチン ============================
:sub1Calender
rem ===========================================================================
rem 1ヶ月表示
echo    %Month% %Yr%
echo  Su Mo Tu We Th Fr Sa

rem ---1週目
set i=1
rem 1行目の空白部分を表示
:LoopBlank
if %i% LSS %Wk% (
	set WeekStr=%WeekStr%   
	set /a i=i+1
	goto LoopBlank
)
rem 1行目の数字部分を作成
set Dy=1
:LoopNumber
set WeekStr=%WeekStr%  %Dy%
set /a Dy=Dy+1
set /a i=i+1
if %i% LEQ 7 goto LoopNumber

echo %WeekStr%

rem ---2週目以降
:LoopMonth
set WeekStr=
set i=1
:LoopWeek
if %Dy% LSS 10 (
	set WeekStr=%WeekStr%  %Dy%
) else (
	set WeekStr=%WeekStr% %Dy%
)
set /a Dy=Dy+1
rem 日数が月末を越えると、週表示を行い、ループを出る
if %Dy% GTR %Getumatu% (
	echo %WeekStr%
	goto Break
	)
set /a i=i+1
if %i% LEQ 7 goto LoopWeek
echo %WeekStr%

rem ---3週目以降
rem %Dy%の値のみ引き継がれる
if %Dy% LEQ %Getumatu% goto LoopMonth


:Break


rem ===== 戻る
exit /b



rem ===========================================================================
rem ====================== 3ヶ月描画のサブルーチン ============================
:sub3Calender
rem ===========================================================================
rem 3ヶ月表示
echo  Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa   Su Mo Tu We Th Fr Sa
set WeekStr=

rem ------1週目
 rem 周回のカウント
set j=0
:Week1
set /a j=j+1
 rem 曜日のカウント
set i=1

rem 1行目の空白部分を作成
:LoopBlank3
 set /a Wk=Wk%j%
 if %i% LSS %Wk% (
	set WeekStr=%WeekStr%   
	set /a i=i+1
	goto LoopBlank3
)
rem 1行目の数字部分を作成
set Dy=1
:LoopNumber3
 set WeekStr=%WeekStr%  %Dy%
 set /a Dy=Dy+1
 set /a i=i+1
if %i% LEQ 7 goto LoopNumber3

rem ３周する 
set /a Dy%j%=Dy
if %j% LSS 3 (
	set WeekStr=%WeekStr%  
	goto Week1
)

echo %WeekStr%
set WeekStr=


rem ------2週目以降
set j=1
 rem 周回のカウント
:LoopMonth3
 rem ループが終わっているときの処理
set /a Dy=Dy%j%
set /a Getumatu=Getumatu%j%
if %Dy% GTR %Getumatu% (
	set WeekStr=%WeekStr%                     
	goto :Break3
)

set i=1

set /a Dy=Dy%j%
set /a Getumatu=Getumatu%j%

:LoopDay3
if %Dy% LSS 10 (
	set WeekStr=%WeekStr%  %Dy%
) else (
	set WeekStr=%WeekStr% %Dy%
)
set /a Dy=Dy+1
rem 日数が月末を越えると、残りを埋め、ループを出る
if %Dy% GTR %Getumatu% goto LoopLast3
set /a i=i+1
if %i% LEQ 7 (
	goto LoopDay3
)
goto Break3
rem 残り日数の埋め立て
:LoopLast3
 set /a i=i+1
 if %i% GEQ 8 goto Break3
 set WeekStr=%WeekStr%   
goto LoopLast3

:Break3

rem 月別ループ
set WeekStr=%WeekStr%  
set /a Dy%j%=Dy
set /a j=j+1
if %j% LEQ 3 goto LoopMonth3

echo %WeekStr%
set WeekStr=


rem 週のループ
set j=1

if %Dy1% LEQ %Getumatu1% goto LoopMonth3
if %Dy2% LEQ %Getumatu2% goto LoopMonth3
if %Dy3% LEQ %Getumatu3% goto LoopMonth3



rem ===== 戻る
exit /b


