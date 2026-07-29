# 🛡️ Anti-AFK Parado vs Movimento

Dois tipos de anti-AFK disponíveis. Escolha o que preferir!

---

## 📊 Comparação

| Aspecto | Anti-AFK com Movimento | Anti-AFK Parado |
|---------|------------------------|-----------------|
| **Movimento** | ✅ Sim (4 direções) | ❌ Não (parado) |
| **Pulos** | ✅ Sim | ❌ Não |
| **Método** | Humanoid:MoveTo() | VirtualUser (cliques) |
| **Discrição** | Médio | Muito alto ✨ |
| **Compatibilidade** | Todos os jogos | Maioria dos jogos |
| **Visibilidade** | Pode ser notado | Não se mexe |
| **Arquivo** | `anti_afk.lua` | `anti_afk_parado.lua` |
| **Pasta** | `src/Main.lua` | `src/MainAFK.lua` |

---

## 🎯 Qual Usar?

### Use **Anti-AFK com Movimento** se:
- Quer que o personagem se mova
- O jogo permite movimento livre
- Quer efeito visível

**Arquivo:** [anti_afk.lua](anti_afk.lua)

---

### Use **Anti-AFK Parado** se:
- Quer ficar completamente parado ⭐
- Quer máxima discrição
- O jogo detecta inatividade via timeout
- Quer evitar ser notado

**Arquivo:** [anti_afk_parado.lua](anti_afk_parado.lua)

---

## 🚀 Como Usar Anti-AFK Parado

### Opção 1: Script Integrado (Recomendado)

1. Abra [anti_afk_parado.lua](anti_afk_parado.lua)
2. Copie **todo** o conteúdo
3. Roblox Studio → `StarterPlayer > StarterCharacterScripts` → LocalScript
4. Cole o código
5. Pressione F5
6. Clique "ATIVAR"

**Tempo:** 5 minutos

---

### Opção 2: Versão Modular

1. Abra [src/MainAFK.lua](src/MainAFK.lua)
2. Use como referência para integração

---

## 🔧 Como Funciona

### Anti-AFK com Movimento

```lua
-- Movimento em 4 direções
humanoid:MoveTo(rootPart.Position + Vector3.new(3, 0, 0))
task.wait(1.2)
humanoid:MoveTo(rootPart.Position + Vector3.new(-3, 0, 0))
task.wait(1.2)

-- Pulos periódicos
humanoid.Jump = true
```

**Resultado:** Personagem se move visualmente

---

### Anti-AFK Parado

```lua
-- Conecta ao evento Idled do jogador
player.Idled:Connect(function()
    -- Captura o controlador
    VirtualUser:CaptureController()
    -- Simula um clique (sem movimento visual)
    VirtualUser:ClickButton1(Vector2.new(0, 0))
end)
```

**Resultado:** Personagem **não se mexe**, apenas cliques virtuais

---

## 💡 O Que é VirtualUser?

`VirtualUser` é um serviço do Roblox que permite simular entrada do usuário:
- **CaptureController()**: Captura o controle do jogador
- **ClickButton1()**: Simula um clique do mouse
- **Button2Down/Button2Up**: Simula segurar botão direito

**Vantagem:** Engana o anti-AFK do Roblox sem movimento visível

---

## 📝 GUI em Ambos

Ambas versões têm a mesma GUI elegante:
- 🎨 Fundo vidro semi-transparente
- 🌈 Bordas RGB animadas
- 📊 Indicador de status
- 🔘 Botão grande

**Única diferença:** Título indica o tipo

- **Com Movimento:** "HOC NOC Zoo v1.0.3"
- **Parado:** "🛡️ Anti-AFK Parado"

---

## ⚙️ Customização

### Mudar Método Anti-AFK Parado

Edite [src/antiafk/AFK.lua](src/antiafk/AFK.lua):

```lua
-- Usar Button2 ao invés de ClickButton1
VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
task.wait(0.5)
VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
```

### Mudar Intervalo de Cliques

Adicione intervalo de atualização em config:

```lua
-- A cada N segundos, faz um clique
task.spawn(function()
    while isRunning do
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end)
        task.wait(30)  -- A cada 30 segundos
    end
end)
```

---

## 🎮 Compatibilidade

### Anti-AFK com Movimento ✅
- ✅ Funciona em quase todos os jogos
- ❌ Pode ser detectado visualmente
- ⚠️ Alguns jogos podem bloquear

### Anti-AFK Parado ✅
- ✅ Máxima compatibilidade
- ✅ Não é visível
- ✅ Mais seguro
- ⚠️ Raramente bloqueado

---

## ⚖️ Aviso Legal

Ambos os métodos:
- Use por sua conta e risco
- Respeite os Termos de Serviço do jogo
- Você pode ser banido
- Use com responsabilidade

**VirtualUser é mais seguro, mas continue sendo cauteloso.**

---

## 📂 Ficheiros Relacionados

### Anti-AFK com Movimento
- [anti_afk.lua](anti_afk.lua) - Script integrado
- [src/Main.lua](src/Main.lua) - Versão modular
- [src/antiafk/AntiAFK.lua](src/antiafk/AntiAFK.lua) - Controller
- [src/antiafk/Movement.lua](src/antiafk/Movement.lua) - Sistema movimento

### Anti-AFK Parado
- [anti_afk_parado.lua](anti_afk_parado.lua) - Script integrado ⭐
- [src/MainAFK.lua](src/MainAFK.lua) - Versão modular
- [src/antiafk/AFK.lua](src/antiafk/AFK.lua) - Controller VirtualUser

### Compartilhado
- [src/gui/GuiBuilder.lua](src/gui/GuiBuilder.lua) - Interface
- [src/utils/Config.lua](src/utils/Config.lua) - Configurações
- [src/utils/Logger.lua](src/utils/Logger.lua) - Logs

---

## 🎯 Resumo

**Quer simplicidade?** → Use [anti_afk_parado.lua](anti_afk_parado.lua) (copy-paste)

**Quer personalizar?** → Use [src/MainAFK.lua](src/MainAFK.lua)

**Quer movimento?** → Use [anti_afk.lua](anti_afk.lua)

---

**Versão:** 1.0.3  
**Última atualização:** 2026-07-29
