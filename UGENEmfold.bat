@echo off
setlocal enabledelayedexpansion
cls; 1>&2
chcp 65001 1>&2
for /f "usebackq tokens=*" %%i IN (`cd`) DO @set current_dir=%%i
if /i "%current_dir%" == "%systemroot%" (
  set mfold_working_dir="%~dp0"
) else (
  set mfold_working_dir="%current_dir%"
)
pushd "%mfold_working_dir%"

set ROOTDIR=%~d0%~p0
set PATH=%ROOTDIR%\mfold-3.6\bin;%ROOTDIR%\dlls;%ROOTDIR%\msys64\usr\bin;%ROOTDIR%\gs\gs10.02.0\bin;%PATH%
set TMPDIR=%TMP%

%ROOTDIR%\msys64\usr\bin\bash.exe %ROOTDIR%\mfold-3.6\bin\mfold %* RUN_TYPE=html

popd
exit /b
