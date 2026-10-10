-- ====================================================
-- Anti-AFK Roblox - Versão Integrada v1.0.3
-- ====================================================
-- Este arquivo integra todo o sistema modular
-- Copie e cole este arquivo em um executor Lua
-- ou como LocalScript em StarterCharacterScripts
-- ====================================================

-- CONFIG
local Version = "1.0.3"
local GameName = "HOC NOC Zoo"

local function createGui()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AntiAFKGui"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    screenGui.Parent = playerGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0.25, 0, 0.15, 0)
    mainFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    mainFrame.BackgroundTransparency = 0.3
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    
    -- Canto arredondado
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    -- Borda RGB
    local border = Instance.new("UIStroke")
    border.Thickness = 2
    border.Color = Color3.fromRGB(0, 255, 255)
    border.Transparency = 0
    border.Parent = mainFrame
    
    -- Título
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.4, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = GameName .. " v" .. Version
    titleLabel.Parent = mainFrame
    
    -- Status
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, 0, 0.3, 0)
    statusLabel.Position = UDim2.new(0, 0, 0.4, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Text = "Status: Inactive"
    statusLabel.TextSize = 12
    statusLabel.Parent = mainFrame
    
    -- Botão
    local button = Instance.new("TextButton")
    button.Name = "ToggleButton"
    button.Size = UDim2.new(0.9, 0, 0.2, 0)
    button.Position = UDim2.new(0.05, 0, 0.75, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    button.BackgroundTransparency = 0.3
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Text = "Enable"
    button.BorderSizePixel = 0
    button.Parent = mainFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 4)
    buttonCorner.Parent = button
    
    local buttonBorder = Instance.new("UIStroke")
    buttonBorder.Thickness = 1
    buttonBorder.Color = Color3.fromRGB(0, 255, 255)
    buttonBorder.Parent = button
    
    return {
        gui = screenGui,
        frame = mainFrame,
        title = titleLabel,
        status = statusLabel,
        button = button,
        border = border,
    }
end

local function startAntiAfk(player)
    local isRunning = true
    
    task.spawn(function()
        while isRunning do
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local rootPart = character and character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and humanoid.Health > 0 and rootPart then
                -- Mover direita
                humanoid:MoveTo(rootPart.Position + Vector3.new(3, 0, 0))
                task.wait(1.2)
                
                -- Mover esquerda
                humanoid:MoveTo(rootPart.Position + Vector3.new(-3, 0, 0))
                task.wait(1.2)
                
                -- Mover frente
                humanoid:MoveTo(rootPart.Position + Vector3.new(0, 0, 3))
                task.wait(1.2)
                
                -- Mover trás
                humanoid:MoveTo(rootPart.Position + Vector3.new(0, 0, -3))
                task.wait(1.2)
                
                -- Pular
                humanoid.Jump = true
                task.wait(0.5)
            else
                task.wait(1)
            end
        end
    end)
    
    return function()
        isRunning = false
    end
end

local function animateRgbBorder(border)
    local colors = {
        Color3.fromRGB(255, 0, 0),      -- Vermelho
        Color3.fromRGB(0, 255, 0),      -- Verde
        Color3.fromRGB(0, 0, 255),      -- Azul
        Color3.fromRGB(0, 255, 255),    -- Ciano
        Color3.fromRGB(255, 0, 255),    -- Magenta
        Color3.fromRGB(255, 255, 0),    -- Amarelo
    }
    
    local index = 1
    
    return function(enabled)
        if enabled then
            task.spawn(function()
                while enabled do
                    border.Color = colors[index]
                    index = index + 1
                    if index > #colors then
                        index = 1
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
end

-- INICIALIZAÇÃO
local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("[Anti-AFK] Inicializando " .. GameName .. " v" .. Version)

local gui = createGui()
local antiAfkStop = nil
local isActive = true

gui.button.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        antiAfkStop = startAntiAfk(player)
        gui.button.Text = "Disable"
        gui.status.Text = "Status: Active ✓"
        gui.frame.UIStroke.Color = Color3.fromRGB(0, 255, 0)
        print("[Anti-AFK] Ativado")
    else
        if antiAfkStop then
            antiAfkStop()
        end
        gui.button.Text = "Enable"
        gui.status.Text = "Status: Inactive"
        gui.frame.UIStroke.Color = Color3.fromRGB(0, 255, 255)
        print("[Anti-AFK] Desativado")
    end
end)

antiAfkStop = startAntiAfk(player)
gui.button.Text = "Disable"
gui.status.Text = "Status: Active ✓"
gui.frame.UIStroke.Color = Color3.fromRGB(0, 255, 0)

-- Reiniciar após respawn
player.CharacterAdded:Connect(function()
    if isActive then
        task.wait(0.5)
        antiAfkStop = startAntiAfk(player)
        print("[Anti-AFK] Restarted after respawn")
    end
end)

-- Tecla CTRL para esconder/mostrar GUI
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
        gui.frame.Visible = not gui.frame.Visible
    end
end)

print("[Anti-AFK] Ready")

