-- Ponto de entrada principal do Anti-AFK VirtualUser (não se mexe)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GuiBuilder = require(script.Parent.gui.GuiBuilder)
local AFK = require(script.Parent.antiafk.AFK)
local Logger = require(script.Parent.utils.Logger)
local Config = require(script.Parent.utils.Config)

Logger:info("==========================================")
Logger:info("Anti-AFK VirtualUser " .. Config.VERSION .. " iniciando...")
Logger:info("Método: Não se mexe (apenas cliques)")
Logger:info("==========================================")

-- Cria instância do Anti-AFK VirtualUser
local afkController = AFK.new(player)

-- Cria a GUI
local guiBuilder = GuiBuilder.new()
local guiElements = guiBuilder:build(player:WaitForChild("PlayerGui"))

-- Atualizar título
guiElements.titleLabel.Text = "🛡️ Anti-AFK (Parado)"

Logger:info("GUI criada com sucesso")

-- Variável para controlar o estado
local isActive = false

-- Configurar botão de toggle
guiElements.toggleButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        afkController:start()
        guiElements:updateButtonText("DESATIVAR")
        guiElements:updateStatus("Ativo (parado)")
        guiBuilder:animateRgbBorder()
        Logger:info("Anti-AFK ativado - Método: VirtualUser")
    else
        afkController:stop()
        guiElements:updateButtonText("ATIVAR")
        guiElements:updateStatus("Inativo")
        guiBuilder:stopAnimateRgbBorder()
        Logger:info("Anti-AFK desativado")
    end
end)

-- Atualizar GUI periodicamente
task.spawn(function()
    while true do
        task.wait(Config.GUI.UpdateInterval)
        
        if isActive then
            local status = afkController:getStatus()
            guiElements:updateStatus("Ativo (parado) ✓")
        end
    end
end)

-- Tecla CTRL para esconder/mostrar GUI
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        guiElements.mainFrame.Visible = not guiElements.mainFrame.Visible
    end
end)

Logger:info("Anti-AFK pronto para uso!")
