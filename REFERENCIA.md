# 📖 Referência de Ficheiros

Guia rápido de cada ficheiro do projeto.

---

## 📁 Raiz do Projeto

### `anti_afk.lua` ⭐ COMECE AQUI
- **Tipo:** Script integrado self-contained
- **Tamanho:** ~300 linhas
- **Uso:** Copy-paste direto em LocalScript
- **Inclui:** GUI + Anti-AFK completo
- **Vantagem:** Tudo em um ficheiro

**Como usar:**
```lua
-- Copie tudo de anti_afk.lua
-- Cole em: StarterPlayer > StarterCharacterScripts > LocalScript
-- Execute! (F5)
```

---

### `README.md`
- **Tipo:** Documentação principal
- **Conteúdo:** Visão geral, estrutura, features, recursos
- **Público:** Todos
- **Ler primeiro:** ✅ Sim

---

### `INICIO_RAPIDO.md` ⚡ LEIA ISTO
- **Tipo:** Guia rápido de início
- **Conteúdo:** 3 passos para começar
- **Tempo de leitura:** 2 minutos
- **Público:** Iniciantes

---

### `INSTALACAO.md`
- **Tipo:** Guia passo-a-passo
- **Conteúdo:** 3 métodos de instalação, troubleshooting
- **Tempo de leitura:** 10 minutos
- **Público:** Iniciantes que querem detalhes

---

### `CONFIGURACAO.md`
- **Tipo:** Guia de customização
- **Conteúdo:** Como mudar cores, posição, padrões
- **Tempo de leitura:** 15 minutos
- **Público:** Intermediários

---

### `EXEMPLOS.md`
- **Tipo:** Exemplos de código
- **Conteúdo:** 10 exemplos práticos
- **Tempo de leitura:** 15 minutos
- **Público:** Developers

---

## 📦 Pasta `src/`

Código modular separado em componentes.

### `src/Main.lua` - Ponto de entrada
- **Função:** Inicializa todo o sistema
- **Linhas:** ~80
- **Dependências:** AntiAFK, GuiBuilder, Logger, Config
- **O que faz:**
  - Cria instâncias dos componentes
  - Configura eventos do botão
  - Reinicia após spawn

**Editar se:** Quer mudar lógica principal

---

## 🎨 Pasta `src/gui/`

Interfaces gráficas.

### `src/gui/GuiBuilder.lua` - Construtor de UI
- **Função:** Cria e gerencia a interface gráfica
- **Linhas:** ~150
- **Responsabilidade:** 
  - Criar ScreenGui
  - Criar MainFrame com vidro
  - Adicionar bordas RGB animadas
  - Criar labels e botões
  - Animar bordas

**Métodos principais:**
```lua
GuiBuilder.new()              -- Cria nova instância
:createScreenGui(parent)      -- Cria GUI
:createMainFrame()            -- Cria frame principal
:createTitleLabel(parent)     -- Cria título
:createStatusLabel(parent)    -- Cria status
:createToggleButton(parent)   -- Cria botão
:animateRgbBorder()          -- Anima bordas
```

**Editar se:** 
- Quer mudar estilo da GUI
- Quer adicionar elementos
- Quer customizar animação RGB

---

## 🤖 Pasta `src/antiafk/`

Lógica do anti-AFK.

### `src/antiafk/AntiAFK.lua` - Controller principal
- **Função:** Controlador principal do anti-AFK
- **Linhas:** ~80
- **Responsabilidade:**
  - Gerenciar estado (running/stopped)
  - Executar padrões de movimento
  - Monitorar personagem
  - Reiniciar após spawn

**Métodos principais:**
```lua
AntiAFK.new(player)           -- Criar instância
:start()                      -- Iniciar
:stop()                       -- Parar
:run()                        -- Loop principal
:setPattern(name)             -- Mudar padrão
:getStatus()                  -- Obter status
```

**Editar se:**
- Quer alterar lógica de movimento
- Quer adicionar novos eventos
- Quer mudar sistema de padrões

---

### `src/antiafk/Movement.lua` - Sistema de movimento
- **Função:** Executa movimentos do personagem
- **Linhas:** ~50
- **Responsabilidade:**
  - Mover personagem em direções
  - Executar padrões de movimento
  - Fazer pulos
  - Parar movimento

**Métodos principais:**
```lua
Movement.new(config)          -- Criar instância
:moveToDirection(...)         -- Mover numa direção
:executePattern(...)          -- Executar padrão
:stop()                       -- Parar movimento
```

**Editar se:**
- Quer mudar como movimento funciona
- Quer adicionar novos tipos de movimento
- Quer otimizar movimento

---

### `src/antiafk/Config.lua` - Configurações anti-AFK
- **Função:** Centralizar configurações
- **Linhas:** ~40
- **Conteúdo:**
  - Versão e nome do jogo
  - Padrões de movimento (Default, Agressivo, etc)
  - Limites de segurança

