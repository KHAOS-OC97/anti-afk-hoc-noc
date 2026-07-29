# 📚 Índice de Documentação

Guia completo de navegação da documentação.

---

## 🚀 Comece Aqui

1. **[INICIO_RAPIDO.md](INICIO_RAPIDO.md)** ⚡ (2 min)
   - Início em 3 passos
   - Guia visual
   - Links úteis

2. **[ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md)** 🛡️ (5 min)
   - Dois tipos de anti-AFK
   - Qual usar?
   - Comparação lado a lado

3. **[README.md](README.md)** (5 min)
   - Visão geral do projeto
   - Features principais
   - Estrutura básica

---

## 📖 Documentação Principal

### Para Iniciantes

- **[ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md)** - Comparação de métodos
  - Anti-AFK com Movimento vs Parado
  - Qual usar em cada caso
  - Como funciona VirtualUser

- **[INSTALACAO.md](INSTALACAO.md)** - 3 métodos de instalação
  - Roblox Studio
  - Código modular
  - Executor Lua
  - Troubleshooting

- **[EXEMPLOS.md](EXEMPLOS.md)** - 10 exemplos práticos
  - Uso básico
  - Customizações simples
  - Integração com outros scripts

### Para Intermediários

- **[CONFIGURACAO.md](CONFIGURACAO.md)** - Guia de personalização
  - Mudar cores
  - Posição da GUI
  - Padrões de movimento
  - Logs
  - Extensões

### Para Developers

- **[REFERENCIA.md](REFERENCIA.md)** - Referência técnica completa
  - Cada ficheiro explicado
  - Métodos e funções
  - Dependências
  - Tabelas de responsabilidades

---

## 📁 Estrutura de Ficheiros

```
anti-afk-hoc-noc/
│
├─ 📖 DOCUMENTAÇÃO
│  ├── README.md                 ← Visão geral
│  ├── INICIO_RAPIDO.md          ← ⚡ COMECE AQUI
│  ├── INSTALACAO.md             ← Passo-a-passo
│  ├── CONFIGURACAO.md           ← Customizações
│  ├── EXEMPLOS.md               ← Código de exemplo
│  ├── REFERENCIA.md             ← Guia técnico
│  └── INDICE.md                 ← Este arquivo
│
├─ 💻 CÓDIGO (Choose One)
│  ├── anti_afk.lua              ← ⭐ COPY-PASTE (recomendado)
│  │   [300 linhas, self-contained]
│  │
│  └── src/                      ← Versão modular (avançado)
│      ├── Main.lua
│      ├── gui/GuiBuilder.lua
│      ├── antiafk/
│      │   ├── AntiAFK.lua
│      │   ├── Movement.lua
│      │   └── Config.lua
│      └── utils/
│          ├── Logger.lua
│          └── Config.lua
```

---

## 🎯 Guia por Objetivo

### "Quero começar AGORA"
1. Abra [INICIO_RAPIDO.md](INICIO_RAPIDO.md)
2. Copie `anti_afk.lua`
3. Cole em LocalScript
4. Clique "ATIVAR"

**Tempo:** 5 minutos

---

### "Quero entender como funciona"
1. Leia [README.md](README.md)
2. Veja estrutura em [REFERENCIA.md](REFERENCIA.md)
3. Veja exemplos em [EXEMPLOS.md](EXEMPLOS.md)

**Tempo:** 20 minutos

---

### "Quero customizar cores/posição"
1. Vá a [CONFIGURACAO.md](CONFIGURACAO.md)
2. Seção: "Mudar Cores"
3. Seção: "Mudar Posição da GUI"
4. Edite `src/utils/Config.lua`

**Tempo:** 10 minutos

---

### "Quero criar novo padrão de movimento"
1. Vá a [CONFIGURACAO.md](CONFIGURACAO.md)
2. Seção: "Adicionar Novos Padrões de Movimento"
3. Edite `src/antiafk/Config.lua`
4. Veja exemplos em [EXEMPLOS.md](EXEMPLOS.md)

**Tempo:** 15 minutos

---

### "Quero entender cada ficheiro"
1. Leia [REFERENCIA.md](REFERENCIA.md)
2. Abra cada ficheiro em `src/`
3. Leia os comentários

**Tempo:** 30 minutos

---

### "Tenho um erro"
1. Veja console (F9)
2. Vá a [INSTALACAO.md](INSTALACAO.md) - Troubleshooting
3. Veja [EXEMPLOS.md](EXEMPLOS.md) para código correto

**Tempo:** 10 minutos

---

## 📊 Tabela de Conteúdos

| Documento | Público | Tempo | Conteúdo |
|-----------|---------|-------|----------|
| README.md | Todos | 5 min | Visão geral, features, estrutura |
| INICIO_RAPIDO.md | Iniciantes | 2 min | Primeiros passos |
| ANTI_AFK_PARADO.md | Todos | 5 min | Comparação de métodos anti-AFK |
| INSTALACAO.md | Iniciantes | 10 min | 3 métodos de instalação |
| CONFIGURACAO.md | Intermediários | 15 min | Customizações e opções |
| EXEMPLOS.md | Developers | 15 min | 10 exemplos de código |
| REFERENCIA.md | Developers | 20 min | Guia técnico completo |
| INDICE.md | Todos | 5 min | Este arquivo |

