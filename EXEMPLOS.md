# Exemplos de Uso

## 📚 Exemplos Práticos

### Exemplo 1: Uso Básico (Integrado)

Use o arquivo `anti_afk.lua` diretamente:

```lua
-- Basta copiar e colar em um LocalScript ou Executor
-- Tudo já está incluído e pronto para usar
```

**Resultado:**
- GUI aparece no canto superior esquerdo
- Clique "ATIVAR" para começar
- Clique "DESATIVAR" para parar

---

### Exemplo 2: Usar o Sistema Modular

Se você quer customizar cada componente:

```lua
-- Em StarterCharacterScripts ou StarterPlayerScripts
local GuiBuilder = require(script.Parent.src.gui.GuiBuilder)
local AntiAFK = require(script.Parent.src.antiafk.AntiAFK)
local Logger = require(script.Parent.src.utils.Logger)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local antiAFKController = AntiAFK.new(player)

-- Iniciar
antiAFKController:start()
Logger:info("Anti-AFK iniciado!")

-- Parar
antiAFKController:stop()
```

---

### Exemplo 3: Customizar Cores

Edite `src/utils/Config.lua`:

```lua
Config.Theme = {
    BackgroundColor = Color3.fromRGB(30, 30, 40),  -- Mais claro
    TextColor = Color3.fromRGB(255, 255, 255),      -- Branco
    BorderColor = Color3.fromRGB(255, 0, 255),      -- Magenta
}
```

---

### Exemplo 4: Adicionar Hotkey

Modifique `src/Main.lua`:

```lua
local UserInputService = game:GetService("UserInputService")

-- Ativar com F6
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.F6 and not gameProcessed then
        isActive = not isActive
        -- Execute o código de ativação
    end
end)
```

---

### Exemplo 5: Múltiplos Padrões de Movimento

Em `src/antiafk/Config.lua`:

```lua
Config.MovementPatterns = {
    Default = {
        moves = {
            { distance = 3, direction = Vector3.new(1, 0, 0), duration = 1.2 },
            { distance = 3, direction = Vector3.new(-1, 0, 0), duration = 1.2 },
        },
        jumpInterval = 2.4,
    },
    Agressivo = {
        moves = {
            { distance = 10, direction = Vector3.new(1, 0, 0), duration = 0.5 },
            { distance = 10, direction = Vector3.new(-1, 0, 0), duration = 0.5 },
            { distance = 10, direction = Vector3.new(0, 0, 1), duration = 0.5 },
            { distance = 10, direction = Vector3.new(0, 0, -1), duration = 0.5 },
        },
        jumpInterval = 1,
    },
    Discreto = {
        moves = {
            { distance = 1, direction = Vector3.new(1, 0, 0), duration = 2 },
            { distance = 1, direction = Vector3.new(-1, 0, 0), duration = 2 },
        },
        jumpInterval = 5,
    }
}
```

Use em `src/Main.lua`:

```lua
-- Mudar padrão dinamicamente
antiAfkController:setPattern("Agressivo")
```

---

### Exemplo 6: GUI Customizada

Se quiser criar uma GUI diferente, use `GuiBuilder`:

```lua
local GuiBuilder = require(script.Parent.src.gui.GuiBuilder)
local Config = require(script.Parent.src.utils.Config)

local gui = GuiBuilder.new()
gui:createScreenGui()
local mainFrame = gui:createMainFrame()

-- Customizar cores
Config.Theme.BackgroundColor = Color3.fromRGB(20, 20, 25)
Config.Colors.Cyan = Color3.fromRGB(0, 200, 255)

-- Criar elementos
local title = gui:createTitleLabel(mainFrame, "Meu Anti-AFK")
local button = gui:createToggleButton(mainFrame)

-- Animar borda
gui:animateRgbBorder()
```

---

### Exemplo 7: Logs Customizados

Em qualquer módulo:

```lua
local Logger = require(script.Parent.utils.Logger)

Logger:info("Sistema iniciado")
Logger:debug("Debug: variável x = " .. tostring(x))
Logger:warn("Aviso: performance baixa")
Logger:error("Erro: personagem não encontrado")
```

**Saída no console:**
```
[12:30:45] [INFO] Sistema iniciado
[12:30:46] [DEBUG] Debug: variável x = 42
[12:30:47] [WARN] Aviso: performance baixa
[12:30:48] [ERROR] Erro: personagem não encontrado
```

---

### Exemplo 8: Monitorar Status

Adicione em `src/Main.lua`:

```lua
task.spawn(function()
    while true do
        task.wait(5)  -- A cada 5 segundos
        
        local status = antiAfkController:getStatus()
        Logger:info(string.format(
            "Status: Running=%s, Padrão=%s, Personagem=%s",
            tostring(status.running),
            tostring(status.pattern),
            tostring(status.character)
        ))
    end
end)
```

---

### Exemplo 9: Integração com Outro Script

Se você tem outro script que quer integrar:

```lua
-- Seu script
local MainScript = require(script.Parent.src.Main)

-- Agora seu script pode:
-- 1. Criar GUI personalizada
-- 2. Usar o controller do AntiAFK
-- 3. Adicionar funcionalidades extras
```

---

### Exemplo 10: Versão Minificada para Executor

Se você quer usar apenas um ficheiro pequeno:

1. Use `anti_afk.lua` (já está otimizado)
2. Ou copie apenas o essencial:

```lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Simples função de movimento
local function movePlayer()
    while true do
        local char = player.Character
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        
        if hum and hum.Health > 0 and root then
            hum:MoveTo(root.Position + Vector3.new(3, 0, 0))
            task.wait(1)
            hum:MoveTo(root.Position + Vector3.new(-3, 0, 0))
            task.wait(1)
            hum.Jump = true
            task.wait(1)
        else
            task.wait(1)
        end
    end
end

task.spawn(movePlayer)
```

---

## 🎯 Dicas Úteis

1. **Para jogos específicos**: Customize o padrão de movimento
2. **Para máxima discrição**: Use padrão "Discreto"
3. **Para máxima performance**: Reduza `UpdateInterval`
4. **Para debug**: Habilite logs e console (F9)
5. **Para customização total**: Edite os ficheiros em `src/`

---

**Próximo passo:** Veja [INSTALACAO.md](INSTALACAO.md) para instruções de instalação
