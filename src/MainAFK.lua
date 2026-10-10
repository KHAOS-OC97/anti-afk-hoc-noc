-- Ponto de entrada principal do Anti-AFK VirtualUser (não se mexe)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GuiBuilder = require(script.Parent.gui.GuiBuilder)
local AFK = require(script.Parent.antiafk.AFK)
local Logger = require(script.Parent.utils.Logger)
local Config = require(script.Parent.utils.Config)

Logger:info("==========================================")
Logger:info("Anti-AFK VirtualUser " .. Config.VERSION .. " iniciando...")
Logger:info("Method: Idle event (no movement)")
Logger:info("==========================================")

-- Cria instância do Anti-AFK VirtualUser
local afkController = AFK.new(player)

-- Cria a GUI
local guiBuilder = GuiBuilder.new()
local guiElements = guiBuilder:build(player:WaitForChild("PlayerGui"))

-- Atualizar título
guiElements.titleLabel.Text = "Anti-AFK (Idle)"

Logger:info("GUI criada com sucesso")

-- Variável para controlar o estado
local isActive = true

-- Configurar botão de toggle
guiElements.toggleButton.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        afkController:start()
        guiElements:updateButtonText("Disable")
        guiElements:updateStatus("Active (idle)")
        guiBuilder:animateRgbBorder()
        Logger:info("Anti-AFK enabled - Method: VirtualUser")
    else
        afkController:stop()
        guiElements:updateButtonText("Enable")
        guiElements:updateStatus("Inactive")
        guiBuilder:stopAnimateRgbBorder()
        Logger:info("Anti-AFK disabled")
    end
end)

guiElements:updateButtonText("Disable")
guiElements:updateStatus("Active (idle)")
afkController:start()
task.spawn(function()
    guiBuilder:animateRgbBorder()
end)

-- Atualizar GUI periodicamente
task.spawn(function()
    while true do
        task.wait(Config.GUI.UpdateInterval)
        
        if isActive then
            local status = afkController:getStatus()
            guiElements:updateStatus("Active (idle) ✓")
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

Logger:info("Anti-AFK ready")