**Editar se:**
- Quer adicionar novo padrão
- Quer mudar intervalos de movimento
- Quer mudar velocidade

**Exemplo de novo padrão:**
```lua
Circular = {
    moves = {
        { distance = 5, direction = Vector3.new(1, 0, 0), duration = 1 },
        { distance = 5, direction = Vector3.new(0, 0, 1), duration = 1 },
    },
    jumpInterval = 2,
}
```

---

## 🛠️ Pasta `src/utils/`

Utilitários e configurações.

### `src/utils/Logger.lua` - Sistema de logs
- **Função:** Registrar eventos e mensagens
- **Linhas:** ~35
- **Responsabilidade:**
  - Imprimir logs formatados
  - Suportar diferentes níveis (INFO, WARN, ERROR, DEBUG)
  - Adicionar timestamp

**Métodos principais:**
```lua
Logger:info(message)          -- Log informativo
Logger:warn(message)          -- Aviso
Logger:error(message)         -- Erro
Logger:debug(message)         -- Debug
```

**Exemplo:**
```lua
Logger:info("Sistema iniciado")
-- Output: [12:30:45] [INFO] Sistema iniciado
```

**Editar se:**
- Quer mudar formato dos logs
- Quer adicionar novos níveis
- Quer guardar logs em ficheiro

---

### `src/utils/Config.lua` - Configurações globais
- **Função:** Centralizar todas as configurações
- **Linhas:** ~50
- **Conteúdo:**
  - Versão, nome do jogo
  - Configurações de movimento
  - Configurações da GUI
  - Cores RGB
  - Tema (cores, tamanho, posição)

**Secções:**
```lua
Config.VERSION              -- "1.0.3"
Config.GAME_NAME            -- "HOC NOC Zoo"
Config.Movement             -- Intervalos de movimento
Config.GUI                  -- Posição, tamanho, atualização
Config.Colors               -- Cores RGB
Config.Theme                -- Cores de tema, transparência
```

**Editar se:**
- Quer mudar cores
- Quer mudar posição da GUI
- Quer mudar intervalos de atualização
- Quer mudar padrão de movimento default

---

## 🔍 Dependências Entre Ficheiros

```
Main.lua
├── require() GuiBuilder
│   ├── require() Config (utils)
│   └── require() Logger
├── require() AntiAFK
│   ├── require() Movement
│   ├── require() Config (antiafk)
│   └── require() Logger
├── require() Logger
└── require() Config (utils)
```

---

## 📊 Tabela de Responsabilidades

| Ficheiro | Cria | Controla | Usa |
|----------|------|----------|-----|
| Main.lua | - | Tudo | Todos |
| GuiBuilder | GUI | Interface | Config, Logger |
| AntiAFK | Controller | Movimento | Movement, Config, Logger |
| Movement | Movimentos | Personagem | - |
| Config (utils) | - | Configuração global | Todos |
| Config (antiafk) | - | Config anti-AFK | AntiAFK |
| Logger | - | Logs | Todos |

---

## 🎯 Resumo por Tarefa

### "Quero mudar cores"
→ Edite `src/utils/Config.lua` secção `Config.Theme`

### "Quero mudar GUI"
→ Edite `src/gui/GuiBuilder.lua`

### "Quero novo padrão de movimento"
→ Edite `src/antiafk/Config.lua` secção `Config.MovementPatterns`

### "Quero mudar lógica de movimento"
→ Edite `src/antiafk/Movement.lua`

### "Quero alterar lógica principal"
→ Edite `src/Main.lua`

### "Quero ver logs"
→ Abra console (F9) no Roblox

### "Quero começar rápido"
→ Use `anti_afk.lua`

---

## 📝 Tamanho dos Ficheiros (Aproximado)

```
anti_afk.lua              ~300 linhas   (integrado)
src/Main.lua              ~80 linhas
src/gui/GuiBuilder.lua    ~150 linhas
src/antiafk/AntiAFK.lua   ~80 linhas
src/antiafk/Movement.lua  ~50 linhas
src/antiafk/Config.lua    ~40 linhas
src/utils/Logger.lua      ~35 linhas
src/utils/Config.lua      ~50 linhas
────────────────────────────────────
Total (modular):          ~485 linhas
```

---

## ✅ Checklist de Início

- [ ] Leia `INICIO_RAPIDO.md` (2 min)
- [ ] Copie `anti_afk.lua` (1 min)
- [ ] Cole em LocalScript (1 min)
- [ ] Execute F5 (1 min)
- [ ] Clique "ATIVAR" (1 min)
- [ ] Veja GUI aparecer ✅
- [ ] Leia `README.md` para saber mais (5 min)
- [ ] Customize em `Config.lua` (opcional)

**Tempo total:** ~5 minutos para começar!

---

**Pronto?** → [INICIO_RAPIDO.md](INICIO_RAPIDO.md)
