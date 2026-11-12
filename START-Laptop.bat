@echo off
chcp 65001 >nul
title OBS Fernbedienung einrichten

set "TS=C:\Program Files\Tailscale\tailscale.exe"
if not exist "%TS%" set "TS=tailscale"

echo.
echo  ============================================
echo     OBS Fernbedienung wird eingerichtet ...
echo  ============================================
echo.
echo  Falls gleich ein Link kommt ("Serve is not enabled"):
echo  Link im Browser oeffnen, "Enable" klicken, dann hier weiter.
echo.

"%TS%" serve reset >nul 2>&1
"%TS%" serve --bg --set-path /ws http://127.0.0.1:4455
"%TS%" serve --bg --set-path / "%~dp0."

echo.
echo  ============================================
echo   FERTIG! Diese Adresse am Handy oeffnen:
echo  ============================================
"%TS%" serve status
echo.
echo  (Die Adresse, die mit https:// beginnt)
echo  Tailscale muss am Handy eingeschaltet sein.
echo  Diesen Ordner NICHT verschieben oder loeschen.
echo.
pause
