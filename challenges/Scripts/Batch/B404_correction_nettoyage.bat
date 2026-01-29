@echo off
setlocal

REM =========================================================
REM Script: nettoyage.bat
REM Objectif: Nettoyer les fichiers temporaires.
REM =========================================================

color 0E
 echo ATTENTION: Ce script supprime les fichiers .tmp et .log
 echo dans %TEMP% et C:\Windows\Temp
 echo.
 set /p CONFIRM=Continuer ? (O/N) : 

if /i not "%CONFIRM%"=="O" (
    echo Operation annulee.
    goto :end
)

REM Suppression dans %TEMP%
for %%F in ("%TEMP%\*.tmp" "%TEMP%\*.log") do del /q %%F 2>nul

REM Suppression dans C:\Windows\Temp
for %%F in ("C:\Windows\Temp\*.tmp" "C:\Windows\Temp\*.log") do del /q %%F 2>nul

color 0A
 echo Nettoyage termine.

:end
pause
endlocal
