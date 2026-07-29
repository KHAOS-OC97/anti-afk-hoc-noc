# Configuração de Desenvolvimento

## 📋 Estrutura de Ficheiros

```
anti-afk-hoc-noc/
├── README.md                 # Documentação principal
├── INSTALACAO.md            # Guia de instalação
├── CONFIGURACAO.md          # Este ficheiro
├── anti_afk.lua             # Script integrado (v1)
└── src/                     # Código modular (v2)
    ├── Main.lua             # Ponto de entrada
    ├── gui/
    │   └── GuiBuilder.lua   # Construtor de UI
    ├── antiafk/
    │   ├── AntiAFK.lua      # Controller principal
    │   ├── Movement.lua     # Sistema de movimento
    │   └── Config.lua       # Config do anti-AFK
    └── utils/
        ├── Logger.lua       # Sistema de logs
        └── Config.lua       # Config geral
```

## 🔧 Ficheiros de Configuração

### 1. `src/utils/Config.lua`

Configurações gerais do sistema:

```lua
Config.VERSION = "1.0.3"                    -- Versão
Config.GAME_NAME = "HOC NOC Zoo"            -- Nome do jogo

Config.Movement = {
    MoveDistance = 3,       -- Distância em studs
    MoveInterval = 1.2,     -- Tempo entre movimentos
    JumpInterval = 2.4,     -- Tempo entre pulos
}

Config.GUI = {
    Position = UDim2.new(0.02, 0, 0.02, 0),  -- Posição (X, Y)
    Size = UDim2.new(0.25, 0, 0.15, 0),      -- Tamanho (W, H)
    UpdateInterval = 0.5,                     -- Atualização da GUI
}

Config.Theme = {
    BackgroundColor = Color3.fromRGB(15, 15, 20),      -- Fundo
    TextColor = Color3.fromRGB(200, 200, 200),         -- Texto
    BorderColor = Color3.fromRGB(0, 255, 255),         -- Borda
    CornerRadius = 8,                                   -- Cantos
}
```

### 2. `src/antiafk/Config.lua`

Configurações específicas do anti-AFK:

```lua
Config.Enabled = true                       -- Ativa/desativa
Config.AutoStartOnSpawn = true              -- Inicia ao spawn

Config.MovementPatterns = {
    Default = {
        moves = {
            { distance = 3, direction = Vector3.new(1, 0, 0), duration = 1.2 },
            { distance = 3, direction = Vector3.new(-1, 0, 0), duration = 1.2 },
            -- ... mais movimentos
        },
        jumpInterval = 2.4,
    }
}
```

## 🎨 Personalizar Cores RGB

### Cores Disponíveis

Em `src/utils/Config.lua`:

```lua
Config.Colors = {
    Red = Color3.fromRGB(255, 0, 0),        -- Vermelho
    Green = Color3.fromRGB(0, 255, 0),      -- Verde
    Blue = Color3.fromRGB(0, 0, 255),       -- Azul
    Cyan = Color3.fromRGB(0, 255, 255),     -- Ciano
    Magenta = Color3.fromRGB(255, 0, 255),  -- Magenta
    Yellow = Color3.fromRGB(255, 255, 0),   -- Amarelo
}
```

### Mudar Sequência de Animação

Em `src/gui/GuiBuilder.lua`:

```lua
self.rgbColors = {
    Config.Colors.Red,
    Config.Colors.Green,
    Config.Colors.Blue,
    -- Customize aqui a ordem
}
```

### Desabilitar Animação RGB

Comente a linha em `src/Main.lua`:

```lua
-- guiBuilder:animateRgbBorder()  -- Descomente para animar
```

## 📍 Mudar Posição da GUI

### Cantos da Tela

```lua
-- Canto superior esquerdo (padrão)
Position = UDim2.new(0.02, 0, 0.02, 0)

-- Canto superior direito
Position = UDim2.new(0.73, 0, 0.02, 0)

-- Canto inferior esquerdo
Position = UDim2.new(0.02, 0, 0.85, 0)

-- Canto inferior direito
Position = UDim2.new(0.73, 0, 0.85, 0)

-- Centro
Position = UDim2.new(0.375, 0, 0.425, 0)
```

## 🎮 Adicionar Novos Padrões de Movimento

1. Edite `src/antiafk/Config.lua`
2. Adicione um novo padrão:

```lua
Config.MovementPatterns = {
    Default = { ... },
    Quadrado = {
        moves = {
            { distance = 5, direction = Vector3.new(1, 0, 0), duration = 1 },
            { distance = 5, direction = Vector3.new(0, 0, 1), duration = 1 },
            { distance = 5, direction = Vector3.new(-1, 0, 0), duration = 1 },
            { distance = 5, direction = Vector3.new(0, 0, -1), duration = 1 },
        },
        jumpInterval = 2,
    },
    Circulo = { ... }
}
```

3. Use em `src/Main.lua`:

```lua
antiAfkController:setPattern("Quadrado")
```

## 🎯 Sistema de Logs

Ver logs em tempo real no console do Roblox (F9):

```lua
Logger:info("Mensagem informativa")
Logger:warn("Aviso")
Logger:error("Erro")
Logger:debug("Debug")
```

Cada log mostra:
- Timestamp: `[HH:MM:SS]`
- Nível: `[INFO]`, `[WARN]`, `[ERROR]`, `[DEBUG]`
- Mensagem: Seu texto

## 🔌 Extensões

### Adicionar Novo Módulo

1. Crie o ficheiro em `src/novo_modulo/Modulo.lua`
2. Exporte as funções:

```lua
local Modulo = {}

function Modulo.nova_funcao()
    -- Código aqui
end

return Modulo
```

3. Importe em outro ficheiro:

```lua
local Modulo = require(script.Parent.novo_modulo.Modulo)
Modulo.nova_funcao()
```

### Integrar com Main.lua

Edite `src/Main.lua`:

```lua
local SeuModulo = require(script.Parent.seu_modulo.SeuModulo)

-- Use dentro da lógica principal
```

## 📦 Build e Deploy

### Compilar em um Único Ficheiro

Para usar apenas `anti_afk.lua` (versão integrada):

```bash
cat src/antiafk/*.lua src/gui/*.lua src/utils/*.lua src/Main.lua > anti_afk_full.lua
```

### Distribuir

1. Copie `anti_afk.lua` ou a pasta `src/`
2. Compartilhe com outros desenvolvedores
3. Inclua o README.md

## 🧪 Testing

Para testar localmente no Roblox Studio:

1. Crie um novo jogo no Studio
2. Crie uma LocalScript em `StarterCharacterScripts`
3. Cole o conteúdo de `src/Main.lua`
4. Pressione F5 para executar
5. Verifique a GUI e os logs (F9)

## 📈 Performance

### Otimizações

- **UpdateInterval**: Reduzir `0.5` → `1` para menos atualizações
- **RGB Animation**: Desabilitar se não precisar
- **Movement Speed**: Aumentar intervalos para movimento mais lento

### Monitoramento

No console, observe:
- FPS do jogo
- CPU/Memória do Roblox Studio
- Tempo de resposta da GUI

---

**Última atualização:** 2026-07-29