---

## 🔍 Buscar por Tópico

### 🎨 GUI e Interface
- Cores: [CONFIGURACAO.md](CONFIGURACAO.md#-personalizar-cores-rgb)
- Posição: [CONFIGURACAO.md](CONFIGURACAO.md#-mudar-posição-da-gui)
- Animação RGB: [REFERENCIA.md](REFERENCIA.md#srcguiguibuilder-lua)

### 🤖 Anti-AFK e Movimento
- Padrões: [CONFIGURACAO.md](CONFIGURACAO.md#-adicionar-novos-padrões-de-movimento)
- Velocidade: [CONFIGURACAO.md](CONFIGURACAO.md#intervalo-de-atualização-da-gui)
- Lógica: [REFERENCIA.md](REFERENCIA.md#srcantiaafkantiaafklua)

### 🔧 Configuração
- Cores: [CONFIGURACAO.md](CONFIGURACAO.md#-personalizar-cores-rgb)
- Movimento: [CONFIGURACAO.md](CONFIGURACAO.md#-mudar-padrão-de-movimento)
- Logs: [CONFIGURACAO.md](CONFIGURACAO.md#-sistema-de-logs)

### 💻 Código
- Básico: [EXEMPLOS.md](EXEMPLOS.md#exemplo-1-uso-básico-integrado)
- Modular: [EXEMPLOS.md](EXEMPLOS.md#exemplo-2-usar-o-sistema-modular)
- Avançado: [EXEMPLOS.md](EXEMPLOS.md#exemplo-5-múltiplos-padrões-de-movimento)

### 🐛 Troubleshooting
- Erros: [INSTALACAO.md](INSTALACAO.md#-troubleshooting)
- Performance: [CONFIGURACAO.md](CONFIGURACAO.md#-otimizações)

---

## ⏱️ Tempo Total de Leitura

- **Mínimo (Just Start):** 5 minutos
  - INICIO_RAPIDO.md

- **Básico:** 15 minutos
  - INICIO_RAPIDO.md
  - README.md
  - Primeiros 3 exemplos

- **Completo:** 60 minutos
  - Todos os documentos
  - Todos os exemplos
  - Exploração de código

---

## 📋 Checklist de Documentação

- [x] README.md - Documentação principal
- [x] INICIO_RAPIDO.md - Guia rápido
- [x] INSTALACAO.md - Instalação passo-a-passo
- [x] CONFIGURACAO.md - Guia de customização
- [x] EXEMPLOS.md - 10 exemplos de código
- [x] REFERENCIA.md - Guia técnico
- [x] INDICE.md - Este arquivo

**Total de documentação:** ~40KB de conteúdo

---

## 🎓 Curva de Aprendizado

```
Experiência          Tempo    Recomendação
───────────────────────────────────────────
Iniciante (0-1h)     5 min  → INICIO_RAPIDO.md
                     +5 min → README.md
                     +5 min → Usar anti_afk.lua

Intermediário (1-8h) +10 min → INSTALACAO.md
                     +15 min → CONFIGURACAO.md
                     +15 min → EXEMPLOS.md

Avançado (8h+)       +20 min → REFERENCIA.md
                     +30 min → Explorar src/
                     +30 min → Customizar código
```

---

## 🚀 Começar Agora

1. **Clique:** [INICIO_RAPIDO.md](INICIO_RAPIDO.md)
2. **Copie:** [anti_afk.lua](anti_afk.lua)
3. **Cole:** Em LocalScript
4. **Execute:** F5

**Pronto em 5 minutos!**

---

## 📞 Links Rápidos

| Ação | Link |
|------|------|
| Começar rápido | [INICIO_RAPIDO.md](INICIO_RAPIDO.md) |
| Escolher tipo de anti-AFK | [ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md) |
| Instalar | [INSTALACAO.md](INSTALACAO.md) |
| Customizar | [CONFIGURACAO.md](CONFIGURACAO.md) |
| Ver exemplos | [EXEMPLOS.md](EXEMPLOS.md) |
| Referência técnica | [REFERENCIA.md](REFERENCIA.md) |
| Script com movimento | [anti_afk.lua](anti_afk.lua) |
| Script parado (VirtualUser) | [anti_afk_parado.lua](anti_afk_parado.lua) |
| Código modular | [src/](src/) |

---

## 📱 Versão Mobile

Para ler no telemóvel:
1. Copie o link do documento
2. Abra no navegador do telemóvel
3. Leia no GitHub

Documentação está em Markdown, otimizada para mobile!

---

**Última atualização:** 2026-07-29  
**Versão:** 1.0.3  
**Status:** ✅ Documentação completa
