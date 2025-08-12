@echo off
:: Verifica se está em modo administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permissao de administrador...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

title Limpeza e Manutenção do Windows 10
color 0A

echo ================================
echo INICIANDO VERIFICACAO COM DISM
echo ================================
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo ================================
echo LIMPANDO ARQUIVOS TEMPORARIOS
echo ================================
echo Limpando %TEMP%
del /q /f /s "%TEMP%\*"
echo Limpando C:\Windows\Temp
del /q /f /s "C:\Windows\Temp\*"

echo.
echo ================================
echo LIMPANDO CACHE DO WINDOWS UPDATE
echo ================================
net stop wuauserv
net stop bits
rd /s /q "%windir%\SoftwareDistribution"
net start wuauserv
net start bits

echo.
echo ================================
echo LIMPEZA E MANUTENCAO CONCLUIDAS
echo ================================
pause
