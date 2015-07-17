@echo off
@echo FossilRepository=%1
@echo GitRepository=%2
@echo GitExe=%3
@echo DescFile=%4

@echo.
@echo.
@echo mORMot repository
@echo -----------------

ROBOCOPY %1 %2 /xf _fossil_  >nul
ROBOCOPY %1\SQLite3 %2\SQLite3 /s >nul
ROBOCOPY %1\SynDBDataSet %2\SynDBDataSet  >nul
ROBOCOPY %1\CrossPlatform %2\CrossPlatform /s >nul
del /q /s %2\*.bak %2\*.bk2 > nul 2> nul

%3 add .
%3 commit -a --file=%4
%3 push


@echo.
@echo.
@echo SynPDF repository
@echo -----------------

@cd ..\SynPDF

@xcopy %1\SynCommons.pas . /Y >nul
@xcopy %1\SynLZ.pas . /Y >nul
@xcopy %1\Synopse.inc . /Y >nul
@xcopy %1\SynopseCommit.inc . /Y >nul
@xcopy %1\SynPdf.pas . /Y >nul
@xcopy %1\SynCrypto.pas . /Y >nul
@xcopy %1\SynGdiPlus.pas . /Y >nul
@xcopy %1\SynZip.pas . /Y >nul
@xcopy %1\deflate.obj . /Y >nul
@xcopy %1\trees.obj . /Y >nul
@xcopy %1\SQLite3\mORMotReport.pas . /Y >nul

%3 add .
%3 commit -a --file=%4
%3 push

@echo.
@echo.
@echo dmustache repository
@echo --------------------

@cd ..\dmustache

@xcopy %1\SynCommons.pas . /Y >nul
@xcopy %1\SynLZ.pas . /Y >nul
@xcopy %1\SynMustache.pas . /Y >nul
@xcopy %1\Synopse.inc . /Y >nul
@xcopy %1\SynopseCommit.inc . /Y >nul

%3 add .
%3 commit -a --file=%4
%3 push

@echo.
@echo.
@echo LVCL repository
@echo ---------------

@cd ..\LVCL

ROBOCOPY %1\LVCL . /s >nul

%3 add .
%3 commit -a --file=%4
%3 push

@echo.
@echo.
@echo SynProject repository
@echo ---------------------

@cd ..\SynProject

ROBOCOPY %1\SynProject . /s >nul

%3 add .
%3 commit -a --file=%4
%3 push

@echo.
@pause
