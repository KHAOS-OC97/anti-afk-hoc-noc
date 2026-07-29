-- Ponto de entrada principal do Anti-AFK

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GuiBuilder = require(script.Parent.gui.GuiBuilder)
local AntiAFK = require(script.Parent.antiafk.AntiAFK)
local Logger = require(script.Parent.utils.Logger)
local Config = require(script.Parent.utils.Config)

Logger:info("==========================================")
Logger:info("Anti-AFK " .. Config.VERSION .. " iniciando...")
Logger:info("==========================================")

-- Cria instância do Anti-AFK
local antiAfkController = AntiAFK.new(player)

-- Cria a GUI
local guiBuilder = GuiBuilder.new()
local guiElements = guiBuilder:build(player:WaitForChild("PlayerGui"))

Logger:info("GUI criada com sucesso")

-- Variável para controlar o estado
local isActive = false

-- Configurar botão de toggle
guiElements.toggleButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        antiAfkController:start()
        guiElements:updateButtonText("DESATIVAR")
        guiElements:updateStatus("Ativo")
        guiBuilder:animateRgbBorder()
        Logger:info("Anti-AFK ativado")
    else
        antiAfkController:stop()
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
            local status = antiAfkController:getStatus()
            if status.character then
                guiElements:updateStatus("Ativo ✓")
            else
                guiElements:updateStatus("Aguardando spawn...")
            end
        end
    end
end)

-- Reiniciar Anti-AFK ao morrer (se estava ativo)
player.CharacterAdded:Connect(function(character)
    task.wait(0.5)
    
    if isActive then
        antiAfkController = AntiAFK.new(player)
        antiAfkController:start()
        Logger:info("Anti-AFK reiniciado após spawn")
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
