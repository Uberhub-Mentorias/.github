# 🤖 Scripts de Commit Automático em Português

Scripts para facilitar commits com mensagens automáticas em português baseadas nos arquivos modificados.

## 📋 Arquivos

- **commit-auto.ps1** - Script PowerShell (recomendado)
- **commit-auto.bat** - Script Batch para cmd.exe
- **.gitmessage** - Template de commit em português

## 🚀 Como Usar

### PowerShell (Recomendado)

```powershell
# Commit automático (mensagem gerada automaticamente)
.\commit-auto.ps1

# Commit com mensagem customizada
.\commit-auto.ps1 "Adicionar nova funcionalidade de mentorias"
```

### CMD/Batch

```cmd
REM Commit automático
commit-auto.bat

REM Commit com mensagem customizada
commit-auto.bat "Corrigir bug no formulário"
```

## 🎯 Mensagens Automáticas Geradas

O script detecta o tipo de arquivo modificado e gera mensagens apropriadas:

| Tipo de Arquivo           | Mensagem Exemplo                           |
| ------------------------- | ------------------------------------------ |
| `_config.yml`             | "Atualizar configuração do Jekyll"         |
| `Gemfile`                 | "Atualizar dependências do projeto"        |
| `README.md`               | "Atualizar README do projeto"              |
| `index.md`                | "Atualizar página inicial"                 |
| `.ps1`, `.bat`            | "Adicionar/atualizar scripts de automação" |
| `_layouts/`, `_includes/` | "Atualizar layout e templates"             |
| `assets/`, `css/`         | "Atualizar estilos e recursos visuais"     |
| Arquivos de código        | "Implementar novas funcionalidades"        |
| Múltiplos arquivos        | "Atualizar X arquivos do projeto"          |

## ✨ Funcionalidades

- ✅ Detecção automática de arquivos modificados
- ✅ Geração inteligente de mensagens em português
- ✅ Confirmação antes de commit
- ✅ Opção de push automático após commit
- ✅ Suporte para mensagens customizadas
- ✅ Resumo visual dos arquivos alterados

## 🔧 Configuração Adicional

### Habilitar execução de scripts PowerShell (se necessário)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Configurar atalho no VS Code (opcional)

Adicione em `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Commit Automático",
      "type": "shell",
      "command": ".\\commit-auto.ps1",
      "problemMatcher": [],
      "group": {
        "kind": "build",
        "isDefault": false
      }
    }
  ]
}
```

Depois use `Ctrl+Shift+B` e selecione "Commit Automático".

## 📝 Template de Commit Manual

Se preferir escrever commits manualmente com orientação em português:

```bash
git commit
```

Isso abrirá o editor com o template em português definido em `.gitmessage`.

## 🎨 Personalização

Edite `commit-auto.ps1` para adicionar suas próprias regras de mensagens:

```powershell
# Exemplo: adicionar regra para arquivos Java
if ($codigo -match '\.java$') {
    return "Implementar funcionalidade em Java"
}
```

## 📚 Convenções de Commit (Conventional Commits)

Os scripts seguem padrões similares a:

- **config:** mudanças de configuração
- **docs:** documentação
- **feat:** nova funcionalidade
- **style:** formatação, estilos
- **refactor:** refatoração de código

---

**Desenvolvido para:** Projeto Uber Mentorias  
**Instituição:** IFTM - Campus Uberlândia Centro
