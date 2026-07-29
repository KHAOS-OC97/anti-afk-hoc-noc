# anti-afk-hoc-noc

Anti-AFK profissional e estruturado para Roblox, com GUI elegante estilo vidro RGB.

## 📋 Estrutura do Projeto

```
src/
├── gui/
│   └── GuiBuilder.lua       # Construtor de UI com vidro e borda RGB
├── antiafk/
│   ├── AntiAFK.lua          # Controlador principal
│   ├── Movement.lua         # Lógica de movimento
│   └── Config.lua           # Configurações do Anti-AFK
├── utils/
│   ├── Logger.lua           # Sistema de logs
│   └── Config.lua           # Configurações gerais
└── Main.lua                 # Ponto de entrada
```

## 🚀 Como usar

### Opção 1: Usar via Roblox Studio (Recomendado)

Escolha o tipo de anti-AFK:

**🚶 Com Movimento** (padrão)
1. Abra [anti_afk.lua](anti_afk.lua)
2. Copie todo o código
3. Roblox Studio → **Explorer** → **StarterPlayer** → **StarterCharacterScripts**
4. Clique com botão direito → **Insert Object** → **LocalScript**
5. Cole o código e salve
6. Pressione F5 para testar
7. Clique em "ATIVAR" na GUI

**🛡️ Parado (Sem Movimento)** - Novo!
1. Abra [anti_afk_parado.lua](anti_afk_parado.lua)
2. Copie todo o código
3. Mesmos passos acima...
4. Personagem ficará parado com cliques virtuais

**Qual escolher?** → Leia [ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md)

### Opção 2: Usar via Executor (Synapse X, Krnl, etc.)

1. Copie o conteúdo de `anti_afk.lua` ou `anti_afk_parado.lua`
2. Cole em um executor Lua
3. Execute o script
4. A GUI aparecerá e você pode ativar o Anti-AFK

## ✨ Recursos

- ✨ **GUI estilo vidro** com fundo semi-transparente
- 🌈 **Bordas RGB animadas** com múltiplas cores
- 📊 **Indicador de status** em tempo real
- 🎮 **Botão de ativar/desativar** elegante
- 🚶 **Anti-AFK com Movimento** - Personagem se mexe
- 🛡️ **Anti-AFK Parado** - Personagem fica parado (VirtualUser)
- 📁 **Código modular e bem organizado**
- 🔧 **Configurações centralizadas**
- 📝 **Sistema de logs integrado**

## ⚙️ Configurações

Edite `src/utils/Config.lua` para personalizar:

- 🎨 **Cores** da GUI e animação RGB
- 📍 **Posição** e tamanho da GUI
- ⏱️ **Intervalo** de atualização
- 🚶 **Padrões de movimento** (apenas anti-AFK com movimento)

Edite `src/antiafk/Config.lua` para o anti-AFK com movimento:
- 🚶 **Padrões de movimento** diferentes
- ⏳ **Intervalos** de movimento e pulos
- 🔄 **Comportamento** do anti-AFK

---

## 🛡️ Dois Tipos de Anti-AFK

Este projeto inclui **dois métodos diferentes**:

### 1️⃣ Anti-AFK com Movimento (anti_afk.lua)
- ✅ Personagem se move em 4 direções
- ✅ Faz pulos periodicamente
- ✅ Mais visível
- 📁 Arquivo: [anti_afk.lua](anti_afk.lua)
- 📂 Pasta: `src/Main.lua`

### 2️⃣ Anti-AFK Parado (anti_afk_parado.lua)
- ✅ Personagem fica **completamente parado**
- ✅ Usa cliques virtuais (VirtualUser)
- ✅ Máxima discrição
- ✅ Mais seguro
- 📁 Arquivo: [anti_afk_parado.lua](anti_afk_parado.lua)
- 📂 Pasta: `src/MainAFK.lua`

**Comparação completa:** [ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md)

## 🛠️ Componentes

### GuiBuilder
Responsável por criar e gerenciar a interface gráfica com:
- Frame principal com vidro
- Bordas RGB animadas
- Labels de status
- Botão de toggle

### AntiAFK (Anti-AFK com Movimento)
Controlador principal que:
- Gerencia o estado do anti-AFK
- Executa padrões de movimento
- Monitora o personagem
- Reinicia após respawn

### AFK (Anti-AFK Parado - VirtualUser)
Controlador para método sem movimento que:
- Gerencia estado via VirtualUser
- Simula cliques virtuais
- Ativa no evento Idled
- Não move o personagem

### Movement
Sistema de movimento que:
- Move o personagem em diferentes direções
- Executa pulos periodicamente
- Previne kickout por inatividade

## ⚠️ Aviso Importante

- Use com responsabilidade
- Respeite as regras do jogo e da plataforma Roblox
- Use apenas em jogos que permitem
- Assuma todo risco de banimento

## 📝 Logs

Todos os eventos são registrados no console:
```
[HH:MM:SS] [INFO] Anti-AFK iniciado
[HH:MM:SS] [INFO] GUI criada com sucesso
[HH:MM:SS] [INFO] Anti-AFK ativado
```

## 🎯 Roadmap

- [ ] Padrões de movimento customizáveis
- [ ] Interface de configuração na GUI
- [ ] Sistema de hotkeys
- [ ] Detecção de script bloqueados
- [ ] Suporte a múltiplos padrões de jogo

---

**Versão:** 1.0.3  
**Última atualização:** 2026-07-29
