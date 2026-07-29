-- ====================================================
-- Anti-AFK Parado (VirtualUser) - Versão Integrada v1.0.3
-- ====================================================
-- NÃO SE MEXE - Apenas cliques virtuais
-- Copie e cole este arquivo em um executor Lua
-- ou como LocalScript em StarterCharacterScripts
-- ====================================================

local Version = "1.0.3"
local GameName = "HOC NOC Zoo"

local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function createGui()
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
    titleLabel.Text = "🛡️ Anti-AFK Parado"
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
    statusLabel.Text = "Status: Inativo"
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
    button.Text = "ATIVAR"
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

local function startAntiAFK()
    local isRunning = true
    
    -- Conecta ao evento Idled do jogador
    player.Idled:Connect(function()
        if not isRunning then return end
        
        pcall(function()
            -- Captura o controlador do jogador
            VirtualUser:CaptureController()
            -- Simula um clique (não move o personagem)
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end)
    end)
    
    return function()
        isRunning = false
    end
end

-- INICIALIZAÇÃO
print("[Anti-AFK Parado] Inicializando " .. GameName .. " v" .. Version)

local gui = createGui()
local antiAfkStop = nil
local isActive = false

gui.button.MouseButton1Click:Connect(function()
    isActive = not isActive
    
    if isActive then
        antiAfkStop = startAntiAFK()
        gui.button.Text = "DESATIVAR"
        gui.status.Text = "Status: Ativo (parado) ✓"
        gui.frame.UIStroke.Color = Color3.fromRGB(0, 255, 0)
        print("[Anti-AFK Parado] Ativado - Método: VirtualUser")
    else
        if antiAfkStop then
            antiAfkStop()
        end
        gui.button.Text = "ATIVAR"
        gui.status.Text = "Status: Inativo"
        gui.frame.UIStroke.Color = Color3.fromRGB(0, 255, 255)
        print("[Anti-AFK Parado] Desativado")
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

print("[Anti-AFK Parado] Pronto para uso!")
