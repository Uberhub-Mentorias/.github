@echo off
REM Script para commit automatico em portugues
REM Uso: commit-auto.bat ou commit-auto.bat "mensagem customizada"

setlocal enabledelayedexpansion

if "%~1"=="" (
    REM Gerar mensagem automatica
    for /f "tokens=*" %%a in ('git diff --name-only') do (
        set "arquivo=%%a"
        goto :processar
    )
    
    :processar
    echo.
    echo Arquivos modificados detectados.
    set "mensagem=Atualizar arquivos do projeto"
    
    echo !arquivo! | findstr /i "_config.yml" >nul
    if !errorlevel! equ 0 set "mensagem=Atualizar configuracao do Jekyll"
    
    echo !arquivo! | findstr /i "README\|index.md" >nul
    if !errorlevel! equ 0 set "mensagem=Atualizar documentacao"
    
    echo !arquivo! | findstr /i ".ps1\|.bat" >nul
    if !errorlevel! equ 0 set "mensagem=Adicionar scripts de automacao"
) else (
    set "mensagem=%~1"
)

echo.
echo ================================================
echo Mensagem do commit: !mensagem!
echo ================================================
echo.

set /p confirma="Deseja prosseguir com este commit? (S/n): "
if /i "!confirma!"=="n" (
    echo Commit cancelado.
    exit /b
)

git add .
git commit -m "!mensagem!"

if !errorlevel! equ 0 (
    echo.
    echo ✓ Commit realizado com sucesso!
    echo.
    set /p push="Deseja fazer push? (S/n): "
    if /i not "!push!"=="n" (
        git push
        if !errorlevel! equ 0 (
            echo ✓ Push realizado com sucesso!
        ) else (
            echo X Erro ao fazer push.
        )
    )
) else (
    echo X Erro ao fazer commit.
)
