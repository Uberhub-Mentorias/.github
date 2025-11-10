# Script para gerar mensagens de commit automáticas em português
# Uso: .\commit-auto.ps1 ou .\commit-auto.ps1 "mensagem customizada"

param(
    [string]$mensagemCustom = ""
)

# Obter arquivos modificados
$arquivosModificados = git diff --cached --name-only
if (-not $arquivosModificados) {
    $arquivosModificados = git diff --name-only
}

if (-not $arquivosModificados) {
    Write-Host "Nenhuma alteração detectada para commit." -ForegroundColor Yellow
    exit 1
}

# Função para gerar mensagem baseada nos arquivos
function Get-MensagemAutomatica {
    param([string[]]$arquivos)
    
    $configs = $arquivos | Where-Object { $_ -match '(_config\.yml|\.json|\.xml|Gemfile)' }
    $docs = $arquivos | Where-Object { $_ -match '\.(md|txt|pdf)$' }
    $scripts = $arquivos | Where-Object { $_ -match '\.(ps1|bat|sh)$' }
    $codigo = $arquivos | Where-Object { $_ -match '\.(java|js|ts|py|cs|rb|html|css|scss)$' }
    $layouts = $arquivos | Where-Object { $_ -match '(_layouts|_includes)' }
    $assets = $arquivos | Where-Object { $_ -match '(assets|images|css|js)/' }
    
    $tipo = ""
    $escopo = ""
    
    if ($configs) {
        $tipo = "config"
        $escopo = "configuração"
        if ($configs -match '_config\.yml') {
            return "Atualizar configuração do Jekyll"
        } elseif ($configs -match 'Gemfile') {
            return "Atualizar dependências do projeto"
        } else {
            return "Atualizar arquivos de configuração"
        }
    }
    
    if ($docs) {
        $tipo = "docs"
        $escopo = "documentação"
        if ($docs -match 'README') {
            return "Atualizar README do projeto"
        } elseif ($docs -match 'index\.md') {
            return "Atualizar página inicial"
        } else {
            return "Atualizar documentação"
        }
    }
    
    if ($scripts) {
        $tipo = "script"
        $escopo = "automação"
        return "Adicionar/atualizar scripts de automação"
    }
    
    if ($layouts) {
        $tipo = "layout"
        $escopo = "visual"
        return "Atualizar layout e templates"
    }
    
    if ($assets) {
        $tipo = "style"
        $escopo = "estilo"
        return "Atualizar estilos e recursos visuais"
    }
    
    if ($codigo) {
        $tipo = "feat"
        $escopo = "funcionalidade"
        return "Implementar novas funcionalidades"
    }
    
    # Mensagem genérica
    $numArquivos = $arquivos.Count
    if ($numArquivos -eq 1) {
        $nomeArquivo = Split-Path $arquivos[0] -Leaf
        return "Atualizar $nomeArquivo"
    } else {
        return "Atualizar $numArquivos arquivos do projeto"
    }
}

# Usar mensagem customizada ou gerar automática
if ($mensagemCustom) {
    $mensagem = $mensagemCustom
} else {
    $mensagem = Get-MensagemAutomatica -arquivos $arquivosModificados
}

# Mostrar resumo
Write-Host "`n📝 Preparando commit..." -ForegroundColor Cyan
Write-Host "Arquivos alterados:" -ForegroundColor Yellow
$arquivosModificados | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }
Write-Host "`nMensagem do commit:" -ForegroundColor Yellow
Write-Host "  $mensagem" -ForegroundColor Green

# Confirmar
$confirmacao = Read-Host "`nDeseja prosseguir com este commit? (S/n)"
if ($confirmacao -eq "" -or $confirmacao -eq "S" -or $confirmacao -eq "s") {
    # Adicionar todos os arquivos modificados
    git add .
    
    # Fazer commit
    git commit -m $mensagem
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ Commit realizado com sucesso!" -ForegroundColor Green
        
        # Perguntar se quer fazer push
        $push = Read-Host "Deseja fazer push para o repositório remoto? (S/n)"
        if ($push -eq "" -or $push -eq "S" -or $push -eq "s") {
            git push
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✅ Push realizado com sucesso!" -ForegroundColor Green
            } else {
                Write-Host "❌ Erro ao fazer push." -ForegroundColor Red
            }
        }
    } else {
        Write-Host "`n❌ Erro ao fazer commit." -ForegroundColor Red
    }
} else {
    Write-Host "`n❌ Commit cancelado." -ForegroundColor Yellow
}
