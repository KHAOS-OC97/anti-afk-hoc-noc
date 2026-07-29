# 🚀 Início Rápido

## 📥 Instalação em 3 Passos

Escolha um dos dois tipos:

### 🚶 **Com Movimento** (Padrão)

```
Copie o conteúdo de: anti_afk.lua
```

### 🛡️ **Parado** (Sem movimento - VirtualUser)

```
Copie o conteúdo de: anti_afk_parado.lua
```

### Depois:

1. Roblox Studio → `StarterPlayer > StarterCharacterScripts` → Nova LocalScript
2. Cole o código escolhido
3. Pressione F5 para testar
4. Procure a GUI no canto superior esquerdo

---

## 🎮 Qual Usar?

| Tipo | Arquivo | Uso |
|------|---------|-----|
| **Com Movimento** | `anti_afk.lua` | Personagem se mexe visualmente |
| **Parado** | `anti_afk_parado.lua` | Personagem fica parado (mais discreto) |

**Dúvida?** Leia [ANTI_AFK_PARADO.md](ANTI_AFK_PARADO.md)

---

## 🎮 Usar o Anti-AFK

1. Procure pela GUI no canto superior esquerdo
2. Clique no botão **"ATIVAR"**
3. Seu personagem começará a se mover automaticamente
4. Clique em **"DESATIVAR"** para parar

---

## 🖱️ Controles da GUI

- **Esconder GUI:** Pressione **CTRL**
- **Mover GUI:** Clique e arraste com o mouse
- **Mostrar GUI:** Pressione **CTRL** novamente

---

## 📁 Estrutura do Projeto

```
anti-afk-hoc-noc/
│
├── 📄 README.md              ← Documentação completa
├── 📄 INSTALACAO.md          ← Guia de instalação detalhado
├── 📄 CONFIGURACAO.md        ← Como customizar
├── 📄 EXEMPLOS.md            ← Exemplos de código
├── 📄 INICIO_RAPIDO.md       ← Este arquivo
│
├── 💻 anti_afk.lua           ← Script integrado (COPY-PASTE)
│
└── 📦 src/                   ← Código modular (para projetos avançados)
    ├── Main.lua              ← Ponto de entrada
    ├── gui/
    │   └── GuiBuilder.lua    ← Interface gráfica
    ├── antiafk/
    │   ├── AntiAFK.lua       ← Controlador principal
    │   ├── Movement.lua      ← Sistema de movimento
    │   └── Config.lua        ← Configurações anti-AFK
    └── utils/
        ├── Logger.lua        ← Sistema de logs
        └── Config.lua        ← Configurações gerais
```

---

## 🎨 GUI (Interface Gráfica)

A GUI tem um design moderno com:
- 🖼️ Fundo tipo vidro (semi-transparente)
- 🌈 Bordas com cores RGB animadas
- 📊 Indicador de status em tempo real
- 🔘 Botão grande e responsivo

**Posição:** Canto superior esquerdo (customize em Config.lua)

---

## ⚙️ Configurações Principais

Edite `src/utils/Config.lua` para:
- 🎨 **Cores** da GUI e animação RGB
- 📍 **Posição** e tamanho da GUI
- ⏱️ **Velocidade** de movimento

Edite `src/antiafk/Config.lua` para:
- 🚶 **Padrões de movimento** diferentes
- ⏳ **Intervalos** de movimento e pulos
- 🔄 **Comportamento** do anti-AFK

---

## 🗂️ Ficheiros Importantes

| Ficheiro | Propósito |
|----------|-----------|
| `anti_afk.lua` | **USE ESTE** para começar rápido |
| `README.md` | Documentação completa |
| `INSTALACAO.md` | Instruções detalhadas de instalação |
| `CONFIGURACAO.md` | Opções de personalização |
| `EXEMPLOS.md` | Exemplos de código |
| `src/Main.lua` | Versão modular (avançado) |

---

## 🆘 Troubleshooting Rápido

| Problema | Solução |
|----------|---------|
| GUI não aparece | Verifique se está em `StarterCharacterScripts` |
| Anti-AFK não funciona | Clique "ATIVAR" no botão |
| Sou kickado | Tente aumentar `MoveDistance` em Config.lua |
| Erros no console | Veja se o caminho dos `require()` está correto |

---

## 📚 Documentação

Para saber mais, consulte:

- 📖 **[README.md](README.md)** - Visão geral completa
- 🔧 **[INSTALACAO.md](INSTALACAO.md)** - Instalação passo-a-passo
- ⚙️ **[CONFIGURACAO.md](CONFIGURACAO.md)** - Todas as opções
- 💡 **[EXEMPLOS.md](EXEMPLOS.md)** - Códigos de exemplo

---

## ✨ Características Principais

✅ GUI elegante com vidro RGB  
✅ Código 100% modular e organizado  
✅ Sistema de logs completo  
✅ Configurações centralizadas  
✅ Suporte a múltiplos padrões  
✅ Reinicia automaticamente após morte  
✅ Compatível com Roblox Studio e Executores  

---

## 🎯 Próximos Passos

1. **Iniciante:** Use `anti_afk.lua` e clique em ATIVAR
2. **Intermediário:** Customize cores em `src/utils/Config.lua`
3. **Avançado:** Crie novos padrões em `src/antiafk/Config.lua`
4. **Desenvolvedor:** Edite `src/Main.lua` para funcionalidades custom

---

## ⚖️ Aviso Legal

⚠️ **IMPORTANTE:**

- Use por sua conta e risco
- Verifique os Termos de Serviço do jogo
- Nem todos os jogos permitem anti-AFK
- Você pode ser banido se usar em jogo que proíbe
- Use com responsabilidade

---

## 📞 Suporte

Para dúvidas ou problemas:
1. Veja o console (F9) por erros
2. Leia a documentação completa
3. Veja exemplos de código
4. Customize conforme necessário

---

**Pronto para começar?** → [anti_afk.lua](anti_afk.lua)  
**Quer aprender mais?** → [README.md](README.md)

---

**Versão:** 1.0.3  
**Status:** ✅ Pronto para uso  
**Última atualização:** 2026-07-29
