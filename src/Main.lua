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
local isActive = true

-- Configurar botão de toggle
guiElements.toggleButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        task.spawn(function()
            antiAfkController:start()
        end)
        guiElements:updateButtonText("Disable")
        guiElements:updateStatus("Active")
        task.spawn(function()
            guiBuilder:animateRgbBorder()
        end)
        Logger:info("Anti-AFK enabled")
    else
        antiAfkController:stop()
        guiElements:updateButtonText("Enable")
        guiElements:updateStatus("Inactive")
        guiBuilder:stopAnimateRgbBorder()
        Logger:info("Anti-AFK disabled")
    end
end)

guiElements:updateButtonText("Disable")
guiElements:updateStatus("Active")
task.spawn(function()
    antiAfkController:start()
end)
task.spawn(function()
    guiBuilder:animateRgbBorder()
end)

-- Atualizar GUI periodicamente
task.spawn(function()
    while true do
        task.wait(Config.GUI.UpdateInterval)
        
        if isActive then
            local status = antiAfkController:getStatus()
            if status.character then
                guiElements:updateStatus("Active ✓")
            else
                guiElements:updateStatus("Waiting for character...")
            end
        end
    end
end)

-- Reiniciar Anti-AFK ao morrer (se estava ativo)
player.CharacterAdded:Connect(function(character)
    task.wait(0.5)
    
    if isActive then
        antiAfkController = AntiAFK.new(player)
        task.spawn(function()
            antiAfkController:start()
        end)
        Logger:info("Anti-AFK restarted after respawn")
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

Logger:info("Anti-AFK ready")
