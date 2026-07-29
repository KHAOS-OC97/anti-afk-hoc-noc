-- Configurações gerais do Anti-AFK

local Config = {}

Config.VERSION = "1.0.3"
Config.GAME_NAME = "HOC NOC Zoo"

-- Configurações de movimento
Config.Movement = {
    MoveDistance = 3,
    MoveInterval = 1.2,
    JumpInterval = 2.4,
    WalkSpeedMin = 16,
}

-- Configurações de GUI
Config.GUI = {
    Enabled = true,
    Position = UDim2.new(0.02, 0, 0.02, 0),
    Size = UDim2.new(0.25, 0, 0.15, 0),
    Title = "HOC NOC Zoo v" .. "1.0.3",
    UpdateInterval = 0.5,
}

-- Cores RGB (para bordas animadas)
Config.Colors = {
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Cyan = Color3.fromRGB(0, 255, 255),
    Magenta = Color3.fromRGB(255, 0, 255),
    Yellow = Color3.fromRGB(255, 255, 0),
}

-- Paleta de cores para a GUI
Config.Theme = {
    BackgroundColor = Color3.fromRGB(15, 15, 20),
    BackgroundTransparency = 0.3,
    TextColor = Color3.fromRGB(200, 200, 200),
    BorderColor = Color3.fromRGB(0, 255, 255),
    BorderSize = 2,
    CornerRadius = 8,
}

return Config
