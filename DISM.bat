# Windows Cleanup and Maintenance Script
# Para hospedar este arquivo e executar em 1 linha, use:
# iwr -useb "https://seusite.com/cleanup.ps1" | iex

# Verificar se está executando como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Solicitando permissao de administrador..." -ForegroundColor Yellow
    
    # Reexecutar como administrador
    $arguments = "-NoProfile -ExecutionPolicy Bypass -Command `"& {" + $MyInvocation.MyCommand.Definition + "}`""
    Start-Process PowerShell -Verb RunAs -ArgumentList $arguments
    exit
}

# Configurar console
$Host.UI.RawUI.WindowTitle = "Limpeza e Manutenção do Windows 10"
Clear-Host

Write-Host "================================" -ForegroundColor Green
Write-Host "INICIANDO VERIFICACAO COM DISM" -ForegroundColor Green  
Write-Host "================================" -ForegroundColor Green

try {
    Write-Host "Executando DISM ScanHealth..." -ForegroundColor Cyan
    DISM /Online /Cleanup-Image /ScanHealth
    
    Write-Host "Executando DISM CheckHealth..." -ForegroundColor Cyan
    DISM /Online /Cleanup-Image /CheckHealth
    
    Write-Host "Executando DISM RestoreHealth..." -ForegroundColor Cyan
    DISM /Online /Cleanup-Image /RestoreHealth
    
    Write-Host "DISM concluido com sucesso!" -ForegroundColor Green
} catch {
    Write-Host "Erro no DISM: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "LIMPANDO ARQUIVOS TEMPORARIOS" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

try {
    Write-Host "Limpando $env:TEMP..." -ForegroundColor Cyan
    Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "Limpando C:\Windows\Temp..." -ForegroundColor Cyan
    Get-ChildItem -Path "C:\Windows\Temp" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Write-Host "Arquivos temporarios limpos!" -ForegroundColor Green
} catch {
    Write-Host "Erro na limpeza: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "LIMPANDO CACHE DO WINDOWS UPDATE" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

try {
    Write-Host "Parando servicos Windows Update..." -ForegroundColor Cyan
    Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue
    Stop-Service -Name "bits" -Force -ErrorAction SilentlyContinue
    
    Write-Host "Removendo cache do Windows Update..." -ForegroundColor Cyan
    if (Test-Path "$env:windir\SoftwareDistribution") {
        Remove-Item -Path "$env:windir\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    Write-Host "Reiniciando servicos..." -ForegroundColor Cyan
    Start-Service -Name "wuauserv" -ErrorAction SilentlyContinue
    Start-Service -Name "bits" -ErrorAction SilentlyContinue
    
    Write-Host "Cache do Windows Update limpo!" -ForegroundColor Green
} catch {
    Write-Host "Erro na limpeza do Windows Update: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "================================" -ForegroundColor Green
Write-Host "LIMPEZA E MANUTENCAO CONCLUIDAS" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

Write-Host "Pressione qualquer tecla para continuar..." -ForegroundColor Yellow
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
