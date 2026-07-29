-- Sistema de anti-AFK sem movimento (usando VirtualUser)

local AFK = {}
AFK.__index = AFK

local VirtualUser = game:GetService("VirtualUser")
local Logger = require(script.Parent.Parent.utils.Logger)

function AFK.new(player)
    local self = setmetatable({}, AFK)
    self.player = player
    self.isRunning = false
    self.isConnected = false
    return self
end

function AFK:start()
    if self.isRunning then
        Logger:warn("Anti-AFK VirtualUser já está em execução")
        return
    end
    
    self.isRunning = true
    Logger:info("Anti-AFK VirtualUser iniciado")
    
    if not self.isConnected then
        self:connectIdleEvent()
    end
end

function AFK:stop()
    self.isRunning = false
    Logger:info("Anti-AFK VirtualUser parado")
end

function AFK:connectIdleEvent()
    if self.isConnected then
        return
    end
    
    self.isConnected = true
    
    self.player.Idled:Connect(function()
        if not self.isRunning then
            return
        end
        
        pcall(function()
            -- Captura o controlador do jogador
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end)
    end)
    
    Logger:info("Evento Idle conectado")
end

function AFK:getStatus()
    return {
        running = self.isRunning,
        type = "VirtualUser",
        method = "Click",
    }
end

return AFK
