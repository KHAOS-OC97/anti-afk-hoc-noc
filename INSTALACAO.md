# Guia de Instalação e Uso

## 📦 Instalação

### Método 1: Roblox Studio (Mais Simples)

1. **Abra o Roblox Studio** e seu projeto
2. **Navegue** até: `StarterPlayer` → `StarterCharacterScripts`
3. **Clique com botão direito** → `Insert Object` → `LocalScript`
4. **Limpe o conteúdo padrão** do script
5. **Copie o código de `anti_afk.lua`** para este novo script
6. **Salve** o projeto (Ctrl + S)
7. **Execute** o jogo (F5)
8. Uma **GUI aparecerá no canto superior esquerdo**
9. **Clique em "ATIVAR"** para iniciar o anti-AFK

### Método 2: Usando o Código Modular

Se você quer a estrutura completa com arquivos separados:

1. **Copie a pasta `src/`** para seu projeto
2. **Crie uma LocalScript** em `StarterPlayer` → `StarterPlayerScripts`
3. **Cole:**
```lua
require(game:GetService("ServerScriptService"):WaitForChild("src"):WaitForChild("Main"))
```

### Método 3: Executor Lua (Synapse X, Krnl, etc.)

1. **Copie o conteúdo completo de `anti_afk.lua`**
2. **Cole em seu executor**
3. **Execute o script**
4. A GUI aparecerá automaticamente

## 🎮 Como Usar

### Interface Principal

```
┌─────────────────────────────┐
│  HOC NOC Zoo v1.0.3    ✕    │
├─────────────────────────────┤
│                             │
│  Status: Inativo            │
│                             │
│       [ ATIVAR ]            │
│                             │
└─────────────────────────────┘
```

**Componentes:**
- **Título**: Mostra o nome do jogo e versão
- **Status**: Indica se o anti-AFK está ativo
- **Botão**: Ativa/desativa o anti-AFK

### Usar o Anti-AFK

1. Veja a GUI no canto superior esquerdo
2. Clique no botão **"ATIVAR"**
3. O status mudará para **"Ativo ✓"**
4. A borda ficará **verde**
5. Seu personagem começará a se mover automaticamente

### Desativar

1. Clique no botão **"DESATIVAR"**
2. A borda voltará para **ciano**
3. O movimento parará

## 🎨 Personalizações

### Mudar Cores

Edite `src/utils/Config.lua`:

```lua
Config.Theme = {
    BackgroundColor = Color3.fromRGB(15, 15, 20),     -- Cor de fundo
    BorderColor = Color3.fromRGB(0, 255, 255),        -- Cor da borda
    TextColor = Color3.fromRGB(200, 200, 200),        -- Cor do texto
}
```

### Mudar Posição da GUI

```lua
Config.GUI = {
    Position = UDim2.new(0.02, 0, 0.02, 0),  -- X, Y (canto superior esquerdo)
    Size = UDim2.new(0.25, 0, 0.15, 0),      -- Largura, Altura
}
```

### Mudar Padrão de Movimento

Edite `src/antiafk/Config.lua`:

```lua
Config.MovementPatterns = {
    Default = {
        moves = {
            { distance = 3, direction = Vector3.new(1, 0, 0), duration = 1.2 },
            -- Adicione mais movimentos aqui
        },
        jumpInterval = 2.4,
    }
}
```

## 📊 Logs

O script imprime logs no console do Roblox (F9):

```
[00:30:45] [INFO] ==========================================
[00:30:45] [INFO] Anti-AFK 1.0.3 iniciando...
[00:30:45] [INFO] ==========================================
[00:30:46] [INFO] GUI criada com sucesso
[00:30:50] [INFO] Anti-AFK ativado
```

## ⚙️ Configurações Avançadas

### Intervalo de Atualização da GUI

Em `src/utils/Config.lua`:

```lua
Config.GUI = {
    UpdateInterval = 0.5,  -- Atualiza a cada 0.5 segundos
}
```

### Velocidade de Movimento

Em `src/antiafk/Config.lua`:

```lua
Config.Movement = {
    MoveDistance = 3,      -- Distância de movimento
    MoveInterval = 1.2,    -- Tempo entre movimentos
    JumpInterval = 2.4,    -- Frequência de pulos
}
```

## 🐛 Troubleshooting

### A GUI não aparece
- Verifique se o script está em `StarterCharacterScripts`
- Verifique o console (F9) por erros
- Tente usar o arquivo `anti_afk.lua` integrado

### O Anti-AFK não funciona
- Verifique se o personagem está vivo
- Veja os logs no console
- Tente desativar e ativar novamente

### Sou kickado como AFK mesmo assim
- Aumente a velocidade de movimento
- Adicione mais padrões de movimento
- Tente adicionar input/chat periodicamente

## ⚖️ Aviso Legal

⚠️ **IMPORTANTE:**

- Use este script **por sua conta e risco**
- Nem todos os jogos Roblox permitem anti-AFK
- Você pode ser **banido** se usar em jogo que proíbe
- Verifique os **Termos de Serviço** do jogo
- Use **responsavelmente**

## 📝 Changelog

### v1.0.3
- ✨ GUI com vidro e bordas RGB
- 🎨 Tema escuro elegante
- 📦 Código modular e organizado
- 📊 Sistema de logs integrado
- 🔄 Suporte a respawn automático

---

**Precisa de ajuda?** Verifique o arquivo README.md
