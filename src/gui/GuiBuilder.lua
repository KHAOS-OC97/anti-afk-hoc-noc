-- Construtor de GUI com estilo vidro RGB

local GuiBuilder = {}
GuiBuilder.__index = GuiBuilder

local Config = require(script.Parent.Parent.utils.Config)
local Logger = require(script.Parent.Parent.utils.Logger)

function GuiBuilder.new()
    local self = setmetatable({}, GuiBuilder)
    self.screenGui = nil
    self.mainFrame = nil
    self.borderFrame = nil
    self.rgbColors = {
        Config.Colors.Red,
        Config.Colors.Green,
        Config.Colors.Blue,
        Config.Colors.Cyan,
        Config.Colors.Magenta,
        Config.Colors.Yellow,
    }
    self.currentColorIndex = 1
    self.animating = false
    return self
end

function GuiBuilder:createScreenGui(parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AntiAFKGui"
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999
    screenGui.Parent = parent or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    self.screenGui = screenGui
    return screenGui
end

function GuiBuilder:createCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or Config.Theme.CornerRadius)
    corner.Parent = parent
    return corner
end

function GuiBuilder:createBorder(parent, borderSize, borderColor)
    local border = Instance.new("UIStroke")
    border.Thickness = borderSize or Config.Theme.BorderSize
    border.Color = borderColor or Config.Theme.BorderColor
    border.Transparency = 0
    border.Parent = parent
    return border
end

function GuiBuilder:createMainFrame()
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = Config.GUI.Size
    frame.Position = Config.GUI.Position
    frame.BackgroundColor3 = Config.Theme.BackgroundColor
    frame.BackgroundTransparency = Config.Theme.BackgroundTransparency
    frame.BorderSizePixel = 0
    frame.Parent = self.screenGui
    
    -- Adiciona canto arredondado
    self:createCorner(frame, Config.Theme.CornerRadius)
    
    -- Adiciona borda RGB
    self.borderFrame = self:createBorder(frame, Config.Theme.BorderSize, Config.Theme.BorderColor)
    
    self.mainFrame = frame
    return frame
end

function GuiBuilder:createTitleLabel(parent, title)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.4, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Config.Theme.TextColor
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = title or Config.GUI.Title
    titleLabel.Parent = parent
    
    return titleLabel
end

function GuiBuilder:createStatusLabel(parent)
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name = "StatusLabel"
    statusLabel.Size = UDim2.new(1, 0, 0.3, 0)
    statusLabel.Position = UDim2.new(0, 0, 0.4, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextColor3 = Config.Theme.TextColor
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.Text = "Status: Aguardando..."
    statusLabel.TextSize = 12
    statusLabel.Parent = parent
    
    return statusLabel
end

function GuiBuilder:createToggleButton(parent, callback)
    local button = Instance.new("TextButton")
    button.Name = "ToggleButton"
    button.Size = UDim2.new(0.9, 0, 0.2, 0)
    button.Position = UDim2.new(0.05, 0, 0.75, 0)
    button.BackgroundColor3 = Config.Colors.Cyan
    button.BackgroundTransparency = 0.3
    button.TextColor3 = Config.Theme.TextColor
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Text = "ATIVAR"
    button.BorderSizePixel = 0
    button.Parent = parent
    
    self:createCorner(button, 4)
    self:createBorder(button, 1, Config.Colors.Cyan)
    
    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    return button
end

function GuiBuilder:animateRgbBorder()
    if self.animating or not self.borderFrame then
        return
    end
    
    self.animating = true
    
    while self.animating and self.borderFrame do
        self.borderFrame.Color = self.rgbColors[self.currentColorIndex]
        self.currentColorIndex = self.currentColorIndex + 1
        
        if self.currentColorIndex > #self.rgbColors then
            self.currentColorIndex = 1
        end
        
        task.wait(0.3)
    end
end

function GuiBuilder:stopAnimateRgbBorder()
    self.animating = false
end

function GuiBuilder:build(parent)
    Logger:info("Construindo GUI...")
    
    self:createScreenGui(parent)
    local mainFrame = self:createMainFrame()
    
    local titleLabel = self:createTitleLabel(mainFrame)
    local statusLabel = self:createStatusLabel(mainFrame)
    
    local toggleButton = self:createToggleButton(mainFrame)
    
    -- Retorna os elementos para controle externo
    return {
        screenGui = self.screenGui,
        mainFrame = mainFrame,
        titleLabel = titleLabel,
        statusLabel = statusLabel,
        toggleButton = toggleButton,
        updateStatus = function(self, text)
            statusLabel.Text = "Status: " .. text
        end,
        updateButtonText = function(self, text)
            toggleButton.Text = text
        end,
        startRgbAnimation = function(self)
            GuiBuilder:animateRgbBorder()
        end,
        stopRgbAnimation = function(self)
            GuiBuilder:stopAnimateRgbBorder()
        end,
    }
end

return GuiBuilder
